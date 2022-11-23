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
-- Name: constelation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constelation (
    constelation_id integer NOT NULL,
    name character varying(20) NOT NULL,
    culture character varying(15)
);


ALTER TABLE public.constelation OWNER TO freecodecamp;

--
-- Name: constelation_constelation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constelation_constelation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constelation_constelation_id_seq OWNER TO freecodecamp;

--
-- Name: constelation_constelation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constelation_constelation_id_seq OWNED BY public.constelation.constelation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    type_galaxy_id integer NOT NULL,
    image_url text,
    constelation_id integer,
    diameter_in_yl numeric(5,2),
    right_ascension character varying(25) NOT NULL,
    declination character varying(25) NOT NULL
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
    planet_id integer NOT NULL,
    image_url text,
    diameter_in_yl numeric(5,2),
    year_of_discovery integer
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
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    image_url text,
    has_rings boolean,
    year_of_discovery integer,
    type_planet_id integer NOT NULL,
    its_habitable boolean NOT NULL
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
    name character varying(20) NOT NULL,
    galaxy_id integer NOT NULL,
    image_url text,
    solar_mass numeric(5,2) NOT NULL
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
-- Name: type_galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.type_galaxy (
    type_galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    abbreviation character varying(7)
);


ALTER TABLE public.type_galaxy OWNER TO freecodecamp;

--
-- Name: type_galaxy_type_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.type_galaxy_type_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_galaxy_type_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: type_galaxy_type_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.type_galaxy_type_galaxy_id_seq OWNED BY public.type_galaxy.type_galaxy_id;


--
-- Name: type_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.type_planet (
    type_planet_id integer NOT NULL,
    name character varying(25) NOT NULL,
    abreviation character varying(5)
);


ALTER TABLE public.type_planet OWNER TO freecodecamp;

--
-- Name: type_planet_type_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.type_planet_type_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_planet_type_planet_id_seq OWNER TO freecodecamp;

--
-- Name: type_planet_type_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.type_planet_type_planet_id_seq OWNED BY public.type_planet.type_planet_id;


--
-- Name: constelation constelation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constelation ALTER COLUMN constelation_id SET DEFAULT nextval('public.constelation_constelation_id_seq'::regclass);


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
-- Name: type_galaxy type_galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_galaxy ALTER COLUMN type_galaxy_id SET DEFAULT nextval('public.type_galaxy_type_galaxy_id_seq'::regclass);


--
-- Name: type_planet type_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_planet ALTER COLUMN type_planet_id SET DEFAULT nextval('public.type_planet_type_planet_id_seq'::regclass);


--
-- Data for Name: constelation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constelation VALUES (1, 'Sagitario', NULL);
INSERT INTO public.constelation VALUES (2, 'Andromeda', NULL);
INSERT INTO public.constelation VALUES (3, 'Escorpio', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', 1, NULL, NULL, NULL, '17° 45′ 40.03599″', '−29° 00′ 28.1699″');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 4, NULL, NULL, NULL, '0° 42′ 44.3″', '+41° 16′ 09″');
INSERT INTO public.galaxy VALUES (3, 'Messier 58', 4, NULL, NULL, NULL, '12° 37.7′ 0″', '+11° 49′ 0″');
INSERT INTO public.galaxy VALUES (4, 'Messier 100', 4, NULL, NULL, NULL, '12° 22′ 54.9″', '+15° 49′ 21″');
INSERT INTO public.galaxy VALUES (5, 'NGC 3184', 4, NULL, NULL, NULL, '10° 18′ 17″', '+41° 25′ 27″');
INSERT INTO public.galaxy VALUES (6, 'NGC 7479', 1, NULL, NULL, NULL, '23° 04′ 56.6″', '+21° 19′ 22″');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Fobos', 2, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Ganymede', 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Io', 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Europa', 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Himalia', 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Amaltea', 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Calisto', 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Elara', 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Sinope', 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Lysithea', 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Carme', 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Ananke', 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Leda', 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Thebe', 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Adrastea', 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Callirhoe', 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Temisto', 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Metis', 4, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tierra', 1, NULL, NULL, NULL, 1, false);
INSERT INTO public.planet VALUES (2, 'Marte', 1, NULL, NULL, NULL, 1, false);
INSERT INTO public.planet VALUES (3, 'Venus', 1, NULL, NULL, NULL, 1, false);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, NULL, NULL, NULL, 1, false);
INSERT INTO public.planet VALUES (5, 'Saturno', 1, NULL, NULL, NULL, 2, false);
INSERT INTO public.planet VALUES (6, 'Neptuno', 1, NULL, NULL, NULL, 1, false);
INSERT INTO public.planet VALUES (7, 'Urano', 1, NULL, NULL, NULL, 2, false);
INSERT INTO public.planet VALUES (8, 'Mercurio', 1, NULL, NULL, NULL, 1, false);
INSERT INTO public.planet VALUES (9, 'Urano C-137', 1, NULL, NULL, NULL, 2, false);
INSERT INTO public.planet VALUES (10, 'Mercurio c-214', 1, NULL, NULL, NULL, 1, false);
INSERT INTO public.planet VALUES (11, 'Tierra C-101', 1, NULL, NULL, NULL, 1, false);
INSERT INTO public.planet VALUES (12, 'Marte C-423', 1, NULL, NULL, NULL, 1, false);
INSERT INTO public.planet VALUES (13, 'Venus C-223', 1, NULL, NULL, NULL, 1, false);
INSERT INTO public.planet VALUES (14, 'Jupiter C-964', 1, NULL, NULL, NULL, 1, false);
INSERT INTO public.planet VALUES (15, 'Saturno C-500', 1, NULL, NULL, NULL, 2, false);
INSERT INTO public.planet VALUES (16, 'Neptuno C-888', 1, NULL, NULL, NULL, 1, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Titawin', 2, NULL, 1.28);
INSERT INTO public.star VALUES (2, 'Westerlund 1-26', 1, NULL, 750.00);
INSERT INTO public.star VALUES (3, 'Osa mayor', 1, NULL, 0.50);
INSERT INTO public.star VALUES (4, 'Osa menoor', 1, NULL, 0.25);
INSERT INTO public.star VALUES (5, 'bart simpson', 1, NULL, 0.10);
INSERT INTO public.star VALUES (6, 'Voyager', 3, NULL, 5.00);


--
-- Data for Name: type_galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.type_galaxy VALUES (2, 'Irregular', NULL);
INSERT INTO public.type_galaxy VALUES (3, 'Eliptica', NULL);
INSERT INTO public.type_galaxy VALUES (1, 'Espiral barrada', NULL);
INSERT INTO public.type_galaxy VALUES (4, 'Espiral', NULL);


--
-- Data for Name: type_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.type_planet VALUES (1, 'Rocoso', NULL);
INSERT INTO public.type_planet VALUES (2, 'Gaseoso', NULL);
INSERT INTO public.type_planet VALUES (3, 'Gigante de hielo', NULL);
INSERT INTO public.type_planet VALUES (4, 'Enano', NULL);


--
-- Name: constelation_constelation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constelation_constelation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: type_galaxy_type_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.type_galaxy_type_galaxy_id_seq', 4, true);


--
-- Name: type_planet_type_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.type_planet_type_planet_id_seq', 4, true);


--
-- Name: constelation constelation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constelation
    ADD CONSTRAINT constelation_name_key UNIQUE (name);


--
-- Name: constelation constelation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constelation
    ADD CONSTRAINT constelation_pkey PRIMARY KEY (constelation_id);


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
-- Name: type_galaxy type_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_galaxy
    ADD CONSTRAINT type_galaxy_name_key UNIQUE (name);


--
-- Name: type_galaxy type_galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_galaxy
    ADD CONSTRAINT type_galaxy_pkey PRIMARY KEY (type_galaxy_id);


--
-- Name: type_planet type_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_planet
    ADD CONSTRAINT type_planet_name_key UNIQUE (name);


--
-- Name: type_planet type_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_planet
    ADD CONSTRAINT type_planet_pkey PRIMARY KEY (type_planet_id);


--
-- Name: galaxy galaxy_constelation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constelation_id_fkey FOREIGN KEY (constelation_id) REFERENCES public.constelation(constelation_id);


--
-- Name: galaxy galaxy_type_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type_galaxy_id_fkey FOREIGN KEY (type_galaxy_id) REFERENCES public.type_galaxy(type_galaxy_id);


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
-- Name: planet planet_type_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_type_planet_id_fkey FOREIGN KEY (type_planet_id) REFERENCES public.type_planet(type_planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

