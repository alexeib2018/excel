CREATE TABLE public.excel_orders (
    id integer NOT NULL,
    account text NOT NULL,
    item_no text NOT NULL,
    day_of_week text NOT NULL,
    location text NOT NULL,
    quantity integer NOT NULL,
    active boolean DEFAULT true,
    date_created date DEFAULT now(),
    item_active boolean DEFAULT true,
    CONSTRAINT excel_orders_day_of_week_check CHECK ((day_of_week = ANY (ARRAY['sunday'::text, 'monday'::text, 'tuesday'::text, 'wednesday'::text, 'thursday'::text, 'friday'::text, 'saturday'::text]))),
    CONSTRAINT excel_orders_quantity_check CHECK ((quantity > 0))
);

CREATE SEQUENCE public.excel_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.excel_orders_id_seq OWNED BY public.excel_orders.id;

ALTER TABLE ONLY public.excel_orders ALTER COLUMN id SET DEFAULT nextval('public.excel_orders_id_seq'::regclass);

SELECT pg_catalog.setval('public.excel_orders_id_seq', 1, false);

ALTER TABLE ONLY public.excel_orders
    ADD CONSTRAINT excel_orders_pkey PRIMARY KEY (id);
