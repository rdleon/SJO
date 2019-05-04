CREATE TABLE contracts ( 
    id serial NOT NULL,
    number character varying NOT NULL,
    title character varying NOT NULL,
    description text,
    provider integer NOT NULL,
    delivery_status  integer NOT NULL,
    initial_contracted_amount double precision NOT NULL,
    kickoff date NOT NULL,
    ending date NOT NULL,
    down_payment date,
    down_payment_amount double precision,
    ext_agreement date,
    ext_agreement_amount double precision,
    final_contracted_amount double precision,
    total_amount_paid double precision,
    outstanding_down_payment double precision,
    blocked boolean DEFAULT false,
    inception_time timestamp with time zone NOT NULL,
    touch_latter_time timestamp with time zone NOT NULL
);

ALTER TABLE ONLY contracts
    ADD CONSTRAINT contract_pkey PRIMARY KEY (id);

ALTER TABLE ONLY contracts
    ADD CONSTRAINT contract_unique_title UNIQUE (title);

COMMENT ON TABLE  contracts IS 'Relacion que alberga los contratos';
COMMENT ON COLUMN contracts.title IS 'Nombre con el que se identifica a este contrato';
COMMENT ON COLUMN contracts.inception_time IS 'Fecha en la que se registro este contrato';
COMMENT ON COLUMN contracts.touch_latter_time IS 'Apunta a la ultima fecha de alteracion de el registro';
COMMENT ON COLUMN contracts.kickoff IS 'Fecha para su inicio';
COMMENT ON COLUMN contracts.ending IS 'Fecha para su conclusion';


CREATE TABLE categories ( 
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL
);

ALTER TABLE ONLY categories
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);

ALTER TABLE ONLY categories
    ADD CONSTRAINT category_unique_title UNIQUE (title);

COMMENT ON TABLE  categories IS 'Relacion que alberga los posibles valores para el attributo categoria de un proyecto';
COMMENT ON COLUMN categories.title IS 'Nombre con el que se identifica a esta categoria';


CREATE TABLE cities ( 
    id integer NOT NULL,
    title character varying NOT NULL
);

ALTER TABLE ONLY cities
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);

ALTER TABLE ONLY cities
    ADD CONSTRAINT city_unique_title UNIQUE (title);

COMMENT ON TABLE  cities IS 'Relacion que alberga los posibles valores para el attributo ciudad de un proyecto';
COMMENT ON COLUMN cities.title IS 'Nombre con el que se identifica a esta ciudad';


CREATE TABLE projects (
    id serial NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    city integer NOT NULL,
    category integer NOT NULL,
    department integer NOT NULL,
    budget double precision NOT NULL,
    contract integer NOT NULL,
    planed_kickoff date NOT NULL,
    planed_ending date NOT NULL,
    blocked boolean DEFAULT false,
    inceptor_uuid character varying NOT NULL,
    inception_time timestamp with time zone NOT NULL,
    touch_latter_time timestamp with time zone NOT NULL
);

ALTER TABLE ONLY projects
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);

ALTER TABLE ONLY projects
    ADD CONSTRAINT project_unique_title UNIQUE (title);


COMMENT ON TABLE  projects IS 'Relacion que alberga proyectos';
COMMENT ON COLUMN projects.category IS 'Llave foranea a tabla de attributo categoria';
COMMENT ON COLUMN projects.contract IS 'Llave foranea a tabla de attributo contrato';
COMMENT ON COLUMN projects.department IS 'Llave foranea a table de attributo dependencia de gobierno';
COMMENT ON COLUMN projects.title IS 'Nombre con el que se identifica a este proyecto';
COMMENT ON COLUMN projects.planed_kickoff IS 'Fecha planeada para su inicio';
COMMENT ON COLUMN projects.planed_ending IS 'Fecha planeada para su conclusion';
COMMENT ON COLUMN projects.inception_time IS 'Fecha en la que se registro este proyecto';
COMMENT ON COLUMN projects.touch_latter_time IS 'Apunta a la ultima fecha de alteracion de el registro';
COMMENT ON COLUMN projects.blocked IS 'Implementacion de feature borrado logico';


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
