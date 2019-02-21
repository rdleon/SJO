CREATE FUNCTION obra_edit(
    _obra_id integer,
    _usr_id integer,
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
    latter_id integer := 0;
    no_control character varying;

    -- dump of errors
    rmsg text;

BEGIN

    CASE

        WHEN _obra_id = 0 THEN:

            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- STARTS - Generation of control number
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

            -- pending implementation

            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- ENDS   - Generation of control number
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


            INSERT INTO obras (
                usr_id,
                control,
                titulo,
                status,
                municipio,
                categoria,
                monto,
                contrato,
                licitacion,
                momento_creacion
            ) VALUES (
                _usr_id,
                no_control,
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
            UPDATE obras
            SET usr_id = _usr_id, titulo = _titulo, status = _status,
                municipio = _municipio, categoria = _categoria, monto = _monto,
                contrato = _contrato, licitacion = _licitacion,
                momento_creacion = current_moment
            WHERE id = _obra_id;

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
