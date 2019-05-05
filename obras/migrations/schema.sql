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
-- Name: contracts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contracts (
    id integer NOT NULL,
    number character varying NOT NULL,
    title character varying NOT NULL,
    description text,
    provider integer NOT NULL,
    delivery_stage integer NOT NULL,
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
-- Name: delivery_stages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.delivery_stages (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL
);


--
-- Name: departments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL
);


--
-- Name: TABLE departments; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.departments IS 'Relacion que alberga los posibles valores para el attributo departamento de un proyecto';


--
-- Name: COLUMN departments.title; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.departments.title IS 'Nombre con el que se identifica a este departamento';


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
-- Name: COLUMN projects.city; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.projects.city IS 'Identificador de municipio en cache autoritativo';


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
-- Name: providers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.providers (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    blocked boolean DEFAULT false,
    inceptor_uuid character varying NOT NULL,
    inception_time timestamp with time zone NOT NULL,
    touch_latter_time timestamp with time zone NOT NULL
);


--
-- Name: TABLE providers; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.providers IS 'Relacion que alberga los proveedores';


--
-- Name: COLUMN providers.title; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.providers.title IS 'Nombre con el que se identifica a este proveedor';


--
-- Name: COLUMN providers.inceptor_uuid; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.providers.inceptor_uuid IS 'Usuario que origino este proveedor';


--
-- Name: COLUMN providers.inception_time; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.providers.inception_time IS 'Fecha en la que se registro este proveedor';


--
-- Name: COLUMN providers.touch_latter_time; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.providers.touch_latter_time IS 'Apunta a la ultima fecha de alteracion de el registro';


--
-- Name: providers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.providers_id_seq OWNED BY public.providers.id;


--
-- Name: contracts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contracts ALTER COLUMN id SET DEFAULT nextval('public.contracts_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: providers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.providers ALTER COLUMN id SET DEFAULT nextval('public.providers_id_seq'::regclass);


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
-- Name: delivery_stages delivery_stage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_stages
    ADD CONSTRAINT delivery_stage_pkey PRIMARY KEY (id);


--
-- Name: delivery_stages delivery_stage_unique_title; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_stages
    ADD CONSTRAINT delivery_stage_unique_title UNIQUE (title);


--
-- Name: departments department_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);


--
-- Name: departments department_unique_title; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT department_unique_title UNIQUE (title);


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
-- Name: providers provider_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.providers
    ADD CONSTRAINT provider_pkey PRIMARY KEY (id);


--
-- Name: providers provider_unique_title; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.providers
    ADD CONSTRAINT provider_unique_title UNIQUE (title);


--
-- Name: contracts contract_fk_delivery_stage; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contract_fk_delivery_stage FOREIGN KEY (delivery_stage) REFERENCES public.delivery_stages(id);


--
-- Name: contracts contract_fk_provider; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contract_fk_provider FOREIGN KEY (provider) REFERENCES public.providers(id);


--
-- Name: projects project_fk_category; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT project_fk_category FOREIGN KEY (category) REFERENCES public.categories(id);


--
-- Name: projects project_fk_contract; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT project_fk_contract FOREIGN KEY (contract) REFERENCES public.contracts(id);


--
-- Name: projects project_fk_department; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT project_fk_department FOREIGN KEY (department) REFERENCES public.departments(id);


--
-- PostgreSQL database dump complete
--

