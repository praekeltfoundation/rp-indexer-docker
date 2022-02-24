CREATE TABLE public.contacts_contact (
    id integer NOT NULL,
    is_active boolean NOT NULL,
    created_on timestamp with time zone NOT NULL,
    modified_on timestamp with time zone NOT NULL,
    uuid character varying(36) NOT NULL,
    name character varying(128),
    language character varying(3),
    fields jsonb,
    status character varying(1) NOT NULL,
    last_seen_on timestamp with time zone,
    created_by_id integer,
    modified_by_id integer,
    org_id integer NOT NULL,
    ticket_count integer NOT NULL,
    current_flow_id integer
);