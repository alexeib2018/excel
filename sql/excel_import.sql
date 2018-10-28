CREATE TABLE public.excel_locations (
    id integer NOT NULL,
    account text NOT NULL,
    location text NOT NULL,
    active boolean DEFAULT true,
    date_created date DEFAULT now()
);

CREATE SEQUENCE public.excel_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.excel_locations_id_seq OWNED BY public.excel_locations.id;

ALTER TABLE ONLY public.excel_locations ALTER COLUMN id SET DEFAULT nextval('public.excel_locations_id_seq'::regclass);

SELECT pg_catalog.setval('public.excel_locations_id_seq', 1, false);

ALTER TABLE ONLY public.excel_locations
    ADD CONSTRAINT excel_locations_pkey PRIMARY KEY (id);
