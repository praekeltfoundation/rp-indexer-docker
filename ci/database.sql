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

CREATE TABLE public.contacts_contactgroup_contacts (
    id bigint NOT NULL,
    contactgroup_id integer NOT NULL,
    contact_id integer NOT NULL
);

CREATE TABLE public.contacts_contactgroup (
    id integer NOT NULL,
    is_active boolean NOT NULL,
    created_on timestamp with time zone NOT NULL,
    modified_on timestamp with time zone NOT NULL,
    uuid character varying(36) NOT NULL,
    name character varying(64) NOT NULL,
    group_type character varying(1) NOT NULL,
    status character varying(1) NOT NULL,
    query text,
    created_by_id integer NOT NULL,
    modified_by_id integer NOT NULL,
    org_id integer NOT NULL
);

CREATE TABLE public.flows_flow (
    id integer NOT NULL,
    is_active boolean NOT NULL,
    created_on timestamp with time zone NOT NULL,
    modified_on timestamp with time zone NOT NULL,
    uuid character varying(36) NOT NULL,
    name character varying(64) NOT NULL,
    is_archived boolean NOT NULL,
    flow_type character varying(1) NOT NULL,
    metadata text,
    expires_after_minutes integer NOT NULL,
    ignore_triggers boolean NOT NULL,
    saved_on timestamp with time zone NOT NULL,
    base_language character varying(4),
    version_number character varying(8) NOT NULL,
    created_by_id integer NOT NULL,
    modified_by_id integer NOT NULL,
    org_id integer NOT NULL,
    saved_by_id integer NOT NULL,
    is_system boolean NOT NULL
)

CREATE TABLE public.flows_flowrun (
    id integer NOT NULL,
    uuid character varying(36) NOT NULL,
    org_id integer NOT NULL,
    flow_id integer NOT NULL,
    status character varying(1) NOT NULL,
    contact_id integer NOT NULL,
    session_id integer NOT NULL,
    created_on timestamp with time zone NOT NULL,
    modified_on timestamp with time zone NOT NULL,
    exited_on timestamp with time zone NULL,
    responded boolean NOT NULL,
    start_id integer NOT NULL,
    submitted_by_id integer NOT NULL,
    results jsonb,
    path jsonb,
    current_node_uuid character varying(36) NULL,
    delete_from_results boolean NULL
)
