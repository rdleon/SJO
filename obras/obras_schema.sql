CREATE TABLE ent_project (
    id serial NOT NULL,
    control character varying NOT NULL,
    titulo character varying NOT NULL,
    desc character varying NOT NULL,
    status integer NOT NULL,
    municipio integer NOT NULL,
    categoria integer NOT NULL,
    dependencia integer NOT NULL,
    monto double precision NOT NULL,
    contrato character varying NOT NULL,
    licitacion character varying NOT NULL,
    inicio_planeado date,
    final_planeado date,
    blocked boolean DEFAULT false,
    creation_time timestamp with time zone NOT NULL,
    touch_latter_time timestamp with time zone
);


CREATE FUNCTION obra_edit(
    _obra_id integer,
    _titulo character varying,
    _status integer,
    _municipio integer,
    _categoria integer,
    _monto double precision,
    _contrato character varying,
    _licitacion character varying
)
  RETURNS record AS
$BODY$

DECLARE

    current_moment timestamp with time zone = now();
    coincidences integer := 0;
    latter_id integer := 0;

    -- dump of errors
    rmsg text;

BEGIN

    CASE

        WHEN _obra_id = 0 THEN:

            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- STARTS - Validates clave unica
            --
            -- JUSTIFICATION: Clave unica is created by another division
            -- We should only abide with the format
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

            -- pending implementation

            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- ENDS   - Validates clave_unica
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

            INSERT INTO ent_project (
                control,
                titulo,
                status,
                municipio,
                categoria,
                monto,
                contrato,
                licitacion,
                momento_alta
            ) VALUES (
                clave_unica,
                _titulo,
                _status,
                _municipio,
                _categoria,
                _monto,
                _contrato,
                _licitacion,
                current_moment
            ) RETURNING id INTO latter_id;

        WHEN _obra_id > 0 THEN

            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- STARTS - Validates obra id
            --
            -- JUSTIFICATION: Because UPDATE statement does not issue
            -- any exception if nothing was updated.
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            SELECT count(id)
            FROM obras INTO coincidences;
            WHERE not borrado_logico AND id = _obra_id;

            IF not coincidences = 1 THEN
                RAISE EXCEPTION 'obra identifier % does not exist', _obra_id;
            ENDIF;
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- ENDS - Validate obra id
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

            UPDATE ent_project
            SET titulo = _titulo, status = _status,
                municipio = _municipio, categoria = _categoria,
                monto = _monto, contrato = _contrato,
                licitacion = _licitacion,
                momento_ultima_actualizacion = current_moment
            WHERE id = _obra_id;

            -- Upon edition we return obra id as latter id
            latter_id = _obra_id;

        ELSE
            RAISE EXCEPTION 'negative obra identifier % is unsupported', _obra_id;

    END CASE;

    return ( latter_id::integer, ''::text );

    EXCEPTION
        WHEN OTHERS THEN
            GET STACKED DIAGNOSTICS rmsg = MESSAGE_TEXT;
            return ( -1::integer, rmsg::text );

    RETURN rv;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE COST 100;
