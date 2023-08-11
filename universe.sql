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
    name character varying(30) NOT NULL,
    apparent_mag numeric(3,1),
    distance integer,
    no_of_stars integer,
    visible boolean,
    bigger_than_sun boolean,
    description text
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
    name character varying(30) NOT NULL,
    lat numeric(4,2),
    valley_dim integer,
    diameter integer,
    has_craters boolean,
    has_valley boolean,
    description text,
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
    name character varying(30) NOT NULL,
    no_of_satellites integer,
    relative_size_to_earth integer,
    distance_from_sun_in_m numeric(3,2),
    has_life boolean,
    is_spherical boolean,
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_galaxy_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_moons; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moons (
    planet_moons_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_moons OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    right_asc numeric(3,2),
    area integer,
    main_stars integer,
    symbolic_name boolean,
    meteor_shower boolean,
    description text,
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

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_galaxy_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', -6.5, 0, 400, true, true, 'This is the milky way');
INSERT INTO public.galaxy VALUES (2, 'Margellic cloud', -7.5, 24, 1400, true, false, 'This is the lage margellic cloud');
INSERT INTO public.galaxy VALUES (3, 'Small Margellic cloud', 4.6, 74, 600, false, false, 'This is the small margellic cloud');
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 67.4, 103, 900, false, true, 'This is the Andromeda galaxy');
INSERT INTO public.galaxy VALUES (5, 'Centaurus', 47.8, 19, 750, false, true, 'This is the centaurus');
INSERT INTO public.galaxy VALUES (6, 'Bode''s galaxy', 44.8, 39, 70, true, true, 'This is the Bode''s Galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Nectar', 2.40, 233, 1211, true, true, 'This is Moon Nectar', 1);
INSERT INTO public.moon VALUES (2, 'Valhala', 1.40, 543, 341, false, true, 'This is Moon Valhala', 1);
INSERT INTO public.moon VALUES (3, 'erwgf', 1.40, 543, 341, false, true, 'This is Moon asdffr', 2);
INSERT INTO public.moon VALUES (4, 'jfgh', 1.40, 543, 341, false, true, 'This is Moon hjg', 2);
INSERT INTO public.moon VALUES (5, 'dfvdfggf', 1.40, 543, 341, false, true, 'This is Moon dghfughf', 3);
INSERT INTO public.moon VALUES (6, 'dfvdkhf', 1.40, 543, 341, false, true, 'This is Moon dgfhdhjg', 3);
INSERT INTO public.moon VALUES (7, 'fdsghhf', 1.40, 543, 341, false, true, 'This is Moon dgfhdfgdg', 4);
INSERT INTO public.moon VALUES (8, 'nh cbfgs', 1.40, 543, 341, false, true, 'This is Moon rfdgag', 4);
INSERT INTO public.moon VALUES (9, 'nbcdfgs', 1.40, 543, 341, false, true, 'This is Moon dfbgag', 5);
INSERT INTO public.moon VALUES (10, 'zasfgs', 1.40, 543, 341, false, true, 'This is Moon dfbgag', 5);
INSERT INTO public.moon VALUES (11, 'wpedffgs', 1.40, 543, 341, false, true, 'This is Moon askfl', 6);
INSERT INTO public.moon VALUES (12, 'qasdffgs', 1.40, 543, 341, false, true, 'This is Moon asqa', 6);
INSERT INTO public.moon VALUES (13, 'yauxjc', 1.40, 543, 341, false, true, 'This is Moon ysqa', 7);
INSERT INTO public.moon VALUES (14, 'cvuxjc', 1.40, 543, 341, false, true, 'This is Moon ysqa', 7);
INSERT INTO public.moon VALUES (15, 'xzxcmf', 1.40, 543, 341, false, true, 'This is Moon ysqa', 8);
INSERT INTO public.moon VALUES (16, 'ibvcmf', 1.40, 543, 341, false, true, 'This is Moon fsqa', 8);
INSERT INTO public.moon VALUES (18, 'ibvf', 1.40, 543, 341, false, true, 'This is Moon fsqa', 9);
INSERT INTO public.moon VALUES (19, 'defghvf', 1.40, 543, 341, false, true, 'This is Moon cvbsqa', 11);
INSERT INTO public.moon VALUES (20, 'pasldf', 1.40, 543, 341, false, true, 'This is Moon cvbsqa', 12);
INSERT INTO public.moon VALUES (21, 'sxasldf', 1.40, 543, 341, false, true, 'This is Moon vbsqa', 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 9, 5.21, false, true, 'This is Mercury', 1);
INSERT INTO public.planet VALUES (3, 'Venus', 0, 4, 6.21, false, true, 'This is Venus', 2);
INSERT INTO public.planet VALUES (4, 'Earth', 1, 1, 2.30, true, true, 'This is Earth', 2);
INSERT INTO public.planet VALUES (5, 'Mars', 7, 29, 2.30, true, true, 'This is Mars', 3);
INSERT INTO public.planet VALUES (6, 'Jupiter', 9, 12, 5.40, false, true, 'This is Jupiter', 3);
INSERT INTO public.planet VALUES (7, 'Saturn', 81, 7, 9.30, false, true, 'This is Saturn', 4);
INSERT INTO public.planet VALUES (9, 'Neptunwe', 12, 56, 4.90, false, true, 'This is Neptune', 5);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 7, 1.30, false, true, 'This is Uranus', 5);
INSERT INTO public.planet VALUES (10, 'Pluto', 12, 56, 4.90, false, true, 'This is Pluto', 6);
INSERT INTO public.planet VALUES (2, 'Vikingas', 12, 56, 4.90, false, true, 'This is Pluto', 6);
INSERT INTO public.planet VALUES (11, 'Pices', 12, 56, 4.90, false, true, 'This is Pices', 6);
INSERT INTO public.planet VALUES (12, 'Saggitarus', 12, 56, 4.90, false, true, 'This is Saggitarus', 1);


--
-- Data for Name: planet_moons; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moons VALUES (1, 'dfvkj', 'shjdbhfdbjdfgsd');
INSERT INTO public.planet_moons VALUES (2, 'weripore', 'jeisfbjkir');
INSERT INTO public.planet_moons VALUES (4, 'fjdvf', 'eiwhouifhrhgtjk');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Lynx', 8.30, 545, 4, true, true, 'This is the Lynx', 1);
INSERT INTO public.star VALUES (2, 'Eridanus', 9.20, 675, 4, true, false, 'This is the Eridanus', 1);
INSERT INTO public.star VALUES (3, 'Cassiopea', 4.70, 100, 67, false, false, 'This is the Cassiopea', 2);
INSERT INTO public.star VALUES (4, 'Scorpius', 5.50, 1009, 67, false, false, 'This is the Scorpius', 3);
INSERT INTO public.star VALUES (5, 'Crux', 1.90, 19, 467, false, true, 'This is the Crux', 4);
INSERT INTO public.star VALUES (6, 'Cancer', 8.20, 58, 294, true, true, 'This is the Cancer', 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_galaxy_id_seq', 12, true);


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
-- Name: planet_moons planet_moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_pkey PRIMARY KEY (planet_moons_id);


--
-- Name: planet_moons planet_moons_planet_moons_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_planet_moons_id_key UNIQUE (planet_moons_id);


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
-- Name: star star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planet_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

