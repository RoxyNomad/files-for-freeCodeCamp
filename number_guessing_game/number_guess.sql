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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (61, 'user_1736508790805', 1, 623);
INSERT INTO public.users VALUES (17, 'user_1736505605065', 2, 73);
INSERT INTO public.users VALUES (1, 'Roxy', 8, 6);
INSERT INTO public.users VALUES (3, 'user_1736504447778', 2, 731);
INSERT INTO public.users VALUES (62, 'user_1736508790804', 1, 746);
INSERT INTO public.users VALUES (29, 'user_1736506574964', 2, 540);
INSERT INTO public.users VALUES (16, 'user_1736505605066', 5, 23);
INSERT INTO public.users VALUES (2, 'user_1736504447779', 5, 292);
INSERT INTO public.users VALUES (107, 'user_1736520221937', 5, 50);
INSERT INTO public.users VALUES (28, 'user_1736506574965', 5, 80);
INSERT INTO public.users VALUES (5, 'user_1736504583879', 2, 489);
INSERT INTO public.users VALUES (19, 'user_1736505943526', 2, 135);
INSERT INTO public.users VALUES (4, 'user_1736504583880', 5, 569);
INSERT INTO public.users VALUES (18, 'user_1736505943527', 5, 491);
INSERT INTO public.users VALUES (7, 'user_1736504992771', 2, 387);
INSERT INTO public.users VALUES (31, 'user_1736506726102', 2, 106);
INSERT INTO public.users VALUES (6, 'user_1736504992772', 5, 332);
INSERT INTO public.users VALUES (64, 'user_1736509053793', 2, 402);
INSERT INTO public.users VALUES (21, 'user_1736506109838', 2, 892);
INSERT INTO public.users VALUES (30, 'user_1736506726103', 5, 28);
INSERT INTO public.users VALUES (10, 'user_1736505204119', 2, 550);
INSERT INTO public.users VALUES (20, 'user_1736506109839', 5, 577);
INSERT INTO public.users VALUES (83, 'user_1736510199182', 1, 430);
INSERT INTO public.users VALUES (63, 'user_1736509053794', 5, 231);
INSERT INTO public.users VALUES (8, 'user_1736505204120', 5, 146);
INSERT INTO public.users VALUES (23, 'user_1736506148077', 2, 228);
INSERT INTO public.users VALUES (97, 'user_1736519833670', 2, 559);
INSERT INTO public.users VALUES (33, 'user_1736507186449', 2, 850);
INSERT INTO public.users VALUES (22, 'user_1736506148078', 5, 459);
INSERT INTO public.users VALUES (110, 'user_1736520835274', 2, 480);
INSERT INTO public.users VALUES (32, 'user_1736507186450', 5, 60);
INSERT INTO public.users VALUES (25, 'user_1736506188983', 2, 14);
INSERT INTO public.users VALUES (96, 'user_1736519833671', 5, 126);
INSERT INTO public.users VALUES (24, 'user_1736506188984', 5, 69);
INSERT INTO public.users VALUES (98, 'user_1736519855410', 0, 9999);
INSERT INTO public.users VALUES (99, 'user_1736519855409', 0, 9999);
INSERT INTO public.users VALUES (66, 'user_1736509163662', 2, 275);
INSERT INTO public.users VALUES (35, 'user_1736507349527', 2, 198);
INSERT INTO public.users VALUES (81, 'user_1736510199183', 1, 535);
INSERT INTO public.users VALUES (27, 'user_1736506328879', 2, 510);
INSERT INTO public.users VALUES (65, 'user_1736509163663', 5, 212);
INSERT INTO public.users VALUES (26, 'user_1736506328880', 5, 164);
INSERT INTO public.users VALUES (34, 'user_1736507349528', 5, 124);
INSERT INTO public.users VALUES (37, 'user_1736507578561', 2, 112);
INSERT INTO public.users VALUES (109, 'user_1736520835275', 5, 66);
INSERT INTO public.users VALUES (89, 'user_1736513496203', 2, 526);
INSERT INTO public.users VALUES (36, 'user_1736507578562', 5, 222);
INSERT INTO public.users VALUES (124, 'user_1736521637475', 2, 683);
INSERT INTO public.users VALUES (101, 'user_1736519966594', 2, 344);
INSERT INTO public.users VALUES (59, 'user_1736508538995', 1, 142);
INSERT INTO public.users VALUES (69, 'user_1736509246213', 1, 919);
INSERT INTO public.users VALUES (60, 'user_1736508538994', 1, 12);
INSERT INTO public.users VALUES (118, 'user_1736521584057', 2, 29);
INSERT INTO public.users VALUES (88, 'user_1736513496204', 5, 55);
INSERT INTO public.users VALUES (130, 'user_1736521837606', 2, 81);
INSERT INTO public.users VALUES (100, 'user_1736519966595', 5, 45);
INSERT INTO public.users VALUES (67, 'user_1736509246214', 1, 887);
INSERT INTO public.users VALUES (123, 'user_1736521637476', 5, 118);
INSERT INTO public.users VALUES (91, 'user_1736513720473', 2, 734);
INSERT INTO public.users VALUES (112, 'user_1736520938602', 2, 112);
INSERT INTO public.users VALUES (90, 'user_1736513720474', 5, 114);
INSERT INTO public.users VALUES (117, 'user_1736521584058', 5, 147);
INSERT INTO public.users VALUES (76, 'user_1736509464285', 1, 850);
INSERT INTO public.users VALUES (103, 'user_1736519969802', 2, 669);
INSERT INTO public.users VALUES (111, 'user_1736520938603', 5, 74);
INSERT INTO public.users VALUES (102, 'user_1736519969803', 5, 22);
INSERT INTO public.users VALUES (74, 'user_1736509464286', 1, 587);
INSERT INTO public.users VALUES (93, 'user_1736513774859', 2, 114);
INSERT INTO public.users VALUES (92, 'user_1736513774860', 5, 60);
INSERT INTO public.users VALUES (105, 'user_1736520134048', 2, 217);
INSERT INTO public.users VALUES (129, 'user_1736521837607', 5, 3);
INSERT INTO public.users VALUES (104, 'user_1736520134049', 5, 60);
INSERT INTO public.users VALUES (95, 'user_1736514088995', 2, 112);
INSERT INTO public.users VALUES (114, 'user_1736521031531', 2, 42);
INSERT INTO public.users VALUES (106, 'Roxana', 1, 14);
INSERT INTO public.users VALUES (94, 'user_1736514088996', 5, 103);
INSERT INTO public.users VALUES (120, 'user_1736521611836', 2, 170);
INSERT INTO public.users VALUES (126, 'user_1736521656113', 2, 622);
INSERT INTO public.users VALUES (113, 'user_1736521031532', 5, 18);
INSERT INTO public.users VALUES (108, 'user_1736520221936', 2, 461);
INSERT INTO public.users VALUES (119, 'user_1736521611837', 5, 26);
INSERT INTO public.users VALUES (125, 'user_1736521656114', 5, 7);
INSERT INTO public.users VALUES (116, 'user_1736521415423', 2, 52);
INSERT INTO public.users VALUES (115, 'user_1736521415424', 5, 24);
INSERT INTO public.users VALUES (122, 'user_1736521627127', 2, 492);
INSERT INTO public.users VALUES (121, 'user_1736521627128', 5, 348);
INSERT INTO public.users VALUES (128, 'user_1736521665910', 2, 214);
INSERT INTO public.users VALUES (127, 'user_1736521665911', 5, 126);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 130, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

