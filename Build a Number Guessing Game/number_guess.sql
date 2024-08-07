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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: game_play_history; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game_play_history (
    game_id integer NOT NULL,
    player_id integer NOT NULL,
    number_of_guess integer NOT NULL
);


ALTER TABLE public.game_play_history OWNER TO freecodecamp;

--
-- Name: game_play_history_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_play_history_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_play_history_game_id_seq OWNER TO freecodecamp;

--
-- Name: game_play_history_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_play_history_game_id_seq OWNED BY public.game_play_history.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    name character varying(22) NOT NULL,
    player_id integer NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: game_play_history game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_play_history ALTER COLUMN game_id SET DEFAULT nextval('public.game_play_history_game_id_seq'::regclass);


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: game_play_history; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game_play_history VALUES (1, 1, 289);
INSERT INTO public.game_play_history VALUES (2, 1, 727);
INSERT INTO public.game_play_history VALUES (3, 2, 352);
INSERT INTO public.game_play_history VALUES (4, 2, 507);
INSERT INTO public.game_play_history VALUES (5, 1, 517);
INSERT INTO public.game_play_history VALUES (6, 1, 657);
INSERT INTO public.game_play_history VALUES (7, 1, 700);
INSERT INTO public.game_play_history VALUES (8, 3, 878);
INSERT INTO public.game_play_history VALUES (9, 3, 831);
INSERT INTO public.game_play_history VALUES (10, 4, 165);
INSERT INTO public.game_play_history VALUES (11, 4, 160);
INSERT INTO public.game_play_history VALUES (12, 3, 174);
INSERT INTO public.game_play_history VALUES (13, 3, 771);
INSERT INTO public.game_play_history VALUES (14, 3, 137);
INSERT INTO public.game_play_history VALUES (15, 5, 413);
INSERT INTO public.game_play_history VALUES (16, 5, 82);
INSERT INTO public.game_play_history VALUES (17, 6, 984);
INSERT INTO public.game_play_history VALUES (18, 6, 474);
INSERT INTO public.game_play_history VALUES (19, 5, 484);
INSERT INTO public.game_play_history VALUES (20, 5, 977);
INSERT INTO public.game_play_history VALUES (21, 5, 208);
INSERT INTO public.game_play_history VALUES (22, 7, 523);
INSERT INTO public.game_play_history VALUES (23, 7, 265);
INSERT INTO public.game_play_history VALUES (24, 8, 498);
INSERT INTO public.game_play_history VALUES (25, 8, 67);
INSERT INTO public.game_play_history VALUES (26, 7, 160);
INSERT INTO public.game_play_history VALUES (27, 7, 991);
INSERT INTO public.game_play_history VALUES (28, 7, 711);
INSERT INTO public.game_play_history VALUES (29, 9, 14);
INSERT INTO public.game_play_history VALUES (30, 9, 663);
INSERT INTO public.game_play_history VALUES (31, 10, 201);
INSERT INTO public.game_play_history VALUES (32, 10, 166);
INSERT INTO public.game_play_history VALUES (33, 9, 413);
INSERT INTO public.game_play_history VALUES (34, 9, 7);
INSERT INTO public.game_play_history VALUES (35, 9, 151);
INSERT INTO public.game_play_history VALUES (36, 11, 304);
INSERT INTO public.game_play_history VALUES (37, 11, 670);
INSERT INTO public.game_play_history VALUES (38, 12, 996);
INSERT INTO public.game_play_history VALUES (39, 12, 384);
INSERT INTO public.game_play_history VALUES (40, 11, 543);
INSERT INTO public.game_play_history VALUES (41, 11, 838);
INSERT INTO public.game_play_history VALUES (42, 11, 361);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES ('user_1723021178076', 1);
INSERT INTO public.players VALUES ('user_1723021178075', 2);
INSERT INTO public.players VALUES ('user_1723021246243', 3);
INSERT INTO public.players VALUES ('user_1723021246242', 4);
INSERT INTO public.players VALUES ('user_1723021274249', 5);
INSERT INTO public.players VALUES ('user_1723021274248', 6);
INSERT INTO public.players VALUES ('user_1723021324441', 7);
INSERT INTO public.players VALUES ('user_1723021324440', 8);
INSERT INTO public.players VALUES ('user_1723021332599', 9);
INSERT INTO public.players VALUES ('user_1723021332598', 10);
INSERT INTO public.players VALUES ('user_1723021355055', 11);
INSERT INTO public.players VALUES ('user_1723021355054', 12);


--
-- Name: game_play_history_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_play_history_game_id_seq', 42, true);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 12, true);


--
-- Name: game_play_history game_play_history_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_play_history
    ADD CONSTRAINT game_play_history_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: game_play_history game_play_history_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_play_history
    ADD CONSTRAINT game_play_history_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- PostgreSQL database dump complete
--

