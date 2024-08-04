--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(50) NOT NULL,
    description text,
    year_of_discovery integer,
    is_elliptical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_round boolean,
    year_of_discovery integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    habitable boolean NOT NULL,
    year_of_discovery integer,
    diameter_in_km numeric(10,2),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moon (
    planet_moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.planet_moon OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moon_planet_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moon_planet_moon_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moon_planet_moon_id_seq OWNED BY public.planet_moon.planet_moon_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    year_of_discovery integer,
    age_in_millions_of_year integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_moon planet_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon ALTER COLUMN planet_moon_id SET DEFAULT nextval('public.planet_moon_planet_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Antennae', 'Two colliding galaxies.', 1785, false);
INSERT INTO public.galaxy VALUES (3, 'Black Eye', 'Also known as "Sleeping Beauty Galaxy".', 1779, true);
INSERT INTO public.galaxy VALUES (4, 'Bode', 'The largest galaxy in the M81 Group.', 1774, true);
INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Andromeda is the closest big galaxy to the Milky Way.', 1612, true);
INSERT INTO public.galaxy VALUES (5, 'Cigar', 'Also known as Messier82.', 2014, false);
INSERT INTO public.galaxy VALUES (6, 'Eye of God', 'A prototype for multi-arm spiral galaxies.', 1784, true);
INSERT INTO public.galaxy VALUES (8, 'Milky Way', 'A band of light.', 1610, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', true, 1645, 3);
INSERT INTO public.moon VALUES (2, 'moon_Venus', true, 1660, 2);
INSERT INTO public.moon VALUES (3, 'moon_Venus2', true, 1660, 2);
INSERT INTO public.moon VALUES (4, 'moon_Venus3', true, 1690, 2);
INSERT INTO public.moon VALUES (5, 'moon_Mercury', true, 1900, 1);
INSERT INTO public.moon VALUES (6, 'moon_Mercury2', true, 1900, 1);
INSERT INTO public.moon VALUES (7, 'moon_Saturn', false, 1886, 6);
INSERT INTO public.moon VALUES (8, 'moon_Saturn2', false, 1886, 6);
INSERT INTO public.moon VALUES (9, 'moon_Saturn3', true, 1886, 6);
INSERT INTO public.moon VALUES (10, 'moon_Saturn4', true, 1887, 6);
INSERT INTO public.moon VALUES (11, 'moon_Mars', false, 1777, 4);
INSERT INTO public.moon VALUES (12, 'moon_Mars2', false, 1778, 4);
INSERT INTO public.moon VALUES (13, 'moon_Uranus', false, 1901, 7);
INSERT INTO public.moon VALUES (14, 'moon_Uranus2', false, 1901, 7);
INSERT INTO public.moon VALUES (15, 'moon_Jupiter', false, 1905, 5);
INSERT INTO public.moon VALUES (16, 'moon_Jupiter2', false, 1905, 5);
INSERT INTO public.moon VALUES (17, 'moon_Jupiter3', true, 1855, 5);
INSERT INTO public.moon VALUES (18, 'moon_Jupiter4', true, 1856, 5);
INSERT INTO public.moon VALUES (19, 'moon_Neptune', true, 1956, 8);
INSERT INTO public.moon VALUES (20, 'moon_Neptune2', true, 1956, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 1610, 4880.00, 2);
INSERT INTO public.planet VALUES (4, 'Mars', false, 1609, 6779.00, 2);
INSERT INTO public.planet VALUES (3, 'Earth', true, 1543, 12742.00, 2);
INSERT INTO public.planet VALUES (2, 'Venus', false, 1610, 12104.00, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 1610, 139820.00, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 1610, 116460.00, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 1846, 49244.00, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 1781, 50724.00, 2);
INSERT INTO public.planet VALUES (9, 'Dummy1', false, 2024, 11111.00, 1);
INSERT INTO public.planet VALUES (10, 'Dummy2', false, 2024, 22222.00, 3);
INSERT INTO public.planet VALUES (11, 'Dummy3', false, 2024, 33333.00, 4);
INSERT INTO public.planet VALUES (12, 'Dummy4', false, 2024, 44444.00, 5);


--
-- Data for Name: planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moon VALUES (1, 3, 1, NULL);
INSERT INTO public.planet_moon VALUES (2, 2, 2, NULL);
INSERT INTO public.planet_moon VALUES (3, 2, 3, NULL);
INSERT INTO public.planet_moon VALUES (4, 2, 4, NULL);
INSERT INTO public.planet_moon VALUES (5, 1, 5, NULL);
INSERT INTO public.planet_moon VALUES (6, 1, 6, NULL);
INSERT INTO public.planet_moon VALUES (7, 6, 7, NULL);
INSERT INTO public.planet_moon VALUES (8, 6, 8, NULL);
INSERT INTO public.planet_moon VALUES (9, 6, 9, NULL);
INSERT INTO public.planet_moon VALUES (10, 6, 10, NULL);
INSERT INTO public.planet_moon VALUES (11, 4, 11, NULL);
INSERT INTO public.planet_moon VALUES (12, 4, 12, NULL);
INSERT INTO public.planet_moon VALUES (13, 7, 13, NULL);
INSERT INTO public.planet_moon VALUES (14, 7, 14, NULL);
INSERT INTO public.planet_moon VALUES (15, 5, 15, NULL);
INSERT INTO public.planet_moon VALUES (16, 5, 16, NULL);
INSERT INTO public.planet_moon VALUES (17, 5, 17, NULL);
INSERT INTO public.planet_moon VALUES (18, 5, 18, NULL);
INSERT INTO public.planet_moon VALUES (19, 8, 19, NULL);
INSERT INTO public.planet_moon VALUES (20, 9, 20, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sun', 1930, 4603, 8);
INSERT INTO public.star VALUES (1, 'Alpheratz', 1781, 60, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1836, 450, 8);
INSERT INTO public.star VALUES (3, 'Vega', 1838, 450, 8);
INSERT INTO public.star VALUES (5, 'HA 140283', 1912, 13700, 8);
INSERT INTO public.star VALUES (6, 'Aldebaran', 1782, 6500, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_moon_planet_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moon_planet_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_moon planet_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_pkey PRIMARY KEY (planet_moon_id);


--
-- Name: planet_moon planet_moon_planet_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_moon_planet_moon_id_key UNIQUE (planet_moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

