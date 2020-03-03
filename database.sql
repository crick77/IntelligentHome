--
-- PostgreSQL database dump
--

-- Dumped from database version 10.11
-- Dumped by pg_dump version 10.11

-- Started on 2020-03-03 19:31:59

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
-- TOC entry 5 (class 2615 OID 57344)
-- Name: intelligenthome; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA intelligenthome;


ALTER SCHEMA intelligenthome OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 226 (class 1259 OID 65559)
-- Name: actuatordata; Type: TABLE; Schema: intelligenthome; Owner: postgres
--

CREATE TABLE intelligenthome.actuatordata (
    id integer NOT NULL,
    observation timestamp without time zone NOT NULL,
    actuatorname character varying(32) NOT NULL,
    value character varying(2000) NOT NULL
);


ALTER TABLE intelligenthome.actuatordata OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 65557)
-- Name: actuaordata_id_seq; Type: SEQUENCE; Schema: intelligenthome; Owner: postgres
--

CREATE SEQUENCE intelligenthome.actuaordata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE intelligenthome.actuaordata_id_seq OWNER TO postgres;

--
-- TOC entry 2908 (class 0 OID 0)
-- Dependencies: 225
-- Name: actuaordata_id_seq; Type: SEQUENCE OWNED BY; Schema: intelligenthome; Owner: postgres
--

ALTER SEQUENCE intelligenthome.actuaordata_id_seq OWNED BY intelligenthome.actuatordata.id;


--
-- TOC entry 219 (class 1259 OID 57358)
-- Name: actuators_id_seq; Type: SEQUENCE; Schema: intelligenthome; Owner: postgres
--

CREATE SEQUENCE intelligenthome.actuators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE intelligenthome.actuators_id_seq OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 57360)
-- Name: actuators; Type: TABLE; Schema: intelligenthome; Owner: postgres
--

CREATE TABLE intelligenthome.actuators (
    id integer DEFAULT nextval('intelligenthome.actuators_id_seq'::regclass) NOT NULL,
    devicename character varying(32) NOT NULL,
    measureunit character varying(8) NOT NULL,
    outputtype character varying(16) NOT NULL,
    url character varying(255) NOT NULL,
    enabled boolean NOT NULL
);


ALTER TABLE intelligenthome.actuators OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 65538)
-- Name: scripts; Type: TABLE; Schema: intelligenthome; Owner: postgres
--

CREATE TABLE intelligenthome.scripts (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    sensorlist character varying(8192) NOT NULL,
    actuatorlist character varying(8192) NOT NULL,
    script character varying(16384) NOT NULL,
    enabled boolean NOT NULL
);


ALTER TABLE intelligenthome.scripts OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 65536)
-- Name: scripts_id_seq; Type: SEQUENCE; Schema: intelligenthome; Owner: postgres
--

CREATE SEQUENCE intelligenthome.scripts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE intelligenthome.scripts_id_seq OWNER TO postgres;

--
-- TOC entry 2909 (class 0 OID 0)
-- Dependencies: 221
-- Name: scripts_id_seq; Type: SEQUENCE OWNED BY; Schema: intelligenthome; Owner: postgres
--

ALTER SEQUENCE intelligenthome.scripts_id_seq OWNED BY intelligenthome.scripts.id;


--
-- TOC entry 224 (class 1259 OID 65551)
-- Name: sensordata; Type: TABLE; Schema: intelligenthome; Owner: postgres
--

CREATE TABLE intelligenthome.sensordata (
    id integer NOT NULL,
    observation timestamp without time zone NOT NULL,
    sensorname character varying(32) NOT NULL,
    value character varying(2000) NOT NULL
);


ALTER TABLE intelligenthome.sensordata OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 65549)
-- Name: sensordata_id_seq; Type: SEQUENCE; Schema: intelligenthome; Owner: postgres
--

CREATE SEQUENCE intelligenthome.sensordata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE intelligenthome.sensordata_id_seq OWNER TO postgres;

--
-- TOC entry 2910 (class 0 OID 0)
-- Dependencies: 223
-- Name: sensordata_id_seq; Type: SEQUENCE OWNED BY; Schema: intelligenthome; Owner: postgres
--

ALTER SEQUENCE intelligenthome.sensordata_id_seq OWNED BY intelligenthome.sensordata.id;


--
-- TOC entry 218 (class 1259 OID 57347)
-- Name: sensors; Type: TABLE; Schema: intelligenthome; Owner: postgres
--

CREATE TABLE intelligenthome.sensors (
    id integer NOT NULL,
    devicename character varying(32) NOT NULL,
    measureunit character varying(8) NOT NULL,
    inputtype character varying(16) NOT NULL,
    enabled boolean NOT NULL
);


ALTER TABLE intelligenthome.sensors OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 57345)
-- Name: sensors_id_seq; Type: SEQUENCE; Schema: intelligenthome; Owner: postgres
--

CREATE SEQUENCE intelligenthome.sensors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE intelligenthome.sensors_id_seq OWNER TO postgres;

--
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 217
-- Name: sensors_id_seq; Type: SEQUENCE OWNED BY; Schema: intelligenthome; Owner: postgres
--

ALTER SEQUENCE intelligenthome.sensors_id_seq OWNED BY intelligenthome.sensors.id;


--
-- TOC entry 2755 (class 2604 OID 65562)
-- Name: actuatordata id; Type: DEFAULT; Schema: intelligenthome; Owner: postgres
--

ALTER TABLE ONLY intelligenthome.actuatordata ALTER COLUMN id SET DEFAULT nextval('intelligenthome.actuaordata_id_seq'::regclass);


--
-- TOC entry 2753 (class 2604 OID 65541)
-- Name: scripts id; Type: DEFAULT; Schema: intelligenthome; Owner: postgres
--

ALTER TABLE ONLY intelligenthome.scripts ALTER COLUMN id SET DEFAULT nextval('intelligenthome.scripts_id_seq'::regclass);


--
-- TOC entry 2754 (class 2604 OID 65554)
-- Name: sensordata id; Type: DEFAULT; Schema: intelligenthome; Owner: postgres
--

ALTER TABLE ONLY intelligenthome.sensordata ALTER COLUMN id SET DEFAULT nextval('intelligenthome.sensordata_id_seq'::regclass);


--
-- TOC entry 2751 (class 2604 OID 57350)
-- Name: sensors id; Type: DEFAULT; Schema: intelligenthome; Owner: postgres
--

ALTER TABLE ONLY intelligenthome.sensors ALTER COLUMN id SET DEFAULT nextval('intelligenthome.sensors_id_seq'::regclass);


--
-- TOC entry 2902 (class 0 OID 65559)
-- Dependencies: 226
-- Data for Name: actuatordata; Type: TABLE DATA; Schema: intelligenthome; Owner: postgres
--

INSERT INTO intelligenthome.actuatordata VALUES (1, '2020-02-20 09:37:29.618', 'HeatUnitCamera1', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (2, '2020-02-20 09:37:29.889', 'HeatUnitCamera2', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (3, '2020-02-20 09:37:30.42', 'HeatUnitBagno', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (4, '2020-02-20 09:37:30.743', 'HeatUnitCucina', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (5, '2020-02-20 09:37:30.919', 'HeatUnitSalone', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (6, '2020-02-20 09:37:30.998', 'LuceSalone', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (7, '2020-02-20 09:37:31.09', 'LCD', 'PortaCasa false');
INSERT INTO intelligenthome.actuatordata VALUES (8, '2020-02-20 09:37:31.17', 'LCD', 'GasCucina false');
INSERT INTO intelligenthome.actuatordata VALUES (9, '2020-02-20 09:37:31.282', 'FinestraCucina', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (10, '2020-02-20 09:38:06.034', 'LCD', 'TempCamera1 18.0');
INSERT INTO intelligenthome.actuatordata VALUES (11, '2020-02-20 09:38:06.134', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (12, '2020-02-20 09:38:06.19', 'HeatUnitCamera1', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (13, '2020-02-20 09:38:06.546', 'LCD', 'TempCamera1 18.1');
INSERT INTO intelligenthome.actuatordata VALUES (14, '2020-02-20 09:38:06.638', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (15, '2020-02-20 09:38:06.694', 'HeatUnitCamera1', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (16, '2020-02-20 09:38:09.558', 'LCD', 'TempCamera1 18.2');
INSERT INTO intelligenthome.actuatordata VALUES (17, '2020-02-20 09:38:09.638', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (18, '2020-02-20 09:38:09.702', 'HeatUnitCamera1', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (19, '2020-02-20 09:38:12.545', 'LCD', 'TempCamera1 18.3');
INSERT INTO intelligenthome.actuatordata VALUES (20, '2020-02-20 09:38:12.637', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (21, '2020-02-20 09:38:12.693', 'HeatUnitCamera1', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (22, '2020-02-20 09:38:15.545', 'LCD', 'TempCamera1 18.4');
INSERT INTO intelligenthome.actuatordata VALUES (23, '2020-02-20 09:38:15.657', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (24, '2020-02-20 09:38:15.717', 'HeatUnitCamera1', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (25, '2020-02-20 09:38:18.548', 'LCD', 'TempCamera1 18.5');
INSERT INTO intelligenthome.actuatordata VALUES (26, '2020-02-20 09:38:18.644', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (27, '2020-02-20 09:38:18.704', 'HeatUnitCamera1', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (28, '2020-02-20 09:38:21.546', 'LCD', 'TempCamera1 18.6');
INSERT INTO intelligenthome.actuatordata VALUES (29, '2020-02-20 09:38:21.634', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (30, '2020-02-20 09:38:21.69', 'HeatUnitCamera1', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (31, '2020-02-20 09:38:24.543', 'LCD', 'TempCamera1 18.7');
INSERT INTO intelligenthome.actuatordata VALUES (32, '2020-02-20 09:38:24.627', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (33, '2020-02-20 09:38:24.687', 'HeatUnitCamera1', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (34, '2020-02-20 09:38:27.55', 'LCD', 'TempCamera1 18.8');
INSERT INTO intelligenthome.actuatordata VALUES (35, '2020-02-20 09:38:27.65', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (36, '2020-02-20 09:38:27.718', 'HeatUnitCamera1', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (37, '2020-02-20 09:38:30.557', 'LCD', 'TempCamera1 18.9');
INSERT INTO intelligenthome.actuatordata VALUES (38, '2020-02-20 09:38:30.649', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (39, '2020-02-20 09:38:30.721', 'HeatUnitCamera1', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (40, '2020-02-20 09:38:33.539', 'LCD', 'TempCamera1 19.0');
INSERT INTO intelligenthome.actuatordata VALUES (41, '2020-02-20 09:38:33.647', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (42, '2020-02-20 09:38:33.715', 'HeatUnitCamera1', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (43, '2020-02-20 09:38:36.535', 'LCD', 'TempCamera1 19.1');
INSERT INTO intelligenthome.actuatordata VALUES (44, '2020-02-20 09:38:36.619', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (45, '2020-02-20 09:38:39.554', 'LCD', 'TempCamera1 19.2');
INSERT INTO intelligenthome.actuatordata VALUES (46, '2020-02-20 09:38:39.654', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (47, '2020-02-20 09:38:42.553', 'LCD', 'TempCamera1 19.3');
INSERT INTO intelligenthome.actuatordata VALUES (48, '2020-02-20 09:38:42.633', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (49, '2020-02-20 09:38:45.548', 'LCD', 'TempCamera1 19.4');
INSERT INTO intelligenthome.actuatordata VALUES (50, '2020-02-20 09:38:45.628', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (51, '2020-02-20 09:38:48.542', 'LCD', 'TempCamera1 19.5');
INSERT INTO intelligenthome.actuatordata VALUES (52, '2020-02-20 09:38:48.654', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (53, '2020-02-20 09:38:51.541', 'LCD', 'TempCamera1 19.6');
INSERT INTO intelligenthome.actuatordata VALUES (54, '2020-02-20 09:38:51.621', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (55, '2020-02-20 09:38:54.532', 'LCD', 'TempCamera1 19.7');
INSERT INTO intelligenthome.actuatordata VALUES (56, '2020-02-20 09:38:54.64', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (57, '2020-02-20 09:38:57.542', 'LCD', 'TempCamera1 19.8');
INSERT INTO intelligenthome.actuatordata VALUES (58, '2020-02-20 09:38:57.622', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (59, '2020-02-20 09:39:00.543', 'LCD', 'TempCamera1 19.9');
INSERT INTO intelligenthome.actuatordata VALUES (60, '2020-02-20 09:39:00.623', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (61, '2020-02-20 09:39:03.544', 'LCD', 'TempCamera1 20.0');
INSERT INTO intelligenthome.actuatordata VALUES (62, '2020-02-20 09:39:03.632', 'LCD', 'Ciaoooooooo!');
INSERT INTO intelligenthome.actuatordata VALUES (63, '2020-02-20 09:39:03.688', 'HeatUnitCamera1', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (64, '2020-02-20 09:57:10.643', 'HeatUnitCamera1', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (65, '2020-02-20 09:57:10.805', 'HeatUnitBagno', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (66, '2020-02-20 09:57:10.981', 'HeatUnitCamera2', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (67, '2020-02-20 09:57:11.289', 'HeatUnitCucina', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (68, '2020-02-20 09:57:11.541', 'HeatUnitSalone', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (69, '2020-02-20 09:57:11.641', 'LuceSalone', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (70, '2020-02-20 09:57:11.722', 'LCD', 'GasCucina false');
INSERT INTO intelligenthome.actuatordata VALUES (71, '2020-02-20 09:57:11.8', 'FinestraCucina', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (72, '2020-02-20 09:57:11.876', 'LCD', 'PortaCasa false');
INSERT INTO intelligenthome.actuatordata VALUES (73, '2020-02-20 09:57:24.708', 'LCD', 'TempCamera1 19.2');
INSERT INTO intelligenthome.actuatordata VALUES (74, '2020-02-20 09:57:24.786', 'HeatUnitCamera1', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (75, '2020-02-20 09:57:26.381', 'LCD', 'TempCamera1 19.3');
INSERT INTO intelligenthome.actuatordata VALUES (76, '2020-02-20 09:57:29.391', 'LCD', 'TempCamera1 19.4');
INSERT INTO intelligenthome.actuatordata VALUES (77, '2020-02-20 09:57:32.395', 'LCD', 'TempCamera1 19.5');
INSERT INTO intelligenthome.actuatordata VALUES (78, '2020-02-20 09:57:35.387', 'LCD', 'TempCamera1 19.6');
INSERT INTO intelligenthome.actuatordata VALUES (79, '2020-02-20 09:57:38.376', 'LCD', 'TempCamera1 19.7');
INSERT INTO intelligenthome.actuatordata VALUES (80, '2020-02-20 09:57:41.394', 'LCD', 'TempCamera1 19.8');
INSERT INTO intelligenthome.actuatordata VALUES (81, '2020-02-20 09:57:41.472', 'HeatUnitCamera1', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (82, '2020-03-03 10:34:11.383', 'LCD', 'TermostatoCamera1 19.5');
INSERT INTO intelligenthome.actuatordata VALUES (83, '2020-03-03 10:34:11.75', 'LCD', 'TermostatoCamera2 19.5');
INSERT INTO intelligenthome.actuatordata VALUES (84, '2020-03-03 10:34:11.965', 'HeatUnitCamera1', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (85, '2020-03-03 10:34:12.099', 'LCD', 'TermostatoBagno 21.0');
INSERT INTO intelligenthome.actuatordata VALUES (86, '2020-03-03 10:34:12.36', 'HeatUnitCamera2', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (87, '2020-03-03 10:34:12.656', 'LCD', 'TermostatoCucina 20.0');
INSERT INTO intelligenthome.actuatordata VALUES (88, '2020-03-03 10:34:13.236', 'HeatUnitBagno', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (89, '2020-03-03 10:34:13.45', 'LCD', 'TermostatoSalone 21.0');
INSERT INTO intelligenthome.actuatordata VALUES (90, '2020-03-03 10:34:13.572', 'HeatUnitCucina', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (91, '2020-03-03 10:34:13.671', 'HeatUnitSalone', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (92, '2020-03-03 10:34:13.756', 'LCD', 'CrepuscolareSalone 5');
INSERT INTO intelligenthome.actuatordata VALUES (93, '2020-03-03 10:34:13.835', 'LuceSalone', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (94, '2020-03-03 10:34:13.988', 'LCD', 'GasCucina false');
INSERT INTO intelligenthome.actuatordata VALUES (95, '2020-03-03 10:34:14.085', 'LCD', 'PortaCasa false');
INSERT INTO intelligenthome.actuatordata VALUES (96, '2020-03-03 10:34:14.173', 'FinestraCucina', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (97, '2020-03-03 10:35:29.751', 'LCD', 'GasCucina true');
INSERT INTO intelligenthome.actuatordata VALUES (98, '2020-03-03 10:35:29.849', 'FinestraCucina', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (99, '2020-03-03 10:35:29.917', 'LCD', 'Attenzione GAS!');
INSERT INTO intelligenthome.actuatordata VALUES (100, '2020-03-03 10:35:59.496', 'LCD', 'GasCucina false');
INSERT INTO intelligenthome.actuatordata VALUES (101, '2020-03-03 10:35:59.58', 'FinestraCucina', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (102, '2020-03-03 10:36:00.592', 'LCD', 'GasCucina true');
INSERT INTO intelligenthome.actuatordata VALUES (103, '2020-03-03 10:36:00.733', 'FinestraCucina', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (104, '2020-03-03 10:36:02.885', 'LCD', 'GasCucina false');
INSERT INTO intelligenthome.actuatordata VALUES (105, '2020-03-03 10:36:02.971', 'FinestraCucina', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (106, '2020-03-03 10:36:04.11', 'LCD', 'GasCucina true');
INSERT INTO intelligenthome.actuatordata VALUES (107, '2020-03-03 10:36:04.19', 'LCD', 'Attenzione GAS!!!!!');
INSERT INTO intelligenthome.actuatordata VALUES (108, '2020-03-03 10:36:04.257', 'FinestraCucina', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (109, '2020-03-03 10:36:24.182', 'LCD', 'TempCamera1 18.9');
INSERT INTO intelligenthome.actuatordata VALUES (110, '2020-03-03 10:36:24.272', 'HeatUnitCamera1', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (111, '2020-03-03 10:36:27.015', 'LCD', 'TempCamera1 19.0');
INSERT INTO intelligenthome.actuatordata VALUES (112, '2020-03-03 10:36:27.104', 'HeatUnitCamera1', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (113, '2020-03-03 10:36:30.057', 'LCD', 'TempCamera1 19.1');
INSERT INTO intelligenthome.actuatordata VALUES (114, '2020-03-03 10:36:30.114', 'HeatUnitCamera1', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (115, '2020-03-03 10:36:33.003', 'LCD', 'TempCamera1 19.2');
INSERT INTO intelligenthome.actuatordata VALUES (116, '2020-03-03 10:36:33.082', 'HeatUnitCamera1', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (117, '2020-03-03 10:36:36.03', 'LCD', 'TempCamera1 19.3');
INSERT INTO intelligenthome.actuatordata VALUES (118, '2020-03-03 10:36:39.003', 'LCD', 'TempCamera1 19.4');
INSERT INTO intelligenthome.actuatordata VALUES (119, '2020-03-03 10:36:42.029', 'LCD', 'TempCamera1 19.5');
INSERT INTO intelligenthome.actuatordata VALUES (120, '2020-03-03 10:36:45.09', 'LCD', 'TempCamera1 19.6');
INSERT INTO intelligenthome.actuatordata VALUES (121, '2020-03-03 10:36:48.024', 'LCD', 'TempCamera1 19.7');
INSERT INTO intelligenthome.actuatordata VALUES (122, '2020-03-03 10:36:51.027', 'LCD', 'TempCamera1 19.8');
INSERT INTO intelligenthome.actuatordata VALUES (123, '2020-03-03 10:36:54.003', 'LCD', 'TempCamera1 19.9');
INSERT INTO intelligenthome.actuatordata VALUES (124, '2020-03-03 10:36:54.098', 'HeatUnitCamera1', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (125, '2020-03-03 10:42:06.761', 'LCD', 'TempCamera1 Invalid data [1]');
INSERT INTO intelligenthome.actuatordata VALUES (126, '2020-03-03 10:46:23.818', 'LCD', 'CrepuscolareSalone 4');
INSERT INTO intelligenthome.actuatordata VALUES (127, '2020-03-03 10:46:23.954', 'LuceSalone', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (128, '2020-03-03 10:46:37.835', 'LCD', 'PosizioneBob 101');
INSERT INTO intelligenthome.actuatordata VALUES (129, '2020-03-03 10:46:39.024', 'LCD', 'PortaCasa true');
INSERT INTO intelligenthome.actuatordata VALUES (130, '2020-03-03 10:46:39.232', 'PortaCasa', 'false');
INSERT INTO intelligenthome.actuatordata VALUES (131, '2020-03-03 10:46:39.356', 'LCD', 'Chiudo porta...ciao Bob!');
INSERT INTO intelligenthome.actuatordata VALUES (132, '2020-03-03 10:47:11.128', 'LCD', 'TempCamera1 19.0');
INSERT INTO intelligenthome.actuatordata VALUES (133, '2020-03-03 10:47:11.224', 'HeatUnitCamera1', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (134, '2020-03-03 10:47:12.024', 'LCD', 'TempBagno 18.0');
INSERT INTO intelligenthome.actuatordata VALUES (135, '2020-03-03 10:47:12.3', 'LCD', 'TempCamera1 19.1');
INSERT INTO intelligenthome.actuatordata VALUES (136, '2020-03-03 10:47:12.44', 'HeatUnitBagno', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (137, '2020-03-03 10:47:12.548', 'HeatUnitCamera1', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (138, '2020-03-03 10:47:12.828', 'LCD', 'TempCamera2 18.9');
INSERT INTO intelligenthome.actuatordata VALUES (139, '2020-03-03 10:47:12.964', 'HeatUnitCamera2', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (140, '2020-03-03 10:47:13.952', 'LCD', 'TempCucina 18.0');
INSERT INTO intelligenthome.actuatordata VALUES (141, '2020-03-03 10:47:14.076', 'HeatUnitCucina', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (142, '2020-03-03 10:47:15.373', 'LCD', 'TempCamera1 19.2');
INSERT INTO intelligenthome.actuatordata VALUES (143, '2020-03-03 10:47:15.557', 'LCD', 'TempBagno 18.1');
INSERT INTO intelligenthome.actuatordata VALUES (144, '2020-03-03 10:47:15.873', 'HeatUnitCamera1', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (145, '2020-03-03 10:47:16.013', 'HeatUnitBagno', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (146, '2020-03-03 10:47:16.118', 'LCD', 'TempCucina 18.1');
INSERT INTO intelligenthome.actuatordata VALUES (147, '2020-03-03 10:47:16.226', 'LCD', 'TempCamera2 19.0');
INSERT INTO intelligenthome.actuatordata VALUES (148, '2020-03-03 10:47:16.346', 'HeatUnitCucina', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (149, '2020-03-03 10:47:16.434', 'HeatUnitCamera2', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (150, '2020-03-03 10:47:18.169', 'LCD', 'TempCamera1 19.3');
INSERT INTO intelligenthome.actuatordata VALUES (151, '2020-03-03 10:47:18.293', 'LCD', 'TempCucina 18.2');
INSERT INTO intelligenthome.actuatordata VALUES (152, '2020-03-03 10:47:18.429', 'LCD', 'TempBagno 18.2');
INSERT INTO intelligenthome.actuatordata VALUES (153, '2020-03-03 10:47:18.589', 'HeatUnitCucina', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (154, '2020-03-03 10:47:18.753', 'LCD', 'TempCamera2 19.1');
INSERT INTO intelligenthome.actuatordata VALUES (155, '2020-03-03 10:47:18.873', 'HeatUnitBagno', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (156, '2020-03-03 10:47:18.969', 'HeatUnitCamera2', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (157, '2020-03-03 10:47:21.208', 'LCD', 'TempCamera1 19.4');
INSERT INTO intelligenthome.actuatordata VALUES (158, '2020-03-03 10:47:21.356', 'LCD', 'TempCucina 18.3');
INSERT INTO intelligenthome.actuatordata VALUES (159, '2020-03-03 10:47:21.504', 'LCD', 'TempBagno 18.3');
INSERT INTO intelligenthome.actuatordata VALUES (160, '2020-03-03 10:47:21.728', 'HeatUnitCucina', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (161, '2020-03-03 10:47:21.884', 'LCD', 'TempCamera2 19.2');
INSERT INTO intelligenthome.actuatordata VALUES (162, '2020-03-03 10:47:21.964', 'HeatUnitBagno', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (163, '2020-03-03 10:47:24.213', 'LCD', 'TempCamera1 19.5');
INSERT INTO intelligenthome.actuatordata VALUES (164, '2020-03-03 10:47:24.409', 'LCD', 'TempBagno 18.4');
INSERT INTO intelligenthome.actuatordata VALUES (165, '2020-03-03 10:47:24.669', 'HeatUnitBagno', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (166, '2020-03-03 10:47:24.897', 'LCD', 'TempCucina 18.4');
INSERT INTO intelligenthome.actuatordata VALUES (167, '2020-03-03 10:47:25.061', 'HeatUnitCucina', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (168, '2020-03-03 10:47:25.241', 'LCD', 'TempCamera2 19.3');
INSERT INTO intelligenthome.actuatordata VALUES (169, '2020-03-03 10:47:27.178', 'LCD', 'TempCamera1 19.6');
INSERT INTO intelligenthome.actuatordata VALUES (170, '2020-03-03 10:47:27.378', 'LCD', 'TempCucina 18.5');
INSERT INTO intelligenthome.actuatordata VALUES (171, '2020-03-03 10:47:27.546', 'LCD', 'TempBagno 18.5');
INSERT INTO intelligenthome.actuatordata VALUES (172, '2020-03-03 10:47:27.77', 'HeatUnitCucina', 'true');
INSERT INTO intelligenthome.actuatordata VALUES (173, '2020-03-03 10:47:27.874', 'LCD', 'TempCamera2 19.4');
INSERT INTO intelligenthome.actuatordata VALUES (174, '2020-03-03 10:47:27.95', 'HeatUnitBagno', 'true');


--
-- TOC entry 2896 (class 0 OID 57360)
-- Dependencies: 220
-- Data for Name: actuators; Type: TABLE DATA; Schema: intelligenthome; Owner: postgres
--

INSERT INTO intelligenthome.actuators VALUES (4, 'LCD', 'Chars', 'TEXTUAL', 'http://localhost:8086/home/', true);
INSERT INTO intelligenthome.actuators VALUES (1, 'FinestraCucina', 'On/Off', 'ON/OFF', 'http://localhost:8086/home/', true);
INSERT INTO intelligenthome.actuators VALUES (3, 'HeatUnitSalone', 'On/Off', 'ON/OFF', 'http://localhost:8086/home/', true);
INSERT INTO intelligenthome.actuators VALUES (25, 'HeatUnitBagno', 'On/Off', 'ON/OFF', 'http://localhost:8086/home/', true);
INSERT INTO intelligenthome.actuators VALUES (26, 'HeatUnitCucina', 'On/Off', 'ON/OFF', 'http://localhost:8086/home/', true);
INSERT INTO intelligenthome.actuators VALUES (27, 'LuceSalone', 'On/Off', 'ON/OFF', 'http://localhost:8086/home/', true);
INSERT INTO intelligenthome.actuators VALUES (28, 'LuceCucina', 'On/Off', 'ON/OFF', 'http://localhost:8086/home/', true);
INSERT INTO intelligenthome.actuators VALUES (29, 'LuceCamera1', 'On/Off', 'ON/OFF', 'http://localhost:8086/home/', true);
INSERT INTO intelligenthome.actuators VALUES (30, 'LuceCamera2', 'On/Off', 'ON/OFF', 'http://localhost:8086/home/', true);
INSERT INTO intelligenthome.actuators VALUES (31, 'LuceBagno', 'On/Off', 'ON/OFF', 'http://localhost:8086/home/', true);
INSERT INTO intelligenthome.actuators VALUES (23, 'HeatUnitCamera1', 'On/Off', 'ON/OFF', 'http://localhost:8086/home/', true);
INSERT INTO intelligenthome.actuators VALUES (24, 'HeatUnitCamera2', 'On/Off', 'ON/OFF', 'http://localhost:8086/home/', true);
INSERT INTO intelligenthome.actuators VALUES (32, 'PortaCasa', 'On/Off', 'ON/OFF', 'http://localhost:8086/home/', true);


--
-- TOC entry 2898 (class 0 OID 65538)
-- Dependencies: 222
-- Data for Name: scripts; Type: TABLE DATA; Schema: intelligenthome; Owner: postgres
--

INSERT INTO intelligenthome.scripts VALUES (1, 'RegolaTempCamera1', 'TempCamera1,TermostatoCamera1', 'HeatUnitCamera1', 'var soglia = 0.3;
var termc1 = parseFloat(TermostatoCamera1);
var tempc1 = parseFloat(TempCamera1);

var sogliaDown = (termc1 - soglia);
var sogliaUp = (termc1 + soglia);

HeatUnitCamera1 = UNCHANGED;
if(tempc1 <=sogliaDown) {
   HeatUnitCamera1 = ON;
}
if(tempc1 >=sogliaUp) {
    HeatUnitCamera1 = OFF;
}
', true);
INSERT INTO intelligenthome.scripts VALUES (4, 'VerificaGas', 'GasCucina', 'LCD,FinestraCucina', 'FinestraCucina = CLOSE;
LCD = UNCHANGED;

if(GasCucina==OPEN) {
   FinestraCucina = OPEN;
   LCD = ''Attenzione GAS!!!!!'';
}', true);
INSERT INTO intelligenthome.scripts VALUES (5, 'IlluminazioneSalone', 'CrepuscolareSalone', 'LuceSalone', 'LuceSalone = ''UNCHANGED'';
var luce = parseInt(CrepuscolareSalone);
if(luce<5) {
   LuceSalone = true;
}
else {
  LuceSalone = false;
}', true);
INSERT INTO intelligenthome.scripts VALUES (6, 'RegolaTempCamera2', 'TempCamera2,TermostatoCamera2', 'HeatUnitCamera2', 'var termoc2 = parseFloat(TermostatoCamera2);
var tempc2 = parseFloat(TempCamera2);

var sogliaDown = (termoc2 -0.5);
var sogliaUp = (termoc2 +0.5);

HeatUnitCamera2 = ''UNCHANGED'';
if(tempc2 <=sogliaDown) {
   HeatUnitCamera2 = true;
}
if(tempc2 >=sogliaUp) {
    HeatUnitCamera2 = false;
}
', true);
INSERT INTO intelligenthome.scripts VALUES (7, 'RegolaTempBagno', 'TempBagno,TermostatoBagno', 'HeatUnitBagno', 'var termob = parseFloat(TermostatoBagno);
var tempb = parseFloat(TempBagno);

var sogliaDown = (termob -0.5);
var sogliaUp = (termob +0.5);

HeatUnitBagno = ''UNCHANGED'';
if(tempb <=sogliaDown) {
   HeatUnitBagno = true;
}
if(tempb >=sogliaUp) {
    HeatUnitBagno = false;
}
', true);
INSERT INTO intelligenthome.scripts VALUES (8, 'RegolaTempSalone', 'TempSalone,TermostatoSalone', 'HeatUnitSalone', 'var termos = parseFloat(TermostatoSalone);
var tems = parseFloat(TempSalone);

var sogliaDown = (termos -0.5);
var sogliaUp = (termos +0.5);

HeatUnitSalone = ''UNCHANGED'';
if(tems <=sogliaDown) {
   HeatUnitSalone = true;
}
if(tems >=sogliaUp) {
    HeatUnitSalone = false;
}
', true);
INSERT INTO intelligenthome.scripts VALUES (9, 'RegolaTempCucina', 'TempCucina,TermostatoCucina', 'HeatUnitCucina', 'var termoc = parseFloat(TermostatoCucina);
var termc = parseFloat(TempCucina);

var sogliaDown = (termoc -0.5);
var sogliaUp = (termoc +0.5);

HeatUnitCucina = ''UNCHANGED'';
if(termc <=sogliaDown) {
   HeatUnitCucina = true;
}
if(termc >=sogliaUp) {
    HeatUnitCucina = false;
}
', true);


--
-- TOC entry 2900 (class 0 OID 65551)
-- Dependencies: 224
-- Data for Name: sensordata; Type: TABLE DATA; Schema: intelligenthome; Owner: postgres
--

INSERT INTO intelligenthome.sensordata VALUES (1, '2020-02-02 11:24:53.978', 'BedroomTemp', '20.7');
INSERT INTO intelligenthome.sensordata VALUES (2, '2020-02-02 11:25:52.677', 'BedroomTemp', '20.7');
INSERT INTO intelligenthome.sensordata VALUES (3, '2020-02-02 11:29:27.596', 'BedroomTemp', '20.7');
INSERT INTO intelligenthome.sensordata VALUES (4, '2020-02-02 11:29:51.745', 'BedroomTemp', '20.7');
INSERT INTO intelligenthome.sensordata VALUES (5, '2020-02-02 11:30:57.175', 'BedroomTemp', '20.7');
INSERT INTO intelligenthome.sensordata VALUES (6, '2020-02-02 11:31:03.127', 'BedroomTemp', '20.9');
INSERT INTO intelligenthome.sensordata VALUES (7, '2020-02-02 11:32:01.155', 'BedroomTemp', '20.9');
INSERT INTO intelligenthome.sensordata VALUES (8, '2020-02-02 11:32:12.575', 'BedroomTemp', '20.9');
INSERT INTO intelligenthome.sensordata VALUES (9, '2020-02-02 11:32:21.439', 'BedroomTemp', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (10, '2020-02-04 11:42:37.7', 'TempSalone', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (11, '2020-02-04 13:24:33.859', 'TempSalone', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (12, '2020-02-04 13:27:49.54', 'TempSalone', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (13, '2020-02-04 13:29:45.907', 'TempSalone', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (14, '2020-02-04 13:29:51.82', 'TempSalone', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (15, '2020-02-04 13:33:39.116', 'TempSalone', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (16, '2020-02-04 13:46:27.07', 'TempSalone', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (17, '2020-02-04 13:59:29.084', 'TempSalone', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (18, '2020-02-04 14:02:23.689', 'TempSalone', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (19, '2020-02-04 14:02:52.667', 'TempSalone', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (20, '2020-02-04 14:03:54.711', 'TempSalone', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (21, '2020-02-05 08:42:12.181', 'TempSalone', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (22, '2020-02-05 08:52:41.373', 'TempSalone', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (23, '2020-02-05 08:52:55.312', 'TempSalone', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (24, '2020-02-05 08:52:57.323', 'TempSalone', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (25, '2020-02-05 08:53:27.023', 'TempSalone', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (26, '2020-02-05 08:53:35.353', 'TempSalone', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (27, '2020-02-05 08:54:45.461', 'TempSalone', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (28, '2020-02-05 08:54:57.417', 'TempSalone', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (29, '2020-02-05 08:55:12.579', 'TempSalone', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (30, '2020-02-05 08:59:02.309', 'TempSalone', '20.4');
INSERT INTO intelligenthome.sensordata VALUES (31, '2020-02-05 08:59:25.36', 'TempSalone', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (32, '2020-02-05 09:01:25.812', 'TempSalone', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (33, '2020-02-05 09:01:47.678', 'TempSalone', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (34, '2020-02-05 09:03:07.109', 'TempSalone', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (35, '2020-02-05 09:04:29.744', 'TempSalone', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (36, '2020-02-05 09:05:09.529', 'TempSalone', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (37, '2020-02-05 09:05:54.128', 'TempSalone', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (38, '2020-02-05 09:08:17.467', 'TempSalone', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (39, '2020-02-05 09:09:08.753', 'TempSalone', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (40, '2020-02-05 09:09:12.699', 'TempSalone', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (41, '2020-02-05 09:10:09.072', 'TempSalone', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (42, '2020-02-05 09:10:11.748', 'TempSalone', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (43, '2020-02-05 09:10:15.203', 'TempSalone', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (44, '2020-02-05 10:28:45.636', 'TempSalone', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (45, '2020-02-07 12:08:52.397', 'TempCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (46, '2020-02-07 12:10:12.859', 'TempCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (47, '2020-02-07 12:11:08.359', 'TempCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (48, '2020-02-07 12:11:31.038', 'TempCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (49, '2020-02-07 12:11:37.503', 'TempCamera1', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (50, '2020-02-07 12:12:20.439', 'TempCamera1', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (51, '2020-02-07 12:13:39.548', 'TempCamera1', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (52, '2020-02-07 12:13:44.903', 'TempCamera1', '18.8');
INSERT INTO intelligenthome.sensordata VALUES (53, '2020-02-07 12:19:50.085', 'TempCamera1', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (54, '2020-02-07 12:23:03.493', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (55, '2020-02-07 12:23:48.756', 'TempCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (56, '2020-02-07 12:27:28.433', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (57, '2020-02-07 12:27:35.263', 'TempCamera1', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (58, '2020-02-07 12:29:07.741', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (59, '2020-02-07 12:31:18.718', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (60, '2020-02-07 12:31:33.59', 'TempCamera1', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (61, '2020-02-07 12:31:50.146', 'TempCamera1', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (62, '2020-02-07 12:32:07.484', 'TempCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (63, '2020-02-07 12:39:18', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (64, '2020-02-07 12:39:34.163', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (65, '2020-02-07 12:39:36.543', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (66, '2020-02-07 12:39:41.005', 'TempCamera1', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (67, '2020-02-07 12:40:23.59', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (68, '2020-02-07 12:40:33.508', 'TempCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (69, '2020-02-07 12:41:42.657', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (70, '2020-02-07 12:41:52.825', 'TempCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (71, '2020-02-07 12:41:56.116', 'TempCamera1', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (72, '2020-02-07 12:45:07.153', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (73, '2020-02-07 12:47:43.191', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (74, '2020-02-07 12:47:50.906', 'TempCamera1', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (75, '2020-02-07 12:47:58.399', 'TempCamera1', '18.8');
INSERT INTO intelligenthome.sensordata VALUES (76, '2020-02-07 12:48:02.496', 'TempCamera1', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (77, '2020-02-07 12:48:12.504', 'TempCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (78, '2020-02-07 12:48:22.506', 'TempCamera1', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (79, '2020-02-07 12:48:46.242', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (80, '2020-02-07 12:48:54.205', 'TempCamera1', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (81, '2020-02-07 12:48:59.583', 'TempCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (82, '2020-02-07 12:49:00.244', 'TempCamera1', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (83, '2020-02-07 12:49:01.247', 'TempCamera1', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (84, '2020-02-07 12:54:25.042', 'TempCamera1', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (85, '2020-02-07 12:54:28.879', 'TempCamera1', '18.8');
INSERT INTO intelligenthome.sensordata VALUES (86, '2020-02-07 12:55:06.232', 'TempCamera1', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (87, '2020-02-07 12:55:07.321', 'TempCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (88, '2020-02-07 12:55:08.239', 'TempCamera1', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (89, '2020-02-07 12:55:09.253', 'TempCamera1', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (90, '2020-02-07 12:55:10.274', 'TempCamera1', '19.3');
INSERT INTO intelligenthome.sensordata VALUES (91, '2020-02-07 12:55:11.258', 'TempCamera1', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (92, '2020-02-07 12:55:12.252', 'TempCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (93, '2020-02-07 12:55:13.275', 'TempCamera1', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (94, '2020-02-07 12:55:14.262', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (95, '2020-02-07 12:55:15.283', 'TempCamera1', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (96, '2020-02-07 12:55:16.266', 'TempCamera1', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (97, '2020-02-07 12:55:17.287', 'TempCamera1', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (98, '2020-02-07 13:04:38.629', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (99, '2020-02-07 13:04:44.418', 'GasCucina', 'True');
INSERT INTO intelligenthome.sensordata VALUES (100, '2020-02-07 13:06:22.325', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (101, '2020-02-07 13:06:26.934', 'GasCucina', 'True');
INSERT INTO intelligenthome.sensordata VALUES (102, '2020-02-07 13:06:29.343', 'GasCucina', 'False');
INSERT INTO intelligenthome.sensordata VALUES (103, '2020-02-07 13:06:33.386', 'GasCucina', 'True');
INSERT INTO intelligenthome.sensordata VALUES (104, '2020-02-07 13:06:34.304', 'GasCucina', 'False');
INSERT INTO intelligenthome.sensordata VALUES (105, '2020-02-07 13:06:49.934', 'GasCucina', 'True');
INSERT INTO intelligenthome.sensordata VALUES (106, '2020-02-07 13:06:50.822', 'GasCucina', 'False');
INSERT INTO intelligenthome.sensordata VALUES (107, '2020-02-07 13:06:58.335', 'GasCucina', 'True');
INSERT INTO intelligenthome.sensordata VALUES (108, '2020-02-07 13:07:01.467', 'GasCucina', 'False');
INSERT INTO intelligenthome.sensordata VALUES (109, '2020-02-07 13:08:03.382', 'GasCucina', 'True');
INSERT INTO intelligenthome.sensordata VALUES (110, '2020-02-07 13:08:05.709', 'GasCucina', 'False');
INSERT INTO intelligenthome.sensordata VALUES (111, '2020-02-07 13:08:20.912', 'GasCucina', 'True');
INSERT INTO intelligenthome.sensordata VALUES (112, '2020-02-07 13:09:18.463', 'GasCucina', 'False');
INSERT INTO intelligenthome.sensordata VALUES (113, '2020-02-07 13:09:34.894', 'GasCucina', 'True');
INSERT INTO intelligenthome.sensordata VALUES (114, '2020-02-07 13:09:46.988', 'GasCucina', 'False');
INSERT INTO intelligenthome.sensordata VALUES (115, '2020-02-07 13:11:56.447', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (116, '2020-02-07 13:12:01.73', 'GasCucina', 'true');
INSERT INTO intelligenthome.sensordata VALUES (117, '2020-02-07 13:12:03.324', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (118, '2020-02-07 13:12:04.634', 'GasCucina', 'true');
INSERT INTO intelligenthome.sensordata VALUES (119, '2020-02-07 13:12:06.683', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (120, '2020-02-07 13:24:23.033', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (121, '2020-02-07 13:24:25.935', 'GasCucina', 'true');
INSERT INTO intelligenthome.sensordata VALUES (122, '2020-02-07 13:25:21.452', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (123, '2020-02-07 13:25:26.702', 'GasCucina', 'true');
INSERT INTO intelligenthome.sensordata VALUES (124, '2020-02-07 13:43:44.621', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (125, '2020-02-07 13:47:50.668', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (126, '2020-02-07 13:50:01.704', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (127, '2020-02-07 13:50:07.223', 'CrepuscolareSalone', '1');
INSERT INTO intelligenthome.sensordata VALUES (128, '2020-02-07 13:50:07.347', 'CrepuscolareSalone', '2');
INSERT INTO intelligenthome.sensordata VALUES (129, '2020-02-07 13:50:07.465', 'CrepuscolareSalone', '3');
INSERT INTO intelligenthome.sensordata VALUES (130, '2020-02-07 13:50:07.585', 'CrepuscolareSalone', '4');
INSERT INTO intelligenthome.sensordata VALUES (131, '2020-02-07 13:50:07.693', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (132, '2020-02-07 13:50:07.821', 'CrepuscolareSalone', '6');
INSERT INTO intelligenthome.sensordata VALUES (133, '2020-02-07 13:50:07.957', 'CrepuscolareSalone', '7');
INSERT INTO intelligenthome.sensordata VALUES (134, '2020-02-07 13:50:08.13', 'CrepuscolareSalone', '8');
INSERT INTO intelligenthome.sensordata VALUES (135, '2020-02-07 13:50:08.354', 'CrepuscolareSalone', '9');
INSERT INTO intelligenthome.sensordata VALUES (136, '2020-02-07 13:50:08.527', 'CrepuscolareSalone', '10');
INSERT INTO intelligenthome.sensordata VALUES (137, '2020-02-07 13:50:08.755', 'CrepuscolareSalone', '11');
INSERT INTO intelligenthome.sensordata VALUES (138, '2020-02-07 13:50:08.936', 'CrepuscolareSalone', '12');
INSERT INTO intelligenthome.sensordata VALUES (139, '2020-02-07 13:50:09.178', 'CrepuscolareSalone', '13');
INSERT INTO intelligenthome.sensordata VALUES (140, '2020-02-07 13:50:09.369', 'CrepuscolareSalone', '14');
INSERT INTO intelligenthome.sensordata VALUES (141, '2020-02-07 13:51:43.478', 'CrepuscolareSalone', '20');
INSERT INTO intelligenthome.sensordata VALUES (142, '2020-02-07 13:51:53.198', 'CrepuscolareSalone', '25');
INSERT INTO intelligenthome.sensordata VALUES (143, '2020-02-07 14:06:35.323', 'CrepuscolareSalone', '20');
INSERT INTO intelligenthome.sensordata VALUES (144, '2020-02-07 14:06:35.812', 'CrepuscolareSalone', '15');
INSERT INTO intelligenthome.sensordata VALUES (145, '2020-02-07 14:09:20.834', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (146, '2020-02-07 14:09:21.104', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (147, '2020-02-07 14:09:25.156', 'CrepuscolareSalone', '4');
INSERT INTO intelligenthome.sensordata VALUES (148, '2020-02-07 14:09:26.518', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (149, '2020-02-07 14:09:28.296', 'CrepuscolareSalone', '4');
INSERT INTO intelligenthome.sensordata VALUES (150, '2020-02-07 14:09:30.031', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (151, '2020-02-07 14:09:30.224', 'CrepuscolareSalone', '6');
INSERT INTO intelligenthome.sensordata VALUES (152, '2020-02-07 14:09:30.431', 'CrepuscolareSalone', '7');
INSERT INTO intelligenthome.sensordata VALUES (153, '2020-02-07 14:09:30.546', 'CrepuscolareSalone', '8');
INSERT INTO intelligenthome.sensordata VALUES (154, '2020-02-07 14:09:31.803', 'CrepuscolareSalone', '7');
INSERT INTO intelligenthome.sensordata VALUES (155, '2020-02-07 14:09:31.917', 'CrepuscolareSalone', '6');
INSERT INTO intelligenthome.sensordata VALUES (156, '2020-02-07 14:09:32.042', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (157, '2020-02-07 14:09:32.298', 'CrepuscolareSalone', '4');
INSERT INTO intelligenthome.sensordata VALUES (158, '2020-02-07 14:09:32.53', 'CrepuscolareSalone', '3');
INSERT INTO intelligenthome.sensordata VALUES (159, '2020-02-10 14:09:21.412', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (160, '2020-02-10 14:09:21.722', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (161, '2020-02-10 14:09:21.872', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (162, '2020-02-10 14:09:26.322', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (163, '2020-02-10 14:15:47.254', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (164, '2020-02-10 14:15:47.368', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (165, '2020-02-10 14:15:47.48', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (166, '2020-02-10 14:16:03.675', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (167, '2020-02-10 14:18:25.598', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (168, '2020-02-10 14:18:25.775', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (169, '2020-02-10 14:18:25.911', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (170, '2020-02-10 14:19:37.199', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (171, '2020-02-10 14:19:37.304', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (172, '2020-02-10 14:19:37.403', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (173, '2020-02-10 14:19:37.497', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (174, '2020-02-10 14:19:47.037', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (175, '2020-02-10 14:24:36.159', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (176, '2020-02-10 14:24:36.367', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (177, '2020-02-10 14:24:36.549', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (178, '2020-02-10 14:24:36.683', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (179, '2020-02-10 14:24:47.514', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (180, '2020-02-10 14:24:54.028', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (181, '2020-02-10 14:27:41.652', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (182, '2020-02-10 14:27:41.767', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (183, '2020-02-10 14:27:41.896', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (184, '2020-02-10 14:27:42.063', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (185, '2020-02-10 14:27:50.648', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (186, '2020-02-10 14:27:57.56', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (187, '2020-02-10 14:28:00.997', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (188, '2020-02-10 14:29:37.505', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (189, '2020-02-10 14:29:37.598', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (190, '2020-02-10 14:29:37.736', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (191, '2020-02-10 14:29:38.029', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (192, '2020-02-10 14:29:58.581', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (193, '2020-02-10 14:30:01.074', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (194, '2020-02-10 14:30:44.477', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (195, '2020-02-10 14:30:46.116', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (196, '2020-02-10 14:32:03.823', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (197, '2020-02-10 14:32:04.059', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (198, '2020-02-10 14:32:04.192', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (199, '2020-02-10 14:32:04.312', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (200, '2020-02-10 14:32:24.172', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (201, '2020-02-10 14:32:46.816', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (202, '2020-02-10 14:33:23.251', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (203, '2020-02-10 14:37:45.217', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (204, '2020-02-10 14:37:45.422', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (205, '2020-02-10 14:37:45.596', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (206, '2020-02-10 14:37:45.792', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (207, '2020-02-10 14:37:49.131', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (208, '2020-02-10 14:42:09.345', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (209, '2020-02-10 14:42:09.518', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (210, '2020-02-10 14:42:09.675', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (211, '2020-02-10 14:42:09.776', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (212, '2020-02-10 14:42:17.247', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (213, '2020-02-10 14:46:19.653', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (214, '2020-02-10 14:46:29.737', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (215, '2020-02-10 14:46:39.751', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (216, '2020-02-10 14:49:06.518', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (217, '2020-02-10 14:49:06.664', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (218, '2020-02-10 14:49:06.814', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (219, '2020-02-10 14:49:06.98', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (220, '2020-02-10 14:49:13.042', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (221, '2020-02-10 14:49:16.433', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (222, '2020-02-10 14:49:20.386', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (223, '2020-02-10 17:31:20.28', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (224, '2020-02-10 17:31:20.616', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (225, '2020-02-10 17:31:20.743', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (226, '2020-02-10 17:31:20.885', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (227, '2020-02-10 17:31:38.621', 'TempCamera1', '18.5');
INSERT INTO intelligenthome.sensordata VALUES (228, '2020-02-10 17:31:39.752', 'TempCamera1', '18.6');
INSERT INTO intelligenthome.sensordata VALUES (229, '2020-02-10 17:31:40.755', 'TempCamera1', '18.7');
INSERT INTO intelligenthome.sensordata VALUES (230, '2020-02-10 17:31:41.772', 'TempCamera1', '18.8');
INSERT INTO intelligenthome.sensordata VALUES (231, '2020-02-10 17:31:42.747', 'TempCamera1', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (232, '2020-02-10 17:31:43.75', 'TempCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (233, '2020-02-10 17:31:44.751', 'TempCamera1', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (234, '2020-02-10 17:31:45.754', 'TempCamera1', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (235, '2020-02-10 17:31:46.742', 'TempCamera1', '19.3');
INSERT INTO intelligenthome.sensordata VALUES (236, '2020-02-10 17:31:47.738', 'TempCamera1', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (237, '2020-02-10 17:31:48.743', 'TempCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (238, '2020-02-10 17:31:49.75', 'TempCamera1', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (239, '2020-02-10 17:31:50.749', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (240, '2020-02-10 17:31:51.759', 'TempCamera1', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (241, '2020-02-10 17:31:52.767', 'TempCamera1', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (242, '2020-02-10 17:31:53.752', 'TempCamera1', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (243, '2020-02-10 17:32:00.321', 'GasCucina', 'true');
INSERT INTO intelligenthome.sensordata VALUES (244, '2020-02-10 17:32:07.07', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (245, '2020-02-10 17:32:10.971', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (246, '2020-02-10 17:32:12.054', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (247, '2020-02-10 17:32:37.961', 'CrepuscolareSalone', '4');
INSERT INTO intelligenthome.sensordata VALUES (248, '2020-02-10 17:32:38.883', 'CrepuscolareSalone', '3');
INSERT INTO intelligenthome.sensordata VALUES (249, '2020-02-10 17:32:39.355', 'CrepuscolareSalone', '2');
INSERT INTO intelligenthome.sensordata VALUES (250, '2020-02-10 17:32:39.852', 'CrepuscolareSalone', '3');
INSERT INTO intelligenthome.sensordata VALUES (251, '2020-02-10 17:32:40.077', 'CrepuscolareSalone', '4');
INSERT INTO intelligenthome.sensordata VALUES (252, '2020-02-10 17:32:40.424', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (253, '2020-02-10 17:32:40.773', 'CrepuscolareSalone', '6');
INSERT INTO intelligenthome.sensordata VALUES (254, '2020-02-10 17:35:05.775', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (255, '2020-02-10 17:35:05.872', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (256, '2020-02-10 17:35:05.958', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (257, '2020-02-10 17:35:06.02', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (258, '2020-02-10 17:35:08.312', 'TermostatoCamera1', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (259, '2020-02-10 17:35:20.794', 'TermostatoCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (260, '2020-02-10 17:35:21.273', 'TermostatoCamera1', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (261, '2020-02-10 17:35:21.819', 'TermostatoCamera1', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (262, '2020-02-10 17:35:22.824', 'TermostatoCamera1', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (263, '2020-02-10 17:35:23.767', 'TermostatoCamera1', '20.1');
INSERT INTO intelligenthome.sensordata VALUES (264, '2020-02-10 17:35:24.8', 'TermostatoCamera1', '20.2');
INSERT INTO intelligenthome.sensordata VALUES (265, '2020-02-10 17:35:25.605', 'TermostatoCamera1', '20.3');
INSERT INTO intelligenthome.sensordata VALUES (266, '2020-02-10 17:35:26.318', 'TermostatoCamera1', '20.4');
INSERT INTO intelligenthome.sensordata VALUES (267, '2020-02-10 17:35:27.012', 'TermostatoCamera1', '20.5');
INSERT INTO intelligenthome.sensordata VALUES (268, '2020-02-10 17:35:27.185', 'TempCamera1', '21.1');
INSERT INTO intelligenthome.sensordata VALUES (269, '2020-02-10 17:35:28.172', 'TempCamera1', '21.2');
INSERT INTO intelligenthome.sensordata VALUES (270, '2020-02-10 17:35:40.415', 'GasCucina', 'true');
INSERT INTO intelligenthome.sensordata VALUES (271, '2020-02-10 17:36:02.854', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (272, '2020-02-10 17:36:04.513', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (273, '2020-02-10 17:36:12.888', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (274, '2020-02-10 17:58:26.74', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (275, '2020-02-10 17:58:37.672', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (276, '2020-02-16 17:47:57.931', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (277, '2020-02-16 17:47:58.189', 'TermostatoCamera2', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (278, '2020-02-16 17:47:58.356', 'TermostatoBagno', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (279, '2020-02-16 17:47:58.46', 'TermostatoCucina', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (280, '2020-02-16 17:47:58.591', 'TermostatoSalone', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (281, '2020-02-16 17:47:58.716', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (282, '2020-02-16 17:47:58.835', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (283, '2020-02-16 17:47:59.054', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (284, '2020-02-16 17:47:59.298', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (285, '2020-02-16 17:47:59.633', 'TempSalone', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (286, '2020-02-16 17:48:00.464', 'TempSalone', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (287, '2020-02-16 17:48:01.552', 'TempSalone', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (288, '2020-02-16 17:48:02.483', 'TempSalone', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (289, '2020-02-16 17:48:03.446', 'TempSalone', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (290, '2020-02-16 17:48:04.513', 'TempSalone', '20.1');
INSERT INTO intelligenthome.sensordata VALUES (291, '2020-02-16 17:48:05.475', 'TempSalone', '20.2');
INSERT INTO intelligenthome.sensordata VALUES (292, '2020-02-16 17:48:06.461', 'TempSalone', '20.3');
INSERT INTO intelligenthome.sensordata VALUES (293, '2020-02-16 17:48:07.503', 'TempSalone', '20.4');
INSERT INTO intelligenthome.sensordata VALUES (294, '2020-02-16 17:48:08.447', 'TempSalone', '20.5');
INSERT INTO intelligenthome.sensordata VALUES (295, '2020-02-16 17:48:09.487', 'TempSalone', '20.6');
INSERT INTO intelligenthome.sensordata VALUES (296, '2020-02-16 17:48:10.453', 'TempSalone', '20.7');
INSERT INTO intelligenthome.sensordata VALUES (297, '2020-02-16 17:48:11.434', 'TempSalone', '20.8');
INSERT INTO intelligenthome.sensordata VALUES (298, '2020-02-16 17:48:12.519', 'TempSalone', '20.9');
INSERT INTO intelligenthome.sensordata VALUES (299, '2020-02-16 17:48:13.473', 'TempSalone', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (300, '2020-02-16 17:48:14.457', 'TempSalone', '21.1');
INSERT INTO intelligenthome.sensordata VALUES (301, '2020-02-16 17:48:15.456', 'TempSalone', '21.2');
INSERT INTO intelligenthome.sensordata VALUES (302, '2020-02-16 17:48:16.566', 'TempSalone', '21.3');
INSERT INTO intelligenthome.sensordata VALUES (303, '2020-02-16 17:48:17.454', 'TempSalone', '21.4');
INSERT INTO intelligenthome.sensordata VALUES (304, '2020-02-16 17:48:18.458', 'TempSalone', '21.5');
INSERT INTO intelligenthome.sensordata VALUES (305, '2020-02-16 17:48:19.464', 'TempSalone', '21.6');
INSERT INTO intelligenthome.sensordata VALUES (306, '2020-02-16 17:49:17.884', 'TermostatoCamera1', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (307, '2020-02-16 17:49:17.978', 'TermostatoCamera1', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (308, '2020-02-16 17:49:18.139', 'TermostatoCamera1', '19.3');
INSERT INTO intelligenthome.sensordata VALUES (309, '2020-02-16 17:49:18.256', 'TermostatoCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (310, '2020-02-16 17:49:18.536', 'TermostatoCamera1', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (311, '2020-02-16 17:49:18.701', 'TermostatoCamera1', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (312, '2020-02-16 17:49:19.085', 'TermostatoCamera1', '18.8');
INSERT INTO intelligenthome.sensordata VALUES (313, '2020-02-16 17:49:19.294', 'TermostatoCamera1', '18.6');
INSERT INTO intelligenthome.sensordata VALUES (314, '2020-02-16 17:49:19.494', 'TermostatoCamera1', '18.7');
INSERT INTO intelligenthome.sensordata VALUES (315, '2020-02-16 17:49:19.852', 'TermostatoCamera1', '18.5');
INSERT INTO intelligenthome.sensordata VALUES (316, '2020-02-16 17:51:47.764', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (317, '2020-02-16 17:52:00.736', 'GasCucina', 'true');
INSERT INTO intelligenthome.sensordata VALUES (318, '2020-02-16 17:52:03.51', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (319, '2020-02-16 17:52:06.443', 'TempCamera1', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (320, '2020-02-16 17:54:25.249', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (321, '2020-02-16 17:54:25.42', 'TermostatoCamera2', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (322, '2020-02-16 17:54:25.536', 'TermostatoBagno', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (323, '2020-02-16 17:54:25.639', 'TermostatoCucina', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (324, '2020-02-16 17:54:25.748', 'TermostatoSalone', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (325, '2020-02-16 17:54:25.838', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (326, '2020-02-16 17:54:25.926', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (327, '2020-02-16 17:54:26.043', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (328, '2020-02-16 17:54:26.221', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (329, '2020-02-16 17:55:31.828', 'CrepuscolareSalone', '4');
INSERT INTO intelligenthome.sensordata VALUES (330, '2020-02-16 17:55:33.108', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (331, '2020-02-16 17:55:40.881', 'TempCamera1', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (332, '2020-02-16 17:58:30.942', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (333, '2020-02-16 17:58:31.093', 'TermostatoCamera2', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (334, '2020-02-16 17:58:31.193', 'TermostatoBagno', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (335, '2020-02-16 17:58:31.295', 'TermostatoCucina', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (336, '2020-02-16 17:58:31.424', 'TermostatoSalone', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (337, '2020-02-16 17:58:31.565', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (338, '2020-02-16 17:58:31.68', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (339, '2020-02-16 17:58:31.758', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (340, '2020-02-16 17:58:31.897', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (341, '2020-02-16 18:02:05.531', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (342, '2020-02-16 18:02:05.685', 'TermostatoCamera2', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (343, '2020-02-16 18:02:05.771', 'TermostatoBagno', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (344, '2020-02-16 18:02:05.853', 'TermostatoCucina', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (345, '2020-02-16 18:02:05.96', 'TermostatoSalone', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (346, '2020-02-16 18:02:06.063', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (347, '2020-02-16 18:02:06.197', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (348, '2020-02-16 18:02:06.284', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (349, '2020-02-16 18:02:06.506', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (350, '2020-02-16 18:02:14.276', 'CrepuscolareSalone', '4');
INSERT INTO intelligenthome.sensordata VALUES (351, '2020-02-16 18:02:14.991', 'CrepuscolareSalone', '3');
INSERT INTO intelligenthome.sensordata VALUES (352, '2020-02-16 18:02:15.666', 'CrepuscolareSalone', '4');
INSERT INTO intelligenthome.sensordata VALUES (353, '2020-02-16 18:02:15.959', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (354, '2020-02-16 18:02:16.683', 'CrepuscolareSalone', '6');
INSERT INTO intelligenthome.sensordata VALUES (355, '2020-02-16 18:02:17.015', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (356, '2020-02-16 18:02:20.725', 'TempCamera1', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (357, '2020-02-16 18:02:48.546', 'TempCamera1', '18.0');
INSERT INTO intelligenthome.sensordata VALUES (358, '2020-02-16 18:02:49.314', 'TempCamera1', '18.1');
INSERT INTO intelligenthome.sensordata VALUES (359, '2020-02-16 18:02:50.331', 'TempCamera1', '18.2');
INSERT INTO intelligenthome.sensordata VALUES (360, '2020-02-16 18:02:51.33', 'TempCamera1', '18.3');
INSERT INTO intelligenthome.sensordata VALUES (361, '2020-02-16 18:02:52.368', 'TempCamera1', '18.4');
INSERT INTO intelligenthome.sensordata VALUES (362, '2020-02-16 18:02:53.359', 'TempCamera1', '18.5');
INSERT INTO intelligenthome.sensordata VALUES (363, '2020-02-16 18:02:54.35', 'TempCamera1', '18.6');
INSERT INTO intelligenthome.sensordata VALUES (364, '2020-02-16 18:02:55.015', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (365, '2020-02-16 18:02:55.394', 'TempCamera1', '18.7');
INSERT INTO intelligenthome.sensordata VALUES (366, '2020-02-16 18:02:55.719', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (367, '2020-02-16 18:02:56.368', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (368, '2020-02-16 18:02:56.48', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (369, '2020-02-16 18:02:57.311', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (370, '2020-02-16 18:02:57.374', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (371, '2020-02-16 18:02:58.305', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (372, '2020-02-16 18:02:58.371', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (373, '2020-02-16 18:02:59.294', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (374, '2020-02-16 18:02:59.364', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (375, '2020-02-16 18:03:00.308', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (376, '2020-02-16 18:03:00.378', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (377, '2020-02-16 18:03:01.344', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (378, '2020-02-16 18:03:01.428', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (379, '2020-02-16 18:03:02.343', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (380, '2020-02-16 18:03:02.415', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (381, '2020-02-16 18:03:03.289', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (382, '2020-02-16 18:03:03.348', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (383, '2020-02-16 18:03:04.307', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (384, '2020-02-16 18:03:04.365', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (385, '2020-02-16 18:03:05.3', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (386, '2020-02-16 18:03:05.374', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (387, '2020-02-16 18:03:06.312', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (388, '2020-02-16 18:03:06.369', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (389, '2020-02-16 18:03:07.318', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (390, '2020-02-16 18:03:07.378', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (391, '2020-02-16 18:03:08.307', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (392, '2020-02-16 18:03:08.367', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (393, '2020-02-16 18:03:09.303', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (394, '2020-02-16 18:03:09.369', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (395, '2020-02-16 18:03:10.3', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (396, '2020-02-16 18:03:10.374', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (397, '2020-02-16 18:03:11.293', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (398, '2020-02-16 18:03:11.359', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (399, '2020-02-16 18:03:12.302', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (400, '2020-02-16 18:03:12.369', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (401, '2020-02-16 18:03:13.301', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (402, '2020-02-16 18:03:13.373', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (403, '2020-02-16 18:03:14.297', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (404, '2020-02-16 18:03:14.361', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (405, '2020-02-16 18:03:15.296', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (406, '2020-02-16 18:03:15.355', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (407, '2020-02-16 18:03:16.292', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (408, '2020-02-16 18:03:16.354', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (409, '2020-02-16 18:03:17.302', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (410, '2020-02-16 18:03:17.363', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (411, '2020-02-16 18:03:18.297', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (412, '2020-02-16 18:03:18.357', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (413, '2020-02-16 18:04:03.64', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (414, '2020-02-16 18:04:10.814', 'TempBagno', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (415, '2020-02-16 18:04:11.022', 'TempBagno', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (416, '2020-02-16 18:04:11.988', 'TempBagno', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (417, '2020-02-16 18:04:13.005', 'TempBagno', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (418, '2020-02-16 18:04:13.986', 'TempBagno', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (419, '2020-02-16 18:04:14.988', 'TempBagno', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (420, '2020-02-16 18:04:15.985', 'TempBagno', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (421, '2020-02-16 18:04:16.994', 'TempBagno', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (422, '2020-02-16 18:04:17.981', 'TempBagno', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (423, '2020-02-16 18:04:18.986', 'TempBagno', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (424, '2020-02-16 18:04:19.992', 'TempBagno', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (425, '2020-02-16 18:04:20.992', 'TempBagno', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (426, '2020-02-16 18:04:21.991', 'TempBagno', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (427, '2020-02-16 18:04:22.996', 'TempBagno', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (428, '2020-02-16 18:05:05.205', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (429, '2020-02-16 18:05:05.76', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (430, '2020-02-16 18:05:06.781', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (431, '2020-02-16 18:05:07.773', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (432, '2020-02-16 18:05:08.763', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (433, '2020-02-16 18:05:09.768', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (434, '2020-02-16 18:05:10.768', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (435, '2020-02-16 18:05:11.785', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (436, '2020-02-16 18:07:26.614', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (437, '2020-02-16 18:07:29.224', 'TempBagno', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (438, '2020-02-16 18:07:30.291', 'TempBagno', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (439, '2020-02-16 18:07:31.206', 'TempBagno', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (440, '2020-02-16 18:07:32.202', 'TempBagno', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (441, '2020-02-16 18:07:33.205', 'TempBagno', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (442, '2020-02-16 18:07:34.263', 'TempBagno', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (443, '2020-02-16 18:07:35.213', 'TempBagno', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (444, '2020-02-16 18:07:36.253', 'TempBagno', '20.1');
INSERT INTO intelligenthome.sensordata VALUES (445, '2020-02-16 18:07:36.783', 'TempCamera1', '18.0');
INSERT INTO intelligenthome.sensordata VALUES (446, '2020-02-16 18:07:37.276', 'TempCamera1', '18.1');
INSERT INTO intelligenthome.sensordata VALUES (447, '2020-02-16 18:07:37.456', 'TempBagno', '20.2');
INSERT INTO intelligenthome.sensordata VALUES (448, '2020-02-16 18:07:38.207', 'TempCamera1', '18.2');
INSERT INTO intelligenthome.sensordata VALUES (449, '2020-02-16 18:07:38.4', 'TempBagno', '20.3');
INSERT INTO intelligenthome.sensordata VALUES (450, '2020-02-16 18:07:39.259', 'TempCamera1', '18.3');
INSERT INTO intelligenthome.sensordata VALUES (451, '2020-02-16 18:07:39.579', 'TempBagno', '20.4');
INSERT INTO intelligenthome.sensordata VALUES (452, '2020-02-16 18:07:40.232', 'TempCamera1', '18.4');
INSERT INTO intelligenthome.sensordata VALUES (453, '2020-02-16 18:07:40.667', 'TempBagno', '20.5');
INSERT INTO intelligenthome.sensordata VALUES (454, '2020-02-16 18:07:41.21', 'TempCamera1', '18.5');
INSERT INTO intelligenthome.sensordata VALUES (455, '2020-02-16 18:07:41.457', 'TempBagno', '20.6');
INSERT INTO intelligenthome.sensordata VALUES (456, '2020-02-16 18:07:42.201', 'TempCamera1', '18.6');
INSERT INTO intelligenthome.sensordata VALUES (457, '2020-02-16 18:07:42.322', 'TempBagno', '20.7');
INSERT INTO intelligenthome.sensordata VALUES (458, '2020-02-16 18:07:43.281', 'TempCamera1', '18.7');
INSERT INTO intelligenthome.sensordata VALUES (459, '2020-02-16 18:07:43.455', 'TempBagno', '20.8');
INSERT INTO intelligenthome.sensordata VALUES (460, '2020-02-16 18:07:44.22', 'TempCamera1', '18.8');
INSERT INTO intelligenthome.sensordata VALUES (461, '2020-02-16 18:07:44.405', 'TempBagno', '20.9');
INSERT INTO intelligenthome.sensordata VALUES (462, '2020-02-16 18:07:45.3', 'TempCamera1', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (463, '2020-02-16 18:07:45.435', 'TempBagno', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (464, '2020-02-16 18:07:46.303', 'TempCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (465, '2020-02-16 18:07:46.485', 'TempBagno', '21.1');
INSERT INTO intelligenthome.sensordata VALUES (466, '2020-02-16 18:07:47.203', 'TempCamera1', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (467, '2020-02-16 18:07:47.396', 'TempBagno', '21.2');
INSERT INTO intelligenthome.sensordata VALUES (468, '2020-02-16 18:07:48.215', 'TempCamera1', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (469, '2020-02-16 18:07:48.337', 'TempBagno', '21.3');
INSERT INTO intelligenthome.sensordata VALUES (470, '2020-02-16 18:07:48.735', 'GasCucina', 'true');
INSERT INTO intelligenthome.sensordata VALUES (471, '2020-02-16 18:07:49.264', 'TempCamera1', '19.3');
INSERT INTO intelligenthome.sensordata VALUES (472, '2020-02-16 18:07:49.47', 'TempBagno', '21.4');
INSERT INTO intelligenthome.sensordata VALUES (473, '2020-02-16 18:07:50.206', 'TempCamera1', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (474, '2020-02-16 18:07:50.36', 'TempBagno', '21.5');
INSERT INTO intelligenthome.sensordata VALUES (475, '2020-02-16 18:07:51.225', 'TempCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (476, '2020-02-16 18:07:52.312', 'TempCamera1', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (477, '2020-02-16 18:07:53.228', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (478, '2020-02-16 18:07:54.253', 'TempCamera1', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (479, '2020-02-16 18:07:55.204', 'TempCamera1', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (480, '2020-02-16 18:07:56.211', 'TempCamera1', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (481, '2020-02-16 18:08:03.166', 'TempCamera2', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (482, '2020-02-16 18:08:04.235', 'TempCamera2', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (483, '2020-02-16 18:08:05.24', 'TempCamera2', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (484, '2020-02-16 18:08:06.31', 'TempCamera2', '19.3');
INSERT INTO intelligenthome.sensordata VALUES (485, '2020-02-16 18:08:07.298', 'TempCamera2', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (486, '2020-02-16 18:08:08.292', 'TempCamera2', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (487, '2020-02-16 18:08:09.288', 'TempCamera2', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (488, '2020-02-16 18:08:10.239', 'TempCamera2', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (489, '2020-02-16 18:08:11.298', 'TempCamera2', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (490, '2020-02-16 18:08:12.229', 'TempCamera2', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (491, '2020-02-16 18:08:13.214', 'TempCamera2', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (492, '2020-02-16 18:08:17.989', 'TempCucina', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (493, '2020-02-16 18:08:18.253', 'TempCucina', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (494, '2020-02-16 18:08:19.2', 'TempCucina', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (495, '2020-02-16 18:08:20.21', 'TempCucina', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (496, '2020-02-16 18:08:21.217', 'TempCucina', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (497, '2020-02-16 18:08:22.183', 'TempCucina', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (498, '2020-02-16 18:08:23.186', 'TempCucina', '20.1');
INSERT INTO intelligenthome.sensordata VALUES (499, '2020-02-16 18:08:24.196', 'TempCucina', '20.2');
INSERT INTO intelligenthome.sensordata VALUES (500, '2020-02-16 18:08:25.196', 'TempCucina', '20.3');
INSERT INTO intelligenthome.sensordata VALUES (501, '2020-02-16 18:08:26.217', 'TempCucina', '20.4');
INSERT INTO intelligenthome.sensordata VALUES (502, '2020-02-16 18:08:27.21', 'TempCucina', '20.5');
INSERT INTO intelligenthome.sensordata VALUES (503, '2020-02-16 18:08:36.441', 'TempSalone', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (504, '2020-02-16 18:08:37.198', 'TempSalone', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (505, '2020-02-16 18:08:38.219', 'TempSalone', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (506, '2020-02-16 18:08:39.236', 'TempSalone', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (507, '2020-02-16 18:08:40.199', 'TempSalone', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (508, '2020-02-16 18:08:41.202', 'TempSalone', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (509, '2020-02-16 18:08:42.187', 'TempSalone', '20.1');
INSERT INTO intelligenthome.sensordata VALUES (510, '2020-02-16 18:08:43.188', 'TempSalone', '20.2');
INSERT INTO intelligenthome.sensordata VALUES (511, '2020-02-16 18:08:44.204', 'TempSalone', '20.3');
INSERT INTO intelligenthome.sensordata VALUES (512, '2020-02-16 18:08:45.195', 'TempSalone', '20.4');
INSERT INTO intelligenthome.sensordata VALUES (513, '2020-02-16 18:08:46.193', 'TempSalone', '20.5');
INSERT INTO intelligenthome.sensordata VALUES (514, '2020-02-16 18:08:47.202', 'TempSalone', '20.6');
INSERT INTO intelligenthome.sensordata VALUES (515, '2020-02-16 18:08:48.218', 'TempSalone', '20.7');
INSERT INTO intelligenthome.sensordata VALUES (516, '2020-02-16 18:08:49.203', 'TempSalone', '20.8');
INSERT INTO intelligenthome.sensordata VALUES (517, '2020-02-16 18:08:50.192', 'TempSalone', '20.9');
INSERT INTO intelligenthome.sensordata VALUES (518, '2020-02-16 18:08:51.295', 'TempSalone', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (519, '2020-02-16 18:08:52.194', 'TempSalone', '21.1');
INSERT INTO intelligenthome.sensordata VALUES (520, '2020-02-16 18:08:53.201', 'TempSalone', '21.2');
INSERT INTO intelligenthome.sensordata VALUES (521, '2020-02-16 18:08:54.24', 'TempSalone', '21.3');
INSERT INTO intelligenthome.sensordata VALUES (522, '2020-02-16 18:08:55.273', 'TempSalone', '21.4');
INSERT INTO intelligenthome.sensordata VALUES (523, '2020-02-16 18:08:56.197', 'TempSalone', '21.5');
INSERT INTO intelligenthome.sensordata VALUES (524, '2020-02-16 18:09:00.238', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (525, '2020-02-16 18:09:26.836', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (526, '2020-02-16 18:11:10.666', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (527, '2020-02-16 18:11:10.806', 'TermostatoCamera2', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (528, '2020-02-16 18:11:10.917', 'TermostatoBagno', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (529, '2020-02-16 18:11:11.002', 'TermostatoCucina', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (530, '2020-02-16 18:11:11.123', 'TermostatoSalone', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (531, '2020-02-16 18:11:11.215', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (532, '2020-02-16 18:11:11.341', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (533, '2020-02-16 18:11:11.473', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (534, '2020-02-16 18:11:11.664', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (535, '2020-02-16 18:11:20.452', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (536, '2020-02-16 18:14:37.173', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (537, '2020-02-16 18:14:54.894', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (538, '2020-02-16 18:15:06.053', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (539, '2020-02-16 18:15:28.698', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (540, '2020-02-16 18:16:21.457', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (541, '2020-02-16 18:16:24.662', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (542, '2020-02-16 18:17:21.024', 'TempCamera1', '18.0');
INSERT INTO intelligenthome.sensordata VALUES (543, '2020-02-16 18:17:21.732', 'TempBagno', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (544, '2020-02-16 18:17:21.903', 'TempCamera1', '18.1');
INSERT INTO intelligenthome.sensordata VALUES (545, '2020-02-16 18:17:22.288', 'TempCamera2', '18.7');
INSERT INTO intelligenthome.sensordata VALUES (546, '2020-02-16 18:17:22.816', 'TempCamera1', '18.2');
INSERT INTO intelligenthome.sensordata VALUES (547, '2020-02-16 18:17:23.001', 'TempBagno', '20.1');
INSERT INTO intelligenthome.sensordata VALUES (548, '2020-02-16 18:17:23.179', 'TempCucina', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (549, '2020-02-16 18:17:23.8', 'TempSalone', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (550, '2020-02-16 18:17:24.001', 'TempCamera1', '18.3');
INSERT INTO intelligenthome.sensordata VALUES (551, '2020-02-16 18:17:24.315', 'TempCamera2', '18.8');
INSERT INTO intelligenthome.sensordata VALUES (552, '2020-02-16 18:17:24.52', 'TempBagno', '20.2');
INSERT INTO intelligenthome.sensordata VALUES (553, '2020-02-16 18:17:24.693', 'TempCucina', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (554, '2020-02-16 18:17:24.893', 'TempCamera1', '18.4');
INSERT INTO intelligenthome.sensordata VALUES (555, '2020-02-16 18:17:25.332', 'TempCamera2', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (556, '2020-02-16 18:17:25.753', 'TempBagno', '20.3');
INSERT INTO intelligenthome.sensordata VALUES (557, '2020-02-16 18:17:25.995', 'TempCucina', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (558, '2020-02-16 18:17:26.153', 'TempSalone', '20.1');
INSERT INTO intelligenthome.sensordata VALUES (559, '2020-02-16 18:17:26.349', 'TempCamera1', '18.5');
INSERT INTO intelligenthome.sensordata VALUES (560, '2020-02-16 18:17:26.523', 'TempCamera2', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (561, '2020-02-16 18:17:26.826', 'TempBagno', '20.4');
INSERT INTO intelligenthome.sensordata VALUES (562, '2020-02-16 18:17:27.009', 'TempSalone', '20.2');
INSERT INTO intelligenthome.sensordata VALUES (563, '2020-02-16 18:17:27.483', 'TempCucina', '19.3');
INSERT INTO intelligenthome.sensordata VALUES (564, '2020-02-16 18:17:27.912', 'TempCamera1', '18.6');
INSERT INTO intelligenthome.sensordata VALUES (565, '2020-02-16 18:17:28.175', 'TempCucina', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (566, '2020-02-16 18:17:28.469', 'TempSalone', '20.3');
INSERT INTO intelligenthome.sensordata VALUES (567, '2020-02-16 18:17:28.861', 'TempBagno', '20.5');
INSERT INTO intelligenthome.sensordata VALUES (568, '2020-02-16 18:17:29.132', 'TempCamera2', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (569, '2020-02-16 18:17:29.511', 'TempCamera1', '18.7');
INSERT INTO intelligenthome.sensordata VALUES (570, '2020-02-16 18:17:29.738', 'TempSalone', '20.4');
INSERT INTO intelligenthome.sensordata VALUES (571, '2020-02-16 18:17:29.92', 'TempBagno', '20.6');
INSERT INTO intelligenthome.sensordata VALUES (572, '2020-02-16 18:17:30.286', 'TempCamera2', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (573, '2020-02-16 18:17:30.503', 'TempCamera1', '18.8');
INSERT INTO intelligenthome.sensordata VALUES (574, '2020-02-16 18:17:30.709', 'TempCamera2', '19.3');
INSERT INTO intelligenthome.sensordata VALUES (575, '2020-02-16 18:17:30.887', 'TempCucina', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (576, '2020-02-16 18:32:16.622', 'TempCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (577, '2020-02-16 18:32:17.059', 'TempBagno', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (578, '2020-02-16 18:32:17.846', 'TempCamera2', '18.5');
INSERT INTO intelligenthome.sensordata VALUES (579, '2020-02-16 18:32:18.471', 'TempCucina', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (580, '2020-02-16 18:32:19.654', 'TempSalone', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (581, '2020-02-16 18:32:20.231', 'TempCamera1', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (582, '2020-02-16 18:32:20.427', 'TempBagno', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (583, '2020-02-16 18:32:20.59', 'TempSalone', '20.1');
INSERT INTO intelligenthome.sensordata VALUES (584, '2020-02-16 18:32:20.962', 'TempCucina', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (585, '2020-02-16 18:32:22.56', 'TempCamera2', '18.5');
INSERT INTO intelligenthome.sensordata VALUES (586, '2020-02-16 18:32:23.252', 'TempCamera1', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (587, '2020-02-16 18:32:23.388', 'TempCucina', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (588, '2020-02-16 18:32:23.535', 'TempSalone', '20.2');
INSERT INTO intelligenthome.sensordata VALUES (589, '2020-02-16 18:32:23.84', 'TempBagno', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (590, '2020-02-16 18:32:24.577', 'TempCamera2', '18.4');
INSERT INTO intelligenthome.sensordata VALUES (591, '2020-02-16 18:32:26.256', 'TempCamera1', '19.3');
INSERT INTO intelligenthome.sensordata VALUES (592, '2020-02-16 18:32:26.403', 'TempCucina', '19.3');
INSERT INTO intelligenthome.sensordata VALUES (593, '2020-02-16 18:32:26.617', 'TempBagno', '20.1');
INSERT INTO intelligenthome.sensordata VALUES (594, '2020-02-16 18:32:26.851', 'TempCamera2', '18.5');
INSERT INTO intelligenthome.sensordata VALUES (595, '2020-02-16 18:32:27.097', 'TempSalone', '20.3');
INSERT INTO intelligenthome.sensordata VALUES (596, '2020-02-16 18:32:29.244', 'TempCamera1', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (597, '2020-02-16 18:32:29.406', 'TempSalone', '20.4');
INSERT INTO intelligenthome.sensordata VALUES (598, '2020-02-16 18:32:29.619', 'TempBagno', '20.2');
INSERT INTO intelligenthome.sensordata VALUES (599, '2020-02-16 18:32:29.851', 'TempCucina', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (600, '2020-02-16 18:32:30.072', 'TempCamera2', '18.6');
INSERT INTO intelligenthome.sensordata VALUES (601, '2020-02-16 18:32:32.236', 'TempCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (602, '2020-02-16 18:32:32.365', 'TempSalone', '20.5');
INSERT INTO intelligenthome.sensordata VALUES (603, '2020-02-16 18:32:32.521', 'TempCucina', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (604, '2020-02-16 18:32:32.734', 'TempBagno', '20.3');
INSERT INTO intelligenthome.sensordata VALUES (605, '2020-02-16 18:32:32.967', 'TempCamera2', '18.7');
INSERT INTO intelligenthome.sensordata VALUES (606, '2020-02-16 18:32:35.232', 'TempCamera1', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (607, '2020-02-16 18:32:35.345', 'TempBagno', '20.4');
INSERT INTO intelligenthome.sensordata VALUES (608, '2020-02-16 18:32:35.472', 'TempSalone', '20.6');
INSERT INTO intelligenthome.sensordata VALUES (609, '2020-02-16 18:32:35.61', 'TempCucina', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (610, '2020-02-16 18:32:35.89', 'TempCamera2', '18.8');
INSERT INTO intelligenthome.sensordata VALUES (611, '2020-02-16 18:32:38.258', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (612, '2020-02-16 18:32:38.371', 'TempSalone', '20.7');
INSERT INTO intelligenthome.sensordata VALUES (613, '2020-02-16 18:32:38.504', 'TempCucina', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (614, '2020-02-16 18:32:38.726', 'TempBagno', '20.5');
INSERT INTO intelligenthome.sensordata VALUES (615, '2020-02-16 18:32:38.997', 'TempCamera2', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (616, '2020-02-16 18:32:41.228', 'TempCamera1', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (617, '2020-02-16 18:32:41.396', 'TempCucina', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (618, '2020-02-16 18:32:41.617', 'TempBagno', '20.6');
INSERT INTO intelligenthome.sensordata VALUES (619, '2020-02-16 18:32:41.893', 'TempCamera2', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (620, '2020-02-16 18:32:42.089', 'TempSalone', '20.8');
INSERT INTO intelligenthome.sensordata VALUES (621, '2020-02-16 18:32:44.222', 'TempCamera1', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (622, '2020-02-16 18:32:44.37', 'TempSalone', '20.9');
INSERT INTO intelligenthome.sensordata VALUES (623, '2020-02-16 18:32:44.659', 'TempCucina', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (624, '2020-02-16 18:32:44.889', 'TempBagno', '20.7');
INSERT INTO intelligenthome.sensordata VALUES (625, '2020-02-16 18:32:45.068', 'TempCamera2', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (626, '2020-02-16 18:32:47.245', 'TempCamera1', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (627, '2020-02-16 18:32:47.414', 'TempCucina', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (628, '2020-02-16 18:32:47.672', 'TempBagno', '20.8');
INSERT INTO intelligenthome.sensordata VALUES (629, '2020-02-16 18:32:48.061', 'TempCamera2', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (630, '2020-02-16 18:32:48.237', 'TempSalone', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (631, '2020-02-16 18:32:50.222', 'TempCamera2', '19.3');
INSERT INTO intelligenthome.sensordata VALUES (632, '2020-02-16 18:32:50.351', 'TempSalone', '21.1');
INSERT INTO intelligenthome.sensordata VALUES (633, '2020-02-16 18:32:50.494', 'TempCucina', '20.1');
INSERT INTO intelligenthome.sensordata VALUES (634, '2020-02-16 18:32:50.782', 'TempBagno', '20.9');
INSERT INTO intelligenthome.sensordata VALUES (635, '2020-02-16 18:32:53.212', 'TempCamera2', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (636, '2020-02-16 18:32:53.379', 'TempSalone', '21.2');
INSERT INTO intelligenthome.sensordata VALUES (637, '2020-02-16 18:32:53.513', 'TempCucina', '20.2');
INSERT INTO intelligenthome.sensordata VALUES (638, '2020-02-16 18:32:53.763', 'TempBagno', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (639, '2020-02-16 18:32:56.213', 'TempCamera2', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (640, '2020-02-16 18:32:56.35', 'TempSalone', '21.3');
INSERT INTO intelligenthome.sensordata VALUES (641, '2020-02-16 18:32:56.501', 'TempCucina', '20.3');
INSERT INTO intelligenthome.sensordata VALUES (642, '2020-02-16 18:32:56.67', 'TempBagno', '21.1');
INSERT INTO intelligenthome.sensordata VALUES (643, '2020-02-16 18:32:59.211', 'TempCamera2', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (644, '2020-02-16 18:32:59.404', 'TempSalone', '21.4');
INSERT INTO intelligenthome.sensordata VALUES (645, '2020-02-16 18:32:59.552', 'TempCucina', '20.4');
INSERT INTO intelligenthome.sensordata VALUES (646, '2020-02-16 18:32:59.781', 'TempBagno', '21.2');
INSERT INTO intelligenthome.sensordata VALUES (647, '2020-02-16 18:33:02.211', 'TempCamera2', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (648, '2020-02-16 18:33:02.427', 'TempSalone', '21.5');
INSERT INTO intelligenthome.sensordata VALUES (649, '2020-02-16 18:33:02.689', 'TempCucina', '20.5');
INSERT INTO intelligenthome.sensordata VALUES (650, '2020-02-16 18:33:02.93', 'TempBagno', '21.3');
INSERT INTO intelligenthome.sensordata VALUES (651, '2020-02-16 18:33:05.246', 'TempCamera2', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (652, '2020-02-16 18:33:05.375', 'TempSalone', '21.6');
INSERT INTO intelligenthome.sensordata VALUES (653, '2020-02-16 18:33:05.631', 'TempBagno', '21.4');
INSERT INTO intelligenthome.sensordata VALUES (654, '2020-02-16 18:33:08.19', 'TempCamera2', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (655, '2020-02-16 18:33:08.328', 'TempBagno', '21.5');
INSERT INTO intelligenthome.sensordata VALUES (656, '2020-02-16 18:33:10.377', 'GasCucina', 'true');
INSERT INTO intelligenthome.sensordata VALUES (657, '2020-02-16 18:33:11.215', 'TempCamera2', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (658, '2020-02-16 18:33:13.013', 'CrepuscolareSalone', '7');
INSERT INTO intelligenthome.sensordata VALUES (659, '2020-02-16 18:33:13.685', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (660, '2020-02-16 18:33:13.812', 'CrepuscolareSalone', '3');
INSERT INTO intelligenthome.sensordata VALUES (661, '2020-02-16 18:33:15.116', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (662, '2020-02-16 18:33:16.144', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (663, '2020-02-16 18:33:19.562', 'CrepuscolareSalone', '6');
INSERT INTO intelligenthome.sensordata VALUES (664, '2020-02-16 18:33:22.072', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (665, '2020-02-16 18:33:24.84', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (666, '2020-02-16 18:33:41.762', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (667, '2020-02-16 18:34:08.927', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (668, '2020-02-16 18:34:20.27', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (669, '2020-02-16 18:35:46.578', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (670, '2020-02-16 18:35:46.737', 'TermostatoCamera2', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (671, '2020-02-16 18:35:46.852', 'TermostatoBagno', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (672, '2020-02-16 18:35:46.991', 'TermostatoCucina', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (673, '2020-02-16 18:35:47.11', 'TermostatoSalone', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (674, '2020-02-16 18:35:47.235', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (675, '2020-02-16 18:35:47.327', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (676, '2020-02-16 18:35:47.401', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (677, '2020-02-16 18:35:47.467', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (678, '2020-02-16 18:36:03.2', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (679, '2020-02-16 18:36:06.062', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (680, '2020-02-16 18:36:28.682', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (681, '2020-02-16 18:36:40.871', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (682, '2020-02-16 18:38:15.018', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (683, '2020-02-16 18:38:16.536', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (684, '2020-02-16 18:38:21.32', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (685, '2020-02-16 18:39:38.52', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (686, '2020-02-16 18:39:39.532', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (687, '2020-02-16 18:39:41.664', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (688, '2020-02-16 19:16:10.381', 'TempCamera1', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (689, '2020-02-16 19:16:11.207', 'TempCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (690, '2020-02-16 19:16:14.211', 'TempCamera1', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (691, '2020-02-16 19:16:17.198', 'TempCamera1', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (692, '2020-02-16 19:16:20.209', 'TempCamera1', '19.3');
INSERT INTO intelligenthome.sensordata VALUES (693, '2020-02-16 19:16:23.216', 'TempCamera1', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (694, '2020-02-16 19:16:26.194', 'TempCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (695, '2020-02-16 19:16:29.204', 'TempCamera1', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (696, '2020-02-16 19:16:32.215', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (697, '2020-02-16 19:16:35.233', 'TempCamera1', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (698, '2020-02-16 19:16:38.194', 'TempCamera1', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (699, '2020-02-16 19:16:41.206', 'TempCamera1', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (700, '2020-02-17 16:21:27.291', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (701, '2020-02-17 16:21:27.822', 'TermostatoCamera2', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (702, '2020-02-17 16:21:27.979', 'TermostatoBagno', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (703, '2020-02-17 16:21:28.281', 'TermostatoCucina', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (704, '2020-02-17 16:21:28.609', 'TermostatoSalone', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (705, '2020-02-17 16:21:28.968', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (706, '2020-02-17 16:21:29.098', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (707, '2020-02-17 16:21:29.223', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (708, '2020-02-17 16:21:29.395', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (709, '2020-02-17 16:22:00.672', 'TempSalone', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (710, '2020-02-17 16:22:07.395', 'TempSalone', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (711, '2020-02-17 16:22:10.429', 'TempSalone', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (712, '2020-02-17 16:22:13.431', 'TempSalone', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (713, '2020-02-17 16:22:16.425', 'TempSalone', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (714, '2020-02-17 16:22:19.45', 'TempSalone', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (715, '2020-02-17 16:22:22.431', 'TempSalone', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (716, '2020-02-17 16:22:25.429', 'TempSalone', '20.1');
INSERT INTO intelligenthome.sensordata VALUES (717, '2020-02-17 16:22:28.407', 'TempSalone', '20.2');
INSERT INTO intelligenthome.sensordata VALUES (718, '2020-02-17 16:22:31.439', 'TempSalone', '20.3');
INSERT INTO intelligenthome.sensordata VALUES (719, '2020-02-17 16:22:34.432', 'TempSalone', '20.4');
INSERT INTO intelligenthome.sensordata VALUES (720, '2020-02-17 16:22:37.716', 'TempSalone', '20.5');
INSERT INTO intelligenthome.sensordata VALUES (721, '2020-02-17 16:22:40.888', 'TempSalone', '20.6');
INSERT INTO intelligenthome.sensordata VALUES (722, '2020-02-17 16:22:43.437', 'TempSalone', '20.7');
INSERT INTO intelligenthome.sensordata VALUES (723, '2020-02-17 16:22:46.534', 'TempSalone', '20.8');
INSERT INTO intelligenthome.sensordata VALUES (724, '2020-02-17 16:22:49.464', 'TempSalone', '20.9');
INSERT INTO intelligenthome.sensordata VALUES (725, '2020-02-17 16:22:52.467', 'TempSalone', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (726, '2020-02-17 16:22:55.463', 'TempSalone', '21.1');
INSERT INTO intelligenthome.sensordata VALUES (727, '2020-02-17 16:22:58.426', 'TempSalone', '21.2');
INSERT INTO intelligenthome.sensordata VALUES (728, '2020-02-17 16:23:01.499', 'TempSalone', '21.3');
INSERT INTO intelligenthome.sensordata VALUES (729, '2020-02-17 16:23:04.444', 'TempSalone', '21.4');
INSERT INTO intelligenthome.sensordata VALUES (730, '2020-02-17 16:23:07.453', 'TempSalone', '21.5');
INSERT INTO intelligenthome.sensordata VALUES (731, '2020-02-17 16:24:23.198', 'GasCucina', 'true');
INSERT INTO intelligenthome.sensordata VALUES (732, '2020-02-17 16:24:25.805', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (733, '2020-02-17 16:24:26.883', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (734, '2020-02-17 16:24:28.324', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (735, '2020-02-17 16:24:29.807', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (736, '2020-02-17 16:29:15.737', 'CrepuscolareSalone', '4');
INSERT INTO intelligenthome.sensordata VALUES (737, '2020-02-17 16:29:16.241', 'CrepuscolareSalone', '3');
INSERT INTO intelligenthome.sensordata VALUES (738, '2020-02-17 16:29:17.055', 'CrepuscolareSalone', '4');
INSERT INTO intelligenthome.sensordata VALUES (739, '2020-02-17 16:29:17.283', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (740, '2020-02-17 16:29:17.671', 'CrepuscolareSalone', '6');
INSERT INTO intelligenthome.sensordata VALUES (741, '2020-02-17 16:29:27.63', 'CrepuscolareSalone', '9');
INSERT INTO intelligenthome.sensordata VALUES (742, '2020-02-17 16:29:27.714', 'CrepuscolareSalone', '9');
INSERT INTO intelligenthome.sensordata VALUES (743, '2020-02-17 16:29:43.969', 'TempCamera1', '18.0');
INSERT INTO intelligenthome.sensordata VALUES (744, '2020-02-17 16:29:44.47', 'TempBagno', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (745, '2020-02-17 16:29:45.075', 'TempCamera2', '17.0');
INSERT INTO intelligenthome.sensordata VALUES (746, '2020-02-17 16:29:45.599', 'TempCucina', '18.5');
INSERT INTO intelligenthome.sensordata VALUES (747, '2020-02-17 16:29:46.351', 'TempSalone', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (748, '2020-02-17 16:29:46.619', 'TempCamera1', '18.1');
INSERT INTO intelligenthome.sensordata VALUES (749, '2020-02-17 16:29:46.743', 'TempBagno', '20.1');
INSERT INTO intelligenthome.sensordata VALUES (750, '2020-02-17 16:29:46.863', 'TempCamera2', '17.1');
INSERT INTO intelligenthome.sensordata VALUES (751, '2020-02-17 16:29:46.995', 'TempCucina', '18.6');
INSERT INTO intelligenthome.sensordata VALUES (752, '2020-02-17 16:29:49.571', 'TempCamera1', '18.2');
INSERT INTO intelligenthome.sensordata VALUES (753, '2020-02-17 16:29:49.771', 'TempSalone', '20.1');
INSERT INTO intelligenthome.sensordata VALUES (754, '2020-02-17 16:29:49.891', 'TempCucina', '18.7');
INSERT INTO intelligenthome.sensordata VALUES (755, '2020-02-17 16:29:50.035', 'TempBagno', '20.2');
INSERT INTO intelligenthome.sensordata VALUES (756, '2020-02-17 16:29:50.159', 'TempCamera2', '17.2');
INSERT INTO intelligenthome.sensordata VALUES (757, '2020-02-17 16:29:52.548', 'TempCamera1', '18.3');
INSERT INTO intelligenthome.sensordata VALUES (758, '2020-02-17 16:29:52.66', 'TempSalone', '20.2');
INSERT INTO intelligenthome.sensordata VALUES (759, '2020-02-17 16:29:52.8', 'TempCucina', '18.8');
INSERT INTO intelligenthome.sensordata VALUES (760, '2020-02-17 16:29:52.948', 'TempBagno', '20.3');
INSERT INTO intelligenthome.sensordata VALUES (761, '2020-02-17 16:29:53.104', 'TempCamera2', '17.3');
INSERT INTO intelligenthome.sensordata VALUES (762, '2020-02-17 16:29:55.625', 'TempCamera1', '18.4');
INSERT INTO intelligenthome.sensordata VALUES (763, '2020-02-17 16:29:55.741', 'TempSalone', '20.3');
INSERT INTO intelligenthome.sensordata VALUES (764, '2020-02-17 16:29:55.977', 'TempCucina', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (765, '2020-02-17 16:29:56.137', 'TempBagno', '20.4');
INSERT INTO intelligenthome.sensordata VALUES (766, '2020-02-17 16:29:56.249', 'TempCamera2', '17.4');
INSERT INTO intelligenthome.sensordata VALUES (767, '2020-02-17 16:29:58.581', 'TempCamera1', '18.5');
INSERT INTO intelligenthome.sensordata VALUES (768, '2020-02-17 16:29:58.741', 'TempSalone', '20.4');
INSERT INTO intelligenthome.sensordata VALUES (769, '2020-02-17 16:29:58.961', 'TempCucina', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (770, '2020-02-17 16:29:59.093', 'TempBagno', '20.5');
INSERT INTO intelligenthome.sensordata VALUES (771, '2020-02-17 16:29:59.253', 'TempCamera2', '17.5');
INSERT INTO intelligenthome.sensordata VALUES (772, '2020-02-17 16:30:01.538', 'TempCamera1', '18.6');
INSERT INTO intelligenthome.sensordata VALUES (773, '2020-02-17 16:30:01.65', 'TempSalone', '20.5');
INSERT INTO intelligenthome.sensordata VALUES (774, '2020-02-17 16:30:01.778', 'TempCucina', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (775, '2020-02-17 16:30:01.906', 'TempBagno', '20.6');
INSERT INTO intelligenthome.sensordata VALUES (776, '2020-02-17 16:30:02.102', 'TempCamera2', '17.6');
INSERT INTO intelligenthome.sensordata VALUES (777, '2020-02-17 16:30:04.515', 'TempCamera1', '18.7');
INSERT INTO intelligenthome.sensordata VALUES (778, '2020-02-17 16:30:04.663', 'TempSalone', '20.6');
INSERT INTO intelligenthome.sensordata VALUES (779, '2020-02-17 16:30:04.791', 'TempCucina', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (780, '2020-02-17 16:30:04.923', 'TempBagno', '20.7');
INSERT INTO intelligenthome.sensordata VALUES (781, '2020-02-17 16:30:05.067', 'TempCamera2', '17.7');
INSERT INTO intelligenthome.sensordata VALUES (782, '2020-02-17 16:30:07.568', 'TempCamera1', '18.8');
INSERT INTO intelligenthome.sensordata VALUES (783, '2020-02-17 16:30:07.772', 'TempCamera2', '17.8');
INSERT INTO intelligenthome.sensordata VALUES (784, '2020-02-17 16:30:07.932', 'TempCucina', '19.3');
INSERT INTO intelligenthome.sensordata VALUES (785, '2020-02-17 16:30:08.064', 'TempSalone', '20.7');
INSERT INTO intelligenthome.sensordata VALUES (786, '2020-02-17 16:30:08.208', 'TempBagno', '20.8');
INSERT INTO intelligenthome.sensordata VALUES (787, '2020-02-17 16:30:10.538', 'TempCamera1', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (788, '2020-02-17 16:30:10.67', 'TempSalone', '20.8');
INSERT INTO intelligenthome.sensordata VALUES (789, '2020-02-17 16:30:10.786', 'TempCucina', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (790, '2020-02-17 16:30:10.962', 'TempBagno', '20.9');
INSERT INTO intelligenthome.sensordata VALUES (791, '2020-02-17 16:30:11.134', 'TempCamera2', '17.9');
INSERT INTO intelligenthome.sensordata VALUES (792, '2020-02-17 16:30:13.539', 'TempCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (793, '2020-02-17 16:30:13.671', 'TempSalone', '20.9');
INSERT INTO intelligenthome.sensordata VALUES (794, '2020-02-17 16:30:13.823', 'TempCucina', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (795, '2020-02-17 16:30:13.968', 'TempBagno', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (796, '2020-02-17 16:30:14.16', 'TempCamera2', '18.0');
INSERT INTO intelligenthome.sensordata VALUES (797, '2020-02-17 16:30:16.578', 'TempCamera1', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (798, '2020-02-17 16:30:16.73', 'TempSalone', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (799, '2020-02-17 16:30:16.838', 'TempCucina', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (800, '2020-02-17 16:30:17.178', 'TempBagno', '21.1');
INSERT INTO intelligenthome.sensordata VALUES (801, '2020-02-17 16:30:17.418', 'TempCamera2', '18.1');
INSERT INTO intelligenthome.sensordata VALUES (802, '2020-02-17 16:30:19.581', 'TempCamera1', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (803, '2020-02-17 16:30:19.685', 'TempSalone', '21.1');
INSERT INTO intelligenthome.sensordata VALUES (804, '2020-02-17 16:30:19.794', 'TempCucina', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (805, '2020-02-17 16:30:19.962', 'TempBagno', '21.2');
INSERT INTO intelligenthome.sensordata VALUES (806, '2020-02-17 16:30:20.13', 'TempCamera2', '18.2');
INSERT INTO intelligenthome.sensordata VALUES (807, '2020-02-17 16:30:22.537', 'TempCamera1', '19.3');
INSERT INTO intelligenthome.sensordata VALUES (808, '2020-02-17 16:30:22.653', 'TempSalone', '21.2');
INSERT INTO intelligenthome.sensordata VALUES (809, '2020-02-17 16:30:22.757', 'TempCucina', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (810, '2020-02-17 16:30:22.865', 'TempBagno', '21.3');
INSERT INTO intelligenthome.sensordata VALUES (811, '2020-02-17 16:30:23.025', 'TempCamera2', '18.3');
INSERT INTO intelligenthome.sensordata VALUES (812, '2020-02-17 16:30:25.518', 'TempCamera1', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (813, '2020-02-17 16:30:25.682', 'TempSalone', '21.3');
INSERT INTO intelligenthome.sensordata VALUES (814, '2020-02-17 16:30:25.794', 'TempCucina', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (815, '2020-02-17 16:30:25.922', 'TempBagno', '21.4');
INSERT INTO intelligenthome.sensordata VALUES (816, '2020-02-17 16:30:26.07', 'TempCamera2', '18.4');
INSERT INTO intelligenthome.sensordata VALUES (817, '2020-02-17 16:30:28.524', 'TempCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (818, '2020-02-17 16:30:28.636', 'TempCucina', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (819, '2020-02-17 16:30:28.752', 'TempBagno', '21.5');
INSERT INTO intelligenthome.sensordata VALUES (820, '2020-02-17 16:30:28.868', 'TempCamera2', '18.5');
INSERT INTO intelligenthome.sensordata VALUES (821, '2020-02-17 16:30:28.996', 'TempSalone', '21.4');
INSERT INTO intelligenthome.sensordata VALUES (822, '2020-02-17 16:30:31.516', 'TempCamera1', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (823, '2020-02-17 16:30:31.672', 'TempCucina', '20.1');
INSERT INTO intelligenthome.sensordata VALUES (824, '2020-02-17 16:30:31.792', 'TempSalone', '21.5');
INSERT INTO intelligenthome.sensordata VALUES (825, '2020-02-17 16:30:31.96', 'TempCamera2', '18.6');
INSERT INTO intelligenthome.sensordata VALUES (826, '2020-02-17 16:30:34.508', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (827, '2020-02-17 16:30:34.616', 'TempCucina', '20.2');
INSERT INTO intelligenthome.sensordata VALUES (828, '2020-02-17 16:30:34.748', 'TempCamera2', '18.7');
INSERT INTO intelligenthome.sensordata VALUES (829, '2020-02-17 16:30:37.505', 'TempCamera1', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (830, '2020-02-17 16:30:37.641', 'TempCucina', '20.3');
INSERT INTO intelligenthome.sensordata VALUES (831, '2020-02-17 16:30:37.797', 'TempCamera2', '18.8');
INSERT INTO intelligenthome.sensordata VALUES (832, '2020-02-17 16:30:40.516', 'TempCamera1', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (833, '2020-02-17 16:30:40.664', 'TempCucina', '20.4');
INSERT INTO intelligenthome.sensordata VALUES (834, '2020-02-17 16:30:40.804', 'TempCamera2', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (835, '2020-02-17 16:30:43.495', 'TempCamera1', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (836, '2020-02-17 16:30:43.631', 'TempCucina', '20.5');
INSERT INTO intelligenthome.sensordata VALUES (837, '2020-02-17 16:30:43.739', 'TempCamera2', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (838, '2020-02-17 16:30:46.503', 'TempCamera2', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (839, '2020-02-17 16:30:49.499', 'TempCamera2', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (840, '2020-02-17 16:30:52.487', 'TempCamera2', '19.3');
INSERT INTO intelligenthome.sensordata VALUES (841, '2020-02-17 16:30:55.498', 'TempCamera2', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (842, '2020-02-17 16:30:58.525', 'TempCamera2', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (843, '2020-02-17 16:31:01.501', 'TempCamera2', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (844, '2020-02-17 16:31:01.997', 'GasCucina', 'true');
INSERT INTO intelligenthome.sensordata VALUES (845, '2020-02-17 16:31:03.52', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (846, '2020-02-17 16:31:04.276', 'CrepuscolareSalone', '7');
INSERT INTO intelligenthome.sensordata VALUES (847, '2020-02-17 16:31:04.501', 'TempCamera2', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (848, '2020-02-17 16:31:04.633', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (849, '2020-02-17 16:31:04.757', 'CrepuscolareSalone', '3');
INSERT INTO intelligenthome.sensordata VALUES (850, '2020-02-17 16:31:04.973', 'CrepuscolareSalone', '1');
INSERT INTO intelligenthome.sensordata VALUES (851, '2020-02-17 16:31:05.662', 'CrepuscolareSalone', '3');
INSERT INTO intelligenthome.sensordata VALUES (852, '2020-02-17 16:31:05.818', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (853, '2020-02-17 16:31:07.353', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (854, '2020-02-17 16:31:07.497', 'TempCamera2', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (855, '2020-02-17 16:31:07.633', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (856, '2020-02-17 16:31:10.485', 'TempCamera2', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (857, '2020-02-17 16:31:11.417', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (858, '2020-02-17 16:31:13.5', 'TempCamera2', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (859, '2020-02-17 17:12:10.728', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (860, '2020-02-17 17:12:11.036', 'TermostatoCamera2', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (861, '2020-02-17 17:12:11.192', 'TermostatoBagno', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (862, '2020-02-17 17:12:11.408', 'TermostatoCucina', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (863, '2020-02-17 17:12:11.56', 'TermostatoSalone', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (864, '2020-02-17 17:12:11.822', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (865, '2020-02-17 17:12:12.03', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (866, '2020-02-17 17:12:12.17', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (867, '2020-02-17 17:12:12.33', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (868, '2020-02-17 17:12:18.375', 'GasCucina', 'true');
INSERT INTO intelligenthome.sensordata VALUES (869, '2020-02-17 17:12:21.285', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (870, '2020-02-17 17:12:28.21', 'GasCucina', 'true');
INSERT INTO intelligenthome.sensordata VALUES (871, '2020-02-17 17:12:29.28', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (872, '2020-02-17 17:13:32.28', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (873, '2020-02-17 17:13:32.524', 'TermostatoCamera2', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (874, '2020-02-17 17:13:32.704', 'TermostatoBagno', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (875, '2020-02-17 17:13:32.96', 'TermostatoCucina', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (876, '2020-02-17 17:13:33.1', 'TermostatoSalone', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (877, '2020-02-17 17:13:33.366', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (878, '2020-02-17 17:13:33.57', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (879, '2020-02-17 17:13:33.754', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (880, '2020-02-17 17:13:33.895', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (881, '2020-02-17 17:13:36.967', 'GasCucina', 'true');
INSERT INTO intelligenthome.sensordata VALUES (882, '2020-02-17 17:13:38.034', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (883, '2020-02-17 17:13:39.341', 'GasCucina', 'true');
INSERT INTO intelligenthome.sensordata VALUES (884, '2020-02-17 17:13:40.444', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (885, '2020-02-17 17:13:41.766', 'GasCucina', 'true');
INSERT INTO intelligenthome.sensordata VALUES (886, '2020-02-17 17:13:44.947', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (887, '2020-02-20 09:37:29.043', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (888, '2020-02-20 09:37:29.411', 'TermostatoCamera2', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (889, '2020-02-20 09:37:29.595', 'TermostatoBagno', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (890, '2020-02-20 09:37:29.727', 'TermostatoCucina', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (891, '2020-02-20 09:37:29.852', 'TermostatoSalone', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (892, '2020-02-20 09:37:30.061', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (893, '2020-02-20 09:37:30.232', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (894, '2020-02-20 09:37:30.42', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (895, '2020-02-20 09:37:30.592', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (896, '2020-02-20 09:38:06.002', 'TempCamera1', '18.0');
INSERT INTO intelligenthome.sensordata VALUES (897, '2020-02-20 09:38:06.53', 'TempCamera1', '18.1');
INSERT INTO intelligenthome.sensordata VALUES (898, '2020-02-20 09:38:09.534', 'TempCamera1', '18.2');
INSERT INTO intelligenthome.sensordata VALUES (899, '2020-02-20 09:38:12.529', 'TempCamera1', '18.3');
INSERT INTO intelligenthome.sensordata VALUES (900, '2020-02-20 09:38:15.529', 'TempCamera1', '18.4');
INSERT INTO intelligenthome.sensordata VALUES (901, '2020-02-20 09:38:18.532', 'TempCamera1', '18.5');
INSERT INTO intelligenthome.sensordata VALUES (902, '2020-02-20 09:38:21.534', 'TempCamera1', '18.6');
INSERT INTO intelligenthome.sensordata VALUES (903, '2020-02-20 09:38:24.519', 'TempCamera1', '18.7');
INSERT INTO intelligenthome.sensordata VALUES (904, '2020-02-20 09:38:27.526', 'TempCamera1', '18.8');
INSERT INTO intelligenthome.sensordata VALUES (905, '2020-02-20 09:38:30.525', 'TempCamera1', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (906, '2020-02-20 09:38:33.535', 'TempCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (907, '2020-02-20 09:38:36.519', 'TempCamera1', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (908, '2020-02-20 09:38:39.538', 'TempCamera1', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (909, '2020-02-20 09:38:42.525', 'TempCamera1', '19.3');
INSERT INTO intelligenthome.sensordata VALUES (910, '2020-02-20 09:38:45.532', 'TempCamera1', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (911, '2020-02-20 09:38:48.526', 'TempCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (912, '2020-02-20 09:38:51.529', 'TempCamera1', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (913, '2020-02-20 09:38:54.528', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (914, '2020-02-20 09:38:57.534', 'TempCamera1', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (915, '2020-02-20 09:39:00.535', 'TempCamera1', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (916, '2020-02-20 09:39:03.528', 'TempCamera1', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (917, '2020-02-20 09:57:09.887', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (918, '2020-02-20 09:57:10.071', 'TermostatoCamera2', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (919, '2020-02-20 09:57:10.199', 'TermostatoBagno', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (920, '2020-02-20 09:57:10.391', 'TermostatoCucina', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (921, '2020-02-20 09:57:10.503', 'TermostatoSalone', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (922, '2020-02-20 09:57:10.699', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (923, '2020-02-20 09:57:10.829', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (924, '2020-02-20 09:57:11.117', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (925, '2020-02-20 09:57:11.289', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (926, '2020-02-20 09:57:24.677', 'TempCamera1', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (927, '2020-02-20 09:57:26.365', 'TempCamera1', '19.3');
INSERT INTO intelligenthome.sensordata VALUES (928, '2020-02-20 09:57:29.375', 'TempCamera1', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (929, '2020-02-20 09:57:32.379', 'TempCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (930, '2020-02-20 09:57:35.371', 'TempCamera1', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (931, '2020-02-20 09:57:38.36', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (932, '2020-02-20 09:57:41.379', 'TempCamera1', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (933, '2020-03-03 10:34:11.262', 'TermostatoCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (934, '2020-03-03 10:34:11.693', 'TermostatoCamera2', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (935, '2020-03-03 10:34:11.893', 'TermostatoBagno', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (936, '2020-03-03 10:34:12.037', 'TermostatoCucina', '20.0');
INSERT INTO intelligenthome.sensordata VALUES (937, '2020-03-03 10:34:12.186', 'TermostatoSalone', '21.0');
INSERT INTO intelligenthome.sensordata VALUES (938, '2020-03-03 10:34:12.457', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (939, '2020-03-03 10:34:12.864', 'CrepuscolareSalone', '5');
INSERT INTO intelligenthome.sensordata VALUES (940, '2020-03-03 10:34:13.01', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (941, '2020-03-03 10:34:13.457', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (942, '2020-03-03 10:35:29.731', 'GasCucina', 'true');
INSERT INTO intelligenthome.sensordata VALUES (943, '2020-03-03 10:35:59.475', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (944, '2020-03-03 10:36:00.604', 'GasCucina', 'true');
INSERT INTO intelligenthome.sensordata VALUES (945, '2020-03-03 10:36:02.853', 'GasCucina', 'false');
INSERT INTO intelligenthome.sensordata VALUES (946, '2020-03-03 10:36:04.056', 'GasCucina', 'true');
INSERT INTO intelligenthome.sensordata VALUES (947, '2020-03-03 10:36:24.162', 'TempCamera1', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (948, '2020-03-03 10:36:26.999', 'TempCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (949, '2020-03-03 10:36:30.004', 'TempCamera1', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (950, '2020-03-03 10:36:32.986', 'TempCamera1', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (951, '2020-03-03 10:36:36.015', 'TempCamera1', '19.3');
INSERT INTO intelligenthome.sensordata VALUES (952, '2020-03-03 10:36:38.994', 'TempCamera1', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (953, '2020-03-03 10:36:42.019', 'TempCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (954, '2020-03-03 10:36:45.05', 'TempCamera1', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (955, '2020-03-03 10:36:48', 'TempCamera1', '19.7');
INSERT INTO intelligenthome.sensordata VALUES (956, '2020-03-03 10:36:51.006', 'TempCamera1', '19.8');
INSERT INTO intelligenthome.sensordata VALUES (957, '2020-03-03 10:36:53.995', 'TempCamera1', '19.9');
INSERT INTO intelligenthome.sensordata VALUES (958, '2020-03-03 10:46:23.81', 'CrepuscolareSalone', '4');
INSERT INTO intelligenthome.sensordata VALUES (959, '2020-03-03 10:46:37.81', 'PosizioneBob', '101');
INSERT INTO intelligenthome.sensordata VALUES (960, '2020-03-03 10:46:38.992', 'PortaCasa', 'true');
INSERT INTO intelligenthome.sensordata VALUES (961, '2020-03-03 10:46:39.232', 'PortaCasa', 'false');
INSERT INTO intelligenthome.sensordata VALUES (962, '2020-03-03 10:47:11.1', 'TempCamera1', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (963, '2020-03-03 10:47:11.992', 'TempBagno', '18.0');
INSERT INTO intelligenthome.sensordata VALUES (964, '2020-03-03 10:47:12.3', 'TempCamera1', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (965, '2020-03-03 10:47:12.816', 'TempCamera2', '18.9');
INSERT INTO intelligenthome.sensordata VALUES (966, '2020-03-03 10:47:13.888', 'TempCucina', '18.0');
INSERT INTO intelligenthome.sensordata VALUES (967, '2020-03-03 10:47:15.141', 'TempCamera1', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (968, '2020-03-03 10:47:15.469', 'TempBagno', '18.1');
INSERT INTO intelligenthome.sensordata VALUES (969, '2020-03-03 10:47:15.625', 'TempCucina', '18.1');
INSERT INTO intelligenthome.sensordata VALUES (970, '2020-03-03 10:47:15.817', 'TempCamera2', '19.0');
INSERT INTO intelligenthome.sensordata VALUES (971, '2020-03-03 10:47:18.113', 'TempCamera1', '19.3');
INSERT INTO intelligenthome.sensordata VALUES (972, '2020-03-03 10:47:18.245', 'TempCucina', '18.2');
INSERT INTO intelligenthome.sensordata VALUES (973, '2020-03-03 10:47:18.429', 'TempBagno', '18.2');
INSERT INTO intelligenthome.sensordata VALUES (974, '2020-03-03 10:47:18.637', 'TempCamera2', '19.1');
INSERT INTO intelligenthome.sensordata VALUES (975, '2020-03-03 10:47:21.092', 'TempCamera1', '19.4');
INSERT INTO intelligenthome.sensordata VALUES (976, '2020-03-03 10:47:21.252', 'TempCucina', '18.3');
INSERT INTO intelligenthome.sensordata VALUES (977, '2020-03-03 10:47:21.416', 'TempBagno', '18.3');
INSERT INTO intelligenthome.sensordata VALUES (978, '2020-03-03 10:47:21.632', 'TempCamera2', '19.2');
INSERT INTO intelligenthome.sensordata VALUES (979, '2020-03-03 10:47:24.101', 'TempCamera1', '19.5');
INSERT INTO intelligenthome.sensordata VALUES (980, '2020-03-03 10:47:24.341', 'TempBagno', '18.4');
INSERT INTO intelligenthome.sensordata VALUES (981, '2020-03-03 10:47:24.469', 'TempCucina', '18.4');
INSERT INTO intelligenthome.sensordata VALUES (982, '2020-03-03 10:47:24.865', 'TempCamera2', '19.3');
INSERT INTO intelligenthome.sensordata VALUES (983, '2020-03-03 10:47:27.086', 'TempCamera1', '19.6');
INSERT INTO intelligenthome.sensordata VALUES (984, '2020-03-03 10:47:27.238', 'TempCucina', '18.5');
INSERT INTO intelligenthome.sensordata VALUES (985, '2020-03-03 10:47:27.406', 'TempBagno', '18.5');
INSERT INTO intelligenthome.sensordata VALUES (986, '2020-03-03 10:47:27.582', 'TempCamera2', '19.4');


--
-- TOC entry 2894 (class 0 OID 57347)
-- Dependencies: 218
-- Data for Name: sensors; Type: TABLE DATA; Schema: intelligenthome; Owner: postgres
--

INSERT INTO intelligenthome.sensors VALUES (7, 'TempSalone', 'C', 'CONTINUOUS', true);
INSERT INTO intelligenthome.sensors VALUES (5, 'TempCamera1', 'C', 'CONTINUOUS', true);
INSERT INTO intelligenthome.sensors VALUES (6, 'CrepuscolareSalone', 'Lux', 'DISCREETE', true);
INSERT INTO intelligenthome.sensors VALUES (20, 'TempCamera2', 'C', 'CONTINUOUS', true);
INSERT INTO intelligenthome.sensors VALUES (21, 'TempBagno', 'C', 'CONTINUOUS', true);
INSERT INTO intelligenthome.sensors VALUES (22, 'TempCucina', 'C', 'CONTINUOUS', true);
INSERT INTO intelligenthome.sensors VALUES (23, 'TermostatoSalone', 'C', 'CONTINUOUS', true);
INSERT INTO intelligenthome.sensors VALUES (24, 'TermostatoCucina', 'C', 'CONTINUOUS', true);
INSERT INTO intelligenthome.sensors VALUES (25, 'TermostatoCamera1', 'C', 'CONTINUOUS', true);
INSERT INTO intelligenthome.sensors VALUES (26, 'TermostatoCamera2', 'C', 'CONTINUOUS', true);
INSERT INTO intelligenthome.sensors VALUES (27, 'TermostatoBagno', 'C', 'CONTINUOUS', true);
INSERT INTO intelligenthome.sensors VALUES (28, 'CrepuscolareCucina', 'Lux', 'DISCREETE', true);
INSERT INTO intelligenthome.sensors VALUES (29, 'CrepuscolareCamera1', 'Lux', 'DISCREETE', true);
INSERT INTO intelligenthome.sensors VALUES (30, 'CrepuscolareCamera2', 'Lux', 'DISCREETE', true);
INSERT INTO intelligenthome.sensors VALUES (31, 'CrepuscolareBagno', 'Lux', 'DISCREETE', true);
INSERT INTO intelligenthome.sensors VALUES (32, 'GasCucina', 'On/Off', 'ON/OFF', true);
INSERT INTO intelligenthome.sensors VALUES (33, 'PosizioneBob', 'm', 'CONTINUOUS', true);
INSERT INTO intelligenthome.sensors VALUES (34, 'PortaCasa', 'On/Off', 'ON/OFF', true);


--
-- TOC entry 2912 (class 0 OID 0)
-- Dependencies: 225
-- Name: actuaordata_id_seq; Type: SEQUENCE SET; Schema: intelligenthome; Owner: postgres
--

SELECT pg_catalog.setval('intelligenthome.actuaordata_id_seq', 191, true);


--
-- TOC entry 2913 (class 0 OID 0)
-- Dependencies: 219
-- Name: actuators_id_seq; Type: SEQUENCE SET; Schema: intelligenthome; Owner: postgres
--

SELECT pg_catalog.setval('intelligenthome.actuators_id_seq', 32, true);


--
-- TOC entry 2914 (class 0 OID 0)
-- Dependencies: 221
-- Name: scripts_id_seq; Type: SEQUENCE SET; Schema: intelligenthome; Owner: postgres
--

SELECT pg_catalog.setval('intelligenthome.scripts_id_seq', 10, true);


--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 223
-- Name: sensordata_id_seq; Type: SEQUENCE SET; Schema: intelligenthome; Owner: postgres
--

SELECT pg_catalog.setval('intelligenthome.sensordata_id_seq', 990, true);


--
-- TOC entry 2916 (class 0 OID 0)
-- Dependencies: 217
-- Name: sensors_id_seq; Type: SEQUENCE SET; Schema: intelligenthome; Owner: postgres
--

SELECT pg_catalog.setval('intelligenthome.sensors_id_seq', 34, true);


--
-- TOC entry 2771 (class 2606 OID 65564)
-- Name: actuatordata actuaordata_pkey; Type: CONSTRAINT; Schema: intelligenthome; Owner: postgres
--

ALTER TABLE ONLY intelligenthome.actuatordata
    ADD CONSTRAINT actuaordata_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 57365)
-- Name: actuators actuators_pkey; Type: CONSTRAINT; Schema: intelligenthome; Owner: postgres
--

ALTER TABLE ONLY intelligenthome.actuators
    ADD CONSTRAINT actuators_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 57367)
-- Name: actuators actuators_uq_name; Type: CONSTRAINT; Schema: intelligenthome; Owner: postgres
--

ALTER TABLE ONLY intelligenthome.actuators
    ADD CONSTRAINT actuators_uq_name UNIQUE (devicename);


--
-- TOC entry 2765 (class 2606 OID 65546)
-- Name: scripts scripts_pkey; Type: CONSTRAINT; Schema: intelligenthome; Owner: postgres
--

ALTER TABLE ONLY intelligenthome.scripts
    ADD CONSTRAINT scripts_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 65548)
-- Name: scripts scripts_uq_name; Type: CONSTRAINT; Schema: intelligenthome; Owner: postgres
--

ALTER TABLE ONLY intelligenthome.scripts
    ADD CONSTRAINT scripts_uq_name UNIQUE (name);


--
-- TOC entry 2769 (class 2606 OID 65556)
-- Name: sensordata sensordata_pkey; Type: CONSTRAINT; Schema: intelligenthome; Owner: postgres
--

ALTER TABLE ONLY intelligenthome.sensordata
    ADD CONSTRAINT sensordata_pkey PRIMARY KEY (id);


--
-- TOC entry 2757 (class 2606 OID 57352)
-- Name: sensors sensors_pkey; Type: CONSTRAINT; Schema: intelligenthome; Owner: postgres
--

ALTER TABLE ONLY intelligenthome.sensors
    ADD CONSTRAINT sensors_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 57381)
-- Name: sensors sensors_uq_name; Type: CONSTRAINT; Schema: intelligenthome; Owner: postgres
--

ALTER TABLE ONLY intelligenthome.sensors
    ADD CONSTRAINT sensors_uq_name UNIQUE (devicename);


-- Completed on 2020-03-03 19:32:00

--
-- PostgreSQL database dump complete
--

