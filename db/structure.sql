--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acmg_codes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE acmg_codes (
    id integer NOT NULL,
    code text,
    description text
);


--
-- Name: acmg_codes_assertions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE acmg_codes_assertions (
    acmg_code_id integer NOT NULL,
    assertion_id integer NOT NULL
);


--
-- Name: acmg_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE acmg_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: acmg_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE acmg_codes_id_seq OWNED BY acmg_codes.id;


--
-- Name: advanced_searches; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE advanced_searches (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    params text,
    search_type text,
    token text
);


--
-- Name: advanced_searches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE advanced_searches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: advanced_searches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE advanced_searches_id_seq OWNED BY advanced_searches.id;


--
-- Name: assertions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE assertions (
    id integer NOT NULL,
    description text,
    fda_approved boolean,
    fda_approval_information text,
    nccn_guideline text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted boolean DEFAULT false,
    status text DEFAULT 'submitted'::text NOT NULL
);


--
-- Name: assertions_evidence_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE assertions_evidence_items (
    assertion_id integer NOT NULL,
    evidence_item_id integer NOT NULL
);


--
-- Name: assertions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE assertions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: assertions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE assertions_id_seq OWNED BY assertions.id;


--
-- Name: audits; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE audits (
    id integer NOT NULL,
    auditable_id integer,
    auditable_type character varying,
    associated_id integer,
    associated_type character varying,
    user_id integer,
    user_type character varying,
    username character varying,
    action character varying,
    audited_changes text,
    version integer DEFAULT 0,
    comment character varying,
    remote_address character varying,
    request_uuid character varying,
    created_at timestamp without time zone
);


--
-- Name: audits_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE audits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: audits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE audits_id_seq OWNED BY audits.id;


--
-- Name: authorizations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE authorizations (
    id integer NOT NULL,
    user_id integer NOT NULL,
    provider character varying NOT NULL,
    uid character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: authorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authorizations_id_seq OWNED BY authorizations.id;


--
-- Name: authors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE authors (
    id integer NOT NULL,
    last_name text,
    fore_name text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authors_id_seq OWNED BY authors.id;


--
-- Name: authors_sources; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE authors_sources (
    source_id integer,
    author_id integer,
    author_position integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: badge_awards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE badge_awards (
    id integer NOT NULL,
    badge_id integer,
    user_id integer,
    tier text,
    message text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: badge_awards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE badge_awards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: badge_awards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE badge_awards_id_seq OWNED BY badge_awards.id;


--
-- Name: badge_claims; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE badge_claims (
    id integer NOT NULL,
    user_id integer,
    badge_id integer,
    redemption_code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: badge_claims_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE badge_claims_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: badge_claims_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE badge_claims_id_seq OWNED BY badge_claims.id;


--
-- Name: badges; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE badges (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    additional_fields text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    display_name text
);


--
-- Name: badges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE badges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE badges_id_seq OWNED BY badges.id;


--
-- Name: clinical_trials; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE clinical_trials (
    id integer NOT NULL,
    nct_id text,
    name text,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: clinical_trials_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE clinical_trials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clinical_trials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE clinical_trials_id_seq OWNED BY clinical_trials.id;


--
-- Name: clinical_trials_sources; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE clinical_trials_sources (
    clinical_trial_id integer NOT NULL,
    source_id integer NOT NULL,
    sources_id integer,
    clinical_trials_id integer
);


--
-- Name: clinvar_entries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE clinvar_entries (
    id integer NOT NULL,
    clinvar_id character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: clinvar_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE clinvar_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clinvar_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE clinvar_entries_id_seq OWNED BY clinvar_entries.id;


--
-- Name: clinvar_entries_variants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE clinvar_entries_variants (
    clinvar_entry_id integer NOT NULL,
    variant_id integer NOT NULL,
    clinvar_entries_id integer,
    variants_id integer
);


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE comments (
    id integer NOT NULL,
    title text DEFAULT ''::character varying,
    comment text,
    commentable_id integer,
    commentable_type character varying,
    user_id integer,
    role character varying DEFAULT 'comments'::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: data_versions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE data_versions (
    id integer NOT NULL,
    version integer DEFAULT 0
);


--
-- Name: data_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE data_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: data_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE data_versions_id_seq OWNED BY data_versions.id;


--
-- Name: definitions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE definitions (
    id integer NOT NULL,
    term character varying NOT NULL,
    text text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: definitions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE definitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: definitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE definitions_id_seq OWNED BY definitions.id;


--
-- Name: delayed_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE delayed_jobs (
    id integer NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    attempts integer DEFAULT 0 NOT NULL,
    handler text NOT NULL,
    last_error text,
    run_at timestamp without time zone,
    locked_at timestamp without time zone,
    failed_at timestamp without time zone,
    locked_by character varying,
    queue character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE delayed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE delayed_jobs_id_seq OWNED BY delayed_jobs.id;


--
-- Name: disease_aliases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE disease_aliases (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: disease_aliases_diseases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE disease_aliases_diseases (
    disease_alias_id integer NOT NULL,
    disease_id integer NOT NULL
);


--
-- Name: disease_aliases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE disease_aliases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: disease_aliases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE disease_aliases_id_seq OWNED BY disease_aliases.id;


--
-- Name: diseases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE diseases (
    id integer NOT NULL,
    doid text,
    display_name character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying
);


--
-- Name: diseases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE diseases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: diseases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE diseases_id_seq OWNED BY diseases.id;


--
-- Name: domain_expert_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE domain_expert_tags (
    id integer NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    domain_of_expertise_id integer,
    domain_of_expertise_type character varying,
    user_id integer
);


--
-- Name: domain_expert_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE domain_expert_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: domain_expert_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE domain_expert_tags_id_seq OWNED BY domain_expert_tags.id;


--
-- Name: drugs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE drugs (
    id integer NOT NULL,
    name character varying NOT NULL,
    pubchem_id character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: drugs_evidence_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE drugs_evidence_items (
    drug_id integer NOT NULL,
    evidence_item_id integer NOT NULL
);


--
-- Name: drugs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE drugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: drugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE drugs_id_seq OWNED BY drugs.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE events (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    action text,
    description text,
    originating_user_id integer,
    subject_id integer,
    subject_type character varying,
    state_params text,
    unlinkable boolean DEFAULT false
);


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: evidence_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE evidence_items (
    id integer NOT NULL,
    description text NOT NULL,
    disease_id integer,
    source_id integer,
    variant_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    rating integer,
    status character varying,
    variant_hgvs character varying,
    evidence_level integer,
    evidence_type integer,
    variant_origin integer,
    evidence_direction integer,
    clinical_significance integer,
    deleted boolean DEFAULT false,
    deleted_at timestamp without time zone,
    drug_interaction_type integer
);


--
-- Name: variants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE variants (
    id integer NOT NULL,
    gene_id integer NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted boolean DEFAULT false,
    deleted_at timestamp without time zone,
    genome_build text,
    chromosome text,
    start integer,
    stop integer,
    reference_bases text,
    variant_bases text,
    representative_transcript text,
    chromosome2 text,
    start2 integer,
    stop2 integer,
    reference_build integer,
    representative_transcript2 text,
    ensembl_version integer,
    secondary_gene_id integer
);


--
-- Name: evidence_items_by_statuses; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW evidence_items_by_statuses AS
 SELECT v.id AS variant_id,
    sum(
        CASE
            WHEN ((ei.status)::text = 'accepted'::text) THEN 1
            ELSE 0
        END) AS accepted_count,
    sum(
        CASE
            WHEN ((ei.status)::text = 'rejected'::text) THEN 1
            ELSE 0
        END) AS rejected_count,
    sum(
        CASE
            WHEN ((ei.status)::text = 'submitted'::text) THEN 1
            ELSE 0
        END) AS submitted_count
   FROM (variants v
     JOIN evidence_items ei ON ((v.id = ei.variant_id)))
  GROUP BY v.id;


--
-- Name: evidence_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE evidence_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: evidence_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE evidence_items_id_seq OWNED BY evidence_items.id;


--
-- Name: flags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE flags (
    id integer NOT NULL,
    flagging_user_id integer,
    resolving_user_id integer,
    flaggable_id integer,
    flaggable_type character varying,
    state text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: flags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE flags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE flags_id_seq OWNED BY flags.id;


--
-- Name: gene_aliases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gene_aliases (
    id integer NOT NULL,
    name character varying
);


--
-- Name: gene_aliases_genes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gene_aliases_genes (
    gene_alias_id integer NOT NULL,
    gene_id integer NOT NULL
);


--
-- Name: gene_aliases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE gene_aliases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: gene_aliases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE gene_aliases_id_seq OWNED BY gene_aliases.id;


--
-- Name: genes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE genes (
    id integer NOT NULL,
    entrez_id integer NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    official_name text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    clinical_description text,
    deleted boolean DEFAULT false,
    deleted_at timestamp without time zone
);


--
-- Name: genes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE genes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: genes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE genes_id_seq OWNED BY genes.id;


--
-- Name: genes_sources; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE genes_sources (
    gene_id integer NOT NULL,
    source_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: hgvs_expressions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE hgvs_expressions (
    id integer NOT NULL,
    expression text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: hgvs_expressions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE hgvs_expressions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hgvs_expressions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE hgvs_expressions_id_seq OWNED BY hgvs_expressions.id;


--
-- Name: hgvs_expressions_variants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE hgvs_expressions_variants (
    hgvs_expression_id integer NOT NULL,
    variant_id integer NOT NULL,
    variants_id integer,
    hgvs_expressions_id integer
);


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE notifications (
    id integer NOT NULL,
    notified_user_id integer,
    originating_user_id integer,
    event_id integer,
    subscription_id integer,
    seen boolean DEFAULT false,
    type integer,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE notifications_id_seq OWNED BY notifications.id;


--
-- Name: ontologies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ontologies (
    id integer NOT NULL,
    name character varying,
    version character varying,
    import_date timestamp without time zone,
    permalink_format character varying,
    civic_class character varying,
    id_name character varying
);


--
-- Name: ontologies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ontologies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ontologies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ontologies_id_seq OWNED BY ontologies.id;


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE organizations (
    id integer NOT NULL,
    name text,
    url text,
    description text,
    profile_image_file_name character varying,
    profile_image_content_type character varying,
    profile_image_file_size integer,
    profile_image_updated_at timestamp without time zone
);


--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE organizations_id_seq OWNED BY organizations.id;


--
-- Name: pipeline_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pipeline_types (
    id integer NOT NULL,
    name text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: pipeline_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pipeline_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pipeline_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pipeline_types_id_seq OWNED BY pipeline_types.id;


--
-- Name: pipeline_types_variant_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pipeline_types_variant_types (
    pipeline_type_id integer NOT NULL,
    variant_type_id integer NOT NULL,
    variant_types_id integer,
    pipeline_types_id integer
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: source_suggestions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE source_suggestions (
    id integer NOT NULL,
    source_id integer,
    user_id integer,
    gene_name text,
    disease_name text,
    variant_name text,
    initial_comment text,
    status text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    reason text
);


--
-- Name: source_suggestions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE source_suggestions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: source_suggestions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE source_suggestions_id_seq OWNED BY source_suggestions.id;


--
-- Name: sources; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sources (
    id integer NOT NULL,
    pubmed_id character varying NOT NULL,
    study_type character varying,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    abstract text,
    open_access boolean,
    pmc_id text,
    publication_year integer,
    publication_month integer,
    publication_day integer,
    journal text,
    full_journal_title character varying,
    name text,
    status text DEFAULT 'fully curated'::text NOT NULL,
    is_review boolean
);


--
-- Name: sources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sources_id_seq OWNED BY sources.id;


--
-- Name: sources_variant_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sources_variant_groups (
    variant_group_id integer NOT NULL,
    source_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: sources_variants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sources_variants (
    variant_id integer NOT NULL,
    source_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE subscriptions (
    id integer NOT NULL,
    user_id integer,
    subscribable_id integer,
    subscribable_type character varying,
    type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    action_type text,
    action_class text
);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE subscriptions_id_seq OWNED BY subscriptions.id;


--
-- Name: suggested_changes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE suggested_changes (
    id integer NOT NULL,
    suggested_changes text NOT NULL,
    moderated_id integer,
    moderated_type character varying,
    user_id integer NOT NULL,
    status character varying DEFAULT 'new'::character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: suggested_changes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE suggested_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: suggested_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE suggested_changes_id_seq OWNED BY suggested_changes.id;


--
-- Name: tsv_releases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tsv_releases (
    id integer NOT NULL,
    path text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: tsv_releases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tsv_releases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tsv_releases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tsv_releases_id_seq OWNED BY tsv_releases.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying,
    name character varying,
    url character varying,
    username character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    orcid character varying,
    area_of_expertise integer,
    deleted boolean DEFAULT false,
    deleted_at timestamp without time zone,
    role integer DEFAULT 0,
    last_seen_at timestamp without time zone,
    twitter_handle text,
    facebook_profile text,
    linkedin_profile text,
    accepted_license boolean,
    featured_expert boolean DEFAULT false,
    bio text,
    signup_complete boolean,
    organization_id integer,
    affiliation text,
    profile_image_file_name character varying,
    profile_image_content_type character varying,
    profile_image_file_size integer,
    profile_image_updated_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: variant_aliases; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE variant_aliases (
    id integer NOT NULL,
    name character varying
);


--
-- Name: variant_aliases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE variant_aliases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: variant_aliases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE variant_aliases_id_seq OWNED BY variant_aliases.id;


--
-- Name: variant_aliases_variants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE variant_aliases_variants (
    variant_alias_id integer NOT NULL,
    variant_id integer NOT NULL
);


--
-- Name: variant_group_variants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE variant_group_variants (
    variant_id integer NOT NULL,
    variant_group_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: variant_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE variant_groups (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted boolean DEFAULT false,
    deleted_at timestamp without time zone
);


--
-- Name: variant_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE variant_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: variant_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE variant_groups_id_seq OWNED BY variant_groups.id;


--
-- Name: variant_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE variant_types (
    id integer NOT NULL,
    name text NOT NULL,
    display_name text NOT NULL,
    description text NOT NULL,
    soid text NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    parent_id integer,
    lft integer,
    rgt integer
);


--
-- Name: variant_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE variant_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: variant_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE variant_types_id_seq OWNED BY variant_types.id;


--
-- Name: variant_types_variants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE variant_types_variants (
    variant_id integer NOT NULL,
    variant_type_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: variants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE variants_id_seq OWNED BY variants.id;


--
-- Name: acmg_codes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY acmg_codes ALTER COLUMN id SET DEFAULT nextval('acmg_codes_id_seq'::regclass);


--
-- Name: advanced_searches id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY advanced_searches ALTER COLUMN id SET DEFAULT nextval('advanced_searches_id_seq'::regclass);


--
-- Name: assertions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY assertions ALTER COLUMN id SET DEFAULT nextval('assertions_id_seq'::regclass);


--
-- Name: audits id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY audits ALTER COLUMN id SET DEFAULT nextval('audits_id_seq'::regclass);


--
-- Name: authorizations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authorizations ALTER COLUMN id SET DEFAULT nextval('authorizations_id_seq'::regclass);


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authors ALTER COLUMN id SET DEFAULT nextval('authors_id_seq'::regclass);


--
-- Name: badge_awards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY badge_awards ALTER COLUMN id SET DEFAULT nextval('badge_awards_id_seq'::regclass);


--
-- Name: badge_claims id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY badge_claims ALTER COLUMN id SET DEFAULT nextval('badge_claims_id_seq'::regclass);


--
-- Name: badges id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY badges ALTER COLUMN id SET DEFAULT nextval('badges_id_seq'::regclass);


--
-- Name: clinical_trials id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY clinical_trials ALTER COLUMN id SET DEFAULT nextval('clinical_trials_id_seq'::regclass);


--
-- Name: clinvar_entries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY clinvar_entries ALTER COLUMN id SET DEFAULT nextval('clinvar_entries_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: data_versions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY data_versions ALTER COLUMN id SET DEFAULT nextval('data_versions_id_seq'::regclass);


--
-- Name: definitions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY definitions ALTER COLUMN id SET DEFAULT nextval('definitions_id_seq'::regclass);


--
-- Name: delayed_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY delayed_jobs ALTER COLUMN id SET DEFAULT nextval('delayed_jobs_id_seq'::regclass);


--
-- Name: disease_aliases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY disease_aliases ALTER COLUMN id SET DEFAULT nextval('disease_aliases_id_seq'::regclass);


--
-- Name: diseases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY diseases ALTER COLUMN id SET DEFAULT nextval('diseases_id_seq'::regclass);


--
-- Name: domain_expert_tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY domain_expert_tags ALTER COLUMN id SET DEFAULT nextval('domain_expert_tags_id_seq'::regclass);


--
-- Name: drugs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugs ALTER COLUMN id SET DEFAULT nextval('drugs_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: evidence_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY evidence_items ALTER COLUMN id SET DEFAULT nextval('evidence_items_id_seq'::regclass);


--
-- Name: flags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY flags ALTER COLUMN id SET DEFAULT nextval('flags_id_seq'::regclass);


--
-- Name: gene_aliases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY gene_aliases ALTER COLUMN id SET DEFAULT nextval('gene_aliases_id_seq'::regclass);


--
-- Name: genes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY genes ALTER COLUMN id SET DEFAULT nextval('genes_id_seq'::regclass);


--
-- Name: hgvs_expressions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY hgvs_expressions ALTER COLUMN id SET DEFAULT nextval('hgvs_expressions_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications ALTER COLUMN id SET DEFAULT nextval('notifications_id_seq'::regclass);


--
-- Name: ontologies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ontologies ALTER COLUMN id SET DEFAULT nextval('ontologies_id_seq'::regclass);


--
-- Name: organizations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizations ALTER COLUMN id SET DEFAULT nextval('organizations_id_seq'::regclass);


--
-- Name: pipeline_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pipeline_types ALTER COLUMN id SET DEFAULT nextval('pipeline_types_id_seq'::regclass);


--
-- Name: source_suggestions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY source_suggestions ALTER COLUMN id SET DEFAULT nextval('source_suggestions_id_seq'::regclass);


--
-- Name: sources id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sources ALTER COLUMN id SET DEFAULT nextval('sources_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY subscriptions ALTER COLUMN id SET DEFAULT nextval('subscriptions_id_seq'::regclass);


--
-- Name: suggested_changes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY suggested_changes ALTER COLUMN id SET DEFAULT nextval('suggested_changes_id_seq'::regclass);


--
-- Name: tsv_releases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tsv_releases ALTER COLUMN id SET DEFAULT nextval('tsv_releases_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: variant_aliases id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY variant_aliases ALTER COLUMN id SET DEFAULT nextval('variant_aliases_id_seq'::regclass);


--
-- Name: variant_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY variant_groups ALTER COLUMN id SET DEFAULT nextval('variant_groups_id_seq'::regclass);


--
-- Name: variant_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY variant_types ALTER COLUMN id SET DEFAULT nextval('variant_types_id_seq'::regclass);


--
-- Name: variants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY variants ALTER COLUMN id SET DEFAULT nextval('variants_id_seq'::regclass);


--
-- Name: acmg_codes acmg_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY acmg_codes
    ADD CONSTRAINT acmg_codes_pkey PRIMARY KEY (id);


--
-- Name: advanced_searches advanced_searches_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY advanced_searches
    ADD CONSTRAINT advanced_searches_pkey PRIMARY KEY (id);


--
-- Name: assertions assertions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY assertions
    ADD CONSTRAINT assertions_pkey PRIMARY KEY (id);


--
-- Name: audits audits_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);


--
-- Name: authorizations authorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authorizations
    ADD CONSTRAINT authorizations_pkey PRIMARY KEY (id);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: badge_awards badge_awards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY badge_awards
    ADD CONSTRAINT badge_awards_pkey PRIMARY KEY (id);


--
-- Name: badge_claims badge_claims_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY badge_claims
    ADD CONSTRAINT badge_claims_pkey PRIMARY KEY (id);


--
-- Name: badges badges_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY badges
    ADD CONSTRAINT badges_pkey PRIMARY KEY (id);


--
-- Name: clinical_trials clinical_trials_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY clinical_trials
    ADD CONSTRAINT clinical_trials_pkey PRIMARY KEY (id);


--
-- Name: clinvar_entries clinvar_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY clinvar_entries
    ADD CONSTRAINT clinvar_entries_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: data_versions data_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY data_versions
    ADD CONSTRAINT data_versions_pkey PRIMARY KEY (id);


--
-- Name: definitions definitions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY definitions
    ADD CONSTRAINT definitions_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs delayed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY delayed_jobs
    ADD CONSTRAINT delayed_jobs_pkey PRIMARY KEY (id);


--
-- Name: disease_aliases disease_aliases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY disease_aliases
    ADD CONSTRAINT disease_aliases_pkey PRIMARY KEY (id);


--
-- Name: diseases diseases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY diseases
    ADD CONSTRAINT diseases_pkey PRIMARY KEY (id);


--
-- Name: domain_expert_tags domain_expert_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY domain_expert_tags
    ADD CONSTRAINT domain_expert_tags_pkey PRIMARY KEY (id);


--
-- Name: drugs drugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugs
    ADD CONSTRAINT drugs_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: evidence_items evidence_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY evidence_items
    ADD CONSTRAINT evidence_items_pkey PRIMARY KEY (id);


--
-- Name: flags flags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY flags
    ADD CONSTRAINT flags_pkey PRIMARY KEY (id);


--
-- Name: gene_aliases gene_aliases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gene_aliases
    ADD CONSTRAINT gene_aliases_pkey PRIMARY KEY (id);


--
-- Name: genes genes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY genes
    ADD CONSTRAINT genes_pkey PRIMARY KEY (id);


--
-- Name: hgvs_expressions hgvs_expressions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY hgvs_expressions
    ADD CONSTRAINT hgvs_expressions_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: ontologies ontologies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ontologies
    ADD CONSTRAINT ontologies_pkey PRIMARY KEY (id);


--
-- Name: organizations organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: pipeline_types pipeline_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pipeline_types
    ADD CONSTRAINT pipeline_types_pkey PRIMARY KEY (id);


--
-- Name: source_suggestions source_suggestions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY source_suggestions
    ADD CONSTRAINT source_suggestions_pkey PRIMARY KEY (id);


--
-- Name: sources sources_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sources
    ADD CONSTRAINT sources_pkey PRIMARY KEY (id);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: suggested_changes suggested_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY suggested_changes
    ADD CONSTRAINT suggested_changes_pkey PRIMARY KEY (id);


--
-- Name: tsv_releases tsv_releases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tsv_releases
    ADD CONSTRAINT tsv_releases_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: variant_aliases variant_aliases_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY variant_aliases
    ADD CONSTRAINT variant_aliases_pkey PRIMARY KEY (id);


--
-- Name: variant_groups variant_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY variant_groups
    ADD CONSTRAINT variant_groups_pkey PRIMARY KEY (id);


--
-- Name: variant_types variant_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY variant_types
    ADD CONSTRAINT variant_types_pkey PRIMARY KEY (id);


--
-- Name: variants variants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY variants
    ADD CONSTRAINT variants_pkey PRIMARY KEY (id);


--
-- Name: associated_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX associated_index ON audits USING btree (associated_id, associated_type);


--
-- Name: auditable_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auditable_index ON audits USING btree (auditable_id, auditable_type);


--
-- Name: delayed_jobs_priority; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX delayed_jobs_priority ON delayed_jobs USING btree (priority, run_at);


--
-- Name: disease_alias_diseases_composite; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX disease_alias_diseases_composite ON disease_aliases_diseases USING btree (disease_alias_id, disease_id);


--
-- Name: gene_name_size_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX gene_name_size_idx ON genes USING btree (char_length((name)::text));


--
-- Name: idx_author_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_author_source_id ON authors_sources USING btree (source_id, author_id);


--
-- Name: idx_clinical_trials_sources; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_clinical_trials_sources ON clinical_trials_sources USING btree (clinical_trial_id, source_id);


--
-- Name: idx_clinvar_variants; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_clinvar_variants ON clinvar_entries_variants USING btree (clinvar_entry_id, variant_id);


--
-- Name: idx_domain_of_expertise; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_domain_of_expertise ON domain_expert_tags USING btree (domain_of_expertise_id, domain_of_expertise_type);


--
-- Name: idx_variant_alias_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_variant_alias_variant_id ON variant_aliases_variants USING btree (variant_alias_id, variant_id);


--
-- Name: idx_variant_id_hgvs_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_variant_id_hgvs_id ON hgvs_expressions_variants USING btree (variant_id, hgvs_expression_id);


--
-- Name: idx_variant_type_pipeline_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_variant_type_pipeline_type ON pipeline_types_variant_types USING btree (variant_type_id, pipeline_type_id);


--
-- Name: index_acmg_codes_assertions_on_acmg_code_id_and_assertion_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_acmg_codes_assertions_on_acmg_code_id_and_assertion_id ON acmg_codes_assertions USING btree (acmg_code_id, assertion_id);


--
-- Name: index_acmg_codes_assertions_on_assertion_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_acmg_codes_assertions_on_assertion_id ON acmg_codes_assertions USING btree (assertion_id);


--
-- Name: index_acmg_codes_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_acmg_codes_on_code ON acmg_codes USING btree (code);


--
-- Name: index_advanced_searches_on_token_and_search_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_advanced_searches_on_token_and_search_type ON advanced_searches USING btree (token, search_type);


--
-- Name: index_assertion_id_evidence_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assertion_id_evidence_item_id ON assertions_evidence_items USING btree (assertion_id, evidence_item_id);


--
-- Name: index_assertions_evidence_items_on_evidence_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assertions_evidence_items_on_evidence_item_id ON assertions_evidence_items USING btree (evidence_item_id);


--
-- Name: index_assertions_on_description; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assertions_on_description ON assertions USING btree (description);


--
-- Name: index_assertions_on_fda_approved; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assertions_on_fda_approved ON assertions USING btree (fda_approved);


--
-- Name: index_assertions_on_nccn_guideline; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_assertions_on_nccn_guideline ON assertions USING btree (nccn_guideline);


--
-- Name: index_audits_on_action; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_audits_on_action ON audits USING btree (action);


--
-- Name: index_audits_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_audits_on_created_at ON audits USING btree (created_at);


--
-- Name: index_audits_on_request_uuid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_audits_on_request_uuid ON audits USING btree (request_uuid);


--
-- Name: index_authorizations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_authorizations_on_user_id ON authorizations USING btree (user_id);


--
-- Name: index_authors_sources_on_author_id_and_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_authors_sources_on_author_id_and_source_id ON authors_sources USING btree (author_id, source_id);


--
-- Name: index_authors_sources_on_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_authors_sources_on_source_id ON authors_sources USING btree (source_id);


--
-- Name: index_badge_awards_on_badge_id_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_badge_awards_on_badge_id_and_user_id ON badge_awards USING btree (badge_id, user_id);


--
-- Name: index_badge_awards_on_user_id_and_badge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_badge_awards_on_user_id_and_badge_id ON badge_awards USING btree (user_id, badge_id);


--
-- Name: index_badge_claims_on_badge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_badge_claims_on_badge_id ON badge_claims USING btree (badge_id);


--
-- Name: index_badge_claims_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_badge_claims_on_user_id ON badge_claims USING btree (user_id);


--
-- Name: index_badges_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_badges_on_name ON badges USING btree (name);


--
-- Name: index_clinical_trials_on_nct_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_clinical_trials_on_nct_id ON clinical_trials USING btree (nct_id);


--
-- Name: index_clinical_trials_sources_on_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_clinical_trials_sources_on_source_id ON clinical_trials_sources USING btree (source_id);


--
-- Name: index_clinvar_entries_on_clinvar_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_clinvar_entries_on_clinvar_id ON clinvar_entries USING btree (clinvar_id);


--
-- Name: index_clinvar_entries_variants_on_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_clinvar_entries_variants_on_variant_id ON clinvar_entries_variants USING btree (variant_id);


--
-- Name: index_comments_on_commentable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_commentable_id ON comments USING btree (commentable_id);


--
-- Name: index_comments_on_commentable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_commentable_type ON comments USING btree (commentable_type);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_user_id ON comments USING btree (user_id);


--
-- Name: index_definitions_on_term; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_definitions_on_term ON definitions USING btree (term);


--
-- Name: index_disease_aliases_diseases_on_disease_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_disease_aliases_diseases_on_disease_id ON disease_aliases_diseases USING btree (disease_id);


--
-- Name: index_disease_aliases_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_disease_aliases_on_name ON disease_aliases USING btree (name);


--
-- Name: index_domain_expert_tags_on_description; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_domain_expert_tags_on_description ON domain_expert_tags USING btree (description);


--
-- Name: index_domain_expert_tags_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_domain_expert_tags_on_user_id ON domain_expert_tags USING btree (user_id);


--
-- Name: index_drugs_evidence_items_on_drug_id_and_evidence_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_drugs_evidence_items_on_drug_id_and_evidence_item_id ON drugs_evidence_items USING btree (drug_id, evidence_item_id);


--
-- Name: index_drugs_evidence_items_on_evidence_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_drugs_evidence_items_on_evidence_item_id ON drugs_evidence_items USING btree (evidence_item_id);


--
-- Name: index_events_on_originating_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_originating_user_id ON events USING btree (originating_user_id);


--
-- Name: index_events_on_subject_id_and_subject_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_events_on_subject_id_and_subject_type ON events USING btree (subject_id, subject_type);


--
-- Name: index_evidence_items_on_clinical_significance; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_evidence_items_on_clinical_significance ON evidence_items USING btree (clinical_significance);


--
-- Name: index_evidence_items_on_deleted; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_evidence_items_on_deleted ON evidence_items USING btree (deleted);


--
-- Name: index_evidence_items_on_disease_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_evidence_items_on_disease_id ON evidence_items USING btree (disease_id);


--
-- Name: index_evidence_items_on_drug_interaction_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_evidence_items_on_drug_interaction_type ON evidence_items USING btree (drug_interaction_type);


--
-- Name: index_evidence_items_on_evidence_direction; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_evidence_items_on_evidence_direction ON evidence_items USING btree (evidence_direction);


--
-- Name: index_evidence_items_on_evidence_level; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_evidence_items_on_evidence_level ON evidence_items USING btree (evidence_level);


--
-- Name: index_evidence_items_on_evidence_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_evidence_items_on_evidence_type ON evidence_items USING btree (evidence_type);


--
-- Name: index_evidence_items_on_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_evidence_items_on_source_id ON evidence_items USING btree (source_id);


--
-- Name: index_evidence_items_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_evidence_items_on_status ON evidence_items USING btree (status);


--
-- Name: index_evidence_items_on_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_evidence_items_on_variant_id ON evidence_items USING btree (variant_id);


--
-- Name: index_evidence_items_on_variant_origin; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_evidence_items_on_variant_origin ON evidence_items USING btree (variant_origin);


--
-- Name: index_flags_on_flaggable_type_and_flaggable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_flags_on_flaggable_type_and_flaggable_id ON flags USING btree (flaggable_type, flaggable_id);


--
-- Name: index_flags_on_flagging_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_flags_on_flagging_user_id ON flags USING btree (flagging_user_id);


--
-- Name: index_flags_on_resolving_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_flags_on_resolving_user_id ON flags USING btree (resolving_user_id);


--
-- Name: index_flags_on_state; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_flags_on_state ON flags USING btree (state);


--
-- Name: index_gene_aliases_genes_on_gene_alias_id_and_gene_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_gene_aliases_genes_on_gene_alias_id_and_gene_id ON gene_aliases_genes USING btree (gene_alias_id, gene_id);


--
-- Name: index_gene_aliases_genes_on_gene_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_gene_aliases_genes_on_gene_id ON gene_aliases_genes USING btree (gene_id);


--
-- Name: index_gene_aliases_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_gene_aliases_on_name ON gene_aliases USING btree (name);


--
-- Name: index_genes_on_deleted; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_genes_on_deleted ON genes USING btree (deleted);


--
-- Name: index_genes_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_genes_on_name ON genes USING btree (name);


--
-- Name: index_genes_sources_on_gene_id_and_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_genes_sources_on_gene_id_and_source_id ON genes_sources USING btree (gene_id, source_id);


--
-- Name: index_hgvs_expressions_on_expression; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hgvs_expressions_on_expression ON hgvs_expressions USING btree (expression);


--
-- Name: index_hgvs_expressions_variants_on_hgvs_expression_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hgvs_expressions_variants_on_hgvs_expression_id ON hgvs_expressions_variants USING btree (hgvs_expression_id);


--
-- Name: index_notifications_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notifications_on_created_at ON notifications USING btree (created_at);


--
-- Name: index_notifications_on_notified_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notifications_on_notified_user_id ON notifications USING btree (notified_user_id);


--
-- Name: index_pipeline_types_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pipeline_types_on_name ON pipeline_types USING btree (name);


--
-- Name: index_pipeline_types_variant_types_on_pipeline_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pipeline_types_variant_types_on_pipeline_type_id ON pipeline_types_variant_types USING btree (pipeline_type_id);


--
-- Name: index_subscriptions_on_action_type_and_action_class; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_action_type_and_action_class ON subscriptions USING btree (action_type, action_class);


--
-- Name: index_subscriptions_on_subscribable_id_and_subscribable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_subscribable_id_and_subscribable_type ON subscriptions USING btree (subscribable_id, subscribable_type);


--
-- Name: index_subscriptions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_user_id ON subscriptions USING btree (user_id);


--
-- Name: index_suggested_changes_on_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_suggested_changes_on_created_at ON suggested_changes USING btree (created_at);


--
-- Name: index_suggested_changes_on_moderated_id_and_moderated_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_suggested_changes_on_moderated_id_and_moderated_type ON suggested_changes USING btree (moderated_id, moderated_type);


--
-- Name: index_suggested_changes_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_suggested_changes_on_status ON suggested_changes USING btree (status);


--
-- Name: index_suggested_changes_on_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_suggested_changes_on_updated_at ON suggested_changes USING btree (updated_at);


--
-- Name: index_users_on_deleted; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_deleted ON users USING btree (deleted);


--
-- Name: index_users_on_last_seen_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_last_seen_at ON users USING btree (last_seen_at);


--
-- Name: index_users_on_organization_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_organization_id ON users USING btree (organization_id);


--
-- Name: index_users_on_role; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_role ON users USING btree (role);


--
-- Name: index_variant_aliases_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variant_aliases_on_name ON variant_aliases USING btree (name);


--
-- Name: index_variant_aliases_variants_on_variant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variant_aliases_variants_on_variant_id ON variant_aliases_variants USING btree (variant_id);


--
-- Name: index_variant_group_variants_on_variant_id_and_variant_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variant_group_variants_on_variant_id_and_variant_group_id ON variant_group_variants USING btree (variant_id, variant_group_id);


--
-- Name: index_variant_groups_on_deleted; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variant_groups_on_deleted ON variant_groups USING btree (deleted);


--
-- Name: index_variant_types_on_display_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variant_types_on_display_name ON variant_types USING btree (display_name);


--
-- Name: index_variant_types_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variant_types_on_name ON variant_types USING btree (name);


--
-- Name: index_variant_types_on_soid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variant_types_on_soid ON variant_types USING btree (soid);


--
-- Name: index_variant_types_variants_on_variant_id_and_variant_type_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variant_types_variants_on_variant_id_and_variant_type_id ON variant_types_variants USING btree (variant_id, variant_type_id);


--
-- Name: index_variants_on_chromosome; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variants_on_chromosome ON variants USING btree (chromosome);


--
-- Name: index_variants_on_chromosome2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variants_on_chromosome2 ON variants USING btree (chromosome2);


--
-- Name: index_variants_on_deleted; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variants_on_deleted ON variants USING btree (deleted);


--
-- Name: index_variants_on_gene_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variants_on_gene_id ON variants USING btree (gene_id);


--
-- Name: index_variants_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variants_on_name ON variants USING btree (name);


--
-- Name: index_variants_on_reference_bases; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variants_on_reference_bases ON variants USING btree (reference_bases);


--
-- Name: index_variants_on_secondary_gene_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variants_on_secondary_gene_id ON variants USING btree (secondary_gene_id);


--
-- Name: index_variants_on_start; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variants_on_start ON variants USING btree (start);


--
-- Name: index_variants_on_start2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variants_on_start2 ON variants USING btree (start2);


--
-- Name: index_variants_on_stop; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variants_on_stop ON variants USING btree (stop);


--
-- Name: index_variants_on_stop2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variants_on_stop2 ON variants USING btree (stop2);


--
-- Name: index_variants_on_variant_bases; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_variants_on_variant_bases ON variants USING btree (variant_bases);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: user_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX user_index ON audits USING btree (user_id, user_type);


--
-- Name: variant_lower_name_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX variant_lower_name_idx ON variants USING btree (lower((name)::text));


--
-- Name: suggested_changes fk_rails_025e926e34; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY suggested_changes
    ADD CONSTRAINT fk_rails_025e926e34 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: comments fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: variant_group_variants fk_rails_13965cbccb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY variant_group_variants
    ADD CONSTRAINT fk_rails_13965cbccb FOREIGN KEY (variant_group_id) REFERENCES variant_groups(id);


--
-- Name: disease_aliases_diseases fk_rails_1419565e48; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY disease_aliases_diseases
    ADD CONSTRAINT fk_rails_1419565e48 FOREIGN KEY (disease_id) REFERENCES diseases(id);


--
-- Name: evidence_items fk_rails_1790fdfc77; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY evidence_items
    ADD CONSTRAINT fk_rails_1790fdfc77 FOREIGN KEY (disease_id) REFERENCES diseases(id);


--
-- Name: assertions_evidence_items fk_rails_1a71ec8134; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY assertions_evidence_items
    ADD CONSTRAINT fk_rails_1a71ec8134 FOREIGN KEY (assertion_id) REFERENCES assertions(id);


--
-- Name: domain_expert_tags fk_rails_26f2de6432; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY domain_expert_tags
    ADD CONSTRAINT fk_rails_26f2de6432 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: drugs_evidence_items fk_rails_2a4e21edef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugs_evidence_items
    ADD CONSTRAINT fk_rails_2a4e21edef FOREIGN KEY (drug_id) REFERENCES drugs(id);


--
-- Name: notifications fk_rails_2c2bc6d901; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT fk_rails_2c2bc6d901 FOREIGN KEY (originating_user_id) REFERENCES users(id);


--
-- Name: events fk_rails_316901e628; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY events
    ADD CONSTRAINT fk_rails_316901e628 FOREIGN KEY (originating_user_id) REFERENCES users(id);


--
-- Name: genes_sources fk_rails_34c6787887; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY genes_sources
    ADD CONSTRAINT fk_rails_34c6787887 FOREIGN KEY (gene_id) REFERENCES genes(id);


--
-- Name: evidence_items fk_rails_493e210046; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY evidence_items
    ADD CONSTRAINT fk_rails_493e210046 FOREIGN KEY (variant_id) REFERENCES variants(id);


--
-- Name: authorizations fk_rails_4ecef5b8c5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authorizations
    ADD CONSTRAINT fk_rails_4ecef5b8c5 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: authors_sources fk_rails_6b13cd95ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authors_sources
    ADD CONSTRAINT fk_rails_6b13cd95ea FOREIGN KEY (author_id) REFERENCES authors(id);


--
-- Name: gene_aliases_genes fk_rails_6be3f8a4b2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gene_aliases_genes
    ADD CONSTRAINT fk_rails_6be3f8a4b2 FOREIGN KEY (gene_id) REFERENCES genes(id);


--
-- Name: variant_aliases_variants fk_rails_766d3c3835; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY variant_aliases_variants
    ADD CONSTRAINT fk_rails_766d3c3835 FOREIGN KEY (variant_id) REFERENCES variants(id);


--
-- Name: acmg_codes_assertions fk_rails_76cf70418c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY acmg_codes_assertions
    ADD CONSTRAINT fk_rails_76cf70418c FOREIGN KEY (acmg_code_id) REFERENCES acmg_codes(id);


--
-- Name: notifications fk_rails_78f4b5a537; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT fk_rails_78f4b5a537 FOREIGN KEY (event_id) REFERENCES events(id);


--
-- Name: gene_aliases_genes fk_rails_7be626955a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gene_aliases_genes
    ADD CONSTRAINT fk_rails_7be626955a FOREIGN KEY (gene_alias_id) REFERENCES gene_aliases(id);


--
-- Name: notifications fk_rails_886d275cf4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT fk_rails_886d275cf4 FOREIGN KEY (subscription_id) REFERENCES subscriptions(id);


--
-- Name: subscriptions fk_rails_933bdff476; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT fk_rails_933bdff476 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: variants fk_rails_af50702d97; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY variants
    ADD CONSTRAINT fk_rails_af50702d97 FOREIGN KEY (gene_id) REFERENCES genes(id);


--
-- Name: assertions_evidence_items fk_rails_b169b222a2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY assertions_evidence_items
    ADD CONSTRAINT fk_rails_b169b222a2 FOREIGN KEY (evidence_item_id) REFERENCES evidence_items(id);


--
-- Name: genes_sources fk_rails_b177d24d60; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY genes_sources
    ADD CONSTRAINT fk_rails_b177d24d60 FOREIGN KEY (source_id) REFERENCES sources(id);


--
-- Name: variant_aliases_variants fk_rails_b2e941bea8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY variant_aliases_variants
    ADD CONSTRAINT fk_rails_b2e941bea8 FOREIGN KEY (variant_alias_id) REFERENCES variant_aliases(id);


--
-- Name: variant_group_variants fk_rails_b32bd6c5c8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY variant_group_variants
    ADD CONSTRAINT fk_rails_b32bd6c5c8 FOREIGN KEY (variant_id) REFERENCES variants(id);


--
-- Name: badge_claims fk_rails_ba12d9ed25; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY badge_claims
    ADD CONSTRAINT fk_rails_ba12d9ed25 FOREIGN KEY (badge_id) REFERENCES badges(id);


--
-- Name: notifications fk_rails_c609e7bccc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT fk_rails_c609e7bccc FOREIGN KEY (notified_user_id) REFERENCES users(id);


--
-- Name: authors_sources fk_rails_caf1a85d4c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authors_sources
    ADD CONSTRAINT fk_rails_caf1a85d4c FOREIGN KEY (source_id) REFERENCES sources(id);


--
-- Name: evidence_items fk_rails_d22bcc06f7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY evidence_items
    ADD CONSTRAINT fk_rails_d22bcc06f7 FOREIGN KEY (source_id) REFERENCES sources(id);


--
-- Name: badge_claims fk_rails_d69abb1ae6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY badge_claims
    ADD CONSTRAINT fk_rails_d69abb1ae6 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: users fk_rails_d7b9ff90af; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_d7b9ff90af FOREIGN KEY (organization_id) REFERENCES organizations(id);


--
-- Name: drugs_evidence_items fk_rails_d8bb1296af; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugs_evidence_items
    ADD CONSTRAINT fk_rails_d8bb1296af FOREIGN KEY (evidence_item_id) REFERENCES evidence_items(id);


--
-- Name: disease_aliases_diseases fk_rails_dc2cb419d8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY disease_aliases_diseases
    ADD CONSTRAINT fk_rails_dc2cb419d8 FOREIGN KEY (disease_alias_id) REFERENCES disease_aliases(id);


--
-- Name: audits fk_rails_e6d7b3fb68; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY audits
    ADD CONSTRAINT fk_rails_e6d7b3fb68 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: acmg_codes_assertions fk_rails_e858656643; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY acmg_codes_assertions
    ADD CONSTRAINT fk_rails_e858656643 FOREIGN KEY (assertion_id) REFERENCES assertions(id);


--
-- Name: variants fk_rails_ef61bc90f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY variants
    ADD CONSTRAINT fk_rails_ef61bc90f9 FOREIGN KEY (secondary_gene_id) REFERENCES genes(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20140805184308');

INSERT INTO schema_migrations (version) VALUES ('20141021192035');

INSERT INTO schema_migrations (version) VALUES ('20141022180523');

INSERT INTO schema_migrations (version) VALUES ('20141022195329');

INSERT INTO schema_migrations (version) VALUES ('20141108234203');

INSERT INTO schema_migrations (version) VALUES ('20141108234935');

INSERT INTO schema_migrations (version) VALUES ('20141109000136');

INSERT INTO schema_migrations (version) VALUES ('20141114222425');

INSERT INTO schema_migrations (version) VALUES ('20150107205621');

INSERT INTO schema_migrations (version) VALUES ('20150115231117');

INSERT INTO schema_migrations (version) VALUES ('20150116220720');

INSERT INTO schema_migrations (version) VALUES ('20150116230539');

INSERT INTO schema_migrations (version) VALUES ('20150116230632');

INSERT INTO schema_migrations (version) VALUES ('20150204192653');

INSERT INTO schema_migrations (version) VALUES ('20150205000010');

INSERT INTO schema_migrations (version) VALUES ('20150205205734');

INSERT INTO schema_migrations (version) VALUES ('20150205210725');

INSERT INTO schema_migrations (version) VALUES ('20150210191015');

INSERT INTO schema_migrations (version) VALUES ('20150210204445');

INSERT INTO schema_migrations (version) VALUES ('20150219202227');

INSERT INTO schema_migrations (version) VALUES ('20150220160805');

INSERT INTO schema_migrations (version) VALUES ('20150220182109');

INSERT INTO schema_migrations (version) VALUES ('20150223170106');

INSERT INTO schema_migrations (version) VALUES ('20150227204142');

INSERT INTO schema_migrations (version) VALUES ('20150227212146');

INSERT INTO schema_migrations (version) VALUES ('20150303202505');

INSERT INTO schema_migrations (version) VALUES ('20150305200429');

INSERT INTO schema_migrations (version) VALUES ('20150319181853');

INSERT INTO schema_migrations (version) VALUES ('20150416182633');

INSERT INTO schema_migrations (version) VALUES ('20150501151624');

INSERT INTO schema_migrations (version) VALUES ('20150511191452');

INSERT INTO schema_migrations (version) VALUES ('20150512184905');

INSERT INTO schema_migrations (version) VALUES ('20150528170506');

INSERT INTO schema_migrations (version) VALUES ('20150528211748');

INSERT INTO schema_migrations (version) VALUES ('20150602202928');

INSERT INTO schema_migrations (version) VALUES ('20150609210448');

INSERT INTO schema_migrations (version) VALUES ('20150611153328');

INSERT INTO schema_migrations (version) VALUES ('20150611154621');

INSERT INTO schema_migrations (version) VALUES ('20150611200713');

INSERT INTO schema_migrations (version) VALUES ('20150709222321');

INSERT INTO schema_migrations (version) VALUES ('20150709230109');

INSERT INTO schema_migrations (version) VALUES ('20150722183121');

INSERT INTO schema_migrations (version) VALUES ('20150722185207');

INSERT INTO schema_migrations (version) VALUES ('20150728191648');

INSERT INTO schema_migrations (version) VALUES ('20150805161648');

INSERT INTO schema_migrations (version) VALUES ('20151028175026');

INSERT INTO schema_migrations (version) VALUES ('20151028181107');

INSERT INTO schema_migrations (version) VALUES ('20151028181641');

INSERT INTO schema_migrations (version) VALUES ('20151029221126');

INSERT INTO schema_migrations (version) VALUES ('20151029221742');

INSERT INTO schema_migrations (version) VALUES ('20151030154300');

INSERT INTO schema_migrations (version) VALUES ('20151030165159');

INSERT INTO schema_migrations (version) VALUES ('20151112020541');

INSERT INTO schema_migrations (version) VALUES ('20151221205318');

INSERT INTO schema_migrations (version) VALUES ('20160219230229');

INSERT INTO schema_migrations (version) VALUES ('20160314194531');

INSERT INTO schema_migrations (version) VALUES ('20160314194931');

INSERT INTO schema_migrations (version) VALUES ('20160322193758');

INSERT INTO schema_migrations (version) VALUES ('20160519204758');

INSERT INTO schema_migrations (version) VALUES ('20160525151415');

INSERT INTO schema_migrations (version) VALUES ('20160601155409');

INSERT INTO schema_migrations (version) VALUES ('20160601171231');

INSERT INTO schema_migrations (version) VALUES ('20160610144412');

INSERT INTO schema_migrations (version) VALUES ('20160629180940');

INSERT INTO schema_migrations (version) VALUES ('20160629185103');

INSERT INTO schema_migrations (version) VALUES ('20160720175535');

INSERT INTO schema_migrations (version) VALUES ('20160725152423');

INSERT INTO schema_migrations (version) VALUES ('20160817152610');

INSERT INTO schema_migrations (version) VALUES ('20160817200100');

INSERT INTO schema_migrations (version) VALUES ('20160819162235');

INSERT INTO schema_migrations (version) VALUES ('20160822203054');

INSERT INTO schema_migrations (version) VALUES ('20160823211859');

INSERT INTO schema_migrations (version) VALUES ('20160824184419');

INSERT INTO schema_migrations (version) VALUES ('20160919193822');

INSERT INTO schema_migrations (version) VALUES ('20160920163506');

INSERT INTO schema_migrations (version) VALUES ('20160921183613');

INSERT INTO schema_migrations (version) VALUES ('20160922155200');

INSERT INTO schema_migrations (version) VALUES ('20161006145204');

INSERT INTO schema_migrations (version) VALUES ('20161012182149');

INSERT INTO schema_migrations (version) VALUES ('20161118222551');

INSERT INTO schema_migrations (version) VALUES ('20161212192914');

INSERT INTO schema_migrations (version) VALUES ('20161212235713');

INSERT INTO schema_migrations (version) VALUES ('20161215053509');

INSERT INTO schema_migrations (version) VALUES ('20170124204224');

INSERT INTO schema_migrations (version) VALUES ('20170125220156');

INSERT INTO schema_migrations (version) VALUES ('20170127221811');

INSERT INTO schema_migrations (version) VALUES ('20170202162311');

INSERT INTO schema_migrations (version) VALUES ('20170210214101');

INSERT INTO schema_migrations (version) VALUES ('20170223201852');

INSERT INTO schema_migrations (version) VALUES ('20170314172116');

INSERT INTO schema_migrations (version) VALUES ('20170320213357');

INSERT INTO schema_migrations (version) VALUES ('20170510220454');

INSERT INTO schema_migrations (version) VALUES ('20170512201022');

INSERT INTO schema_migrations (version) VALUES ('20170512211026');

INSERT INTO schema_migrations (version) VALUES ('20170531193921');

INSERT INTO schema_migrations (version) VALUES ('20170609200608');

INSERT INTO schema_migrations (version) VALUES ('20170622160223');

INSERT INTO schema_migrations (version) VALUES ('20170804155536');

INSERT INTO schema_migrations (version) VALUES ('20170807194638');

INSERT INTO schema_migrations (version) VALUES ('20170807195040');

