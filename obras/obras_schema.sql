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
    inceptor_uuid character varying NOT NULL,
    inception_time timestamp with time zone NOT NULL,
    touch_latter_time timestamp with time zone NOT NULL
);

ALTER TABLE ONLY contracts
    ADD CONSTRAINT contract_pkey PRIMARY KEY (id);

ALTER TABLE ONLY contracts
    ADD CONSTRAINT contract_unique_title UNIQUE (title);

COMMENT ON TABLE  contracts IS 'Relacion que alberga los contratos';
COMMENT ON COLUMN contracts.title IS 'Nombre con el que se identifica a este contrato';
COMMENT ON COLUMN contracts.inceptor_uuid IS 'Usuario que origino este contrato';
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
COMMENT ON COLUMN projects.inceptor_uuid IS 'Usuario que origino este proyecto';
COMMENT ON COLUMN projects.inception_time IS 'Fecha en la que se registro este proyecto';
COMMENT ON COLUMN projects.touch_latter_time IS 'Apunta a la ultima fecha de alteracion de el registro';
COMMENT ON COLUMN projects.blocked IS 'Implementacion de feature borrado logico';


CREATE FUNCTION project_edit(
    _project_id integer,
    _title character varying,
    _description text,
    _city integer,
    _category integer,
    _department integer,
    _contract integer,
    _budget double precision,
    _planed_kickoff date,
    _planed_ending date
) RETURNS record LANGUAGE plpgsql AS $$

DECLARE

    current_moment timestamp with time zone = now();
    coincidences integer := 0;
    latter_id integer := 0;

    -- dump of errors
    rmsg text;

BEGIN

    CASE

        WHEN _project_id = 0 THEN

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

            INSERT INTO projects (
                title,
                description,
                city,
                category,
                department,
                budget,
                contract,
                planed_kickoff,
                planed_ending,
                inceptor_uuid,
                inception_time,
                touch_latter_time
            ) VALUES (
                _title,
                _description,
                _city,
                _category,
                _department,
                _budget,
                _contract,
                _planed_kickoff,
                _planed_ending,
                _inceptor_uuid,
                current_moment,
                current_moment
            ) RETURNING id INTO latter_id;

        WHEN _project_id > 0 THEN

            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- STARTS - Validates obra id
            --
            -- JUSTIFICATION: Because UPDATE statement does not issue
            -- any exception if nothing was updated.
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            SELECT count(id)
            FROM projects INTO coincidences
            WHERE not blocked AND id = _project_id;

            IF not coincidences = 1 THEN
                RAISE EXCEPTION 'obra identifier % does not exist', _obra_id;
            END IF;
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- ENDS - Validate obra id
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

            UPDATE projects
            SET title = _title, description = _description,
                planed_kickoff = _planed_kickoff,
	        planed_ending = _planed_ending,
                city = _city, category = _category,
                budget = _budget, contract = _contract,
                department = _department,
		touch_latter_time = current_moment
            WHERE id = _project_id;

            -- Upon edition we return obra id as latter id
            latter_id = _project_id;

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
$$;
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.12
-- Dumped by pg_dump version 9.6.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: project_edit(integer, character varying, text, integer, integer, integer, integer, double precision, date, date); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.project_edit(_project_id integer, _title character varying, _description text, _city integer, _category integer, _department integer, _contract integer, _budget double precision, _planed_kickoff date, _planed_ending date) RETURNS record
    LANGUAGE plpgsql
    AS $$

DECLARE

    current_moment timestamp with time zone = now();
    coincidences integer := 0;
    latter_id integer := 0;

    -- dump of errors
    rmsg text;

BEGIN

    CASE

        WHEN _project_id = 0 THEN

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

            INSERT INTO projects (
                title,
                description,
                city,
                category,
                department,
                budget,
                contract,
                planed_kickoff,
                planed_ending,
                inceptor_uuid,
                inception_time,
                touch_latter_time
            ) VALUES (
                _title,
                _description,
                _city,
                _category,
                _department,
                _budget,
                _contract,
                _planed_kickoff,
                _planed_ending,
                _inceptor_uuid,
                current_moment,
                current_moment
            ) RETURNING id INTO latter_id;

        WHEN _project_id > 0 THEN

            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- STARTS - Validates obra id
            --
            -- JUSTIFICATION: Because UPDATE statement does not issue
            -- any exception if nothing was updated.
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            SELECT count(id)
            FROM projects INTO coincidences
            WHERE not blocked AND id = _project_id;

            IF not coincidences = 1 THEN
                RAISE EXCEPTION 'obra identifier % does not exist', _obra_id;
            END IF;
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
            -- ENDS - Validate obra id
            -- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

            UPDATE projects
            SET title = _title, description = _description,
                planed_kickoff = _planed_kickoff,
	        planed_ending = _planed_ending,
                city = _city, category = _category,
                budget = _budget, contract = _contract,
                department = _department,
		touch_latter_time = current_moment
            WHERE id = _project_id;

            -- Upon edition we return obra id as latter id
            latter_id = _project_id;

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
$$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL
);


--
-- Name: TABLE categories; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.categories IS 'Relacion que alberga los posibles valores para el attributo categoria de un proyecto';


--
-- Name: COLUMN categories.title; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.categories.title IS 'Nombre con el que se identifica a esta categoria';


--
-- Name: cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    title character varying NOT NULL
);


--
-- Name: TABLE cities; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.cities IS 'Relacion que alberga los posibles valores para el attributo ciudad de un proyecto';


--
-- Name: COLUMN cities.title; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.cities.title IS 'Nombre con el que se identifica a esta ciudad';


--
-- Name: contracts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contracts (
    id integer NOT NULL,
    number character varying NOT NULL,
    title character varying NOT NULL,
    description text,
    provider integer NOT NULL,
    delivery_status integer NOT NULL,
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
    inceptor_uuid character varying NOT NULL,
    inception_time timestamp with time zone NOT NULL,
    touch_latter_time timestamp with time zone NOT NULL
);


--
-- Name: TABLE contracts; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.contracts IS 'Relacion que alberga los contratos';


--
-- Name: COLUMN contracts.title; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contracts.title IS 'Nombre con el que se identifica a este contrato';


--
-- Name: COLUMN contracts.kickoff; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contracts.kickoff IS 'Fecha para su inicio';


--
-- Name: COLUMN contracts.ending; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contracts.ending IS 'Fecha para su conclusion';


--
-- Name: COLUMN contracts.inceptor_uuid; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contracts.inceptor_uuid IS 'Usuario que origino este contrato';


--
-- Name: COLUMN contracts.inception_time; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contracts.inception_time IS 'Fecha en la que se registro este contrato';


--
-- Name: COLUMN contracts.touch_latter_time; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contracts.touch_latter_time IS 'Apunta a la ultima fecha de alteracion de el registro';


--
-- Name: contracts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contracts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contracts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contracts_id_seq OWNED BY public.contracts.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects (
    id integer NOT NULL,
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


--
-- Name: TABLE projects; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.projects IS 'Relacion que alberga proyectos';


--
-- Name: COLUMN projects.title; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.projects.title IS 'Nombre con el que se identifica a este proyecto';


--
-- Name: COLUMN projects.category; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.projects.category IS 'Llave foranea a tabla de attributo categoria';


--
-- Name: COLUMN projects.department; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.projects.department IS 'Llave foranea a table de attributo dependencia de gobierno';


--
-- Name: COLUMN projects.contract; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.projects.contract IS 'Llave foranea a tabla de attributo contrato';


--
-- Name: COLUMN projects.planed_kickoff; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.projects.planed_kickoff IS 'Fecha planeada para su inicio';


--
-- Name: COLUMN projects.planed_ending; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.projects.planed_ending IS 'Fecha planeada para su conclusion';


--
-- Name: COLUMN projects.blocked; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.projects.blocked IS 'Implementacion de feature borrado logico';


--
-- Name: COLUMN projects.inceptor_uuid; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.projects.inceptor_uuid IS 'Usuario que origino este proyecto';


--
-- Name: COLUMN projects.inception_time; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.projects.inception_time IS 'Fecha en la que se registro este proyecto';


--
-- Name: COLUMN projects.touch_latter_time; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.projects.touch_latter_time IS 'Apunta a la ultima fecha de alteracion de el registro';


--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: contracts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contracts ALTER COLUMN id SET DEFAULT nextval('public.contracts_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: categories category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: categories category_unique_title; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT category_unique_title UNIQUE (title);


--
-- Name: cities city_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- Name: cities city_unique_title; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT city_unique_title UNIQUE (title);


--
-- Name: contracts contract_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contract_pkey PRIMARY KEY (id);


--
-- Name: contracts contract_unique_title; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contract_unique_title UNIQUE (title);


--
-- Name: projects project_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: projects project_unique_title; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT project_unique_title UNIQUE (title);


--
-- Name: projects project_fk_category; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT project_fk_category FOREIGN KEY (category) REFERENCES public.categories(id);


--
-- Name: projects project_fk_city; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT project_fk_city FOREIGN KEY (city) REFERENCES public.cities(id);


--
-- Name: projects project_fk_contract; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT project_fk_contract FOREIGN KEY (contract) REFERENCES public.contracts(id);


--
-- PostgreSQL database dump complete
--

