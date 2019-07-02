---
--- New catalog tables and values
---

CREATE TABLE public.adjudications (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL
);

CREATE TABLE public.fundings (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL
);

INSERT INTO adjudications(id, title, description)
    VALUES (1, 'Licitación Pública', ''),
           (2, 'Adjudicación Directa', ''),
           (3, 'Invitación Restringida', '');

INSERT INTO fundings(id, title, description)
    VALUES (1, 'Federal', ''), (2, 'Estatal', '');

ALTER TABLE public.contracts ADD COLUMN adjudication integer;
ALTER TABLE public.contracts ADD COLUMN funding integer;
ALTER TABLE public.contracts ADD COLUMN program integer;
