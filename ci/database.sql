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

CREATE TABLE public.contacts_contacturn (
    id integer NOT NULL,
    identity character varying(255) NOT NULL,
    scheme character varying(128) NOT NULL,
    path character varying(255) NOT NULL,
    display character varying(255),
    priority integer NOT NULL,
    auth text,
    channel_id integer,
    contact_id integer,
    org_id integer NOT NULL,
    CONSTRAINT identity_matches_scheme_and_path CHECK (((identity)::text = concat(scheme, concat(':', path)))),
    CONSTRAINT non_empty_scheme_and_path CHECK ((NOT (((scheme)::text = ''::text) OR ((path)::text = ''::text))))
);