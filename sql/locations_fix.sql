ALTER TABLE public.locations DROP CONSTRAINT IF EXISTS locationchk;
ALTER TABLE public.locations ADD CONSTRAINT locationchk CHECK (length(location) <= 100);
