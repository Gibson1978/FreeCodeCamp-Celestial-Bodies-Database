--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: constellations; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellations (
    constellations_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_zodiac boolean
);


ALTER TABLE public.constellations OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellations_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellations_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellations_constellation_id_seq OWNED BY public.constellations.constellations_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    magnitude numeric(6,2),
    description text,
    constellation_id integer
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
    planet_id integer,
    meaning text,
    magnitude numeric(4,1)
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
    star_id integer,
    habitable boolean,
    color character varying(50),
    number_of_moon integer
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
    galaxy_id integer,
    name character varying(50) NOT NULL,
    lifecycle character varying(50),
    age_in_million_years integer
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
-- Name: constellations constellations_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations ALTER COLUMN constellations_id SET DEFAULT nextval('public.constellations_constellation_id_seq'::regclass);


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
-- Data for Name: constellations; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellations VALUES (1, 'Andromeda', false);
INSERT INTO public.constellations VALUES (2, 'Dorado', false);
INSERT INTO public.constellations VALUES (3, 'Triangulum', false);
INSERT INTO public.constellations VALUES (4, 'Leo', true);
INSERT INTO public.constellations VALUES (5, 'Virgo', true);
INSERT INTO public.constellations VALUES (6, 'Caelum', false);
INSERT INTO public.constellations VALUES (7, 'Gemini', true);
INSERT INTO public.constellations VALUES (8, 'Sagittarius', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', -26.74, 'The galaxy that contains our Solar System', 8);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 3.44, 'The nearest major galaxy to the Milky Way', 1);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 0.90, 'A satellite dwarf galaxy of the Milky Way', 2);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 5.72, 'The third largest member of the Local Group', 3);
INSERT INTO public.galaxy VALUES (5, 'Messier 66', 8.90, 'An intermediate spiral galaxy', 4);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 9.60, 'A supergiant elliptical galaxy', 5);
INSERT INTO public.galaxy VALUES (7, 'Sombrero Galaxy', 8.00, 'Has a bright nucleus and a large central bulge', 5);
INSERT INTO public.galaxy VALUES (8, 'Eye of Sauron', 11.50, 'An intermediate spiral Seyfert galaxy', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earths only natural satellite', -12.7);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Greek god of fear', 11.4);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Greed god of dread', 12.4);
INSERT INTO public.moon VALUES (4, 'Ananke', 5, 'Personification of inevitability', 18.9);
INSERT INTO public.moon VALUES (5, 'Praxidike', 5, 'Goddess of exact justice', 21.2);
INSERT INTO public.moon VALUES (6, 'Herse', 5, 'Goddess of the morning dew', 22.8);
INSERT INTO public.moon VALUES (7, 'Carme', 5, 'Mother of Britomartis', 17.6);
INSERT INTO public.moon VALUES (8, 'Erinome', 5, 'Lover of Jupiter in myth', 22.8);
INSERT INTO public.moon VALUES (9, 'Titan', 6, 'The Titans of Greed Mythology', 8.2);
INSERT INTO public.moon VALUES (10, 'Prometheus', 6, 'Titan who stole fire', 15.8);
INSERT INTO public.moon VALUES (11, 'Calypso', 6, 'Nymph who held Odysseus', 18.7);
INSERT INTO public.moon VALUES (12, 'Polydeuces', 6, 'Brother of Castor', 21.7);
INSERT INTO public.moon VALUES (13, 'Ariel', 7, 'A spirit of the air', 14.2);
INSERT INTO public.moon VALUES (14, 'Oberon', 7, 'King of the Fairies', 14.1);
INSERT INTO public.moon VALUES (15, 'Juliet', 7, 'Heroine of a play from Shakespeare', 22.6);
INSERT INTO public.moon VALUES (16, 'Cupid', 7, 'Roman god of love', 26.0);
INSERT INTO public.moon VALUES (17, 'Despina', 8, 'Nymph, daughter of Poseidon', 22.0);
INSERT INTO public.moon VALUES (18, 'Larissa', 8, 'Lover of Poseidon', 21.5);
INSERT INTO public.moon VALUES (19, 'Triton', 8, 'Son of Poseidon', 13.5);
INSERT INTO public.moon VALUES (20, 'Hippocamp', 8, 'Sea monster from Greek myth', 25.9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, 'Gray', 0);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, 'Yellow', 0);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, 'Blue', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, 'Red', 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, 'Brown', 95);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, 'Pale Yellow', 146);
INSERT INTO public.planet VALUES (7, 'Unranus', 1, false, 'Light Blue', 28);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, 'Deep Blue', 16);
INSERT INTO public.planet VALUES (9, 'K2-416 b', 7, false, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'K2-417 b', 8, false, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1b', 2, false, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 2, false, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'Main Sequence', 4600);
INSERT INTO public.star VALUES (2, 1, 'TRAPPIST-1', 'Red Dwarf', 7600);
INSERT INTO public.star VALUES (3, 1, 'Ascella', 'Main Sequence', 140);
INSERT INTO public.star VALUES (4, 3, 'R125a1', 'Wolf-Rayet', 1);
INSERT INTO public.star VALUES (5, 1, 'Pomehi', 'Main Sequence', 700);
INSERT INTO public.star VALUES (6, 5, 'SN 1989B', 'Supernova', 0);
INSERT INTO public.star VALUES (7, 1, 'K2-416', 'Red Dwarf', 2000);
INSERT INTO public.star VALUES (8, 1, 'K2-417', 'Red Dwarf', 2000);


--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellations_constellation_id_seq', 8, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: constellations constellations_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT constellations_name_key UNIQUE (name);


--
-- Name: constellations constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (constellations_id);


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

