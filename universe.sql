--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    large boolean NOT NULL,
    referenced_god text NOT NULL,
    aaa integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: last_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.last_table (
    id integer,
    moon_id integer NOT NULL,
    last_table_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.last_table OWNER TO freecodecamp;

--
-- Name: last_table_last_table_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.last_table_last_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.last_table_last_table_id_seq OWNER TO freecodecamp;

--
-- Name: last_table_last_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.last_table_last_table_id_seq OWNED BY public.last_table.last_table_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    weight integer NOT NULL,
    planet_id integer,
    high integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    weight integer NOT NULL,
    large boolean NOT NULL,
    position_to_the_star numeric NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer NOT NULL,
    gravity_power boolean,
    power integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: last_table last_table_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.last_table ALTER COLUMN last_table_id SET DEFAULT nextval('public.last_table_last_table_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'leite', true, 'jupiter', 10);
INSERT INTO public.galaxy VALUES (2, 'via', false, 'zeus', 16);
INSERT INTO public.galaxy VALUES (3, 'EM POH', true, 'odin', 176);
INSERT INTO public.galaxy VALUES (4, ' a baitola', true, 'aaa', 999);
INSERT INTO public.galaxy VALUES (5, 'fernando', true, 'praga', 121212);
INSERT INTO public.galaxy VALUES (6, 'pratica', false, 'pindamonhagaba', 47328947);


--
-- Data for Name: last_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.last_table VALUES (1, 1, 1, 'A');
INSERT INTO public.last_table VALUES (2, 2, 2, 'B');
INSERT INTO public.last_table VALUES (3, 3, 3, 'C');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, NULL, 1, 1, NULL);
INSERT INTO public.moon VALUES (2, NULL, 2, 2, NULL);
INSERT INTO public.moon VALUES (3, NULL, 3, 3, NULL);
INSERT INTO public.moon VALUES (4, NULL, 4, 4, NULL);
INSERT INTO public.moon VALUES (5, NULL, 5, 5, NULL);
INSERT INTO public.moon VALUES (6, NULL, 6, 6, NULL);
INSERT INTO public.moon VALUES (7, NULL, 7, 7, NULL);
INSERT INTO public.moon VALUES (8, NULL, 8, 8, NULL);
INSERT INTO public.moon VALUES (9, NULL, 9, 9, NULL);
INSERT INTO public.moon VALUES (10, NULL, 10, 10, NULL);
INSERT INTO public.moon VALUES (11, NULL, 11, 11, NULL);
INSERT INTO public.moon VALUES (12, NULL, 12, 12, NULL);
INSERT INTO public.moon VALUES (13, NULL, 13, 13, NULL);
INSERT INTO public.moon VALUES (14, NULL, 14, 14, NULL);
INSERT INTO public.moon VALUES (15, NULL, 15, 15, NULL);
INSERT INTO public.moon VALUES (16, NULL, 16, 16, NULL);
INSERT INTO public.moon VALUES (17, NULL, 17, 17, NULL);
INSERT INTO public.moon VALUES (18, NULL, 18, 18, NULL);
INSERT INTO public.moon VALUES (19, NULL, 19, 19, NULL);
INSERT INTO public.moon VALUES (20, NULL, 20, 20, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, NULL, 1, true, 1.2, 1);
INSERT INTO public.planet VALUES (2, NULL, 2, true, 1.1, 2);
INSERT INTO public.planet VALUES (3, NULL, 3, false, 1.11, 3);
INSERT INTO public.planet VALUES (4, NULL, 4, true, 2.2, 4);
INSERT INTO public.planet VALUES (5, NULL, 5, false, 5.5, 5);
INSERT INTO public.planet VALUES (6, NULL, 6, true, 6.6, 6);
INSERT INTO public.planet VALUES (7, NULL, 7, true, 7.7, 7);
INSERT INTO public.planet VALUES (8, NULL, 8, false, 87.7, 8);
INSERT INTO public.planet VALUES (9, NULL, 9, false, 9.9, 9);
INSERT INTO public.planet VALUES (10, NULL, 10, true, 10.10, 10);
INSERT INTO public.planet VALUES (11, NULL, 11, true, 11.11, 11);
INSERT INTO public.planet VALUES (12, NULL, 12, false, 12.12, 12);
INSERT INTO public.planet VALUES (13, NULL, 13, true, 13.0, 13);
INSERT INTO public.planet VALUES (14, NULL, 14, false, 14.1, 14);
INSERT INTO public.planet VALUES (15, NULL, 15, true, 15.15, 15);
INSERT INTO public.planet VALUES (16, NULL, 16, true, 16.1, 16);
INSERT INTO public.planet VALUES (17, NULL, 17, false, 17.1, 17);
INSERT INTO public.planet VALUES (18, NULL, 18, true, 18.1, 18);
INSERT INTO public.planet VALUES (19, NULL, 19, true, 19.1, 19);
INSERT INTO public.planet VALUES (20, NULL, 20, true, 20.1, 20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, NULL, 1, NULL, 1);
INSERT INTO public.star VALUES (2, NULL, 2, NULL, 2);
INSERT INTO public.star VALUES (3, NULL, 3, NULL, 3);
INSERT INTO public.star VALUES (4, NULL, 4, NULL, 4);
INSERT INTO public.star VALUES (5, NULL, 5, NULL, 5);
INSERT INTO public.star VALUES (6, NULL, 6, NULL, 6);
INSERT INTO public.star VALUES (7, NULL, 1, NULL, 7);
INSERT INTO public.star VALUES (8, NULL, 2, NULL, 8);
INSERT INTO public.star VALUES (9, NULL, 3, NULL, 9);
INSERT INTO public.star VALUES (10, NULL, 4, NULL, 10);
INSERT INTO public.star VALUES (11, NULL, 1, NULL, 11);
INSERT INTO public.star VALUES (12, NULL, 1, NULL, 12);
INSERT INTO public.star VALUES (13, NULL, 1, NULL, 13);
INSERT INTO public.star VALUES (14, NULL, 1, NULL, 14);
INSERT INTO public.star VALUES (15, NULL, 1, NULL, 15);
INSERT INTO public.star VALUES (16, NULL, 1, NULL, 16);
INSERT INTO public.star VALUES (17, NULL, 1, NULL, 17);
INSERT INTO public.star VALUES (18, NULL, 1, NULL, 18);
INSERT INTO public.star VALUES (19, NULL, 1, NULL, 19);
INSERT INTO public.star VALUES (20, NULL, 1, NULL, 20);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 1, false);


--
-- Name: last_table_last_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.last_table_last_table_id_seq', 1, false);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 1, false);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 1, false);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 1, false);


--
-- Name: galaxy galaxy_aaa_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_aaa_key UNIQUE (aaa);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: last_table last_table_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.last_table
    ADD CONSTRAINT last_table_id_key UNIQUE (id);


--
-- Name: last_table last_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.last_table
    ADD CONSTRAINT last_table_pkey PRIMARY KEY (last_table_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_key UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_power_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_power_key UNIQUE (power);


--
-- Name: moon fk_planet_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk_star_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_planet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
