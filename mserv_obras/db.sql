CREATE OR REPLACE FUNCTION public.obras_edit(
    _obras_id integer,
    _usr_id integer,
    _titulo character varying,
    _status integer,
    _municipio integer,
    _categoria integer,
    _contrato character varying,
    _licitacion character varying
)
  RETURNS record AS
$BODY$

--###################################
--# Wrtten by: Edward Nygma         #
--# mailto: j4nusx@yahoo.com        #
--# 16 / february / 2018            #
--###################################

DECLARE

    current_moment timestamp with time zone = now();

    -- dump of errors
    rmsg text;

BEGIN

    IF rmsg != '' THEN
        rv := ( -1::integer, rmsg::text );
    ELSE
        rv := ( 0::integer, ''::text );
    END IF;

    RETURN rv;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
