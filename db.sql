--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: lbooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lbooks (
    title text,
    author text,
    edition text,
    issued text,
    id integer,
    shelfno text
);


ALTER TABLE lbooks OWNER TO postgres;

--
-- Name: lroles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lroles (
    user_role text NOT NULL
);


ALTER TABLE lroles OWNER TO postgres;

--
-- Name: luser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE luser (
    user_name text NOT NULL,
    password text
);


ALTER TABLE luser OWNER TO postgres;

--
-- Name: luser_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE luser_roles (
    user_name text,
    user_role text
);


ALTER TABLE luser_roles OWNER TO postgres;

--
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transaction (
    bookid integer,
    issuedate date,
    returndate date,
    user_name text
);


ALTER TABLE transaction OWNER TO postgres;

--
-- Data for Name: lbooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY lbooks (title, author, edition, issued, id, shelfno) FROM stdin;
javaee	thomas michael	4.2.1	\N	1	1
JSP and Servlets	Steve Smith	2.0	\N	3	4
struts3	john clarke	2.0.1	\N	2	2
J2EE	Michael Joseph	1.1	\N	4	H31
Ember101	Scot batchon	1.1.1	\N	4	3
EmberJS	Davis Chuckoo	2.14	\N	4	6
EmberJS 2	Davis Chuckoo	6.0.1	\N	4	6
Angular JS	Davis Chuckoo	8.2	\N	4	8
Junit	Roman Roaster	5.6	\N	4	9
Qunit	Roman Roaster	7.5	\N	4	C1
Software process	John Steve	2.1	\N	4	3
Software process 2	John Steve	1.01	\N	4	3
\.


--
-- Data for Name: lroles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY lroles (user_role) FROM stdin;
ADMIN
MANAGER
USER
\.


--
-- Data for Name: luser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY luser (user_name, password) FROM stdin;
postgres	1a1dc91c907325c69271ddf0c944bc72
testuser	1a1dc91c907325c69271ddf0c944bc72
testmanager	1a1dc91c907325c69271ddf0c944bc72
Jack	1a1dc91c907325c69271ddf0c944bc72
Mohan	1a1dc91c907325c69271ddf0c944bc72
Myuser	1a1dc91c907325c69271ddf0c944bc72
Steve	1a1dc91c907325c69271ddf0c944bc72
Mymanager	1a1dc91c907325c69271ddf0c944bc72
\.


--
-- Data for Name: luser_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY luser_roles (user_name, user_role) FROM stdin;
postgres	ADMIN
testuser	USER
testmanager	MANAGER
Jack	MANAGER
Mohan	USER
Myuser	USER
Steve	MANAGER
Mymanager	MANAGER
\.


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transaction (bookid, issuedate, returndate, user_name) FROM stdin;
\.


--
-- Name: lroles lroles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lroles
    ADD CONSTRAINT lroles_pkey PRIMARY KEY (user_role);


--
-- Name: luser luser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY luser
    ADD CONSTRAINT luser_pkey PRIMARY KEY (user_name);


--
-- Name: luser_roles luser_roles_user_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY luser_roles
    ADD CONSTRAINT luser_roles_user_name_fkey FOREIGN KEY (user_name) REFERENCES luser(user_name);


--
-- Name: luser_roles luser_roles_user_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY luser_roles
    ADD CONSTRAINT luser_roles_user_role_fkey FOREIGN KEY (user_role) REFERENCES lroles(user_role);


--
-- Name: transaction transaction_user_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_user_name_fkey FOREIGN KEY (user_name) REFERENCES luser(user_name);


--
-- PostgreSQL database dump complete
--

