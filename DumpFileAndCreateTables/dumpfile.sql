--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:acRnQ5KlPTHdMnjVX2244g==$1cFFscquZmWff5/ICOgn4Lp9G8URw4wuk2MVWrAvHqU=:4PbFSpnoYkezRRbu0YxEMc3toTzedjqfjPKlJyQgHxs=';






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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

--
-- PostgreSQL database dump complete
--

--
-- Database "displayforagpt" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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

--
-- Name: displayforagpt; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE displayforagpt WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Greek_Greece.1252';


ALTER DATABASE displayforagpt OWNER TO postgres;

\connect displayforagpt

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
-- Name: al; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.al (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.al OWNER TO postgres;

--
-- Name: am; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.am (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.am OWNER TO postgres;

--
-- Name: at; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.at (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.at OWNER TO postgres;

--
-- Name: az; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.az (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.az OWNER TO postgres;

--
-- Name: ba; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ba (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ba OWNER TO postgres;

--
-- Name: be; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.be (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.be OWNER TO postgres;

--
-- Name: bg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bg (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.bg OWNER TO postgres;

--
-- Name: by; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.by (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.by OWNER TO postgres;

--
-- Name: ch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ch (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ch OWNER TO postgres;

--
-- Name: cy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cy (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.cy OWNER TO postgres;

--
-- Name: cz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cz (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.cz OWNER TO postgres;

--
-- Name: de; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.de (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.de OWNER TO postgres;

--
-- Name: dk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.dk OWNER TO postgres;

--
-- Name: ee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ee (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ee OWNER TO postgres;

--
-- Name: es; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.es (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.es OWNER TO postgres;

--
-- Name: fi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fi (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.fi OWNER TO postgres;

--
-- Name: fr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.fr OWNER TO postgres;

--
-- Name: gb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gb (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.gb OWNER TO postgres;

--
-- Name: ge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ge (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ge OWNER TO postgres;

--
-- Name: gr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.gr OWNER TO postgres;

--
-- Name: hr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.hr OWNER TO postgres;

--
-- Name: hu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hu (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.hu OWNER TO postgres;

--
-- Name: ie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ie (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ie OWNER TO postgres;

--
-- Name: it; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.it (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.it OWNER TO postgres;

--
-- Name: lt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lt (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.lt OWNER TO postgres;

--
-- Name: lu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lu (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.lu OWNER TO postgres;

--
-- Name: lv; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lv (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.lv OWNER TO postgres;

--
-- Name: md; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.md (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.md OWNER TO postgres;

--
-- Name: me; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.me (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.me OWNER TO postgres;

--
-- Name: mk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.mk OWNER TO postgres;

--
-- Name: mt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mt (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.mt OWNER TO postgres;

--
-- Name: nl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nl (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.nl OWNER TO postgres;

--
-- Name: no; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.no (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.no OWNER TO postgres;

--
-- Name: pl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pl (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.pl OWNER TO postgres;

--
-- Name: pt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pt (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.pt OWNER TO postgres;

--
-- Name: ro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ro (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ro OWNER TO postgres;

--
-- Name: rs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rs (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.rs OWNER TO postgres;

--
-- Name: ru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ru (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ru OWNER TO postgres;

--
-- Name: se; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.se (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.se OWNER TO postgres;

--
-- Name: si; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.si (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.si OWNER TO postgres;

--
-- Name: sk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.sk OWNER TO postgres;

--
-- Name: tr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.tr OWNER TO postgres;

--
-- Name: ua; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ua (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ua OWNER TO postgres;

--
-- Name: xk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.xk OWNER TO postgres;

--
-- Data for Name: al; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.al (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: am; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.am (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: at; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.at (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: az; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.az (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ba; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ba (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: be; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.be (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: bg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bg (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: by; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.by (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ch (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: cy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cy (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: cz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cz (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: de; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.de (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: dk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dk (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ee (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: es; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.es (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: fi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fi (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: fr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fr (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: gb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gb (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ge (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: gr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gr (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: hr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hr (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: hu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hu (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ie (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: it; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.it (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: lt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lt (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: lu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lu (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: lv; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lv (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: md; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.md (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: me; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.me (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: mk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mk (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: mt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mt (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: nl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nl (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: no; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.no (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: pl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pl (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: pt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pt (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ro (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: rs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rs (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ru; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ru (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: se; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.se (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: si; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.si (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: sk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sk (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: tr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tr (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ua; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ua (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: xk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xk (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Name: al al_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.al
    ADD CONSTRAINT al_pkey PRIMARY KEY (index);


--
-- Name: am am_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.am
    ADD CONSTRAINT am_pkey PRIMARY KEY (index);


--
-- Name: at at_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.at
    ADD CONSTRAINT at_pkey PRIMARY KEY (index);


--
-- Name: az az_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.az
    ADD CONSTRAINT az_pkey PRIMARY KEY (index);


--
-- Name: ba ba_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ba
    ADD CONSTRAINT ba_pkey PRIMARY KEY (index);


--
-- Name: be be_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.be
    ADD CONSTRAINT be_pkey PRIMARY KEY (index);


--
-- Name: bg bg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bg
    ADD CONSTRAINT bg_pkey PRIMARY KEY (index);


--
-- Name: by by_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.by
    ADD CONSTRAINT by_pkey PRIMARY KEY (index);


--
-- Name: ch ch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ch
    ADD CONSTRAINT ch_pkey PRIMARY KEY (index);


--
-- Name: cy cy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cy
    ADD CONSTRAINT cy_pkey PRIMARY KEY (index);


--
-- Name: cz cz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cz
    ADD CONSTRAINT cz_pkey PRIMARY KEY (index);


--
-- Name: de de_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.de
    ADD CONSTRAINT de_pkey PRIMARY KEY (index);


--
-- Name: dk dk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dk
    ADD CONSTRAINT dk_pkey PRIMARY KEY (index);


--
-- Name: ee ee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ee
    ADD CONSTRAINT ee_pkey PRIMARY KEY (index);


--
-- Name: es es_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.es
    ADD CONSTRAINT es_pkey PRIMARY KEY (index);


--
-- Name: fi fi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fi
    ADD CONSTRAINT fi_pkey PRIMARY KEY (index);


--
-- Name: fr fr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fr
    ADD CONSTRAINT fr_pkey PRIMARY KEY (index);


--
-- Name: gb gb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gb
    ADD CONSTRAINT gb_pkey PRIMARY KEY (index);


--
-- Name: ge ge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ge
    ADD CONSTRAINT ge_pkey PRIMARY KEY (index);


--
-- Name: gr gr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gr
    ADD CONSTRAINT gr_pkey PRIMARY KEY (index);


--
-- Name: hr hr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hr
    ADD CONSTRAINT hr_pkey PRIMARY KEY (index);


--
-- Name: hu hu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hu
    ADD CONSTRAINT hu_pkey PRIMARY KEY (index);


--
-- Name: ie ie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ie
    ADD CONSTRAINT ie_pkey PRIMARY KEY (index);


--
-- Name: it it_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.it
    ADD CONSTRAINT it_pkey PRIMARY KEY (index);


--
-- Name: lt lt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lt
    ADD CONSTRAINT lt_pkey PRIMARY KEY (index);


--
-- Name: lu lu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lu
    ADD CONSTRAINT lu_pkey PRIMARY KEY (index);


--
-- Name: lv lv_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lv
    ADD CONSTRAINT lv_pkey PRIMARY KEY (index);


--
-- Name: md md_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.md
    ADD CONSTRAINT md_pkey PRIMARY KEY (index);


--
-- Name: me me_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.me
    ADD CONSTRAINT me_pkey PRIMARY KEY (index);


--
-- Name: mk mk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mk
    ADD CONSTRAINT mk_pkey PRIMARY KEY (index);


--
-- Name: mt mt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mt
    ADD CONSTRAINT mt_pkey PRIMARY KEY (index);


--
-- Name: nl nl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nl
    ADD CONSTRAINT nl_pkey PRIMARY KEY (index);


--
-- Name: no no_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.no
    ADD CONSTRAINT no_pkey PRIMARY KEY (index);


--
-- Name: pl pl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pl
    ADD CONSTRAINT pl_pkey PRIMARY KEY (index);


--
-- Name: pt pt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pt
    ADD CONSTRAINT pt_pkey PRIMARY KEY (index);


--
-- Name: ro ro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ro
    ADD CONSTRAINT ro_pkey PRIMARY KEY (index);


--
-- Name: rs rs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rs
    ADD CONSTRAINT rs_pkey PRIMARY KEY (index);


--
-- Name: ru ru_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ru
    ADD CONSTRAINT ru_pkey PRIMARY KEY (index);


--
-- Name: se se_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.se
    ADD CONSTRAINT se_pkey PRIMARY KEY (index);


--
-- Name: si si_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.si
    ADD CONSTRAINT si_pkey PRIMARY KEY (index);


--
-- Name: sk sk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sk
    ADD CONSTRAINT sk_pkey PRIMARY KEY (index);


--
-- Name: tr tr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tr
    ADD CONSTRAINT tr_pkey PRIMARY KEY (index);


--
-- Name: ua ua_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ua
    ADD CONSTRAINT ua_pkey PRIMARY KEY (index);


--
-- Name: xk xk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xk
    ADD CONSTRAINT xk_pkey PRIMARY KEY (index);


--
-- PostgreSQL database dump complete
--

--
-- Database "displayforatl" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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

--
-- Name: displayforatl; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE displayforatl WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Greek_Greece.1252';


ALTER DATABASE displayforatl OWNER TO postgres;

\connect displayforatl

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
-- Name: al; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.al (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.al OWNER TO postgres;

--
-- Name: am; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.am (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.am OWNER TO postgres;

--
-- Name: at; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.at (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.at OWNER TO postgres;

--
-- Name: az; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.az (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.az OWNER TO postgres;

--
-- Name: ba; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ba (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ba OWNER TO postgres;

--
-- Name: be; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.be (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.be OWNER TO postgres;

--
-- Name: bg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bg (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.bg OWNER TO postgres;

--
-- Name: by; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.by (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.by OWNER TO postgres;

--
-- Name: ch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ch (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ch OWNER TO postgres;

--
-- Name: cy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cy (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.cy OWNER TO postgres;

--
-- Name: cz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cz (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.cz OWNER TO postgres;

--
-- Name: de; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.de (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.de OWNER TO postgres;

--
-- Name: dk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.dk OWNER TO postgres;

--
-- Name: ee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ee (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ee OWNER TO postgres;

--
-- Name: es; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.es (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.es OWNER TO postgres;

--
-- Name: fi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fi (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.fi OWNER TO postgres;

--
-- Name: fr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.fr OWNER TO postgres;

--
-- Name: gb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gb (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.gb OWNER TO postgres;

--
-- Name: ge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ge (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ge OWNER TO postgres;

--
-- Name: gr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.gr OWNER TO postgres;

--
-- Name: hr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.hr OWNER TO postgres;

--
-- Name: hu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hu (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.hu OWNER TO postgres;

--
-- Name: ie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ie (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ie OWNER TO postgres;

--
-- Name: it; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.it (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.it OWNER TO postgres;

--
-- Name: lt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lt (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.lt OWNER TO postgres;

--
-- Name: lu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lu (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.lu OWNER TO postgres;

--
-- Name: lv; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lv (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.lv OWNER TO postgres;

--
-- Name: md; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.md (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.md OWNER TO postgres;

--
-- Name: me; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.me (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.me OWNER TO postgres;

--
-- Name: mk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.mk OWNER TO postgres;

--
-- Name: mt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mt (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.mt OWNER TO postgres;

--
-- Name: nl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nl (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.nl OWNER TO postgres;

--
-- Name: no; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.no (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.no OWNER TO postgres;

--
-- Name: pl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pl (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.pl OWNER TO postgres;

--
-- Name: pt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pt (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.pt OWNER TO postgres;

--
-- Name: ro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ro (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ro OWNER TO postgres;

--
-- Name: rs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rs (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.rs OWNER TO postgres;

--
-- Name: ru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ru (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ru OWNER TO postgres;

--
-- Name: se; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.se (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.se OWNER TO postgres;

--
-- Name: si; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.si (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.si OWNER TO postgres;

--
-- Name: sk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.sk OWNER TO postgres;

--
-- Name: tr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.tr OWNER TO postgres;

--
-- Name: ua; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ua (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ua OWNER TO postgres;

--
-- Name: xk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.xk OWNER TO postgres;

--
-- Data for Name: al; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.al (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: am; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.am (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: at; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.at (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: az; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.az (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ba; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ba (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: be; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.be (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: bg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bg (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: by; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.by (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ch (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: cy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cy (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: cz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cz (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: de; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.de (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: dk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dk (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ee (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: es; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.es (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: fi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fi (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: fr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fr (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: gb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gb (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ge (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: gr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gr (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: hr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hr (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: hu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hu (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ie (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: it; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.it (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: lt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lt (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: lu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lu (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: lv; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lv (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: md; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.md (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: me; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.me (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: mk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mk (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: mt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mt (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: nl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nl (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: no; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.no (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: pl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pl (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: pt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pt (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ro (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: rs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rs (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ru; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ru (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: se; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.se (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: si; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.si (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: sk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sk (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: tr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tr (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ua; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ua (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: xk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xk (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Name: al al_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.al
    ADD CONSTRAINT al_pkey PRIMARY KEY (index);


--
-- Name: am am_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.am
    ADD CONSTRAINT am_pkey PRIMARY KEY (index);


--
-- Name: at at_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.at
    ADD CONSTRAINT at_pkey PRIMARY KEY (index);


--
-- Name: az az_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.az
    ADD CONSTRAINT az_pkey PRIMARY KEY (index);


--
-- Name: ba ba_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ba
    ADD CONSTRAINT ba_pkey PRIMARY KEY (index);


--
-- Name: be be_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.be
    ADD CONSTRAINT be_pkey PRIMARY KEY (index);


--
-- Name: bg bg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bg
    ADD CONSTRAINT bg_pkey PRIMARY KEY (index);


--
-- Name: by by_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.by
    ADD CONSTRAINT by_pkey PRIMARY KEY (index);


--
-- Name: ch ch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ch
    ADD CONSTRAINT ch_pkey PRIMARY KEY (index);


--
-- Name: cy cy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cy
    ADD CONSTRAINT cy_pkey PRIMARY KEY (index);


--
-- Name: cz cz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cz
    ADD CONSTRAINT cz_pkey PRIMARY KEY (index);


--
-- Name: de de_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.de
    ADD CONSTRAINT de_pkey PRIMARY KEY (index);


--
-- Name: dk dk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dk
    ADD CONSTRAINT dk_pkey PRIMARY KEY (index);


--
-- Name: ee ee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ee
    ADD CONSTRAINT ee_pkey PRIMARY KEY (index);


--
-- Name: es es_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.es
    ADD CONSTRAINT es_pkey PRIMARY KEY (index);


--
-- Name: fi fi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fi
    ADD CONSTRAINT fi_pkey PRIMARY KEY (index);


--
-- Name: fr fr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fr
    ADD CONSTRAINT fr_pkey PRIMARY KEY (index);


--
-- Name: gb gb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gb
    ADD CONSTRAINT gb_pkey PRIMARY KEY (index);


--
-- Name: ge ge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ge
    ADD CONSTRAINT ge_pkey PRIMARY KEY (index);


--
-- Name: gr gr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gr
    ADD CONSTRAINT gr_pkey PRIMARY KEY (index);


--
-- Name: hr hr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hr
    ADD CONSTRAINT hr_pkey PRIMARY KEY (index);


--
-- Name: hu hu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hu
    ADD CONSTRAINT hu_pkey PRIMARY KEY (index);


--
-- Name: ie ie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ie
    ADD CONSTRAINT ie_pkey PRIMARY KEY (index);


--
-- Name: it it_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.it
    ADD CONSTRAINT it_pkey PRIMARY KEY (index);


--
-- Name: lt lt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lt
    ADD CONSTRAINT lt_pkey PRIMARY KEY (index);


--
-- Name: lu lu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lu
    ADD CONSTRAINT lu_pkey PRIMARY KEY (index);


--
-- Name: lv lv_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lv
    ADD CONSTRAINT lv_pkey PRIMARY KEY (index);


--
-- Name: md md_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.md
    ADD CONSTRAINT md_pkey PRIMARY KEY (index);


--
-- Name: me me_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.me
    ADD CONSTRAINT me_pkey PRIMARY KEY (index);


--
-- Name: mk mk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mk
    ADD CONSTRAINT mk_pkey PRIMARY KEY (index);


--
-- Name: mt mt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mt
    ADD CONSTRAINT mt_pkey PRIMARY KEY (index);


--
-- Name: nl nl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nl
    ADD CONSTRAINT nl_pkey PRIMARY KEY (index);


--
-- Name: no no_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.no
    ADD CONSTRAINT no_pkey PRIMARY KEY (index);


--
-- Name: pl pl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pl
    ADD CONSTRAINT pl_pkey PRIMARY KEY (index);


--
-- Name: pt pt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pt
    ADD CONSTRAINT pt_pkey PRIMARY KEY (index);


--
-- Name: ro ro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ro
    ADD CONSTRAINT ro_pkey PRIMARY KEY (index);


--
-- Name: rs rs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rs
    ADD CONSTRAINT rs_pkey PRIMARY KEY (index);


--
-- Name: ru ru_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ru
    ADD CONSTRAINT ru_pkey PRIMARY KEY (index);


--
-- Name: se se_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.se
    ADD CONSTRAINT se_pkey PRIMARY KEY (index);


--
-- Name: si si_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.si
    ADD CONSTRAINT si_pkey PRIMARY KEY (index);


--
-- Name: sk sk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sk
    ADD CONSTRAINT sk_pkey PRIMARY KEY (index);


--
-- Name: tr tr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tr
    ADD CONSTRAINT tr_pkey PRIMARY KEY (index);


--
-- Name: ua ua_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ua
    ADD CONSTRAINT ua_pkey PRIMARY KEY (index);


--
-- Name: xk xk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xk
    ADD CONSTRAINT xk_pkey PRIMARY KEY (index);


--
-- PostgreSQL database dump complete
--

--
-- Database "displayforff" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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

--
-- Name: displayforff; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE displayforff WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Greek_Greece.1252';


ALTER DATABASE displayforff OWNER TO postgres;

\connect displayforff

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
-- Name: al; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.al (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.al OWNER TO postgres;

--
-- Name: am; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.am (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.am OWNER TO postgres;

--
-- Name: at; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.at (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.at OWNER TO postgres;

--
-- Name: az; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.az (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.az OWNER TO postgres;

--
-- Name: ba; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ba (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ba OWNER TO postgres;

--
-- Name: be; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.be (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.be OWNER TO postgres;

--
-- Name: bg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bg (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.bg OWNER TO postgres;

--
-- Name: by; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.by (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.by OWNER TO postgres;

--
-- Name: ch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ch (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ch OWNER TO postgres;

--
-- Name: cy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cy (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.cy OWNER TO postgres;

--
-- Name: cz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cz (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.cz OWNER TO postgres;

--
-- Name: de; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.de (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.de OWNER TO postgres;

--
-- Name: dk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.dk OWNER TO postgres;

--
-- Name: ee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ee (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ee OWNER TO postgres;

--
-- Name: es; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.es (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.es OWNER TO postgres;

--
-- Name: fi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fi (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.fi OWNER TO postgres;

--
-- Name: fr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.fr OWNER TO postgres;

--
-- Name: gb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gb (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.gb OWNER TO postgres;

--
-- Name: ge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ge (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ge OWNER TO postgres;

--
-- Name: gr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.gr OWNER TO postgres;

--
-- Name: hr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.hr OWNER TO postgres;

--
-- Name: hu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hu (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.hu OWNER TO postgres;

--
-- Name: ie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ie (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ie OWNER TO postgres;

--
-- Name: it; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.it (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.it OWNER TO postgres;

--
-- Name: lt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lt (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.lt OWNER TO postgres;

--
-- Name: lu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lu (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.lu OWNER TO postgres;

--
-- Name: lv; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lv (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.lv OWNER TO postgres;

--
-- Name: md; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.md (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.md OWNER TO postgres;

--
-- Name: me; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.me (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.me OWNER TO postgres;

--
-- Name: mk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.mk OWNER TO postgres;

--
-- Name: mt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mt (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.mt OWNER TO postgres;

--
-- Name: nl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nl (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.nl OWNER TO postgres;

--
-- Name: no; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.no (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.no OWNER TO postgres;

--
-- Name: pl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pl (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.pl OWNER TO postgres;

--
-- Name: pt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pt (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.pt OWNER TO postgres;

--
-- Name: ro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ro (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ro OWNER TO postgres;

--
-- Name: rs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rs (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.rs OWNER TO postgres;

--
-- Name: ru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ru (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ru OWNER TO postgres;

--
-- Name: se; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.se (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.se OWNER TO postgres;

--
-- Name: si; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.si (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.si OWNER TO postgres;

--
-- Name: sk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.sk OWNER TO postgres;

--
-- Name: tr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.tr OWNER TO postgres;

--
-- Name: ua; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ua (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ua OWNER TO postgres;

--
-- Name: xk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.xk OWNER TO postgres;

--
-- Data for Name: al; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.al (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: am; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.am (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: at; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.at (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: az; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.az (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ba; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ba (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: be; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.be (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: bg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bg (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: by; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.by (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ch (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: cy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cy (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: cz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cz (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: de; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.de (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: dk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dk (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ee (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: es; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.es (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: fi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fi (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: fr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fr (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: gb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gb (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ge (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: gr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gr (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: hr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hr (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: hu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hu (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ie (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: it; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.it (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: lt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lt (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: lu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lu (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: lv; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lv (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: md; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.md (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: me; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.me (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: mk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mk (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: mt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mt (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: nl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nl (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: no; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.no (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: pl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pl (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: pt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pt (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ro (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: rs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rs (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ru; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ru (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: se; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.se (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: si; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.si (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: sk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sk (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: tr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tr (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ua; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ua (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: xk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xk (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Name: al al_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.al
    ADD CONSTRAINT al_pkey PRIMARY KEY (index);


--
-- Name: am am_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.am
    ADD CONSTRAINT am_pkey PRIMARY KEY (index);


--
-- Name: at at_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.at
    ADD CONSTRAINT at_pkey PRIMARY KEY (index);


--
-- Name: az az_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.az
    ADD CONSTRAINT az_pkey PRIMARY KEY (index);


--
-- Name: ba ba_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ba
    ADD CONSTRAINT ba_pkey PRIMARY KEY (index);


--
-- Name: be be_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.be
    ADD CONSTRAINT be_pkey PRIMARY KEY (index);


--
-- Name: bg bg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bg
    ADD CONSTRAINT bg_pkey PRIMARY KEY (index);


--
-- Name: by by_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.by
    ADD CONSTRAINT by_pkey PRIMARY KEY (index);


--
-- Name: ch ch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ch
    ADD CONSTRAINT ch_pkey PRIMARY KEY (index);


--
-- Name: cy cy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cy
    ADD CONSTRAINT cy_pkey PRIMARY KEY (index);


--
-- Name: cz cz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cz
    ADD CONSTRAINT cz_pkey PRIMARY KEY (index);


--
-- Name: de de_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.de
    ADD CONSTRAINT de_pkey PRIMARY KEY (index);


--
-- Name: dk dk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dk
    ADD CONSTRAINT dk_pkey PRIMARY KEY (index);


--
-- Name: ee ee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ee
    ADD CONSTRAINT ee_pkey PRIMARY KEY (index);


--
-- Name: es es_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.es
    ADD CONSTRAINT es_pkey PRIMARY KEY (index);


--
-- Name: fi fi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fi
    ADD CONSTRAINT fi_pkey PRIMARY KEY (index);


--
-- Name: fr fr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fr
    ADD CONSTRAINT fr_pkey PRIMARY KEY (index);


--
-- Name: gb gb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gb
    ADD CONSTRAINT gb_pkey PRIMARY KEY (index);


--
-- Name: ge ge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ge
    ADD CONSTRAINT ge_pkey PRIMARY KEY (index);


--
-- Name: gr gr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gr
    ADD CONSTRAINT gr_pkey PRIMARY KEY (index);


--
-- Name: hr hr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hr
    ADD CONSTRAINT hr_pkey PRIMARY KEY (index);


--
-- Name: hu hu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hu
    ADD CONSTRAINT hu_pkey PRIMARY KEY (index);


--
-- Name: ie ie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ie
    ADD CONSTRAINT ie_pkey PRIMARY KEY (index);


--
-- Name: it it_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.it
    ADD CONSTRAINT it_pkey PRIMARY KEY (index);


--
-- Name: lt lt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lt
    ADD CONSTRAINT lt_pkey PRIMARY KEY (index);


--
-- Name: lu lu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lu
    ADD CONSTRAINT lu_pkey PRIMARY KEY (index);


--
-- Name: lv lv_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lv
    ADD CONSTRAINT lv_pkey PRIMARY KEY (index);


--
-- Name: md md_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.md
    ADD CONSTRAINT md_pkey PRIMARY KEY (index);


--
-- Name: me me_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.me
    ADD CONSTRAINT me_pkey PRIMARY KEY (index);


--
-- Name: mk mk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mk
    ADD CONSTRAINT mk_pkey PRIMARY KEY (index);


--
-- Name: mt mt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mt
    ADD CONSTRAINT mt_pkey PRIMARY KEY (index);


--
-- Name: nl nl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nl
    ADD CONSTRAINT nl_pkey PRIMARY KEY (index);


--
-- Name: no no_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.no
    ADD CONSTRAINT no_pkey PRIMARY KEY (index);


--
-- Name: pl pl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pl
    ADD CONSTRAINT pl_pkey PRIMARY KEY (index);


--
-- Name: pt pt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pt
    ADD CONSTRAINT pt_pkey PRIMARY KEY (index);


--
-- Name: ro ro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ro
    ADD CONSTRAINT ro_pkey PRIMARY KEY (index);


--
-- Name: rs rs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rs
    ADD CONSTRAINT rs_pkey PRIMARY KEY (index);


--
-- Name: ru ru_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ru
    ADD CONSTRAINT ru_pkey PRIMARY KEY (index);


--
-- Name: se se_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.se
    ADD CONSTRAINT se_pkey PRIMARY KEY (index);


--
-- Name: si si_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.si
    ADD CONSTRAINT si_pkey PRIMARY KEY (index);


--
-- Name: sk sk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sk
    ADD CONSTRAINT sk_pkey PRIMARY KEY (index);


--
-- Name: tr tr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tr
    ADD CONSTRAINT tr_pkey PRIMARY KEY (index);


--
-- Name: ua ua_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ua
    ADD CONSTRAINT ua_pkey PRIMARY KEY (index);


--
-- Name: xk xk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xk
    ADD CONSTRAINT xk_pkey PRIMARY KEY (index);


--
-- PostgreSQL database dump complete
--

--
-- Database "getterforagpt" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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

--
-- Name: getterforagpt; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE getterforagpt WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Greek_Greece.1252';


ALTER DATABASE getterforagpt OWNER TO postgres;

\connect getterforagpt

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
-- Name: al; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.al (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.al OWNER TO postgres;

--
-- Name: am; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.am (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.am OWNER TO postgres;

--
-- Name: at; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.at (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.at OWNER TO postgres;

--
-- Name: az; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.az (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.az OWNER TO postgres;

--
-- Name: ba; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ba (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ba OWNER TO postgres;

--
-- Name: be; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.be (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.be OWNER TO postgres;

--
-- Name: bg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bg (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.bg OWNER TO postgres;

--
-- Name: by; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.by (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.by OWNER TO postgres;

--
-- Name: ch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ch (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ch OWNER TO postgres;

--
-- Name: cy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cy (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.cy OWNER TO postgres;

--
-- Name: cz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cz (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.cz OWNER TO postgres;

--
-- Name: de; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.de (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.de OWNER TO postgres;

--
-- Name: dk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.dk OWNER TO postgres;

--
-- Name: ee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ee (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ee OWNER TO postgres;

--
-- Name: es; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.es (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.es OWNER TO postgres;

--
-- Name: fi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fi (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.fi OWNER TO postgres;

--
-- Name: fr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.fr OWNER TO postgres;

--
-- Name: gb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gb (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.gb OWNER TO postgres;

--
-- Name: ge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ge (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ge OWNER TO postgres;

--
-- Name: gr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.gr OWNER TO postgres;

--
-- Name: hr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.hr OWNER TO postgres;

--
-- Name: hu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hu (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.hu OWNER TO postgres;

--
-- Name: ie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ie (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ie OWNER TO postgres;

--
-- Name: it; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.it (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.it OWNER TO postgres;

--
-- Name: lt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lt (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.lt OWNER TO postgres;

--
-- Name: lu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lu (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.lu OWNER TO postgres;

--
-- Name: lv; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lv (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.lv OWNER TO postgres;

--
-- Name: md; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.md (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.md OWNER TO postgres;

--
-- Name: me; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.me (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.me OWNER TO postgres;

--
-- Name: mk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.mk OWNER TO postgres;

--
-- Name: mt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mt (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.mt OWNER TO postgres;

--
-- Name: nl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nl (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.nl OWNER TO postgres;

--
-- Name: no; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.no (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.no OWNER TO postgres;

--
-- Name: pl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pl (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.pl OWNER TO postgres;

--
-- Name: pt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pt (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.pt OWNER TO postgres;

--
-- Name: ro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ro (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ro OWNER TO postgres;

--
-- Name: rs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rs (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.rs OWNER TO postgres;

--
-- Name: ru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ru (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ru OWNER TO postgres;

--
-- Name: se; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.se (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.se OWNER TO postgres;

--
-- Name: si; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.si (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.si OWNER TO postgres;

--
-- Name: sk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.sk OWNER TO postgres;

--
-- Name: tr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.tr OWNER TO postgres;

--
-- Name: ua; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ua (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ua OWNER TO postgres;

--
-- Name: xk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    productiontype character varying(50),
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.xk OWNER TO postgres;

--
-- Data for Name: al; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.al (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: am; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.am (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: at; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.at (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: az; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.az (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ba; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ba (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: be; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.be (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: bg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bg (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: by; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.by (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ch (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: cy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cy (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: cz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cz (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: de; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.de (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: dk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dk (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ee (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: es; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.es (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: fi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fi (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: fr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fr (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: gb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gb (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ge (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: gr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gr (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: hr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hr (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: hu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hu (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ie (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: it; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.it (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: lt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lt (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: lu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lu (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: lv; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lv (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: md; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.md (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: me; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.me (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: mk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mk (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: mt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mt (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: nl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nl (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: no; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.no (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: pl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pl (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: pt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pt (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ro (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
2022-03-01 00:00:00	1065	\N	Hydro Run-of-river and poundage	2022-03-01 01:33:12	0
\.


--
-- Data for Name: rs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rs (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ru; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ru (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: se; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.se (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: si; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.si (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: sk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sk (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: tr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tr (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ua; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ua (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Data for Name: xk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xk (datetime, actualgenerationpertype, actualconsumption, productiontype, updatetime, index) FROM stdin;
\.


--
-- Name: al al_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.al
    ADD CONSTRAINT al_pkey PRIMARY KEY (index);


--
-- Name: am am_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.am
    ADD CONSTRAINT am_pkey PRIMARY KEY (index);


--
-- Name: at at_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.at
    ADD CONSTRAINT at_pkey PRIMARY KEY (index);


--
-- Name: az az_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.az
    ADD CONSTRAINT az_pkey PRIMARY KEY (index);


--
-- Name: ba ba_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ba
    ADD CONSTRAINT ba_pkey PRIMARY KEY (index);


--
-- Name: be be_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.be
    ADD CONSTRAINT be_pkey PRIMARY KEY (index);


--
-- Name: bg bg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bg
    ADD CONSTRAINT bg_pkey PRIMARY KEY (index);


--
-- Name: by by_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.by
    ADD CONSTRAINT by_pkey PRIMARY KEY (index);


--
-- Name: ch ch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ch
    ADD CONSTRAINT ch_pkey PRIMARY KEY (index);


--
-- Name: cy cy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cy
    ADD CONSTRAINT cy_pkey PRIMARY KEY (index);


--
-- Name: cz cz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cz
    ADD CONSTRAINT cz_pkey PRIMARY KEY (index);


--
-- Name: de de_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.de
    ADD CONSTRAINT de_pkey PRIMARY KEY (index);


--
-- Name: dk dk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dk
    ADD CONSTRAINT dk_pkey PRIMARY KEY (index);


--
-- Name: ee ee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ee
    ADD CONSTRAINT ee_pkey PRIMARY KEY (index);


--
-- Name: es es_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.es
    ADD CONSTRAINT es_pkey PRIMARY KEY (index);


--
-- Name: fi fi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fi
    ADD CONSTRAINT fi_pkey PRIMARY KEY (index);


--
-- Name: fr fr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fr
    ADD CONSTRAINT fr_pkey PRIMARY KEY (index);


--
-- Name: gb gb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gb
    ADD CONSTRAINT gb_pkey PRIMARY KEY (index);


--
-- Name: ge ge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ge
    ADD CONSTRAINT ge_pkey PRIMARY KEY (index);


--
-- Name: gr gr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gr
    ADD CONSTRAINT gr_pkey PRIMARY KEY (index);


--
-- Name: hr hr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hr
    ADD CONSTRAINT hr_pkey PRIMARY KEY (index);


--
-- Name: hu hu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hu
    ADD CONSTRAINT hu_pkey PRIMARY KEY (index);


--
-- Name: ie ie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ie
    ADD CONSTRAINT ie_pkey PRIMARY KEY (index);


--
-- Name: it it_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.it
    ADD CONSTRAINT it_pkey PRIMARY KEY (index);


--
-- Name: lt lt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lt
    ADD CONSTRAINT lt_pkey PRIMARY KEY (index);


--
-- Name: lu lu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lu
    ADD CONSTRAINT lu_pkey PRIMARY KEY (index);


--
-- Name: lv lv_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lv
    ADD CONSTRAINT lv_pkey PRIMARY KEY (index);


--
-- Name: md md_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.md
    ADD CONSTRAINT md_pkey PRIMARY KEY (index);


--
-- Name: me me_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.me
    ADD CONSTRAINT me_pkey PRIMARY KEY (index);


--
-- Name: mk mk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mk
    ADD CONSTRAINT mk_pkey PRIMARY KEY (index);


--
-- Name: mt mt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mt
    ADD CONSTRAINT mt_pkey PRIMARY KEY (index);


--
-- Name: nl nl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nl
    ADD CONSTRAINT nl_pkey PRIMARY KEY (index);


--
-- Name: no no_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.no
    ADD CONSTRAINT no_pkey PRIMARY KEY (index);


--
-- Name: pl pl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pl
    ADD CONSTRAINT pl_pkey PRIMARY KEY (index);


--
-- Name: pt pt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pt
    ADD CONSTRAINT pt_pkey PRIMARY KEY (index);


--
-- Name: ro ro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ro
    ADD CONSTRAINT ro_pkey PRIMARY KEY (index);


--
-- Name: rs rs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rs
    ADD CONSTRAINT rs_pkey PRIMARY KEY (index);


--
-- Name: ru ru_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ru
    ADD CONSTRAINT ru_pkey PRIMARY KEY (index);


--
-- Name: se se_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.se
    ADD CONSTRAINT se_pkey PRIMARY KEY (index);


--
-- Name: si si_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.si
    ADD CONSTRAINT si_pkey PRIMARY KEY (index);


--
-- Name: sk sk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sk
    ADD CONSTRAINT sk_pkey PRIMARY KEY (index);


--
-- Name: tr tr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tr
    ADD CONSTRAINT tr_pkey PRIMARY KEY (index);


--
-- Name: ua ua_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ua
    ADD CONSTRAINT ua_pkey PRIMARY KEY (index);


--
-- Name: xk xk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xk
    ADD CONSTRAINT xk_pkey PRIMARY KEY (index);


--
-- PostgreSQL database dump complete
--

--
-- Database "getterforatl" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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

--
-- Name: getterforatl; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE getterforatl WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Greek_Greece.1252';


ALTER DATABASE getterforatl OWNER TO postgres;

\connect getterforatl

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
-- Name: al; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.al (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.al OWNER TO postgres;

--
-- Name: am; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.am (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.am OWNER TO postgres;

--
-- Name: at; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.at (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.at OWNER TO postgres;

--
-- Name: az; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.az (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.az OWNER TO postgres;

--
-- Name: ba; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ba (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ba OWNER TO postgres;

--
-- Name: be; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.be (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.be OWNER TO postgres;

--
-- Name: bg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bg (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.bg OWNER TO postgres;

--
-- Name: by; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.by (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.by OWNER TO postgres;

--
-- Name: ch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ch (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ch OWNER TO postgres;

--
-- Name: cy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cy (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.cy OWNER TO postgres;

--
-- Name: cz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cz (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.cz OWNER TO postgres;

--
-- Name: de; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.de (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.de OWNER TO postgres;

--
-- Name: dk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.dk OWNER TO postgres;

--
-- Name: ee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ee (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ee OWNER TO postgres;

--
-- Name: es; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.es (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.es OWNER TO postgres;

--
-- Name: fi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fi (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.fi OWNER TO postgres;

--
-- Name: fr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.fr OWNER TO postgres;

--
-- Name: gb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gb (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.gb OWNER TO postgres;

--
-- Name: ge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ge (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ge OWNER TO postgres;

--
-- Name: gr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.gr OWNER TO postgres;

--
-- Name: hr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.hr OWNER TO postgres;

--
-- Name: hu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hu (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.hu OWNER TO postgres;

--
-- Name: ie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ie (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ie OWNER TO postgres;

--
-- Name: it; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.it (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.it OWNER TO postgres;

--
-- Name: lt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lt (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.lt OWNER TO postgres;

--
-- Name: lu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lu (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.lu OWNER TO postgres;

--
-- Name: lv; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lv (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.lv OWNER TO postgres;

--
-- Name: md; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.md (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.md OWNER TO postgres;

--
-- Name: me; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.me (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.me OWNER TO postgres;

--
-- Name: mk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.mk OWNER TO postgres;

--
-- Name: mt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mt (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.mt OWNER TO postgres;

--
-- Name: nl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nl (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.nl OWNER TO postgres;

--
-- Name: no; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.no (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.no OWNER TO postgres;

--
-- Name: pl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pl (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.pl OWNER TO postgres;

--
-- Name: pt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pt (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.pt OWNER TO postgres;

--
-- Name: ro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ro (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ro OWNER TO postgres;

--
-- Name: rs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rs (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.rs OWNER TO postgres;

--
-- Name: ru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ru (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ru OWNER TO postgres;

--
-- Name: se; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.se (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.se OWNER TO postgres;

--
-- Name: si; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.si (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.si OWNER TO postgres;

--
-- Name: sk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.sk OWNER TO postgres;

--
-- Name: tr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.tr OWNER TO postgres;

--
-- Name: ua; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ua (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ua OWNER TO postgres;

--
-- Name: xk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.xk OWNER TO postgres;

--
-- Data for Name: al; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.al (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: am; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.am (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: at; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.at (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: az; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.az (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ba; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ba (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: be; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.be (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: bg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bg (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: by; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.by (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ch (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: cy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cy (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: cz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cz (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: de; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.de (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: dk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dk (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ee (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: es; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.es (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: fi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fi (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: fr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fr (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: gb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gb (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ge (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: gr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gr (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: hr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hr (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: hu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hu (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ie (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: it; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.it (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: lt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lt (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: lu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lu (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: lv; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lv (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: md; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.md (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: me; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.me (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: mk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mk (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: mt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mt (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: nl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nl (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: no; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.no (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: pl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pl (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: pt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pt (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ro (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: rs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rs (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ru; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ru (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: se; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.se (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: si; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.si (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: sk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sk (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: tr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tr (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ua; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ua (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: xk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xk (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Name: al al_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.al
    ADD CONSTRAINT al_pkey PRIMARY KEY (index);


--
-- Name: am am_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.am
    ADD CONSTRAINT am_pkey PRIMARY KEY (index);


--
-- Name: at at_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.at
    ADD CONSTRAINT at_pkey PRIMARY KEY (index);


--
-- Name: az az_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.az
    ADD CONSTRAINT az_pkey PRIMARY KEY (index);


--
-- Name: ba ba_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ba
    ADD CONSTRAINT ba_pkey PRIMARY KEY (index);


--
-- Name: be be_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.be
    ADD CONSTRAINT be_pkey PRIMARY KEY (index);


--
-- Name: bg bg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bg
    ADD CONSTRAINT bg_pkey PRIMARY KEY (index);


--
-- Name: by by_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.by
    ADD CONSTRAINT by_pkey PRIMARY KEY (index);


--
-- Name: ch ch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ch
    ADD CONSTRAINT ch_pkey PRIMARY KEY (index);


--
-- Name: cy cy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cy
    ADD CONSTRAINT cy_pkey PRIMARY KEY (index);


--
-- Name: cz cz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cz
    ADD CONSTRAINT cz_pkey PRIMARY KEY (index);


--
-- Name: de de_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.de
    ADD CONSTRAINT de_pkey PRIMARY KEY (index);


--
-- Name: dk dk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dk
    ADD CONSTRAINT dk_pkey PRIMARY KEY (index);


--
-- Name: ee ee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ee
    ADD CONSTRAINT ee_pkey PRIMARY KEY (index);


--
-- Name: es es_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.es
    ADD CONSTRAINT es_pkey PRIMARY KEY (index);


--
-- Name: fi fi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fi
    ADD CONSTRAINT fi_pkey PRIMARY KEY (index);


--
-- Name: fr fr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fr
    ADD CONSTRAINT fr_pkey PRIMARY KEY (index);


--
-- Name: gb gb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gb
    ADD CONSTRAINT gb_pkey PRIMARY KEY (index);


--
-- Name: ge ge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ge
    ADD CONSTRAINT ge_pkey PRIMARY KEY (index);


--
-- Name: gr gr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gr
    ADD CONSTRAINT gr_pkey PRIMARY KEY (index);


--
-- Name: hr hr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hr
    ADD CONSTRAINT hr_pkey PRIMARY KEY (index);


--
-- Name: hu hu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hu
    ADD CONSTRAINT hu_pkey PRIMARY KEY (index);


--
-- Name: ie ie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ie
    ADD CONSTRAINT ie_pkey PRIMARY KEY (index);


--
-- Name: it it_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.it
    ADD CONSTRAINT it_pkey PRIMARY KEY (index);


--
-- Name: lt lt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lt
    ADD CONSTRAINT lt_pkey PRIMARY KEY (index);


--
-- Name: lu lu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lu
    ADD CONSTRAINT lu_pkey PRIMARY KEY (index);


--
-- Name: lv lv_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lv
    ADD CONSTRAINT lv_pkey PRIMARY KEY (index);


--
-- Name: md md_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.md
    ADD CONSTRAINT md_pkey PRIMARY KEY (index);


--
-- Name: me me_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.me
    ADD CONSTRAINT me_pkey PRIMARY KEY (index);


--
-- Name: mk mk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mk
    ADD CONSTRAINT mk_pkey PRIMARY KEY (index);


--
-- Name: mt mt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mt
    ADD CONSTRAINT mt_pkey PRIMARY KEY (index);


--
-- Name: nl nl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nl
    ADD CONSTRAINT nl_pkey PRIMARY KEY (index);


--
-- Name: no no_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.no
    ADD CONSTRAINT no_pkey PRIMARY KEY (index);


--
-- Name: pl pl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pl
    ADD CONSTRAINT pl_pkey PRIMARY KEY (index);


--
-- Name: pt pt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pt
    ADD CONSTRAINT pt_pkey PRIMARY KEY (index);


--
-- Name: ro ro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ro
    ADD CONSTRAINT ro_pkey PRIMARY KEY (index);


--
-- Name: rs rs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rs
    ADD CONSTRAINT rs_pkey PRIMARY KEY (index);


--
-- Name: ru ru_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ru
    ADD CONSTRAINT ru_pkey PRIMARY KEY (index);


--
-- Name: se se_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.se
    ADD CONSTRAINT se_pkey PRIMARY KEY (index);


--
-- Name: si si_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.si
    ADD CONSTRAINT si_pkey PRIMARY KEY (index);


--
-- Name: sk sk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sk
    ADD CONSTRAINT sk_pkey PRIMARY KEY (index);


--
-- Name: tr tr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tr
    ADD CONSTRAINT tr_pkey PRIMARY KEY (index);


--
-- Name: ua ua_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ua
    ADD CONSTRAINT ua_pkey PRIMARY KEY (index);


--
-- Name: xk xk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xk
    ADD CONSTRAINT xk_pkey PRIMARY KEY (index);


--
-- PostgreSQL database dump complete
--

--
-- Database "getterforff" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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

--
-- Name: getterforff; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE getterforff WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Greek_Greece.1252';


ALTER DATABASE getterforff OWNER TO postgres;

\connect getterforff

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
-- Name: al; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.al (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.al OWNER TO postgres;

--
-- Name: am; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.am (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.am OWNER TO postgres;

--
-- Name: at; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.at (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.at OWNER TO postgres;

--
-- Name: az; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.az (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.az OWNER TO postgres;

--
-- Name: ba; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ba (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ba OWNER TO postgres;

--
-- Name: be; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.be (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.be OWNER TO postgres;

--
-- Name: bg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bg (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.bg OWNER TO postgres;

--
-- Name: by; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.by (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.by OWNER TO postgres;

--
-- Name: ch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ch (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ch OWNER TO postgres;

--
-- Name: cy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cy (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.cy OWNER TO postgres;

--
-- Name: cz; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cz (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.cz OWNER TO postgres;

--
-- Name: de; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.de (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.de OWNER TO postgres;

--
-- Name: dk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.dk OWNER TO postgres;

--
-- Name: ee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ee (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ee OWNER TO postgres;

--
-- Name: es; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.es (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.es OWNER TO postgres;

--
-- Name: fi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fi (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.fi OWNER TO postgres;

--
-- Name: fr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.fr OWNER TO postgres;

--
-- Name: gb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gb (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.gb OWNER TO postgres;

--
-- Name: ge; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ge (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ge OWNER TO postgres;

--
-- Name: gr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.gr OWNER TO postgres;

--
-- Name: hr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.hr OWNER TO postgres;

--
-- Name: hu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hu (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.hu OWNER TO postgres;

--
-- Name: ie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ie (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ie OWNER TO postgres;

--
-- Name: it; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.it (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.it OWNER TO postgres;

--
-- Name: lt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lt (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.lt OWNER TO postgres;

--
-- Name: lu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lu (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.lu OWNER TO postgres;

--
-- Name: lv; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lv (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.lv OWNER TO postgres;

--
-- Name: md; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.md (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.md OWNER TO postgres;

--
-- Name: me; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.me (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.me OWNER TO postgres;

--
-- Name: mk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.mk OWNER TO postgres;

--
-- Name: mt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mt (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.mt OWNER TO postgres;

--
-- Name: nl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nl (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.nl OWNER TO postgres;

--
-- Name: no; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.no (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.no OWNER TO postgres;

--
-- Name: pl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pl (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.pl OWNER TO postgres;

--
-- Name: pt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pt (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.pt OWNER TO postgres;

--
-- Name: ro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ro (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ro OWNER TO postgres;

--
-- Name: rs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rs (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.rs OWNER TO postgres;

--
-- Name: ru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ru (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ru OWNER TO postgres;

--
-- Name: se; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.se (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.se OWNER TO postgres;

--
-- Name: si; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.si (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.si OWNER TO postgres;

--
-- Name: sk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.sk OWNER TO postgres;

--
-- Name: tr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tr (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.tr OWNER TO postgres;

--
-- Name: ua; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ua (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.ua OWNER TO postgres;

--
-- Name: xk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xk (
    datetime timestamp(6) without time zone,
    actualgenerationpertype real,
    actualconsumption real,
    updatetime timestamp(6) without time zone,
    index integer NOT NULL
);


ALTER TABLE public.xk OWNER TO postgres;

--
-- Data for Name: al; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.al (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: am; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.am (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: at; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.at (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: az; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.az (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ba; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ba (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: be; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.be (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: bg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bg (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: by; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.by (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ch (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: cy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cy (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: cz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cz (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: de; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.de (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: dk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dk (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ee (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: es; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.es (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: fi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fi (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: fr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fr (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: gb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gb (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ge; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ge (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: gr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gr (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: hr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hr (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: hu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hu (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ie (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: it; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.it (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: lt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lt (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: lu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lu (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: lv; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lv (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: md; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.md (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: me; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.me (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: mk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mk (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: mt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mt (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: nl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nl (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: no; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.no (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: pl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pl (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: pt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pt (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ro (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: rs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rs (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ru; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ru (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: se; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.se (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: si; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.si (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: sk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sk (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: tr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tr (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: ua; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ua (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Data for Name: xk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xk (datetime, actualgenerationpertype, actualconsumption, updatetime, index) FROM stdin;
\.


--
-- Name: al al_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.al
    ADD CONSTRAINT al_pkey PRIMARY KEY (index);


--
-- Name: am am_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.am
    ADD CONSTRAINT am_pkey PRIMARY KEY (index);


--
-- Name: at at_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.at
    ADD CONSTRAINT at_pkey PRIMARY KEY (index);


--
-- Name: az az_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.az
    ADD CONSTRAINT az_pkey PRIMARY KEY (index);


--
-- Name: ba ba_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ba
    ADD CONSTRAINT ba_pkey PRIMARY KEY (index);


--
-- Name: be be_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.be
    ADD CONSTRAINT be_pkey PRIMARY KEY (index);


--
-- Name: bg bg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bg
    ADD CONSTRAINT bg_pkey PRIMARY KEY (index);


--
-- Name: by by_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.by
    ADD CONSTRAINT by_pkey PRIMARY KEY (index);


--
-- Name: ch ch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ch
    ADD CONSTRAINT ch_pkey PRIMARY KEY (index);


--
-- Name: cy cy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cy
    ADD CONSTRAINT cy_pkey PRIMARY KEY (index);


--
-- Name: cz cz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cz
    ADD CONSTRAINT cz_pkey PRIMARY KEY (index);


--
-- Name: de de_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.de
    ADD CONSTRAINT de_pkey PRIMARY KEY (index);


--
-- Name: dk dk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dk
    ADD CONSTRAINT dk_pkey PRIMARY KEY (index);


--
-- Name: ee ee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ee
    ADD CONSTRAINT ee_pkey PRIMARY KEY (index);


--
-- Name: es es_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.es
    ADD CONSTRAINT es_pkey PRIMARY KEY (index);


--
-- Name: fi fi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fi
    ADD CONSTRAINT fi_pkey PRIMARY KEY (index);


--
-- Name: fr fr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fr
    ADD CONSTRAINT fr_pkey PRIMARY KEY (index);


--
-- Name: gb gb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gb
    ADD CONSTRAINT gb_pkey PRIMARY KEY (index);


--
-- Name: ge ge_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ge
    ADD CONSTRAINT ge_pkey PRIMARY KEY (index);


--
-- Name: gr gr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gr
    ADD CONSTRAINT gr_pkey PRIMARY KEY (index);


--
-- Name: hr hr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hr
    ADD CONSTRAINT hr_pkey PRIMARY KEY (index);


--
-- Name: hu hu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hu
    ADD CONSTRAINT hu_pkey PRIMARY KEY (index);


--
-- Name: ie ie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ie
    ADD CONSTRAINT ie_pkey PRIMARY KEY (index);


--
-- Name: it it_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.it
    ADD CONSTRAINT it_pkey PRIMARY KEY (index);


--
-- Name: lt lt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lt
    ADD CONSTRAINT lt_pkey PRIMARY KEY (index);


--
-- Name: lu lu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lu
    ADD CONSTRAINT lu_pkey PRIMARY KEY (index);


--
-- Name: lv lv_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lv
    ADD CONSTRAINT lv_pkey PRIMARY KEY (index);


--
-- Name: md md_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.md
    ADD CONSTRAINT md_pkey PRIMARY KEY (index);


--
-- Name: me me_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.me
    ADD CONSTRAINT me_pkey PRIMARY KEY (index);


--
-- Name: mk mk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mk
    ADD CONSTRAINT mk_pkey PRIMARY KEY (index);


--
-- Name: mt mt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mt
    ADD CONSTRAINT mt_pkey PRIMARY KEY (index);


--
-- Name: nl nl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nl
    ADD CONSTRAINT nl_pkey PRIMARY KEY (index);


--
-- Name: no no_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.no
    ADD CONSTRAINT no_pkey PRIMARY KEY (index);


--
-- Name: pl pl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pl
    ADD CONSTRAINT pl_pkey PRIMARY KEY (index);


--
-- Name: pt pt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pt
    ADD CONSTRAINT pt_pkey PRIMARY KEY (index);


--
-- Name: ro ro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ro
    ADD CONSTRAINT ro_pkey PRIMARY KEY (index);


--
-- Name: rs rs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rs
    ADD CONSTRAINT rs_pkey PRIMARY KEY (index);


--
-- Name: ru ru_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ru
    ADD CONSTRAINT ru_pkey PRIMARY KEY (index);


--
-- Name: se se_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.se
    ADD CONSTRAINT se_pkey PRIMARY KEY (index);


--
-- Name: si si_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.si
    ADD CONSTRAINT si_pkey PRIMARY KEY (index);


--
-- Name: sk sk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sk
    ADD CONSTRAINT sk_pkey PRIMARY KEY (index);


--
-- Name: tr tr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tr
    ADD CONSTRAINT tr_pkey PRIMARY KEY (index);


--
-- Name: ua ua_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ua
    ADD CONSTRAINT ua_pkey PRIMARY KEY (index);


--
-- Name: xk xk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xk
    ADD CONSTRAINT xk_pkey PRIMARY KEY (index);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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

--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- PostgreSQL database dump complete
--

--
-- Database "tl2022" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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

--
-- Name: tl2022; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE tl2022 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Greek_Greece.1252';


ALTER DATABASE tl2022 OWNER TO postgres;

\connect tl2022

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
-- Name: actualtotalload; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actualtotalload (
    datetime timestamp(6) without time zone NOT NULL,
    index integer NOT NULL,
    updatedatetime timestamp(6) without time zone,
    totalloadvalue real,
    actualtotalloadrescode integer NOT NULL,
    actualtotalloadcountriesarea character varying(30) NOT NULL
);


ALTER TABLE public.actualtotalload OWNER TO postgres;

--
-- Name: aggrgenerationpertype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aggrgenerationpertype (
    datetime timestamp(6) without time zone NOT NULL,
    index integer NOT NULL,
    updatedatetime timestamp(6) without time zone,
    actualgenerationoutput real,
    actualconsumption real,
    aggrgenerationpertyperescode integer NOT NULL,
    aggrgenerationpertypecountriesarea character varying(30) NOT NULL
);


ALTER TABLE public.aggrgenerationpertype OWNER TO postgres;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    areaname character varying(30) NOT NULL,
    country character varying(30) NOT NULL,
    mapcode character varying(2) NOT NULL,
    areatypecode character varying(10) NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: physicalflows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.physicalflows (
    datetime timestamp(6) without time zone NOT NULL,
    index integer NOT NULL,
    updatedatetime timestamp(6) without time zone,
    flowvalue real,
    physicalflowsrescode integer NOT NULL,
    physicalflowscountriesarea character varying(30) NOT NULL
);


ALTER TABLE public.physicalflows OWNER TO postgres;

--
-- Name: resolutioncode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resolutioncode (
    timestamprescode integer NOT NULL
);


ALTER TABLE public.resolutioncode OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    licenceexpirationdate timestamp(6) without time zone NOT NULL,
    lastlogin timestamp(6) without time zone NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Data for Name: actualtotalload; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actualtotalload (datetime, index, updatedatetime, totalloadvalue, actualtotalloadrescode, actualtotalloadcountriesarea) FROM stdin;
\.


--
-- Data for Name: aggrgenerationpertype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aggrgenerationpertype (datetime, index, updatedatetime, actualgenerationoutput, actualconsumption, aggrgenerationpertyperescode, aggrgenerationpertypecountriesarea) FROM stdin;
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (areaname, country, mapcode, areatypecode) FROM stdin;
\.


--
-- Data for Name: physicalflows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.physicalflows (datetime, index, updatedatetime, flowvalue, physicalflowsrescode, physicalflowscountriesarea) FROM stdin;
\.


--
-- Data for Name: resolutioncode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resolutioncode (timestamprescode) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (firstname, lastname, email, licenceexpirationdate, lastlogin) FROM stdin;
\.


--
-- Name: actualtotalload actualtotalload_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actualtotalload
    ADD CONSTRAINT actualtotalload_pkey PRIMARY KEY (index);


--
-- Name: aggrgenerationpertype aggrgenerationpertype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aggrgenerationpertype
    ADD CONSTRAINT aggrgenerationpertype_pkey PRIMARY KEY (index);


--
-- Name: countries countries_country_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_country_key UNIQUE (country);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (areaname);


--
-- Name: physicalflows physicalflows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physicalflows
    ADD CONSTRAINT physicalflows_pkey PRIMARY KEY (index);


--
-- Name: resolutioncode resolutioncode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resolutioncode
    ADD CONSTRAINT resolutioncode_pkey PRIMARY KEY (timestamprescode);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (email);


--
-- Name: actualtotalload actualtotalload_actualtotalloadcountriesarea_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actualtotalload
    ADD CONSTRAINT actualtotalload_actualtotalloadcountriesarea_fkey FOREIGN KEY (actualtotalloadcountriesarea) REFERENCES public.countries(areaname);


--
-- Name: actualtotalload actualtotalload_actualtotalloadrescode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actualtotalload
    ADD CONSTRAINT actualtotalload_actualtotalloadrescode_fkey FOREIGN KEY (actualtotalloadrescode) REFERENCES public.resolutioncode(timestamprescode);


--
-- Name: aggrgenerationpertype aggrgenerationpertype_aggrgenerationpertypecountriesarea_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aggrgenerationpertype
    ADD CONSTRAINT aggrgenerationpertype_aggrgenerationpertypecountriesarea_fkey FOREIGN KEY (aggrgenerationpertypecountriesarea) REFERENCES public.countries(areaname);


--
-- Name: aggrgenerationpertype aggrgenerationpertype_aggrgenerationpertyperescode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aggrgenerationpertype
    ADD CONSTRAINT aggrgenerationpertype_aggrgenerationpertyperescode_fkey FOREIGN KEY (aggrgenerationpertyperescode) REFERENCES public.resolutioncode(timestamprescode);


--
-- Name: physicalflows physicalflows_physicalflowscountriesarea_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physicalflows
    ADD CONSTRAINT physicalflows_physicalflowscountriesarea_fkey FOREIGN KEY (physicalflowscountriesarea) REFERENCES public.countries(areaname);


--
-- Name: physicalflows physicalflows_physicalflowsrescode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.physicalflows
    ADD CONSTRAINT physicalflows_physicalflowsrescode_fkey FOREIGN KEY (physicalflowsrescode) REFERENCES public.resolutioncode(timestamprescode);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

