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


CREATE TABLE public.excel_standing_orders (
    id integer NOT NULL,
    account text NOT NULL,
    item_no text NOT NULL,
    day_of_week text NOT NULL,
    location text NOT NULL,
    quantity integer NOT NULL,
    active boolean DEFAULT true,
    date_created date DEFAULT now(),
    item_active boolean DEFAULT true,
    CONSTRAINT excel_standing_orders_day_of_week_check CHECK ((day_of_week = ANY (ARRAY['sunday'::text, 'monday'::text, 'tuesday'::text, 'wednesday'::text, 'thursday'::text, 'friday'::text, 'saturday'::text]))),
    CONSTRAINT excel_standing_orders_quantity_check CHECK ((quantity > 0))
);

CREATE SEQUENCE public.excel_standing_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.excel_standing_orders_id_seq OWNED BY public.excel_standing_orders.id;

ALTER TABLE ONLY public.excel_standing_orders ALTER COLUMN id SET DEFAULT nextval('public.excel_standing_orders_id_seq'::regclass);

SELECT pg_catalog.setval('public.excel_standing_orders_id_seq', 1, false);

ALTER TABLE ONLY public.excel_standing_orders
    ADD CONSTRAINT excel_standing_orders_pkey PRIMARY KEY (id);
