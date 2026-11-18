--
-- PostgreSQL database dump
--

\restrict ijHNweRL24Q2ZHym7c9f5tHlmdUVbN5pNgKrKfMIIYTlmqkYsWpaNmDeKlRgCRv

-- Dumped from database version 16.15 (Debian 16.15-1.pgdg13+2)
-- Dumped by pg_dump version 16.15 (Debian 16.15-1.pgdg13+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alerts; Type: TABLE; Schema: public; Owner: uptimelens
--

CREATE TABLE public.alerts (
    id integer NOT NULL,
    message text,
    severity text,
    resolved boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.alerts OWNER TO uptimelens;

--
-- Name: alerts_id_seq; Type: SEQUENCE; Schema: public; Owner: uptimelens
--

CREATE SEQUENCE public.alerts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alerts_id_seq OWNER TO uptimelens;

--
-- Name: alerts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptimelens
--

ALTER SEQUENCE public.alerts_id_seq OWNED BY public.alerts.id;


--
-- Name: container_status; Type: TABLE; Schema: public; Owner: uptimelens
--

CREATE TABLE public.container_status (
    id integer NOT NULL,
    container_name text,
    status text,
    checked_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.container_status OWNER TO uptimelens;

--
-- Name: container_status_id_seq; Type: SEQUENCE; Schema: public; Owner: uptimelens
--

CREATE SEQUENCE public.container_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.container_status_id_seq OWNER TO uptimelens;

--
-- Name: container_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptimelens
--

ALTER SEQUENCE public.container_status_id_seq OWNED BY public.container_status.id;


--
-- Name: deploy_log; Type: TABLE; Schema: public; Owner: uptimelens
--

CREATE TABLE public.deploy_log (
    id integer NOT NULL,
    status text,
    commit_hash text,
    deployed_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.deploy_log OWNER TO uptimelens;

--
-- Name: deploy_log_id_seq; Type: SEQUENCE; Schema: public; Owner: uptimelens
--

CREATE SEQUENCE public.deploy_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.deploy_log_id_seq OWNER TO uptimelens;

--
-- Name: deploy_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptimelens
--

ALTER SEQUENCE public.deploy_log_id_seq OWNED BY public.deploy_log.id;


--
-- Name: server_stats; Type: TABLE; Schema: public; Owner: uptimelens
--

CREATE TABLE public.server_stats (
    id integer NOT NULL,
    disk_usage numeric,
    memory_usage numeric,
    uptime_seconds bigint,
    recorded_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.server_stats OWNER TO uptimelens;

--
-- Name: server_stats_id_seq; Type: SEQUENCE; Schema: public; Owner: uptimelens
--

CREATE SEQUENCE public.server_stats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.server_stats_id_seq OWNER TO uptimelens;

--
-- Name: server_stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: uptimelens
--

ALTER SEQUENCE public.server_stats_id_seq OWNED BY public.server_stats.id;


--
-- Name: alerts id; Type: DEFAULT; Schema: public; Owner: uptimelens
--

ALTER TABLE ONLY public.alerts ALTER COLUMN id SET DEFAULT nextval('public.alerts_id_seq'::regclass);


--
-- Name: container_status id; Type: DEFAULT; Schema: public; Owner: uptimelens
--

ALTER TABLE ONLY public.container_status ALTER COLUMN id SET DEFAULT nextval('public.container_status_id_seq'::regclass);


--
-- Name: deploy_log id; Type: DEFAULT; Schema: public; Owner: uptimelens
--

ALTER TABLE ONLY public.deploy_log ALTER COLUMN id SET DEFAULT nextval('public.deploy_log_id_seq'::regclass);


--
-- Name: server_stats id; Type: DEFAULT; Schema: public; Owner: uptimelens
--

ALTER TABLE ONLY public.server_stats ALTER COLUMN id SET DEFAULT nextval('public.server_stats_id_seq'::regclass);


--
-- Name: alerts alerts_pkey; Type: CONSTRAINT; Schema: public; Owner: uptimelens
--

ALTER TABLE ONLY public.alerts
    ADD CONSTRAINT alerts_pkey PRIMARY KEY (id);


--
-- Name: container_status container_status_pkey; Type: CONSTRAINT; Schema: public; Owner: uptimelens
--

ALTER TABLE ONLY public.container_status
    ADD CONSTRAINT container_status_pkey PRIMARY KEY (id);


--
-- Name: deploy_log deploy_log_pkey; Type: CONSTRAINT; Schema: public; Owner: uptimelens
--

ALTER TABLE ONLY public.deploy_log
    ADD CONSTRAINT deploy_log_pkey PRIMARY KEY (id);


--
-- Name: server_stats server_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: uptimelens
--

ALTER TABLE ONLY public.server_stats
    ADD CONSTRAINT server_stats_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict ijHNweRL24Q2ZHym7c9f5tHlmdUVbN5pNgKrKfMIIYTlmqkYsWpaNmDeKlRgCRv

