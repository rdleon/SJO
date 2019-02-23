CREATE TABLE obras (
    id serial NOT NULL,
    control character varying NOT NULL,
    titulo character varying NOT NULL,
    status integer NOT NULL,
    municipio integer NOT NULL,
    categoria integer NOT NULL,
    monto double precision NOT NULL,
    contrato character varying NOT NULL,
    licitacion character varying NOT NULL,
    borrado_logico boolean DEFAULT false,
    momento_alta timestamp with time zone NOT NULL,
    momento_ultima_actualizacion timestamp with time zone,
    momento_baja timestamp with time zone
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

--###################################
--# Wrtten by: Edward Nygma         #
--# mailto: j4nusx@yahoo.com        #
--# 16 / february / 2019            #
--###################################

DECLARE

    current_moment timestamp with time zone = now();
    coincidences integer := 0;
    latter_id integer := 0;
    clave_unica character varying;

    -- dump of errors
    rmsg text;

BEGIN

    CASE

        WHEN _obra_id = 0 THEN:

            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- STARTS - Generation of clave_unica
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

            -- pending implementation

            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- ENDS   - Generation of clave_unica
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

            INSERT INTO obras (
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
            -- STARTS - Validate obra id
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

            UPDATE obras
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
