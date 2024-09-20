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
    name character varying(30) NOT NULL,
    description text,
    age_in_billion_years numeric,
    morphology_id integer
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
    name character varying(20) NOT NULL,
    planet_id integer,
    gravity_in_ms numeric NOT NULL,
    orbital_period_in_days integer
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
-- Name: morphology; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.morphology (
    morphology_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.morphology OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    num_of_moons integer NOT NULL,
    orbital_period_in_days integer,
    radius_in_miles numeric,
    has_moon boolean,
    is_habitable boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    age integer,
    temperature numeric NOT NULL
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that contains our Solar System.', 13.6, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest spiral galaxy to the Milky Way.', 10.0, 1);
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy', 'A spiral galaxy with a bright nucleus and a prominent dust lane.', 10.0, 1);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'An enormous elliptical galaxy known for its supermassive black hole.', 13.2, 2);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'An irregular galaxy that is a satellite of the Milky Way.', 3.0, 3);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'A classic spiral galaxy known for its beautiful structure.', 1.0, 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 1.62, 27);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 0.0037, 0);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 0.0014, 1);
INSERT INTO public.moon VALUES (4, 'Io', 3, 1.79, 2);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 1.31, 4);
INSERT INTO public.moon VALUES (6, 'Titan', 4, 1.35, 16);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 1.24, 17);
INSERT INTO public.moon VALUES (8, 'Rhea', 4, 0.264, 5);
INSERT INTO public.moon VALUES (9, 'Titania', 5, 0.346, 9);
INSERT INTO public.moon VALUES (10, 'Oberon', 5, 0.357, 14);
INSERT INTO public.moon VALUES (11, 'Miranda', 5, 0.079, 1);
INSERT INTO public.moon VALUES (12, 'Iapetus', 4, 0.223, 79);
INSERT INTO public.moon VALUES (13, 'Enceladus', 4, 0.113, 1);
INSERT INTO public.moon VALUES (14, 'Triton', 5, 0.778, 6);
INSERT INTO public.moon VALUES (15, 'Charon', 6, 0.288, 6);
INSERT INTO public.moon VALUES (16, 'Thebe', 3, 0.003, 1);
INSERT INTO public.moon VALUES (17, 'Mimas', 4, 0.058, 1);
INSERT INTO public.moon VALUES (18, 'Dione', 4, 0.256, 3);
INSERT INTO public.moon VALUES (19, 'Hyperion', 4, 0.088, 21);
INSERT INTO public.moon VALUES (20, 'Phoebe', 4, 0.074, 551);


--
-- Data for Name: morphology; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.morphology VALUES (1, 'Spiral', 'A galaxy with a spiral structure, characterized by winding arms.');
INSERT INTO public.morphology VALUES (2, 'Elliptical', 'A smooth, featureless galaxy shaped like an ellipse.');
INSERT INTO public.morphology VALUES (3, 'Irregular', 'Galaxies that lack a distinct shape or structure.');
INSERT INTO public.morphology VALUES (4, 'Lenticular', 'A galaxy with a lens-like shape, intermediate between spiral and elliptical.');
INSERT INTO public.morphology VALUES (5, 'Barred Spiral', 'A spiral galaxy with a central bar-shaped structure.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, 365, 3959, true, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 2, 687, 3389.5, true, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 2, 79, 4333, 43982, true, false);
INSERT INTO public.planet VALUES (4, 'Saturn', 2, 82, 10585, 36184, true, false);
INSERT INTO public.planet VALUES (5, 'Venus', 1, 0, 225, 7521, false, false);
INSERT INTO public.planet VALUES (6, 'Mercury', 1, 0, 88, 3031, false, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 2, 27, 365, 15759, true, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 2, 14, 165, 15329, true, false);
INSERT INTO public.planet VALUES (9, 'Proxima b', 3, 0, 11, 6400, false, true);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 4, 0, 130, 7100, false, true);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 5, 0, 37, 6500, false, true);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 6, 0, 13, 4800, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, 200, 9940);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 10, 3500);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 2, 5, 3042);
INSERT INTO public.star VALUES (4, 'Vega', 1, 455, 9602);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 2, 6, 5790);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 8, 12100);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


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
-- Name: morphology morphology_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.morphology
    ADD CONSTRAINT morphology_description_key UNIQUE (description);


--
-- Name: morphology morphology_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.morphology
    ADD CONSTRAINT morphology_pkey PRIMARY KEY (morphology_id);


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
-- Name: galaxy galaxy_morphology_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_morphology_id_fkey FOREIGN KEY (morphology_id) REFERENCES public.morphology(morphology_id);


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

