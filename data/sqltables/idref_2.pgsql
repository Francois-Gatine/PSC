--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: nb_duplicated(text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.nb_duplicated(text[]) RETURNS integer
    LANGUAGE sql
    AS $_$                    SELECT                        SUM(CASE                            WHEN idrefs <> ARRAY['''empty'''] AND $1 @> ARRAY[idrefs] THEN 1                            ELSE 0                        END)                    FROM tdu, unnest(idrefs)                $_$;


ALTER FUNCTION public.nb_duplicated(text[]) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bjo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bjo (
    name text,
    idrefs text[],
    newidref boolean DEFAULT false,
    missidref boolean DEFAULT false,
    splitidref boolean DEFAULT false,
    mergeidref boolean DEFAULT false
);


ALTER TABLE public.bjo OWNER TO postgres;

--
-- Name: ceb; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ceb (
    cluster_id integer NOT NULL,
    name character varying(20),
    idref1 character varying(30),
    idref2 character varying(30),
    idref3 character varying(30),
    idref4 character varying(30),
    idref5 character varying(30),
    remain character varying(60),
    newidref boolean DEFAULT false,
    missidref boolean DEFAULT false,
    splitidref boolean DEFAULT false,
    mergeidref boolean DEFAULT false
);


ALTER TABLE public.ceb OWNER TO postgres;

--
-- Name: ddi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ddi (
    name text,
    idrefs text[],
    newidref boolean DEFAULT false,
    missidref boolean DEFAULT false,
    splitidref boolean DEFAULT false,
    mergeidref boolean DEFAULT false
);


ALTER TABLE public.ddi OWNER TO postgres;

--
-- Name: dur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dur (
    name text,
    idrefs text[],
    newidref boolean DEFAULT false,
    missidref boolean DEFAULT false,
    splitidref boolean DEFAULT false,
    mergeidref boolean DEFAULT false
);


ALTER TABLE public.dur OWNER TO postgres;

--
-- Name: ned; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ned (
    name text,
    idrefs text[],
    newidref boolean DEFAULT false,
    missidref boolean DEFAULT false,
    splitidref boolean DEFAULT false,
    mergeidref boolean DEFAULT false
);


ALTER TABLE public.ned OWNER TO postgres;

--
-- Name: nle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nle (
    name text,
    idrefs text[],
    newidref boolean DEFAULT false,
    missidref boolean DEFAULT false,
    splitidref boolean DEFAULT false,
    mergeidref boolean DEFAULT false
);


ALTER TABLE public.nle OWNER TO postgres;

--
-- Name: tdu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tdu (
    name text,
    idrefs text[],
    newidref boolean DEFAULT false,
    missidref boolean DEFAULT false,
    splitidref boolean DEFAULT false,
    mergeidref boolean DEFAULT false
);


ALTER TABLE public.tdu OWNER TO postgres;

--
-- Data for Name: bjo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bjo (name, idrefs, newidref, missidref, splitidref, mergeidref) FROM stdin;
114authorshipRecordCluster.json	{'idref190010584'}	f	f	f	f
121authorshipRecordCluster.json	{'idref174614284'}	f	f	f	f
126authorshipRecordCluster.json	{'idref165602244'}	f	f	f	f
127authorshipRecordCluster.json	{'idref19608122X'}	f	f	f	f
150authorshipRecordCluster.json	{'idref033729735'}	f	f	f	f
162authorshipRecordCluster.json	{'idref030324718'}	f	f	f	f
166authorshipRecordCluster.json	{'idref182696189'}	f	f	f	f
16authorshipRecordCluster.json	{'idref197408761'}	f	f	f	f
209authorshipRecordCluster.json	{'idref055761909'}	f	f	f	f
218authorshipRecordCluster.json	{'idref160729556'}	f	f	f	f
232authorshipRecordCluster.json	{'idref161771343'}	f	f	f	f
120authorshipRecordCluster.json	{'idref068898452'}	f	f	f	t
11authorshipRecordCluster.json	{'idref166218154','empty'}	f	t	f	t
12authorshipRecordCluster.json	{'empty','idref083167226'}	f	t	f	t
143authorshipRecordCluster.json	{'empty','idref176156135'}	f	t	f	t
14authorshipRecordCluster.json	{'empty','idref06996792X'}	f	t	f	t
21authorshipRecordCluster.json	{'idref109335937','empty'}	f	t	f	t
237authorshipRecordCluster.json	{'idref178712949','empty'}	f	t	f	t
13authorshipRecordCluster.json	{'idref144606593','empty','idref147089719'}	f	t	t	t
1authorshipRecordCluster.json	{'idref071455841','empty','idref074601180'}	f	t	t	t
24authorshipRecordCluster.json	{'idref153965908'}	f	f	f	f
274authorshipRecordCluster.json	{'idref186411472'}	f	f	f	f
304authorshipRecordCluster.json	{'idref026939444'}	f	f	f	f
31authorshipRecordCluster.json	{'idref087635410'}	f	f	f	f
345authorshipRecordCluster.json	{'idref111470935'}	f	f	f	f
348authorshipRecordCluster.json	{'idref183431294'}	f	f	f	f
363authorshipRecordCluster.json	{'idref229868991'}	f	f	f	f
36authorshipRecordCluster.json	{'idref167758810'}	f	f	f	f
375authorshipRecordCluster.json	{'idref23567592X'}	f	f	f	f
380authorshipRecordCluster.json	{'idref242791042'}	f	f	f	f
337authorshipRecordCluster.json	{'empty','idref229868991'}	f	t	f	t
35authorshipRecordCluster.json	{'idref160563895','empty'}	f	t	f	t
360authorshipRecordCluster.json	{'empty','idref23849389X'}	f	t	f	t
25authorshipRecordCluster.json	{'idref109335937','empty','idref060157399'}	f	t	t	t
412authorshipRecordCluster.json	{'idref028427513'}	f	f	f	f
43authorshipRecordCluster.json	{'idref160948851'}	f	f	f	f
55authorshipRecordCluster.json	{'idref17972472X'}	f	f	f	f
65authorshipRecordCluster.json	{'idref223700932'}	f	f	f	f
66authorshipRecordCluster.json	{'idref119550857'}	f	f	f	f
247authorshipRecordCluster.json	{'empty'}	t	f	f	f
61authorshipRecordCluster.json	{'idref068898452'}	f	f	f	t
391authorshipRecordCluster.json	{'idref227505514','empty'}	f	t	f	t
394authorshipRecordCluster.json	{'empty','idref123008115'}	f	t	f	t
395authorshipRecordCluster.json	{'empty','idref226133869'}	f	t	f	t
407authorshipRecordCluster.json	{'empty','idref119092832'}	f	t	f	t
411authorshipRecordCluster.json	{'idref075666561','empty'}	f	t	f	t
416authorshipRecordCluster.json	{'empty','idref154176664'}	f	t	f	t
418authorshipRecordCluster.json	{'empty','idref176156135'}	f	t	f	t
42authorshipRecordCluster.json	{'empty','idref172312868'}	f	t	f	t
48authorshipRecordCluster.json	{'idref241074029','empty'}	f	t	f	t
4authorshipRecordCluster.json	{'idref125061161','empty'}	f	t	f	t
50authorshipRecordCluster.json	{'idref235449113','empty'}	f	t	f	t
3authorshipRecordCluster.json	{'empty','idref060157399','idref032086415'}	f	t	t	t
72authorshipRecordCluster.json	{'idref190787163'}	f	f	f	f
78authorshipRecordCluster.json	{'idref186375115'}	f	f	f	f
82authorshipRecordCluster.json	{'idref176489444'}	f	f	f	f
0authorshipRecordCluster.json	{'empty'}	t	f	f	f
100authorshipRecordCluster.json	{'empty'}	t	f	f	f
101authorshipRecordCluster.json	{'empty'}	t	f	f	f
102authorshipRecordCluster.json	{'empty'}	t	f	f	f
106authorshipRecordCluster.json	{'empty'}	t	f	f	f
109authorshipRecordCluster.json	{'empty'}	t	f	f	f
117authorshipRecordCluster.json	{'empty'}	t	f	f	f
118authorshipRecordCluster.json	{'empty'}	t	f	f	f
124authorshipRecordCluster.json	{'empty'}	t	f	f	f
125authorshipRecordCluster.json	{'empty'}	t	f	f	f
131authorshipRecordCluster.json	{'empty'}	t	f	f	f
137authorshipRecordCluster.json	{'empty'}	t	f	f	f
138authorshipRecordCluster.json	{'empty'}	t	f	f	f
139authorshipRecordCluster.json	{'empty'}	t	f	f	f
140authorshipRecordCluster.json	{'empty'}	t	f	f	f
141authorshipRecordCluster.json	{'empty'}	t	f	f	f
144authorshipRecordCluster.json	{'empty'}	t	f	f	f
145authorshipRecordCluster.json	{'empty'}	t	f	f	f
146authorshipRecordCluster.json	{'empty'}	t	f	f	f
147authorshipRecordCluster.json	{'empty'}	t	f	f	f
148authorshipRecordCluster.json	{'empty'}	t	f	f	f
149authorshipRecordCluster.json	{'empty'}	t	f	f	f
153authorshipRecordCluster.json	{'empty'}	t	f	f	f
154authorshipRecordCluster.json	{'empty'}	t	f	f	f
155authorshipRecordCluster.json	{'empty'}	t	f	f	f
160authorshipRecordCluster.json	{'empty'}	t	f	f	f
163authorshipRecordCluster.json	{'empty'}	t	f	f	f
164authorshipRecordCluster.json	{'empty'}	t	f	f	f
173authorshipRecordCluster.json	{'empty'}	t	f	f	f
176authorshipRecordCluster.json	{'empty'}	t	f	f	f
177authorshipRecordCluster.json	{'empty'}	t	f	f	f
17authorshipRecordCluster.json	{'empty'}	t	f	f	f
19authorshipRecordCluster.json	{'empty'}	t	f	f	f
200authorshipRecordCluster.json	{'empty'}	t	f	f	f
201authorshipRecordCluster.json	{'empty'}	t	f	f	f
206authorshipRecordCluster.json	{'empty'}	t	f	f	f
207authorshipRecordCluster.json	{'empty'}	t	f	f	f
208authorshipRecordCluster.json	{'empty'}	t	f	f	f
20authorshipRecordCluster.json	{'empty'}	t	f	f	f
211authorshipRecordCluster.json	{'empty'}	t	f	f	f
213authorshipRecordCluster.json	{'empty'}	t	f	f	f
214authorshipRecordCluster.json	{'empty'}	t	f	f	f
215authorshipRecordCluster.json	{'empty'}	t	f	f	f
216authorshipRecordCluster.json	{'empty'}	t	f	f	f
217authorshipRecordCluster.json	{'empty'}	t	f	f	f
219authorshipRecordCluster.json	{'empty'}	t	f	f	f
221authorshipRecordCluster.json	{'empty'}	t	f	f	f
222authorshipRecordCluster.json	{'empty'}	t	f	f	f
223authorshipRecordCluster.json	{'empty'}	t	f	f	f
225authorshipRecordCluster.json	{'empty'}	t	f	f	f
22authorshipRecordCluster.json	{'empty'}	t	f	f	f
230authorshipRecordCluster.json	{'empty'}	t	f	f	f
231authorshipRecordCluster.json	{'empty'}	t	f	f	f
234authorshipRecordCluster.json	{'empty'}	t	f	f	f
235authorshipRecordCluster.json	{'empty'}	t	f	f	f
236authorshipRecordCluster.json	{'empty'}	t	f	f	f
238authorshipRecordCluster.json	{'empty'}	t	f	f	f
240authorshipRecordCluster.json	{'empty'}	t	f	f	f
241authorshipRecordCluster.json	{'empty'}	t	f	f	f
242authorshipRecordCluster.json	{'empty'}	t	f	f	f
243authorshipRecordCluster.json	{'empty'}	t	f	f	f
244authorshipRecordCluster.json	{'empty'}	t	f	f	f
245authorshipRecordCluster.json	{'empty'}	t	f	f	f
246authorshipRecordCluster.json	{'empty'}	t	f	f	f
71authorshipRecordCluster.json	{'empty','idref159359589'}	f	t	f	t
86authorshipRecordCluster.json	{'idref166218154','empty'}	f	t	f	t
97authorshipRecordCluster.json	{'empty','idref150643411'}	f	t	f	t
99authorshipRecordCluster.json	{'empty','idref144589044'}	f	t	f	t
9authorshipRecordCluster.json	{'empty','idref026940183'}	f	t	f	t
248authorshipRecordCluster.json	{'empty'}	t	f	f	f
249authorshipRecordCluster.json	{'empty'}	t	f	f	f
250authorshipRecordCluster.json	{'empty'}	t	f	f	f
251authorshipRecordCluster.json	{'empty'}	t	f	f	f
252authorshipRecordCluster.json	{'empty'}	t	f	f	f
253authorshipRecordCluster.json	{'empty'}	t	f	f	f
254authorshipRecordCluster.json	{'empty'}	t	f	f	f
255authorshipRecordCluster.json	{'empty'}	t	f	f	f
256authorshipRecordCluster.json	{'empty'}	t	f	f	f
257authorshipRecordCluster.json	{'empty'}	t	f	f	f
258authorshipRecordCluster.json	{'empty'}	t	f	f	f
259authorshipRecordCluster.json	{'empty'}	t	f	f	f
260authorshipRecordCluster.json	{'empty'}	t	f	f	f
261authorshipRecordCluster.json	{'empty'}	t	f	f	f
262authorshipRecordCluster.json	{'empty'}	t	f	f	f
263authorshipRecordCluster.json	{'empty'}	t	f	f	f
264authorshipRecordCluster.json	{'empty'}	t	f	f	f
265authorshipRecordCluster.json	{'empty'}	t	f	f	f
266authorshipRecordCluster.json	{'empty'}	t	f	f	f
268authorshipRecordCluster.json	{'empty'}	t	f	f	f
269authorshipRecordCluster.json	{'empty'}	t	f	f	f
275authorshipRecordCluster.json	{'empty'}	t	f	f	f
280authorshipRecordCluster.json	{'empty'}	t	f	f	f
281authorshipRecordCluster.json	{'empty'}	t	f	f	f
28authorshipRecordCluster.json	{'empty'}	t	f	f	f
293authorshipRecordCluster.json	{'empty'}	t	f	f	f
294authorshipRecordCluster.json	{'empty'}	t	f	f	f
296authorshipRecordCluster.json	{'empty'}	t	f	f	f
297authorshipRecordCluster.json	{'empty'}	t	f	f	f
298authorshipRecordCluster.json	{'empty'}	t	f	f	f
299authorshipRecordCluster.json	{'empty'}	t	f	f	f
29authorshipRecordCluster.json	{'empty'}	t	f	f	f
300authorshipRecordCluster.json	{'empty'}	t	f	f	f
301authorshipRecordCluster.json	{'empty'}	t	f	f	f
302authorshipRecordCluster.json	{'empty'}	t	f	f	f
320authorshipRecordCluster.json	{'empty'}	t	f	f	f
33authorshipRecordCluster.json	{'empty'}	t	f	f	f
342authorshipRecordCluster.json	{'empty'}	t	f	f	f
343authorshipRecordCluster.json	{'empty'}	t	f	f	f
347authorshipRecordCluster.json	{'empty'}	t	f	f	f
349authorshipRecordCluster.json	{'empty'}	t	f	f	f
34authorshipRecordCluster.json	{'empty'}	t	f	f	f
350authorshipRecordCluster.json	{'empty'}	t	f	f	f
352authorshipRecordCluster.json	{'empty'}	t	f	f	f
354authorshipRecordCluster.json	{'empty'}	t	f	f	f
355authorshipRecordCluster.json	{'empty'}	t	f	f	f
356authorshipRecordCluster.json	{'empty'}	t	f	f	f
359authorshipRecordCluster.json	{'empty'}	t	f	f	f
364authorshipRecordCluster.json	{'empty'}	t	f	f	f
365authorshipRecordCluster.json	{'empty'}	t	f	f	f
368authorshipRecordCluster.json	{'empty'}	t	f	f	f
370authorshipRecordCluster.json	{'empty'}	t	f	f	f
372authorshipRecordCluster.json	{'empty'}	t	f	f	f
373authorshipRecordCluster.json	{'empty'}	t	f	f	f
376authorshipRecordCluster.json	{'empty'}	t	f	f	f
377authorshipRecordCluster.json	{'empty'}	t	f	f	f
37authorshipRecordCluster.json	{'empty'}	t	f	f	f
383authorshipRecordCluster.json	{'empty'}	t	f	f	f
385authorshipRecordCluster.json	{'empty'}	t	f	f	f
386authorshipRecordCluster.json	{'empty'}	t	f	f	f
387authorshipRecordCluster.json	{'empty'}	t	f	f	f
389authorshipRecordCluster.json	{'empty'}	t	f	f	f
390authorshipRecordCluster.json	{'empty'}	t	f	f	f
392authorshipRecordCluster.json	{'empty'}	t	f	f	f
393authorshipRecordCluster.json	{'empty'}	t	f	f	f
400authorshipRecordCluster.json	{'empty'}	t	f	f	f
401authorshipRecordCluster.json	{'empty'}	t	f	f	f
402authorshipRecordCluster.json	{'empty'}	t	f	f	f
403authorshipRecordCluster.json	{'empty'}	t	f	f	f
405authorshipRecordCluster.json	{'empty'}	t	f	f	f
406authorshipRecordCluster.json	{'empty'}	t	f	f	f
408authorshipRecordCluster.json	{'empty'}	t	f	f	f
410authorshipRecordCluster.json	{'empty'}	t	f	f	f
413authorshipRecordCluster.json	{'empty'}	t	f	f	f
414authorshipRecordCluster.json	{'empty'}	t	f	f	f
415authorshipRecordCluster.json	{'empty'}	t	f	f	f
417authorshipRecordCluster.json	{'empty'}	t	f	f	f
420authorshipRecordCluster.json	{'empty'}	t	f	f	f
421authorshipRecordCluster.json	{'empty'}	t	f	f	f
422authorshipRecordCluster.json	{'empty'}	t	f	f	f
423authorshipRecordCluster.json	{'empty'}	t	f	f	f
424authorshipRecordCluster.json	{'empty'}	t	f	f	f
425authorshipRecordCluster.json	{'empty'}	t	f	f	f
426authorshipRecordCluster.json	{'empty'}	t	f	f	f
427authorshipRecordCluster.json	{'empty'}	t	f	f	f
428authorshipRecordCluster.json	{'empty'}	t	f	f	f
429authorshipRecordCluster.json	{'empty'}	t	f	f	f
430authorshipRecordCluster.json	{'empty'}	t	f	f	f
432authorshipRecordCluster.json	{'empty'}	t	f	f	f
433authorshipRecordCluster.json	{'empty'}	t	f	f	f
434authorshipRecordCluster.json	{'empty'}	t	f	f	f
435authorshipRecordCluster.json	{'empty'}	t	f	f	f
436authorshipRecordCluster.json	{'empty'}	t	f	f	f
438authorshipRecordCluster.json	{'empty'}	t	f	f	f
439authorshipRecordCluster.json	{'empty'}	t	f	f	f
440authorshipRecordCluster.json	{'empty'}	t	f	f	f
441authorshipRecordCluster.json	{'empty'}	t	f	f	f
442authorshipRecordCluster.json	{'empty'}	t	f	f	f
444authorshipRecordCluster.json	{'empty'}	t	f	f	f
445authorshipRecordCluster.json	{'empty'}	t	f	f	f
447authorshipRecordCluster.json	{'empty'}	t	f	f	f
448authorshipRecordCluster.json	{'empty'}	t	f	f	f
449authorshipRecordCluster.json	{'empty'}	t	f	f	f
44authorshipRecordCluster.json	{'empty'}	t	f	f	f
450authorshipRecordCluster.json	{'empty'}	t	f	f	f
451authorshipRecordCluster.json	{'empty'}	t	f	f	f
452authorshipRecordCluster.json	{'empty'}	t	f	f	f
453authorshipRecordCluster.json	{'empty'}	t	f	f	f
454authorshipRecordCluster.json	{'empty'}	t	f	f	f
455authorshipRecordCluster.json	{'empty'}	t	f	f	f
456authorshipRecordCluster.json	{'empty'}	t	f	f	f
457authorshipRecordCluster.json	{'empty'}	t	f	f	f
458authorshipRecordCluster.json	{'empty'}	t	f	f	f
46authorshipRecordCluster.json	{'empty'}	t	f	f	f
47authorshipRecordCluster.json	{'empty'}	t	f	f	f
56authorshipRecordCluster.json	{'empty'}	t	f	f	f
59authorshipRecordCluster.json	{'empty'}	t	f	f	f
64authorshipRecordCluster.json	{'empty'}	t	f	f	f
67authorshipRecordCluster.json	{'empty'}	t	f	f	f
68authorshipRecordCluster.json	{'empty'}	t	f	f	f
69authorshipRecordCluster.json	{'empty'}	t	f	f	f
70authorshipRecordCluster.json	{'empty'}	t	f	f	f
83authorshipRecordCluster.json	{'empty'}	t	f	f	f
84authorshipRecordCluster.json	{'empty'}	t	f	f	f
87authorshipRecordCluster.json	{'empty'}	t	f	f	f
88authorshipRecordCluster.json	{'empty'}	t	f	f	f
8authorshipRecordCluster.json	{'empty'}	t	f	f	f
91authorshipRecordCluster.json	{'empty'}	t	f	f	f
96authorshipRecordCluster.json	{'empty'}	t	f	f	f
6authorshipRecordCluster.json	{'empty','idref083167226','idref077324382'}	f	t	t	t
\.


--
-- Data for Name: ceb; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ceb (cluster_id, name, idref1, idref2, idref3, idref4, idref5, remain, newidref, missidref, splitidref, mergeidref) FROM stdin;
0	cluster0.json	idref03372329X		idref03372329Y	none	none	[]	f	f	f	f
1	cluster1.json	idref03372329X		idref03372329Y	idref000100000	idref0	[]	f	f	f	f
\.


--
-- Data for Name: ddi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ddi (name, idrefs, newidref, missidref, splitidref, mergeidref) FROM stdin;
100authorshipRecordCluster.json	{'idref219555974'}	f	f	f	f
165authorshipRecordCluster.json	{'idref157825809'}	f	f	f	f
193authorshipRecordCluster.json	{'idref086178822'}	f	f	f	f
205authorshipRecordCluster.json	{'idref111856809'}	f	f	f	f
0authorshipRecordCluster.json	{'empty','idref250404087'}	f	t	f	t
102authorshipRecordCluster.json	{'idref18124179X','empty'}	f	t	f	t
104authorshipRecordCluster.json	{'idref081393229','empty'}	f	t	f	t
107authorshipRecordCluster.json	{'empty','idref156017776'}	f	t	f	t
113authorshipRecordCluster.json	{'empty','idref157617564'}	f	t	f	t
117authorshipRecordCluster.json	{'empty','idref23725610X'}	f	t	f	t
12authorshipRecordCluster.json	{'empty','idref235983608'}	f	t	f	t
133authorshipRecordCluster.json	{'empty','idref203607457'}	f	t	f	t
140authorshipRecordCluster.json	{'empty','idref167630490'}	f	t	f	t
141authorshipRecordCluster.json	{'empty','idref076920941'}	f	t	f	t
149authorshipRecordCluster.json	{'empty','idref070737347'}	f	t	f	t
150authorshipRecordCluster.json	{'empty','idref070737347'}	f	t	f	t
15authorshipRecordCluster.json	{'idref162548737','empty'}	f	t	f	t
161authorshipRecordCluster.json	{'empty','idref032330820'}	f	t	f	t
175authorshipRecordCluster.json	{'empty','idref199796122'}	f	t	f	t
18authorshipRecordCluster.json	{'empty','idref070737347'}	f	t	f	t
194authorshipRecordCluster.json	{'idref228238455','empty'}	f	t	f	t
195authorshipRecordCluster.json	{'empty','idref168031159'}	f	t	f	t
199authorshipRecordCluster.json	{'empty','idref15603140X'}	f	t	f	t
20authorshipRecordCluster.json	{'empty','idref068628226'}	f	t	f	t
108authorshipRecordCluster.json	{'idref168649306','empty','idref142459771'}	f	t	t	t
111authorshipRecordCluster.json	{'idref088576191','empty','idref108963365','idref166661856'}	f	t	t	t
['108authorshipRecordCluster.json', '0authorshipRecordCluster.json']	{'idref168649306','empty','idref250404087','idref142459771'}	f	t	t	t
1authorshipRecordCluster.json	{'empty','idref10930120X','idref081393229','idref069722358','idref159513898'}	f	t	t	t
233authorshipRecordCluster.json	{'idref156002094'}	f	f	f	f
23authorshipRecordCluster.json	{'idref122861566'}	f	f	f	f
247authorshipRecordCluster.json	{'idref030967570'}	f	f	f	f
248authorshipRecordCluster.json	{'idref084063599'}	f	f	f	f
252authorshipRecordCluster.json	{'idref142459771'}	f	f	f	f
304authorshipRecordCluster.json	{'idref076733521'}	f	f	f	f
31authorshipRecordCluster.json	{'idref198220790'}	f	f	f	f
262authorshipRecordCluster.json	{'empty','idref223359173'}	f	t	f	t
28authorshipRecordCluster.json	{'empty','idref171283090'}	f	t	f	t
29authorshipRecordCluster.json	{'idref234478446','empty'}	f	t	f	t
306authorshipRecordCluster.json	{'empty','idref076733521'}	f	t	f	t
337authorshipRecordCluster.json	{'empty','idref157617564'}	f	t	f	t
33authorshipRecordCluster.json	{'empty','idref095004114'}	f	t	f	t
359authorshipRecordCluster.json	{'empty','idref199386706'}	f	t	f	t
32authorshipRecordCluster.json	{'idref167663666','empty','idref199796122'}	f	t	t	t
38authorshipRecordCluster.json	{'empty','idref159513898'}	f	t	f	t
41authorshipRecordCluster.json	{'empty','idref188596380'}	f	t	f	t
42authorshipRecordCluster.json	{'empty','idref031153909'}	f	t	f	t
435authorshipRecordCluster.json	{'empty','idref168031159'}	f	t	f	t
43authorshipRecordCluster.json	{'idref199386706','empty'}	f	t	f	t
450authorshipRecordCluster.json	{'empty','idref090949390'}	f	t	f	t
46authorshipRecordCluster.json	{'idref155543385','empty'}	f	t	f	t
471authorshipRecordCluster.json	{'empty','idref203874471'}	f	t	f	t
47authorshipRecordCluster.json	{'empty','idref192518941'}	f	t	f	t
534authorshipRecordCluster.json	{'idref190093463'}	f	f	f	f
57authorshipRecordCluster.json	{'idref203607457'}	f	f	f	f
58authorshipRecordCluster.json	{'idref24275189X'}	f	f	f	f
64authorshipRecordCluster.json	{'idref139192999'}	f	f	f	f
['102authorshipRecordCluster.json', '103authorshipRecordCluster.json']	{'idref18124179X','empty'}	f	t	f	t
67authorshipRecordCluster.json	{'empty','idref031352146'}	f	t	f	t
77authorshipRecordCluster.json	{'empty','idref168031159'}	f	t	f	t
80authorshipRecordCluster.json	{'empty','idref195124340'}	f	t	f	t
89authorshipRecordCluster.json	{'idref181392577','empty'}	f	t	f	t
['108authorshipRecordCluster.json', '0authorshipRecordCluster.json']	{'idref168649306','empty','idref250404087','idref142459771'}	f	t	t	t
6authorshipRecordCluster.json	{'empty','idref095004114','idref079303846'}	f	t	t	t
101authorshipRecordCluster.json	{'empty'}	t	f	f	f
103authorshipRecordCluster.json	{'empty'}	t	f	f	f
105authorshipRecordCluster.json	{'empty'}	t	f	f	f
106authorshipRecordCluster.json	{'empty'}	t	f	f	f
112authorshipRecordCluster.json	{'empty'}	t	f	f	f
114authorshipRecordCluster.json	{'empty'}	t	f	f	f
115authorshipRecordCluster.json	{'empty'}	t	f	f	f
116authorshipRecordCluster.json	{'empty'}	t	f	f	f
119authorshipRecordCluster.json	{'empty'}	t	f	f	f
11authorshipRecordCluster.json	{'empty'}	t	f	f	f
120authorshipRecordCluster.json	{'empty'}	t	f	f	f
121authorshipRecordCluster.json	{'empty'}	t	f	f	f
122authorshipRecordCluster.json	{'empty'}	t	f	f	f
123authorshipRecordCluster.json	{'empty'}	t	f	f	f
124authorshipRecordCluster.json	{'empty'}	t	f	f	f
125authorshipRecordCluster.json	{'empty'}	t	f	f	f
130authorshipRecordCluster.json	{'empty'}	t	f	f	f
134authorshipRecordCluster.json	{'empty'}	t	f	f	f
137authorshipRecordCluster.json	{'empty'}	t	f	f	f
138authorshipRecordCluster.json	{'empty'}	t	f	f	f
13authorshipRecordCluster.json	{'empty'}	t	f	f	f
143authorshipRecordCluster.json	{'empty'}	t	f	f	f
144authorshipRecordCluster.json	{'empty'}	t	f	f	f
145authorshipRecordCluster.json	{'empty'}	t	f	f	f
146authorshipRecordCluster.json	{'empty'}	t	f	f	f
14authorshipRecordCluster.json	{'empty'}	t	f	f	f
151authorshipRecordCluster.json	{'empty'}	t	f	f	f
152authorshipRecordCluster.json	{'empty'}	t	f	f	f
153authorshipRecordCluster.json	{'empty'}	t	f	f	f
154authorshipRecordCluster.json	{'empty'}	t	f	f	f
155authorshipRecordCluster.json	{'empty'}	t	f	f	f
156authorshipRecordCluster.json	{'empty'}	t	f	f	f
157authorshipRecordCluster.json	{'empty'}	t	f	f	f
158authorshipRecordCluster.json	{'empty'}	t	f	f	f
159authorshipRecordCluster.json	{'empty'}	t	f	f	f
163authorshipRecordCluster.json	{'empty'}	t	f	f	f
166authorshipRecordCluster.json	{'empty'}	t	f	f	f
167authorshipRecordCluster.json	{'empty'}	t	f	f	f
168authorshipRecordCluster.json	{'empty'}	t	f	f	f
171authorshipRecordCluster.json	{'empty'}	t	f	f	f
172authorshipRecordCluster.json	{'empty'}	t	f	f	f
173authorshipRecordCluster.json	{'empty'}	t	f	f	f
174authorshipRecordCluster.json	{'empty'}	t	f	f	f
186authorshipRecordCluster.json	{'empty'}	t	f	f	f
192authorshipRecordCluster.json	{'empty'}	t	f	f	f
19authorshipRecordCluster.json	{'empty'}	t	f	f	f
212authorshipRecordCluster.json	{'empty'}	t	f	f	f
213authorshipRecordCluster.json	{'empty'}	t	f	f	f
214authorshipRecordCluster.json	{'empty'}	t	f	f	f
215authorshipRecordCluster.json	{'empty'}	t	f	f	f
218authorshipRecordCluster.json	{'empty'}	t	f	f	f
219authorshipRecordCluster.json	{'empty'}	t	f	f	f
21authorshipRecordCluster.json	{'empty'}	t	f	f	f
221authorshipRecordCluster.json	{'empty'}	t	f	f	f
222authorshipRecordCluster.json	{'empty'}	t	f	f	f
223authorshipRecordCluster.json	{'empty'}	t	f	f	f
224authorshipRecordCluster.json	{'empty'}	t	f	f	f
230authorshipRecordCluster.json	{'empty'}	t	f	f	f
235authorshipRecordCluster.json	{'empty'}	t	f	f	f
236authorshipRecordCluster.json	{'empty'}	t	f	f	f
238authorshipRecordCluster.json	{'empty'}	t	f	f	f
239authorshipRecordCluster.json	{'empty'}	t	f	f	f
240authorshipRecordCluster.json	{'empty'}	t	f	f	f
241authorshipRecordCluster.json	{'empty'}	t	f	f	f
244authorshipRecordCluster.json	{'empty'}	t	f	f	f
24authorshipRecordCluster.json	{'empty'}	t	f	f	f
25authorshipRecordCluster.json	{'empty'}	t	f	f	f
263authorshipRecordCluster.json	{'empty'}	t	f	f	f
266authorshipRecordCluster.json	{'empty'}	t	f	f	f
267authorshipRecordCluster.json	{'empty'}	t	f	f	f
268authorshipRecordCluster.json	{'empty'}	t	f	f	f
269authorshipRecordCluster.json	{'empty'}	t	f	f	f
271authorshipRecordCluster.json	{'empty'}	t	f	f	f
272authorshipRecordCluster.json	{'empty'}	t	f	f	f
274authorshipRecordCluster.json	{'empty'}	t	f	f	f
275authorshipRecordCluster.json	{'empty'}	t	f	f	f
276authorshipRecordCluster.json	{'empty'}	t	f	f	f
278authorshipRecordCluster.json	{'empty'}	t	f	f	f
279authorshipRecordCluster.json	{'empty'}	t	f	f	f
27authorshipRecordCluster.json	{'empty'}	t	f	f	f
281authorshipRecordCluster.json	{'empty'}	t	f	f	f
283authorshipRecordCluster.json	{'empty'}	t	f	f	f
284authorshipRecordCluster.json	{'empty'}	t	f	f	f
285authorshipRecordCluster.json	{'empty'}	t	f	f	f
286authorshipRecordCluster.json	{'empty'}	t	f	f	f
287authorshipRecordCluster.json	{'empty'}	t	f	f	f
294authorshipRecordCluster.json	{'empty'}	t	f	f	f
295authorshipRecordCluster.json	{'empty'}	t	f	f	f
296authorshipRecordCluster.json	{'empty'}	t	f	f	f
2authorshipRecordCluster.json	{'empty'}	t	f	f	f
313authorshipRecordCluster.json	{'empty'}	t	f	f	f
314authorshipRecordCluster.json	{'empty'}	t	f	f	f
315authorshipRecordCluster.json	{'empty'}	t	f	f	f
316authorshipRecordCluster.json	{'empty'}	t	f	f	f
320authorshipRecordCluster.json	{'empty'}	t	f	f	f
322authorshipRecordCluster.json	{'empty'}	t	f	f	f
330authorshipRecordCluster.json	{'empty'}	t	f	f	f
336authorshipRecordCluster.json	{'empty'}	t	f	f	f
339authorshipRecordCluster.json	{'empty'}	t	f	f	f
340authorshipRecordCluster.json	{'empty'}	t	f	f	f
341authorshipRecordCluster.json	{'empty'}	t	f	f	f
342authorshipRecordCluster.json	{'empty'}	t	f	f	f
343authorshipRecordCluster.json	{'empty'}	t	f	f	f
345authorshipRecordCluster.json	{'empty'}	t	f	f	f
346authorshipRecordCluster.json	{'empty'}	t	f	f	f
35authorshipRecordCluster.json	{'empty'}	t	f	f	f
360authorshipRecordCluster.json	{'empty'}	t	f	f	f
364authorshipRecordCluster.json	{'empty'}	t	f	f	f
365authorshipRecordCluster.json	{'empty'}	t	f	f	f
366authorshipRecordCluster.json	{'empty'}	t	f	f	f
367authorshipRecordCluster.json	{'empty'}	t	f	f	f
368authorshipRecordCluster.json	{'empty'}	t	f	f	f
369authorshipRecordCluster.json	{'empty'}	t	f	f	f
370authorshipRecordCluster.json	{'empty'}	t	f	f	f
371authorshipRecordCluster.json	{'empty'}	t	f	f	f
372authorshipRecordCluster.json	{'empty'}	t	f	f	f
373authorshipRecordCluster.json	{'empty'}	t	f	f	f
377authorshipRecordCluster.json	{'empty'}	t	f	f	f
386authorshipRecordCluster.json	{'empty'}	t	f	f	f
396authorshipRecordCluster.json	{'empty'}	t	f	f	f
399authorshipRecordCluster.json	{'empty'}	t	f	f	f
39authorshipRecordCluster.json	{'empty'}	t	f	f	f
3authorshipRecordCluster.json	{'empty'}	t	f	f	f
400authorshipRecordCluster.json	{'empty'}	t	f	f	f
401authorshipRecordCluster.json	{'empty'}	t	f	f	f
405authorshipRecordCluster.json	{'empty'}	t	f	f	f
408authorshipRecordCluster.json	{'empty'}	t	f	f	f
409authorshipRecordCluster.json	{'empty'}	t	f	f	f
418authorshipRecordCluster.json	{'empty'}	t	f	f	f
421authorshipRecordCluster.json	{'empty'}	t	f	f	f
422authorshipRecordCluster.json	{'empty'}	t	f	f	f
430authorshipRecordCluster.json	{'empty'}	t	f	f	f
432authorshipRecordCluster.json	{'empty'}	t	f	f	f
433authorshipRecordCluster.json	{'empty'}	t	f	f	f
434authorshipRecordCluster.json	{'empty'}	t	f	f	f
439authorshipRecordCluster.json	{'empty'}	t	f	f	f
440authorshipRecordCluster.json	{'empty'}	t	f	f	f
445authorshipRecordCluster.json	{'empty'}	t	f	f	f
446authorshipRecordCluster.json	{'empty'}	t	f	f	f
447authorshipRecordCluster.json	{'empty'}	t	f	f	f
448authorshipRecordCluster.json	{'empty'}	t	f	f	f
449authorshipRecordCluster.json	{'empty'}	t	f	f	f
44authorshipRecordCluster.json	{'empty'}	t	f	f	f
451authorshipRecordCluster.json	{'empty'}	t	f	f	f
454authorshipRecordCluster.json	{'empty'}	t	f	f	f
456authorshipRecordCluster.json	{'empty'}	t	f	f	f
457authorshipRecordCluster.json	{'empty'}	t	f	f	f
458authorshipRecordCluster.json	{'empty'}	t	f	f	f
45authorshipRecordCluster.json	{'empty'}	t	f	f	f
460authorshipRecordCluster.json	{'empty'}	t	f	f	f
461authorshipRecordCluster.json	{'empty'}	t	f	f	f
462authorshipRecordCluster.json	{'empty'}	t	f	f	f
465authorshipRecordCluster.json	{'empty'}	t	f	f	f
469authorshipRecordCluster.json	{'empty'}	t	f	f	f
472authorshipRecordCluster.json	{'empty'}	t	f	f	f
473authorshipRecordCluster.json	{'empty'}	t	f	f	f
474authorshipRecordCluster.json	{'empty'}	t	f	f	f
475authorshipRecordCluster.json	{'empty'}	t	f	f	f
478authorshipRecordCluster.json	{'empty'}	t	f	f	f
479authorshipRecordCluster.json	{'empty'}	t	f	f	f
481authorshipRecordCluster.json	{'empty'}	t	f	f	f
482authorshipRecordCluster.json	{'empty'}	t	f	f	f
483authorshipRecordCluster.json	{'empty'}	t	f	f	f
485authorshipRecordCluster.json	{'empty'}	t	f	f	f
486authorshipRecordCluster.json	{'empty'}	t	f	f	f
487authorshipRecordCluster.json	{'empty'}	t	f	f	f
489authorshipRecordCluster.json	{'empty'}	t	f	f	f
48authorshipRecordCluster.json	{'empty'}	t	f	f	f
491authorshipRecordCluster.json	{'empty'}	t	f	f	f
492authorshipRecordCluster.json	{'empty'}	t	f	f	f
493authorshipRecordCluster.json	{'empty'}	t	f	f	f
494authorshipRecordCluster.json	{'empty'}	t	f	f	f
495authorshipRecordCluster.json	{'empty'}	t	f	f	f
496authorshipRecordCluster.json	{'empty'}	t	f	f	f
497authorshipRecordCluster.json	{'empty'}	t	f	f	f
498authorshipRecordCluster.json	{'empty'}	t	f	f	f
499authorshipRecordCluster.json	{'empty'}	t	f	f	f
49authorshipRecordCluster.json	{'empty'}	t	f	f	f
4authorshipRecordCluster.json	{'empty'}	t	f	f	f
500authorshipRecordCluster.json	{'empty'}	t	f	f	f
501authorshipRecordCluster.json	{'empty'}	t	f	f	f
502authorshipRecordCluster.json	{'empty'}	t	f	f	f
503authorshipRecordCluster.json	{'empty'}	t	f	f	f
507authorshipRecordCluster.json	{'empty'}	t	f	f	f
508authorshipRecordCluster.json	{'empty'}	t	f	f	f
509authorshipRecordCluster.json	{'empty'}	t	f	f	f
510authorshipRecordCluster.json	{'empty'}	t	f	f	f
511authorshipRecordCluster.json	{'empty'}	t	f	f	f
512authorshipRecordCluster.json	{'empty'}	t	f	f	f
513authorshipRecordCluster.json	{'empty'}	t	f	f	f
519authorshipRecordCluster.json	{'empty'}	t	f	f	f
51authorshipRecordCluster.json	{'empty'}	t	f	f	f
520authorshipRecordCluster.json	{'empty'}	t	f	f	f
522authorshipRecordCluster.json	{'empty'}	t	f	f	f
526authorshipRecordCluster.json	{'empty'}	t	f	f	f
527authorshipRecordCluster.json	{'empty'}	t	f	f	f
528authorshipRecordCluster.json	{'empty'}	t	f	f	f
529authorshipRecordCluster.json	{'empty'}	t	f	f	f
52authorshipRecordCluster.json	{'empty'}	t	f	f	f
530authorshipRecordCluster.json	{'empty'}	t	f	f	f
531authorshipRecordCluster.json	{'empty'}	t	f	f	f
535authorshipRecordCluster.json	{'empty'}	t	f	f	f
536authorshipRecordCluster.json	{'empty'}	t	f	f	f
537authorshipRecordCluster.json	{'empty'}	t	f	f	f
538authorshipRecordCluster.json	{'empty'}	t	f	f	f
539authorshipRecordCluster.json	{'empty'}	t	f	f	f
540authorshipRecordCluster.json	{'empty'}	t	f	f	f
541authorshipRecordCluster.json	{'empty'}	t	f	f	f
542authorshipRecordCluster.json	{'empty'}	t	f	f	f
543authorshipRecordCluster.json	{'empty'}	t	f	f	f
544authorshipRecordCluster.json	{'empty'}	t	f	f	f
546authorshipRecordCluster.json	{'empty'}	t	f	f	f
547authorshipRecordCluster.json	{'empty'}	t	f	f	f
548authorshipRecordCluster.json	{'empty'}	t	f	f	f
549authorshipRecordCluster.json	{'empty'}	t	f	f	f
550authorshipRecordCluster.json	{'empty'}	t	f	f	f
552authorshipRecordCluster.json	{'empty'}	t	f	f	f
553authorshipRecordCluster.json	{'empty'}	t	f	f	f
554authorshipRecordCluster.json	{'empty'}	t	f	f	f
555authorshipRecordCluster.json	{'empty'}	t	f	f	f
556authorshipRecordCluster.json	{'empty'}	t	f	f	f
557authorshipRecordCluster.json	{'empty'}	t	f	f	f
558authorshipRecordCluster.json	{'empty'}	t	f	f	f
559authorshipRecordCluster.json	{'empty'}	t	f	f	f
55authorshipRecordCluster.json	{'empty'}	t	f	f	f
56authorshipRecordCluster.json	{'empty'}	t	f	f	f
5authorshipRecordCluster.json	{'empty'}	t	f	f	f
60authorshipRecordCluster.json	{'empty'}	t	f	f	f
62authorshipRecordCluster.json	{'empty'}	t	f	f	f
63authorshipRecordCluster.json	{'empty'}	t	f	f	f
65authorshipRecordCluster.json	{'empty'}	t	f	f	f
66authorshipRecordCluster.json	{'empty'}	t	f	f	f
68authorshipRecordCluster.json	{'empty'}	t	f	f	f
69authorshipRecordCluster.json	{'empty'}	t	f	f	f
70authorshipRecordCluster.json	{'empty'}	t	f	f	f
71authorshipRecordCluster.json	{'empty'}	t	f	f	f
72authorshipRecordCluster.json	{'empty'}	t	f	f	f
75authorshipRecordCluster.json	{'empty'}	t	f	f	f
79authorshipRecordCluster.json	{'empty'}	t	f	f	f
7authorshipRecordCluster.json	{'empty'}	t	f	f	f
81authorshipRecordCluster.json	{'empty'}	t	f	f	f
82authorshipRecordCluster.json	{'empty'}	t	f	f	f
83authorshipRecordCluster.json	{'empty'}	t	f	f	f
84authorshipRecordCluster.json	{'empty'}	t	f	f	f
85authorshipRecordCluster.json	{'empty'}	t	f	f	f
86authorshipRecordCluster.json	{'empty'}	t	f	f	f
87authorshipRecordCluster.json	{'empty'}	t	f	f	f
88authorshipRecordCluster.json	{'empty'}	t	f	f	f
90authorshipRecordCluster.json	{'empty'}	t	f	f	f
91authorshipRecordCluster.json	{'empty'}	t	f	f	f
['105authorshipRecordCluster.json', '106authorshipRecordCluster.json']	{'empty'}	t	f	f	f
94authorshipRecordCluster.json	{'empty'}	t	f	f	f
95authorshipRecordCluster.json	{'empty'}	t	f	f	f
96authorshipRecordCluster.json	{'empty'}	t	f	f	f
97authorshipRecordCluster.json	{'empty'}	t	f	f	f
98authorshipRecordCluster.json	{'empty'}	t	f	f	f
9authorshipRecordCluster.json	{'empty'}	t	f	f	f
\.


--
-- Data for Name: dur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dur (name, idrefs, newidref, missidref, splitidref, mergeidref) FROM stdin;
21authorshipRecordCluster.json	{'idref077396855'}	f	f	f	f
10authorshipRecordCluster.json	{'empty'}	t	f	f	f
11authorshipRecordCluster.json	{'empty'}	t	f	f	f
12authorshipRecordCluster.json	{'empty'}	t	f	f	f
14authorshipRecordCluster.json	{'empty'}	t	f	f	f
15authorshipRecordCluster.json	{'empty'}	t	f	f	f
16authorshipRecordCluster.json	{'empty'}	t	f	f	f
17authorshipRecordCluster.json	{'empty'}	t	f	f	f
1authorshipRecordCluster.json	{'empty'}	t	f	f	f
20authorshipRecordCluster.json	{'empty'}	t	f	f	f
22authorshipRecordCluster.json	{'empty'}	t	f	f	f
23authorshipRecordCluster.json	{'empty'}	t	f	f	f
24authorshipRecordCluster.json	{'empty'}	t	f	f	f
25authorshipRecordCluster.json	{'empty'}	t	f	f	f
26authorshipRecordCluster.json	{'empty'}	t	f	f	f
27authorshipRecordCluster.json	{'empty'}	t	f	f	f
28authorshipRecordCluster.json	{'empty'}	t	f	f	f
29authorshipRecordCluster.json	{'empty'}	t	f	f	f
2authorshipRecordCluster.json	{'empty'}	t	f	f	f
30authorshipRecordCluster.json	{'empty'}	t	f	f	f
31authorshipRecordCluster.json	{'empty'}	t	f	f	f
32authorshipRecordCluster.json	{'empty'}	t	f	f	f
33authorshipRecordCluster.json	{'empty'}	t	f	f	f
34authorshipRecordCluster.json	{'empty'}	t	f	f	f
35authorshipRecordCluster.json	{'empty'}	t	f	f	f
36authorshipRecordCluster.json	{'empty'}	t	f	f	f
38authorshipRecordCluster.json	{'empty'}	t	f	f	f
39authorshipRecordCluster.json	{'empty'}	t	f	f	f
3authorshipRecordCluster.json	{'empty'}	t	f	f	f
40authorshipRecordCluster.json	{'empty'}	t	f	f	f
41authorshipRecordCluster.json	{'empty'}	t	f	f	f
42authorshipRecordCluster.json	{'empty'}	t	f	f	f
43authorshipRecordCluster.json	{'empty'}	t	f	f	f
44authorshipRecordCluster.json	{'empty'}	t	f	f	f
6authorshipRecordCluster.json	{'empty'}	t	f	f	f
8authorshipRecordCluster.json	{'empty'}	t	f	f	f
9authorshipRecordCluster.json	{'empty'}	t	f	f	f
4authorshipRecordCluster.json	{'empty','idref05659951X'}	f	t	f	t
7authorshipRecordCluster.json	{'empty','idref078744989'}	f	t	f	t
0authorshipRecordCluster.json	{'empty','idref112380956','idref150093918'}	f	t	t	t
18authorshipRecordCluster.json	{'idref166416681','empty','idref057203148'}	f	t	t	t
\.


--
-- Data for Name: ned; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ned (name, idrefs, newidref, missidref, splitidref, mergeidref) FROM stdin;
10authorshipRecordCluster.json	{'empty'}	t	f	f	f
12authorshipRecordCluster.json	{'empty'}	t	f	f	f
16authorshipRecordCluster.json	{'empty'}	t	f	f	f
18authorshipRecordCluster.json	{'empty'}	t	f	f	f
1authorshipRecordCluster.json	{'empty'}	t	f	f	f
27authorshipRecordCluster.json	{'empty'}	t	f	f	f
28authorshipRecordCluster.json	{'empty'}	t	f	f	f
29authorshipRecordCluster.json	{'empty'}	t	f	f	f
2authorshipRecordCluster.json	{'empty'}	t	f	f	f
30authorshipRecordCluster.json	{'empty'}	t	f	f	f
31authorshipRecordCluster.json	{'empty'}	t	f	f	f
33authorshipRecordCluster.json	{'empty'}	t	f	f	f
34authorshipRecordCluster.json	{'empty'}	t	f	f	f
35authorshipRecordCluster.json	{'empty'}	t	f	f	f
36authorshipRecordCluster.json	{'empty'}	t	f	f	f
37authorshipRecordCluster.json	{'empty'}	t	f	f	f
7authorshipRecordCluster.json	{'empty'}	t	f	f	f
8authorshipRecordCluster.json	{'empty'}	t	f	f	f
9authorshipRecordCluster.json	{'empty'}	t	f	f	f
0authorshipRecordCluster.json	{'empty','idref227507924'}	f	t	f	t
11authorshipRecordCluster.json	{'empty','idref059218169'}	f	t	f	t
32authorshipRecordCluster.json	{'empty','idref174110707'}	f	t	f	t
3authorshipRecordCluster.json	{'empty','idref148436889'}	f	t	f	t
\.


--
-- Data for Name: nle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nle (name, idrefs, newidref, missidref, splitidref, mergeidref) FROM stdin;
102authorshipRecordCluster.json	{'idref192720090'}	f	f	f	f
107authorshipRecordCluster.json	{'idref198713924'}	f	f	f	f
10authorshipRecordCluster.json	{'idref22450584X'}	f	f	f	f
112authorshipRecordCluster.json	{'idref119942143'}	f	f	f	f
148authorshipRecordCluster.json	{'idref197680976'}	f	f	f	f
14authorshipRecordCluster.json	{'idref164520449'}	f	f	f	f
151authorshipRecordCluster.json	{'idref135351472'}	f	f	f	f
114authorshipRecordCluster.json	{'idref084437642'}	f	f	f	t
0authorshipRecordCluster.json	{'empty','idref103682457'}	f	t	f	t
1006authorshipRecordCluster.json	{'empty','idref122609530'}	f	t	f	t
105authorshipRecordCluster.json	{'empty','idref066823692'}	f	t	f	t
109authorshipRecordCluster.json	{'empty','idref203607554'}	f	t	f	t
113authorshipRecordCluster.json	{'empty','idref24172239X'}	f	t	f	t
117authorshipRecordCluster.json	{'idref11987024X','empty'}	f	t	f	t
120authorshipRecordCluster.json	{'empty','idref158971914'}	f	t	f	t
124authorshipRecordCluster.json	{'empty','idref082771634'}	f	t	f	t
144authorshipRecordCluster.json	{'empty','idref156979195'}	f	t	f	t
145authorshipRecordCluster.json	{'empty','idref188470816'}	f	t	f	t
147authorshipRecordCluster.json	{'empty','idref219561435'}	f	t	f	t
154authorshipRecordCluster.json	{'empty','idref11937840X'}	f	t	f	t
156authorshipRecordCluster.json	{'idref069455899','empty'}	f	t	f	t
11authorshipRecordCluster.json	{'empty','idref081547862','idref175749027'}	f	t	t	t
134authorshipRecordCluster.json	{'idref224242520','empty','idref14349564X'}	f	t	t	t
13authorshipRecordCluster.json	{'idref148445837','empty','idref107956691','idref085026921'}	f	t	t	t
161authorshipRecordCluster.json	{'idref168884089'}	f	f	f	f
17authorshipRecordCluster.json	{'idref055793002'}	f	f	f	f
186authorshipRecordCluster.json	{'idref183969588'}	f	f	f	f
191authorshipRecordCluster.json	{'idref075154625'}	f	f	f	f
203authorshipRecordCluster.json	{'idref125984561'}	f	f	f	f
209authorshipRecordCluster.json	{'idref136910645'}	f	f	f	f
229authorshipRecordCluster.json	{'idref085967432'}	f	f	f	f
22authorshipRecordCluster.json	{'idref159070112'}	f	f	f	f
24authorshipRecordCluster.json	{'idref144554313'}	f	f	f	f
256authorshipRecordCluster.json	{'idref079108326'}	f	f	f	f
281authorshipRecordCluster.json	{'idref230948782'}	f	f	f	f
232authorshipRecordCluster.json	{'idref084437642'}	f	f	f	t
236authorshipRecordCluster.json	{'idref224425250'}	f	f	f	t
159authorshipRecordCluster.json	{'empty','idref170505073'}	f	t	f	t
15authorshipRecordCluster.json	{'idref130683795','empty'}	f	t	f	t
162authorshipRecordCluster.json	{'idref157166791','empty'}	f	t	f	t
178authorshipRecordCluster.json	{'empty','idref143150812'}	f	t	f	t
183authorshipRecordCluster.json	{'empty','idref137154720'}	f	t	f	t
189authorshipRecordCluster.json	{'idref18176914X','empty'}	f	t	f	t
193authorshipRecordCluster.json	{'empty','idref158971914'}	f	t	f	t
197authorshipRecordCluster.json	{'empty','idref193551039'}	f	t	f	t
199authorshipRecordCluster.json	{'idref202696405','empty'}	f	t	f	t
201authorshipRecordCluster.json	{'empty','idref080008240'}	f	t	f	t
205authorshipRecordCluster.json	{'empty','idref234431377'}	f	t	f	t
21authorshipRecordCluster.json	{'idref059811862','empty'}	f	t	f	t
222authorshipRecordCluster.json	{'empty','idref196947715'}	f	t	f	t
230authorshipRecordCluster.json	{'empty','idref156821346'}	f	t	f	t
231authorshipRecordCluster.json	{'idref052557499','empty'}	f	t	f	t
233authorshipRecordCluster.json	{'empty','idref111393183'}	f	t	f	t
237authorshipRecordCluster.json	{'idref082097208','empty'}	f	t	f	t
23authorshipRecordCluster.json	{'empty','idref150081405'}	f	t	f	t
259authorshipRecordCluster.json	{'empty','idref175641048'}	f	t	f	t
173authorshipRecordCluster.json	{'idref069031215','idref11611438X','empty','idref146974549'}	f	t	t	t
1authorshipRecordCluster.json	{'empty','idref158971914','idref113501137'}	f	t	t	t
26authorshipRecordCluster.json	{'empty','idref117475165','idref226834158','idref061411043','idref156821346'}	f	t	t	t
283authorshipRecordCluster.json	{'idref150808151'}	f	f	f	f
308authorshipRecordCluster.json	{'idref083611886'}	f	f	f	f
314authorshipRecordCluster.json	{'idref235653586'}	f	f	f	f
318authorshipRecordCluster.json	{'idref203324919'}	f	f	f	f
32authorshipRecordCluster.json	{'idref232638772'}	f	f	f	f
332authorshipRecordCluster.json	{'idref060969830'}	f	f	f	f
354authorshipRecordCluster.json	{'idref10807157X'}	f	f	f	f
355authorshipRecordCluster.json	{'idref026978342'}	f	f	f	f
356authorshipRecordCluster.json	{'idref176528938'}	f	f	f	f
360authorshipRecordCluster.json	{'idref186386842'}	f	f	f	f
374authorshipRecordCluster.json	{'idref059078839'}	f	f	f	f
37authorshipRecordCluster.json	{'idref190209720'}	f	f	f	f
418authorshipRecordCluster.json	{'idref112917909'}	f	f	f	f
41authorshipRecordCluster.json	{'idref132397005'}	f	f	f	f
327authorshipRecordCluster.json	{'idref224425250'}	f	f	f	t
293authorshipRecordCluster.json	{'empty','idref142615161'}	f	t	f	t
29authorshipRecordCluster.json	{'empty','idref070193355'}	f	t	f	t
2authorshipRecordCluster.json	{'empty','idref111958695'}	f	t	f	t
30authorshipRecordCluster.json	{'idref073522902','empty'}	f	t	f	t
310authorshipRecordCluster.json	{'empty','idref035364580'}	f	t	f	t
330authorshipRecordCluster.json	{'empty','idref150305869'}	f	t	f	t
38authorshipRecordCluster.json	{'idref14070941X','empty'}	f	t	f	t
401authorshipRecordCluster.json	{'empty','idref135209862'}	f	t	f	t
42authorshipRecordCluster.json	{'empty','idref135209862'}	f	t	f	t
431authorshipRecordCluster.json	{'idref189046546','empty'}	f	t	f	t
438authorshipRecordCluster.json	{'empty','idref142966975'}	f	t	f	t
43authorshipRecordCluster.json	{'idref12204536X','empty'}	f	t	f	t
440authorshipRecordCluster.json	{'empty','idref166371548'}	f	t	f	t
443authorshipRecordCluster.json	{'empty','idref230948782'}	f	t	f	t
453authorshipRecordCluster.json	{'empty','idref11937840X'}	f	t	f	t
45authorshipRecordCluster.json	{'idref073357324'}	f	f	f	f
460authorshipRecordCluster.json	{'idref122047230'}	f	f	f	f
482authorshipRecordCluster.json	{'idref112842550'}	f	f	f	f
483authorshipRecordCluster.json	{'idref136088821'}	f	f	f	f
492authorshipRecordCluster.json	{'idref12300621X'}	f	f	f	f
496authorshipRecordCluster.json	{'idref155965565'}	f	f	f	f
500authorshipRecordCluster.json	{'idref083282106'}	f	f	f	f
501authorshipRecordCluster.json	{'idref15589952X'}	f	f	f	f
505authorshipRecordCluster.json	{'idref124603149'}	f	f	f	f
549authorshipRecordCluster.json	{'idref177131926'}	f	f	f	f
54authorshipRecordCluster.json	{'idref144266873'}	f	f	f	f
558authorshipRecordCluster.json	{'idref118683888'}	f	f	f	f
55authorshipRecordCluster.json	{'idref196871719'}	f	f	f	f
564authorshipRecordCluster.json	{'idref083795790'}	f	f	f	f
584authorshipRecordCluster.json	{'idref073956856'}	f	f	f	f
58authorshipRecordCluster.json	{'idref176674675'}	f	f	f	f
594authorshipRecordCluster.json	{'idref133749312'}	f	f	f	f
606authorshipRecordCluster.json	{'idref078535727'}	f	f	f	f
467authorshipRecordCluster.json	{'idref069031215','empty'}	f	t	f	t
46authorshipRecordCluster.json	{'empty','idref236424386'}	f	t	f	t
494authorshipRecordCluster.json	{'empty','idref193061686'}	f	t	f	t
502authorshipRecordCluster.json	{'empty','idref224272616'}	f	t	f	t
51authorshipRecordCluster.json	{'empty','idref122609530'}	f	t	f	t
527authorshipRecordCluster.json	{'empty','idref156979195'}	f	t	f	t
535authorshipRecordCluster.json	{'empty','idref231804296'}	f	t	f	t
53authorshipRecordCluster.json	{'idref080537049','empty'}	f	t	f	t
565authorshipRecordCluster.json	{'empty','idref190075775'}	f	t	f	t
579authorshipRecordCluster.json	{'empty','idref075071746'}	f	t	f	t
57authorshipRecordCluster.json	{'empty','idref137726929'}	f	t	f	t
581authorshipRecordCluster.json	{'empty','idref071501924'}	f	t	f	t
593authorshipRecordCluster.json	{'empty','idref189046546','idref121653609','idref224272616','idref236646990'}	f	t	t	t
611authorshipRecordCluster.json	{'idref165577266'}	f	f	f	f
613authorshipRecordCluster.json	{'idref101512821'}	f	f	f	f
620authorshipRecordCluster.json	{'idref111392853'}	f	f	f	f
627authorshipRecordCluster.json	{'idref138494460'}	f	f	f	f
665authorshipRecordCluster.json	{'idref126740062'}	f	f	f	f
70authorshipRecordCluster.json	{'idref179286838'}	f	f	f	f
65authorshipRecordCluster.json	{'empty','idref076378489'}	f	t	f	t
660authorshipRecordCluster.json	{'empty','idref176345981'}	f	t	f	t
67authorshipRecordCluster.json	{'empty','idref075891964'}	f	t	f	t
719authorshipRecordCluster.json	{'idref204063396','empty'}	f	t	f	t
74authorshipRecordCluster.json	{'empty','idref159070112'}	f	t	f	t
6authorshipRecordCluster.json	{'idref02901056X','idref196788862','empty','idref156821346'}	f	t	t	t
77authorshipRecordCluster.json	{'idref121988902'}	f	f	f	f
847authorshipRecordCluster.json	{'idref076704459'}	f	f	f	f
872authorshipRecordCluster.json	{'idref229967701'}	f	f	f	f
78authorshipRecordCluster.json	{'empty','idref05034711X'}	f	t	f	t
795authorshipRecordCluster.json	{'empty','idref156979195'}	f	t	f	t
82authorshipRecordCluster.json	{'empty','idref17517718X'}	f	t	f	t
85authorshipRecordCluster.json	{'empty','idref07491443X'}	f	t	f	t
866authorshipRecordCluster.json	{'empty','idref084437642'}	f	t	f	t
867authorshipRecordCluster.json	{'idref184617995','empty'}	f	t	f	t
878authorshipRecordCluster.json	{'idref178165204','empty'}	f	t	f	t
88authorshipRecordCluster.json	{'empty','idref101474601'}	f	t	f	t
79authorshipRecordCluster.json	{'empty','idref035038004','idref087816873'}	f	t	t	t
8authorshipRecordCluster.json	{'empty','idref089078144','idref085026921','idref13698763X','idref221296263'}	f	t	t	t
97authorshipRecordCluster.json	{'idref17594542X'}	f	f	f	f
98authorshipRecordCluster.json	{'idref135383129'}	f	f	f	f
91authorshipRecordCluster.json	{'empty','idref122252306'}	f	t	f	t
92authorshipRecordCluster.json	{'idref176567925','empty'}	f	t	f	t
9authorshipRecordCluster.json	{'idref201793628','empty','idref070193355','idref16477694X','idref176345981','idref098826107','idref193061686'}	f	t	t	t
1001authorshipRecordCluster.json	{'empty'}	t	f	f	f
1003authorshipRecordCluster.json	{'empty'}	t	f	f	f
1004authorshipRecordCluster.json	{'empty'}	t	f	f	f
1007authorshipRecordCluster.json	{'empty'}	t	f	f	f
1008authorshipRecordCluster.json	{'empty'}	t	f	f	f
1009authorshipRecordCluster.json	{'empty'}	t	f	f	f
1010authorshipRecordCluster.json	{'empty'}	t	f	f	f
1011authorshipRecordCluster.json	{'empty'}	t	f	f	f
1013authorshipRecordCluster.json	{'empty'}	t	f	f	f
1014authorshipRecordCluster.json	{'empty'}	t	f	f	f
1015authorshipRecordCluster.json	{'empty'}	t	f	f	f
1016authorshipRecordCluster.json	{'empty'}	t	f	f	f
1017authorshipRecordCluster.json	{'empty'}	t	f	f	f
1018authorshipRecordCluster.json	{'empty'}	t	f	f	f
1019authorshipRecordCluster.json	{'empty'}	t	f	f	f
1021authorshipRecordCluster.json	{'empty'}	t	f	f	f
1022authorshipRecordCluster.json	{'empty'}	t	f	f	f
1023authorshipRecordCluster.json	{'empty'}	t	f	f	f
1024authorshipRecordCluster.json	{'empty'}	t	f	f	f
1025authorshipRecordCluster.json	{'empty'}	t	f	f	f
1026authorshipRecordCluster.json	{'empty'}	t	f	f	f
1027authorshipRecordCluster.json	{'empty'}	t	f	f	f
1028authorshipRecordCluster.json	{'empty'}	t	f	f	f
1029authorshipRecordCluster.json	{'empty'}	t	f	f	f
1030authorshipRecordCluster.json	{'empty'}	t	f	f	f
1031authorshipRecordCluster.json	{'empty'}	t	f	f	f
1032authorshipRecordCluster.json	{'empty'}	t	f	f	f
1033authorshipRecordCluster.json	{'empty'}	t	f	f	f
1034authorshipRecordCluster.json	{'empty'}	t	f	f	f
1035authorshipRecordCluster.json	{'empty'}	t	f	f	f
1036authorshipRecordCluster.json	{'empty'}	t	f	f	f
1037authorshipRecordCluster.json	{'empty'}	t	f	f	f
1038authorshipRecordCluster.json	{'empty'}	t	f	f	f
1039authorshipRecordCluster.json	{'empty'}	t	f	f	f
1040authorshipRecordCluster.json	{'empty'}	t	f	f	f
1041authorshipRecordCluster.json	{'empty'}	t	f	f	f
1042authorshipRecordCluster.json	{'empty'}	t	f	f	f
1044authorshipRecordCluster.json	{'empty'}	t	f	f	f
110authorshipRecordCluster.json	{'empty'}	t	f	f	f
118authorshipRecordCluster.json	{'empty'}	t	f	f	f
122authorshipRecordCluster.json	{'empty'}	t	f	f	f
126authorshipRecordCluster.json	{'empty'}	t	f	f	f
12authorshipRecordCluster.json	{'empty'}	t	f	f	f
131authorshipRecordCluster.json	{'empty'}	t	f	f	f
137authorshipRecordCluster.json	{'empty'}	t	f	f	f
140authorshipRecordCluster.json	{'empty'}	t	f	f	f
141authorshipRecordCluster.json	{'empty'}	t	f	f	f
142authorshipRecordCluster.json	{'empty'}	t	f	f	f
146authorshipRecordCluster.json	{'empty'}	t	f	f	f
150authorshipRecordCluster.json	{'empty'}	t	f	f	f
153authorshipRecordCluster.json	{'empty'}	t	f	f	f
155authorshipRecordCluster.json	{'empty'}	t	f	f	f
158authorshipRecordCluster.json	{'empty'}	t	f	f	f
160authorshipRecordCluster.json	{'empty'}	t	f	f	f
165authorshipRecordCluster.json	{'empty'}	t	f	f	f
166authorshipRecordCluster.json	{'empty'}	t	f	f	f
167authorshipRecordCluster.json	{'empty'}	t	f	f	f
16authorshipRecordCluster.json	{'empty'}	t	f	f	f
170authorshipRecordCluster.json	{'empty'}	t	f	f	f
171authorshipRecordCluster.json	{'empty'}	t	f	f	f
175authorshipRecordCluster.json	{'empty'}	t	f	f	f
176authorshipRecordCluster.json	{'empty'}	t	f	f	f
180authorshipRecordCluster.json	{'empty'}	t	f	f	f
188authorshipRecordCluster.json	{'empty'}	t	f	f	f
194authorshipRecordCluster.json	{'empty'}	t	f	f	f
195authorshipRecordCluster.json	{'empty'}	t	f	f	f
19authorshipRecordCluster.json	{'empty'}	t	f	f	f
200authorshipRecordCluster.json	{'empty'}	t	f	f	f
202authorshipRecordCluster.json	{'empty'}	t	f	f	f
206authorshipRecordCluster.json	{'empty'}	t	f	f	f
213authorshipRecordCluster.json	{'empty'}	t	f	f	f
215authorshipRecordCluster.json	{'empty'}	t	f	f	f
216authorshipRecordCluster.json	{'empty'}	t	f	f	f
217authorshipRecordCluster.json	{'empty'}	t	f	f	f
224authorshipRecordCluster.json	{'empty'}	t	f	f	f
226authorshipRecordCluster.json	{'empty'}	t	f	f	f
228authorshipRecordCluster.json	{'empty'}	t	f	f	f
238authorshipRecordCluster.json	{'empty'}	t	f	f	f
244authorshipRecordCluster.json	{'empty'}	t	f	f	f
245authorshipRecordCluster.json	{'empty'}	t	f	f	f
246authorshipRecordCluster.json	{'empty'}	t	f	f	f
251authorshipRecordCluster.json	{'empty'}	t	f	f	f
25authorshipRecordCluster.json	{'empty'}	t	f	f	f
264authorshipRecordCluster.json	{'empty'}	t	f	f	f
267authorshipRecordCluster.json	{'empty'}	t	f	f	f
268authorshipRecordCluster.json	{'empty'}	t	f	f	f
270authorshipRecordCluster.json	{'empty'}	t	f	f	f
273authorshipRecordCluster.json	{'empty'}	t	f	f	f
274authorshipRecordCluster.json	{'empty'}	t	f	f	f
275authorshipRecordCluster.json	{'empty'}	t	f	f	f
276authorshipRecordCluster.json	{'empty'}	t	f	f	f
277authorshipRecordCluster.json	{'empty'}	t	f	f	f
278authorshipRecordCluster.json	{'empty'}	t	f	f	f
280authorshipRecordCluster.json	{'empty'}	t	f	f	f
284authorshipRecordCluster.json	{'empty'}	t	f	f	f
286authorshipRecordCluster.json	{'empty'}	t	f	f	f
289authorshipRecordCluster.json	{'empty'}	t	f	f	f
28authorshipRecordCluster.json	{'empty'}	t	f	f	f
295authorshipRecordCluster.json	{'empty'}	t	f	f	f
296authorshipRecordCluster.json	{'empty'}	t	f	f	f
299authorshipRecordCluster.json	{'empty'}	t	f	f	f
301authorshipRecordCluster.json	{'empty'}	t	f	f	f
302authorshipRecordCluster.json	{'empty'}	t	f	f	f
309authorshipRecordCluster.json	{'empty'}	t	f	f	f
311authorshipRecordCluster.json	{'empty'}	t	f	f	f
312authorshipRecordCluster.json	{'empty'}	t	f	f	f
313authorshipRecordCluster.json	{'empty'}	t	f	f	f
317authorshipRecordCluster.json	{'empty'}	t	f	f	f
320authorshipRecordCluster.json	{'empty'}	t	f	f	f
321authorshipRecordCluster.json	{'empty'}	t	f	f	f
322authorshipRecordCluster.json	{'empty'}	t	f	f	f
323authorshipRecordCluster.json	{'empty'}	t	f	f	f
325authorshipRecordCluster.json	{'empty'}	t	f	f	f
33authorshipRecordCluster.json	{'empty'}	t	f	f	f
346authorshipRecordCluster.json	{'empty'}	t	f	f	f
347authorshipRecordCluster.json	{'empty'}	t	f	f	f
348authorshipRecordCluster.json	{'empty'}	t	f	f	f
349authorshipRecordCluster.json	{'empty'}	t	f	f	f
34authorshipRecordCluster.json	{'empty'}	t	f	f	f
353authorshipRecordCluster.json	{'empty'}	t	f	f	f
371authorshipRecordCluster.json	{'empty'}	t	f	f	f
381authorshipRecordCluster.json	{'empty'}	t	f	f	f
385authorshipRecordCluster.json	{'empty'}	t	f	f	f
392authorshipRecordCluster.json	{'empty'}	t	f	f	f
3authorshipRecordCluster.json	{'empty'}	t	f	f	f
404authorshipRecordCluster.json	{'empty'}	t	f	f	f
405authorshipRecordCluster.json	{'empty'}	t	f	f	f
406authorshipRecordCluster.json	{'empty'}	t	f	f	f
423authorshipRecordCluster.json	{'empty'}	t	f	f	f
429authorshipRecordCluster.json	{'empty'}	t	f	f	f
434authorshipRecordCluster.json	{'empty'}	t	f	f	f
449authorshipRecordCluster.json	{'empty'}	t	f	f	f
451authorshipRecordCluster.json	{'empty'}	t	f	f	f
452authorshipRecordCluster.json	{'empty'}	t	f	f	f
454authorshipRecordCluster.json	{'empty'}	t	f	f	f
455authorshipRecordCluster.json	{'empty'}	t	f	f	f
456authorshipRecordCluster.json	{'empty'}	t	f	f	f
457authorshipRecordCluster.json	{'empty'}	t	f	f	f
458authorshipRecordCluster.json	{'empty'}	t	f	f	f
47authorshipRecordCluster.json	{'empty'}	t	f	f	f
481authorshipRecordCluster.json	{'empty'}	t	f	f	f
487authorshipRecordCluster.json	{'empty'}	t	f	f	f
493authorshipRecordCluster.json	{'empty'}	t	f	f	f
498authorshipRecordCluster.json	{'empty'}	t	f	f	f
499authorshipRecordCluster.json	{'empty'}	t	f	f	f
4authorshipRecordCluster.json	{'empty'}	t	f	f	f
503authorshipRecordCluster.json	{'empty'}	t	f	f	f
504authorshipRecordCluster.json	{'empty'}	t	f	f	f
521authorshipRecordCluster.json	{'empty'}	t	f	f	f
524authorshipRecordCluster.json	{'empty'}	t	f	f	f
526authorshipRecordCluster.json	{'empty'}	t	f	f	f
537authorshipRecordCluster.json	{'empty'}	t	f	f	f
540authorshipRecordCluster.json	{'empty'}	t	f	f	f
542authorshipRecordCluster.json	{'empty'}	t	f	f	f
545authorshipRecordCluster.json	{'empty'}	t	f	f	f
546authorshipRecordCluster.json	{'empty'}	t	f	f	f
547authorshipRecordCluster.json	{'empty'}	t	f	f	f
548authorshipRecordCluster.json	{'empty'}	t	f	f	f
550authorshipRecordCluster.json	{'empty'}	t	f	f	f
553authorshipRecordCluster.json	{'empty'}	t	f	f	f
554authorshipRecordCluster.json	{'empty'}	t	f	f	f
556authorshipRecordCluster.json	{'empty'}	t	f	f	f
557authorshipRecordCluster.json	{'empty'}	t	f	f	f
559authorshipRecordCluster.json	{'empty'}	t	f	f	f
560authorshipRecordCluster.json	{'empty'}	t	f	f	f
563authorshipRecordCluster.json	{'empty'}	t	f	f	f
570authorshipRecordCluster.json	{'empty'}	t	f	f	f
572authorshipRecordCluster.json	{'empty'}	t	f	f	f
573authorshipRecordCluster.json	{'empty'}	t	f	f	f
577authorshipRecordCluster.json	{'empty'}	t	f	f	f
578authorshipRecordCluster.json	{'empty'}	t	f	f	f
580authorshipRecordCluster.json	{'empty'}	t	f	f	f
583authorshipRecordCluster.json	{'empty'}	t	f	f	f
586authorshipRecordCluster.json	{'empty'}	t	f	f	f
587authorshipRecordCluster.json	{'empty'}	t	f	f	f
588authorshipRecordCluster.json	{'empty'}	t	f	f	f
589authorshipRecordCluster.json	{'empty'}	t	f	f	f
590authorshipRecordCluster.json	{'empty'}	t	f	f	f
592authorshipRecordCluster.json	{'empty'}	t	f	f	f
595authorshipRecordCluster.json	{'empty'}	t	f	f	f
596authorshipRecordCluster.json	{'empty'}	t	f	f	f
598authorshipRecordCluster.json	{'empty'}	t	f	f	f
599authorshipRecordCluster.json	{'empty'}	t	f	f	f
5authorshipRecordCluster.json	{'empty'}	t	f	f	f
600authorshipRecordCluster.json	{'empty'}	t	f	f	f
607authorshipRecordCluster.json	{'empty'}	t	f	f	f
608authorshipRecordCluster.json	{'empty'}	t	f	f	f
609authorshipRecordCluster.json	{'empty'}	t	f	f	f
60authorshipRecordCluster.json	{'empty'}	t	f	f	f
610authorshipRecordCluster.json	{'empty'}	t	f	f	f
612authorshipRecordCluster.json	{'empty'}	t	f	f	f
616authorshipRecordCluster.json	{'empty'}	t	f	f	f
619authorshipRecordCluster.json	{'empty'}	t	f	f	f
621authorshipRecordCluster.json	{'empty'}	t	f	f	f
62authorshipRecordCluster.json	{'empty'}	t	f	f	f
630authorshipRecordCluster.json	{'empty'}	t	f	f	f
641authorshipRecordCluster.json	{'empty'}	t	f	f	f
644authorshipRecordCluster.json	{'empty'}	t	f	f	f
645authorshipRecordCluster.json	{'empty'}	t	f	f	f
648authorshipRecordCluster.json	{'empty'}	t	f	f	f
649authorshipRecordCluster.json	{'empty'}	t	f	f	f
650authorshipRecordCluster.json	{'empty'}	t	f	f	f
651authorshipRecordCluster.json	{'empty'}	t	f	f	f
652authorshipRecordCluster.json	{'empty'}	t	f	f	f
653authorshipRecordCluster.json	{'empty'}	t	f	f	f
655authorshipRecordCluster.json	{'empty'}	t	f	f	f
656authorshipRecordCluster.json	{'empty'}	t	f	f	f
657authorshipRecordCluster.json	{'empty'}	t	f	f	f
658authorshipRecordCluster.json	{'empty'}	t	f	f	f
661authorshipRecordCluster.json	{'empty'}	t	f	f	f
663authorshipRecordCluster.json	{'empty'}	t	f	f	f
666authorshipRecordCluster.json	{'empty'}	t	f	f	f
667authorshipRecordCluster.json	{'empty'}	t	f	f	f
668authorshipRecordCluster.json	{'empty'}	t	f	f	f
670authorshipRecordCluster.json	{'empty'}	t	f	f	f
672authorshipRecordCluster.json	{'empty'}	t	f	f	f
673authorshipRecordCluster.json	{'empty'}	t	f	f	f
674authorshipRecordCluster.json	{'empty'}	t	f	f	f
675authorshipRecordCluster.json	{'empty'}	t	f	f	f
676authorshipRecordCluster.json	{'empty'}	t	f	f	f
678authorshipRecordCluster.json	{'empty'}	t	f	f	f
682authorshipRecordCluster.json	{'empty'}	t	f	f	f
683authorshipRecordCluster.json	{'empty'}	t	f	f	f
684authorshipRecordCluster.json	{'empty'}	t	f	f	f
685authorshipRecordCluster.json	{'empty'}	t	f	f	f
687authorshipRecordCluster.json	{'empty'}	t	f	f	f
697authorshipRecordCluster.json	{'empty'}	t	f	f	f
69authorshipRecordCluster.json	{'empty'}	t	f	f	f
700authorshipRecordCluster.json	{'empty'}	t	f	f	f
702authorshipRecordCluster.json	{'empty'}	t	f	f	f
703authorshipRecordCluster.json	{'empty'}	t	f	f	f
705authorshipRecordCluster.json	{'empty'}	t	f	f	f
706authorshipRecordCluster.json	{'empty'}	t	f	f	f
707authorshipRecordCluster.json	{'empty'}	t	f	f	f
708authorshipRecordCluster.json	{'empty'}	t	f	f	f
709authorshipRecordCluster.json	{'empty'}	t	f	f	f
711authorshipRecordCluster.json	{'empty'}	t	f	f	f
712authorshipRecordCluster.json	{'empty'}	t	f	f	f
713authorshipRecordCluster.json	{'empty'}	t	f	f	f
717authorshipRecordCluster.json	{'empty'}	t	f	f	f
718authorshipRecordCluster.json	{'empty'}	t	f	f	f
720authorshipRecordCluster.json	{'empty'}	t	f	f	f
721authorshipRecordCluster.json	{'empty'}	t	f	f	f
722authorshipRecordCluster.json	{'empty'}	t	f	f	f
724authorshipRecordCluster.json	{'empty'}	t	f	f	f
73authorshipRecordCluster.json	{'empty'}	t	f	f	f
761authorshipRecordCluster.json	{'empty'}	t	f	f	f
763authorshipRecordCluster.json	{'empty'}	t	f	f	f
765authorshipRecordCluster.json	{'empty'}	t	f	f	f
767authorshipRecordCluster.json	{'empty'}	t	f	f	f
769authorshipRecordCluster.json	{'empty'}	t	f	f	f
76authorshipRecordCluster.json	{'empty'}	t	f	f	f
770authorshipRecordCluster.json	{'empty'}	t	f	f	f
773authorshipRecordCluster.json	{'empty'}	t	f	f	f
774authorshipRecordCluster.json	{'empty'}	t	f	f	f
775authorshipRecordCluster.json	{'empty'}	t	f	f	f
777authorshipRecordCluster.json	{'empty'}	t	f	f	f
778authorshipRecordCluster.json	{'empty'}	t	f	f	f
779authorshipRecordCluster.json	{'empty'}	t	f	f	f
781authorshipRecordCluster.json	{'empty'}	t	f	f	f
782authorshipRecordCluster.json	{'empty'}	t	f	f	f
799authorshipRecordCluster.json	{'empty'}	t	f	f	f
7authorshipRecordCluster.json	{'empty'}	t	f	f	f
802authorshipRecordCluster.json	{'empty'}	t	f	f	f
812authorshipRecordCluster.json	{'empty'}	t	f	f	f
813authorshipRecordCluster.json	{'empty'}	t	f	f	f
814authorshipRecordCluster.json	{'empty'}	t	f	f	f
816authorshipRecordCluster.json	{'empty'}	t	f	f	f
817authorshipRecordCluster.json	{'empty'}	t	f	f	f
818authorshipRecordCluster.json	{'empty'}	t	f	f	f
819authorshipRecordCluster.json	{'empty'}	t	f	f	f
821authorshipRecordCluster.json	{'empty'}	t	f	f	f
822authorshipRecordCluster.json	{'empty'}	t	f	f	f
824authorshipRecordCluster.json	{'empty'}	t	f	f	f
828authorshipRecordCluster.json	{'empty'}	t	f	f	f
830authorshipRecordCluster.json	{'empty'}	t	f	f	f
832authorshipRecordCluster.json	{'empty'}	t	f	f	f
834authorshipRecordCluster.json	{'empty'}	t	f	f	f
835authorshipRecordCluster.json	{'empty'}	t	f	f	f
836authorshipRecordCluster.json	{'empty'}	t	f	f	f
837authorshipRecordCluster.json	{'empty'}	t	f	f	f
838authorshipRecordCluster.json	{'empty'}	t	f	f	f
839authorshipRecordCluster.json	{'empty'}	t	f	f	f
840authorshipRecordCluster.json	{'empty'}	t	f	f	f
841authorshipRecordCluster.json	{'empty'}	t	f	f	f
842authorshipRecordCluster.json	{'empty'}	t	f	f	f
843authorshipRecordCluster.json	{'empty'}	t	f	f	f
846authorshipRecordCluster.json	{'empty'}	t	f	f	f
849authorshipRecordCluster.json	{'empty'}	t	f	f	f
855authorshipRecordCluster.json	{'empty'}	t	f	f	f
857authorshipRecordCluster.json	{'empty'}	t	f	f	f
858authorshipRecordCluster.json	{'empty'}	t	f	f	f
861authorshipRecordCluster.json	{'empty'}	t	f	f	f
862authorshipRecordCluster.json	{'empty'}	t	f	f	f
864authorshipRecordCluster.json	{'empty'}	t	f	f	f
865authorshipRecordCluster.json	{'empty'}	t	f	f	f
868authorshipRecordCluster.json	{'empty'}	t	f	f	f
869authorshipRecordCluster.json	{'empty'}	t	f	f	f
86authorshipRecordCluster.json	{'empty'}	t	f	f	f
871authorshipRecordCluster.json	{'empty'}	t	f	f	f
873authorshipRecordCluster.json	{'empty'}	t	f	f	f
874authorshipRecordCluster.json	{'empty'}	t	f	f	f
876authorshipRecordCluster.json	{'empty'}	t	f	f	f
877authorshipRecordCluster.json	{'empty'}	t	f	f	f
879authorshipRecordCluster.json	{'empty'}	t	f	f	f
881authorshipRecordCluster.json	{'empty'}	t	f	f	f
882authorshipRecordCluster.json	{'empty'}	t	f	f	f
883authorshipRecordCluster.json	{'empty'}	t	f	f	f
884authorshipRecordCluster.json	{'empty'}	t	f	f	f
886authorshipRecordCluster.json	{'empty'}	t	f	f	f
889authorshipRecordCluster.json	{'empty'}	t	f	f	f
890authorshipRecordCluster.json	{'empty'}	t	f	f	f
892authorshipRecordCluster.json	{'empty'}	t	f	f	f
893authorshipRecordCluster.json	{'empty'}	t	f	f	f
894authorshipRecordCluster.json	{'empty'}	t	f	f	f
895authorshipRecordCluster.json	{'empty'}	t	f	f	f
896authorshipRecordCluster.json	{'empty'}	t	f	f	f
897authorshipRecordCluster.json	{'empty'}	t	f	f	f
898authorshipRecordCluster.json	{'empty'}	t	f	f	f
899authorshipRecordCluster.json	{'empty'}	t	f	f	f
901authorshipRecordCluster.json	{'empty'}	t	f	f	f
902authorshipRecordCluster.json	{'empty'}	t	f	f	f
903authorshipRecordCluster.json	{'empty'}	t	f	f	f
904authorshipRecordCluster.json	{'empty'}	t	f	f	f
905authorshipRecordCluster.json	{'empty'}	t	f	f	f
906authorshipRecordCluster.json	{'empty'}	t	f	f	f
907authorshipRecordCluster.json	{'empty'}	t	f	f	f
908authorshipRecordCluster.json	{'empty'}	t	f	f	f
909authorshipRecordCluster.json	{'empty'}	t	f	f	f
910authorshipRecordCluster.json	{'empty'}	t	f	f	f
911authorshipRecordCluster.json	{'empty'}	t	f	f	f
912authorshipRecordCluster.json	{'empty'}	t	f	f	f
913authorshipRecordCluster.json	{'empty'}	t	f	f	f
914authorshipRecordCluster.json	{'empty'}	t	f	f	f
915authorshipRecordCluster.json	{'empty'}	t	f	f	f
916authorshipRecordCluster.json	{'empty'}	t	f	f	f
917authorshipRecordCluster.json	{'empty'}	t	f	f	f
918authorshipRecordCluster.json	{'empty'}	t	f	f	f
919authorshipRecordCluster.json	{'empty'}	t	f	f	f
920authorshipRecordCluster.json	{'empty'}	t	f	f	f
921authorshipRecordCluster.json	{'empty'}	t	f	f	f
922authorshipRecordCluster.json	{'empty'}	t	f	f	f
923authorshipRecordCluster.json	{'empty'}	t	f	f	f
924authorshipRecordCluster.json	{'empty'}	t	f	f	f
928authorshipRecordCluster.json	{'empty'}	t	f	f	f
931authorshipRecordCluster.json	{'empty'}	t	f	f	f
933authorshipRecordCluster.json	{'empty'}	t	f	f	f
934authorshipRecordCluster.json	{'empty'}	t	f	f	f
935authorshipRecordCluster.json	{'empty'}	t	f	f	f
936authorshipRecordCluster.json	{'empty'}	t	f	f	f
937authorshipRecordCluster.json	{'empty'}	t	f	f	f
939authorshipRecordCluster.json	{'empty'}	t	f	f	f
93authorshipRecordCluster.json	{'empty'}	t	f	f	f
940authorshipRecordCluster.json	{'empty'}	t	f	f	f
944authorshipRecordCluster.json	{'empty'}	t	f	f	f
945authorshipRecordCluster.json	{'empty'}	t	f	f	f
946authorshipRecordCluster.json	{'empty'}	t	f	f	f
947authorshipRecordCluster.json	{'empty'}	t	f	f	f
948authorshipRecordCluster.json	{'empty'}	t	f	f	f
949authorshipRecordCluster.json	{'empty'}	t	f	f	f
950authorshipRecordCluster.json	{'empty'}	t	f	f	f
951authorshipRecordCluster.json	{'empty'}	t	f	f	f
952authorshipRecordCluster.json	{'empty'}	t	f	f	f
954authorshipRecordCluster.json	{'empty'}	t	f	f	f
956authorshipRecordCluster.json	{'empty'}	t	f	f	f
957authorshipRecordCluster.json	{'empty'}	t	f	f	f
958authorshipRecordCluster.json	{'empty'}	t	f	f	f
960authorshipRecordCluster.json	{'empty'}	t	f	f	f
961authorshipRecordCluster.json	{'empty'}	t	f	f	f
962authorshipRecordCluster.json	{'empty'}	t	f	f	f
963authorshipRecordCluster.json	{'empty'}	t	f	f	f
964authorshipRecordCluster.json	{'empty'}	t	f	f	f
966authorshipRecordCluster.json	{'empty'}	t	f	f	f
967authorshipRecordCluster.json	{'empty'}	t	f	f	f
968authorshipRecordCluster.json	{'empty'}	t	f	f	f
970authorshipRecordCluster.json	{'empty'}	t	f	f	f
971authorshipRecordCluster.json	{'empty'}	t	f	f	f
972authorshipRecordCluster.json	{'empty'}	t	f	f	f
973authorshipRecordCluster.json	{'empty'}	t	f	f	f
974authorshipRecordCluster.json	{'empty'}	t	f	f	f
976authorshipRecordCluster.json	{'empty'}	t	f	f	f
977authorshipRecordCluster.json	{'empty'}	t	f	f	f
978authorshipRecordCluster.json	{'empty'}	t	f	f	f
979authorshipRecordCluster.json	{'empty'}	t	f	f	f
981authorshipRecordCluster.json	{'empty'}	t	f	f	f
982authorshipRecordCluster.json	{'empty'}	t	f	f	f
983authorshipRecordCluster.json	{'empty'}	t	f	f	f
984authorshipRecordCluster.json	{'empty'}	t	f	f	f
985authorshipRecordCluster.json	{'empty'}	t	f	f	f
986authorshipRecordCluster.json	{'empty'}	t	f	f	f
989authorshipRecordCluster.json	{'empty'}	t	f	f	f
991authorshipRecordCluster.json	{'empty'}	t	f	f	f
992authorshipRecordCluster.json	{'empty'}	t	f	f	f
993authorshipRecordCluster.json	{'empty'}	t	f	f	f
995authorshipRecordCluster.json	{'empty'}	t	f	f	f
31authorshipRecordCluster.json	{'idref168835460','empty','idref177509538'}	f	t	t	t
35authorshipRecordCluster.json	{'idref110501004','empty','idref092156878','idref073357324'}	f	t	t	t
\.


--
-- Data for Name: tdu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tdu (name, idrefs, newidref, missidref, splitidref, mergeidref) FROM stdin;
110authorshipRecordCluster.json	{'idref17795521X'}	f	f	f	f
113authorshipRecordCluster.json	{'idref111753325'}	f	f	f	f
11authorshipRecordCluster.json	{'idref220104719'}	f	f	f	f
135authorshipRecordCluster.json	{'idref176269142'}	f	f	f	f
140authorshipRecordCluster.json	{'idref129090980'}	f	f	f	f
151authorshipRecordCluster.json	{'idref203161211'}	f	f	f	f
157authorshipRecordCluster.json	{'idref18177898X'}	f	f	f	f
164authorshipRecordCluster.json	{'idref23263579X'}	f	f	f	f
156authorshipRecordCluster.json	{'idref227793617'}	f	f	f	t
128authorshipRecordCluster.json	{'empty','idref224600540'}	f	t	f	t
14authorshipRecordCluster.json	{'idref069315302','empty'}	f	t	f	t
154authorshipRecordCluster.json	{'idref225833298','empty'}	f	t	f	t
17authorshipRecordCluster.json	{'empty','idref139527613'}	f	t	f	t
['10authorshipRecordCluster.json', '110authorshipRecordCluster.json']	{'idref17795521X','empty'}	f	t	f	t
0authorshipRecordCluster.json	{'empty','idref241292972','idref05031968X'}	f	t	t	t
122authorshipRecordCluster.json	{'empty','idref21980530X','idref227182308'}	f	t	t	t
20authorshipRecordCluster.json	{'empty','idref091878055'}	f	t	f	t
229authorshipRecordCluster.json	{'empty','idref080014100'}	f	t	f	t
1authorshipRecordCluster.json	{'empty','idref201772868','idref227300289','idref150113714','idref224600540'}	f	t	t	t
296authorshipRecordCluster.json	{'idref05031968X'}	f	f	f	f
372authorshipRecordCluster.json	{'idref196547172'}	f	f	f	f
413authorshipRecordCluster.json	{'idref189373016'}	f	f	f	f
427authorshipRecordCluster.json	{'idref089425863'}	f	f	f	f
43authorshipRecordCluster.json	{'idref113845332'}	f	f	f	f
470authorshipRecordCluster.json	{'idref190672374'}	f	f	f	f
297authorshipRecordCluster.json	{'idref031669816'}	f	f	f	t
355authorshipRecordCluster.json	{'idref031669816'}	f	f	f	t
27authorshipRecordCluster.json	{'empty','idref080014100'}	f	t	f	t
378authorshipRecordCluster.json	{'idref184101530','empty'}	f	t	f	t
37authorshipRecordCluster.json	{'empty','idref16639579X'}	f	t	f	t
38authorshipRecordCluster.json	{'empty','idref121463583'}	f	t	f	t
400authorshipRecordCluster.json	{'empty','idref164613552'}	f	t	f	t
447authorshipRecordCluster.json	{'empty','idref237904721'}	f	t	f	t
456authorshipRecordCluster.json	{'empty','idref144481448'}	f	t	f	t
460authorshipRecordCluster.json	{'empty','idref19470131X'}	f	t	f	t
2authorshipRecordCluster.json	{'empty','idref076611019','idref138548196'}	f	t	t	t
31authorshipRecordCluster.json	{'idref142561312','empty','idref075976854'}	f	t	t	t
32authorshipRecordCluster.json	{'empty','idref240439368','idref185442560'}	f	t	t	t
35authorshipRecordCluster.json	{'empty','idref197687393','idref076349497'}	f	t	t	t
3authorshipRecordCluster.json	{'idref132144484','empty','idref23326552X'}	f	t	t	t
451authorshipRecordCluster.json	{'idref242558976','empty','idref070071365'}	f	t	t	t
49authorshipRecordCluster.json	{'idref223527718'}	f	f	f	f
503authorshipRecordCluster.json	{'idref075704943'}	f	f	f	f
520authorshipRecordCluster.json	{'idref101326130'}	f	f	f	f
535authorshipRecordCluster.json	{'idref188442243'}	f	f	f	f
537authorshipRecordCluster.json	{'idref240094123'}	f	f	f	f
53authorshipRecordCluster.json	{'idref134212835'}	f	f	f	f
567authorshipRecordCluster.json	{'idref183559304'}	f	f	f	f
56authorshipRecordCluster.json	{'idref177268662'}	f	f	f	f
571authorshipRecordCluster.json	{'idref151216975'}	f	f	f	f
583authorshipRecordCluster.json	{'idref179473158'}	f	f	f	f
477authorshipRecordCluster.json	{'empty','idref196457858'}	f	t	f	t
4authorshipRecordCluster.json	{'empty','idref185551610'}	f	t	f	t
579authorshipRecordCluster.json	{'empty','idref139527613'}	f	t	f	t
600authorshipRecordCluster.json	{'idref069289859'}	f	f	f	f
603authorshipRecordCluster.json	{'idref069315302'}	f	f	f	f
61authorshipRecordCluster.json	{'idref181617315'}	f	f	f	f
624authorshipRecordCluster.json	{'idref123433770'}	f	f	f	f
628authorshipRecordCluster.json	{'idref169855155'}	f	f	f	f
682authorshipRecordCluster.json	{'idref16644779X'}	f	f	f	f
68authorshipRecordCluster.json	{'idref076349497'}	f	f	f	f
62authorshipRecordCluster.json	{'idref227793617'}	f	f	f	t
634authorshipRecordCluster.json	{'empty','idref076158837'}	f	t	f	t
65authorshipRecordCluster.json	{'idref191763772','empty'}	f	t	f	t
680authorshipRecordCluster.json	{'empty','idref179423460'}	f	t	f	t
683authorshipRecordCluster.json	{'empty','idref145470113'}	f	t	f	t
696authorshipRecordCluster.json	{'empty','idref233446966'}	f	t	f	t
5authorshipRecordCluster.json	{'idref060909544','empty','idref166506273','idref237508966','idref139527613'}	f	t	t	t
64authorshipRecordCluster.json	{'idref180744127','empty','idref099275643'}	f	t	t	t
73authorshipRecordCluster.json	{'idref076611019'}	f	f	f	f
7authorshipRecordCluster.json	{'idref067153135'}	f	f	f	f
75authorshipRecordCluster.json	{'empty','idref156212242'}	f	t	f	t
6authorshipRecordCluster.json	{'idref03505784X','empty','idref174111975','idref034707212'}	f	t	t	t
101authorshipRecordCluster.json	{'empty'}	t	f	f	f
104authorshipRecordCluster.json	{'empty'}	t	f	f	f
106authorshipRecordCluster.json	{'empty'}	t	f	f	f
109authorshipRecordCluster.json	{'empty'}	t	f	f	f
10authorshipRecordCluster.json	{'empty'}	t	f	f	f
115authorshipRecordCluster.json	{'empty'}	t	f	f	f
117authorshipRecordCluster.json	{'empty'}	t	f	f	f
118authorshipRecordCluster.json	{'empty'}	t	f	f	f
121authorshipRecordCluster.json	{'empty'}	t	f	f	f
123authorshipRecordCluster.json	{'empty'}	t	f	f	f
125authorshipRecordCluster.json	{'empty'}	t	f	f	f
126authorshipRecordCluster.json	{'empty'}	t	f	f	f
127authorshipRecordCluster.json	{'empty'}	t	f	f	f
129authorshipRecordCluster.json	{'empty'}	t	f	f	f
12authorshipRecordCluster.json	{'empty'}	t	f	f	f
133authorshipRecordCluster.json	{'empty'}	t	f	f	f
137authorshipRecordCluster.json	{'empty'}	t	f	f	f
139authorshipRecordCluster.json	{'empty'}	t	f	f	f
13authorshipRecordCluster.json	{'empty'}	t	f	f	f
141authorshipRecordCluster.json	{'empty'}	t	f	f	f
142authorshipRecordCluster.json	{'empty'}	t	f	f	f
143authorshipRecordCluster.json	{'empty'}	t	f	f	f
144authorshipRecordCluster.json	{'empty'}	t	f	f	f
145authorshipRecordCluster.json	{'empty'}	t	f	f	f
146authorshipRecordCluster.json	{'empty'}	t	f	f	f
147authorshipRecordCluster.json	{'empty'}	t	f	f	f
149authorshipRecordCluster.json	{'empty'}	t	f	f	f
152authorshipRecordCluster.json	{'empty'}	t	f	f	f
15authorshipRecordCluster.json	{'empty'}	t	f	f	f
160authorshipRecordCluster.json	{'empty'}	t	f	f	f
162authorshipRecordCluster.json	{'empty'}	t	f	f	f
166authorshipRecordCluster.json	{'empty'}	t	f	f	f
167authorshipRecordCluster.json	{'empty'}	t	f	f	f
170authorshipRecordCluster.json	{'empty'}	t	f	f	f
171authorshipRecordCluster.json	{'empty'}	t	f	f	f
85authorshipRecordCluster.json	{'empty','idref069246386'}	f	t	f	t
8authorshipRecordCluster.json	{'empty','idref176269975'}	f	t	f	t
86authorshipRecordCluster.json	{'empty','idref150113714','idref191241032'}	f	t	t	t
9authorshipRecordCluster.json	{'idref086969420','empty','idref177207914'}	f	t	t	t
172authorshipRecordCluster.json	{'empty'}	t	f	f	f
173authorshipRecordCluster.json	{'empty'}	t	f	f	f
174authorshipRecordCluster.json	{'empty'}	t	f	f	f
175authorshipRecordCluster.json	{'empty'}	t	f	f	f
176authorshipRecordCluster.json	{'empty'}	t	f	f	f
177authorshipRecordCluster.json	{'empty'}	t	f	f	f
178authorshipRecordCluster.json	{'empty'}	t	f	f	f
179authorshipRecordCluster.json	{'empty'}	t	f	f	f
180authorshipRecordCluster.json	{'empty'}	t	f	f	f
181authorshipRecordCluster.json	{'empty'}	t	f	f	f
182authorshipRecordCluster.json	{'empty'}	t	f	f	f
183authorshipRecordCluster.json	{'empty'}	t	f	f	f
184authorshipRecordCluster.json	{'empty'}	t	f	f	f
185authorshipRecordCluster.json	{'empty'}	t	f	f	f
186authorshipRecordCluster.json	{'empty'}	t	f	f	f
189authorshipRecordCluster.json	{'empty'}	t	f	f	f
18authorshipRecordCluster.json	{'empty'}	t	f	f	f
190authorshipRecordCluster.json	{'empty'}	t	f	f	f
191authorshipRecordCluster.json	{'empty'}	t	f	f	f
192authorshipRecordCluster.json	{'empty'}	t	f	f	f
193authorshipRecordCluster.json	{'empty'}	t	f	f	f
194authorshipRecordCluster.json	{'empty'}	t	f	f	f
195authorshipRecordCluster.json	{'empty'}	t	f	f	f
196authorshipRecordCluster.json	{'empty'}	t	f	f	f
197authorshipRecordCluster.json	{'empty'}	t	f	f	f
198authorshipRecordCluster.json	{'empty'}	t	f	f	f
199authorshipRecordCluster.json	{'empty'}	t	f	f	f
276authorshipRecordCluster.json	{'empty'}	t	f	f	f
200authorshipRecordCluster.json	{'empty'}	t	f	f	f
201authorshipRecordCluster.json	{'empty'}	t	f	f	f
202authorshipRecordCluster.json	{'empty'}	t	f	f	f
203authorshipRecordCluster.json	{'empty'}	t	f	f	f
204authorshipRecordCluster.json	{'empty'}	t	f	f	f
205authorshipRecordCluster.json	{'empty'}	t	f	f	f
206authorshipRecordCluster.json	{'empty'}	t	f	f	f
207authorshipRecordCluster.json	{'empty'}	t	f	f	f
208authorshipRecordCluster.json	{'empty'}	t	f	f	f
209authorshipRecordCluster.json	{'empty'}	t	f	f	f
210authorshipRecordCluster.json	{'empty'}	t	f	f	f
211authorshipRecordCluster.json	{'empty'}	t	f	f	f
212authorshipRecordCluster.json	{'empty'}	t	f	f	f
213authorshipRecordCluster.json	{'empty'}	t	f	f	f
214authorshipRecordCluster.json	{'empty'}	t	f	f	f
215authorshipRecordCluster.json	{'empty'}	t	f	f	f
216authorshipRecordCluster.json	{'empty'}	t	f	f	f
217authorshipRecordCluster.json	{'empty'}	t	f	f	f
218authorshipRecordCluster.json	{'empty'}	t	f	f	f
219authorshipRecordCluster.json	{'empty'}	t	f	f	f
21authorshipRecordCluster.json	{'empty'}	t	f	f	f
220authorshipRecordCluster.json	{'empty'}	t	f	f	f
221authorshipRecordCluster.json	{'empty'}	t	f	f	f
222authorshipRecordCluster.json	{'empty'}	t	f	f	f
223authorshipRecordCluster.json	{'empty'}	t	f	f	f
224authorshipRecordCluster.json	{'empty'}	t	f	f	f
225authorshipRecordCluster.json	{'empty'}	t	f	f	f
226authorshipRecordCluster.json	{'empty'}	t	f	f	f
227authorshipRecordCluster.json	{'empty'}	t	f	f	f
228authorshipRecordCluster.json	{'empty'}	t	f	f	f
22authorshipRecordCluster.json	{'empty'}	t	f	f	f
230authorshipRecordCluster.json	{'empty'}	t	f	f	f
231authorshipRecordCluster.json	{'empty'}	t	f	f	f
232authorshipRecordCluster.json	{'empty'}	t	f	f	f
233authorshipRecordCluster.json	{'empty'}	t	f	f	f
234authorshipRecordCluster.json	{'empty'}	t	f	f	f
235authorshipRecordCluster.json	{'empty'}	t	f	f	f
236authorshipRecordCluster.json	{'empty'}	t	f	f	f
237authorshipRecordCluster.json	{'empty'}	t	f	f	f
238authorshipRecordCluster.json	{'empty'}	t	f	f	f
239authorshipRecordCluster.json	{'empty'}	t	f	f	f
23authorshipRecordCluster.json	{'empty'}	t	f	f	f
240authorshipRecordCluster.json	{'empty'}	t	f	f	f
241authorshipRecordCluster.json	{'empty'}	t	f	f	f
242authorshipRecordCluster.json	{'empty'}	t	f	f	f
243authorshipRecordCluster.json	{'empty'}	t	f	f	f
244authorshipRecordCluster.json	{'empty'}	t	f	f	f
245authorshipRecordCluster.json	{'empty'}	t	f	f	f
246authorshipRecordCluster.json	{'empty'}	t	f	f	f
247authorshipRecordCluster.json	{'empty'}	t	f	f	f
248authorshipRecordCluster.json	{'empty'}	t	f	f	f
249authorshipRecordCluster.json	{'empty'}	t	f	f	f
250authorshipRecordCluster.json	{'empty'}	t	f	f	f
252authorshipRecordCluster.json	{'empty'}	t	f	f	f
253authorshipRecordCluster.json	{'empty'}	t	f	f	f
254authorshipRecordCluster.json	{'empty'}	t	f	f	f
256authorshipRecordCluster.json	{'empty'}	t	f	f	f
257authorshipRecordCluster.json	{'empty'}	t	f	f	f
258authorshipRecordCluster.json	{'empty'}	t	f	f	f
259authorshipRecordCluster.json	{'empty'}	t	f	f	f
260authorshipRecordCluster.json	{'empty'}	t	f	f	f
261authorshipRecordCluster.json	{'empty'}	t	f	f	f
262authorshipRecordCluster.json	{'empty'}	t	f	f	f
263authorshipRecordCluster.json	{'empty'}	t	f	f	f
264authorshipRecordCluster.json	{'empty'}	t	f	f	f
265authorshipRecordCluster.json	{'empty'}	t	f	f	f
266authorshipRecordCluster.json	{'empty'}	t	f	f	f
267authorshipRecordCluster.json	{'empty'}	t	f	f	f
268authorshipRecordCluster.json	{'empty'}	t	f	f	f
269authorshipRecordCluster.json	{'empty'}	t	f	f	f
26authorshipRecordCluster.json	{'empty'}	t	f	f	f
270authorshipRecordCluster.json	{'empty'}	t	f	f	f
271authorshipRecordCluster.json	{'empty'}	t	f	f	f
272authorshipRecordCluster.json	{'empty'}	t	f	f	f
273authorshipRecordCluster.json	{'empty'}	t	f	f	f
274authorshipRecordCluster.json	{'empty'}	t	f	f	f
275authorshipRecordCluster.json	{'empty'}	t	f	f	f
277authorshipRecordCluster.json	{'empty'}	t	f	f	f
278authorshipRecordCluster.json	{'empty'}	t	f	f	f
279authorshipRecordCluster.json	{'empty'}	t	f	f	f
280authorshipRecordCluster.json	{'empty'}	t	f	f	f
281authorshipRecordCluster.json	{'empty'}	t	f	f	f
282authorshipRecordCluster.json	{'empty'}	t	f	f	f
283authorshipRecordCluster.json	{'empty'}	t	f	f	f
284authorshipRecordCluster.json	{'empty'}	t	f	f	f
285authorshipRecordCluster.json	{'empty'}	t	f	f	f
286authorshipRecordCluster.json	{'empty'}	t	f	f	f
287authorshipRecordCluster.json	{'empty'}	t	f	f	f
288authorshipRecordCluster.json	{'empty'}	t	f	f	f
290authorshipRecordCluster.json	{'empty'}	t	f	f	f
291authorshipRecordCluster.json	{'empty'}	t	f	f	f
292authorshipRecordCluster.json	{'empty'}	t	f	f	f
293authorshipRecordCluster.json	{'empty'}	t	f	f	f
295authorshipRecordCluster.json	{'empty'}	t	f	f	f
29authorshipRecordCluster.json	{'empty'}	t	f	f	f
357authorshipRecordCluster.json	{'empty'}	t	f	f	f
359authorshipRecordCluster.json	{'empty'}	t	f	f	f
383authorshipRecordCluster.json	{'empty'}	t	f	f	f
386authorshipRecordCluster.json	{'empty'}	t	f	f	f
388authorshipRecordCluster.json	{'empty'}	t	f	f	f
389authorshipRecordCluster.json	{'empty'}	t	f	f	f
390authorshipRecordCluster.json	{'empty'}	t	f	f	f
392authorshipRecordCluster.json	{'empty'}	t	f	f	f
394authorshipRecordCluster.json	{'empty'}	t	f	f	f
395authorshipRecordCluster.json	{'empty'}	t	f	f	f
399authorshipRecordCluster.json	{'empty'}	t	f	f	f
402authorshipRecordCluster.json	{'empty'}	t	f	f	f
403authorshipRecordCluster.json	{'empty'}	t	f	f	f
405authorshipRecordCluster.json	{'empty'}	t	f	f	f
406authorshipRecordCluster.json	{'empty'}	t	f	f	f
407authorshipRecordCluster.json	{'empty'}	t	f	f	f
408authorshipRecordCluster.json	{'empty'}	t	f	f	f
412authorshipRecordCluster.json	{'empty'}	t	f	f	f
416authorshipRecordCluster.json	{'empty'}	t	f	f	f
420authorshipRecordCluster.json	{'empty'}	t	f	f	f
422authorshipRecordCluster.json	{'empty'}	t	f	f	f
423authorshipRecordCluster.json	{'empty'}	t	f	f	f
425authorshipRecordCluster.json	{'empty'}	t	f	f	f
426authorshipRecordCluster.json	{'empty'}	t	f	f	f
440authorshipRecordCluster.json	{'empty'}	t	f	f	f
442authorshipRecordCluster.json	{'empty'}	t	f	f	f
443authorshipRecordCluster.json	{'empty'}	t	f	f	f
444authorshipRecordCluster.json	{'empty'}	t	f	f	f
445authorshipRecordCluster.json	{'empty'}	t	f	f	f
449authorshipRecordCluster.json	{'empty'}	t	f	f	f
461authorshipRecordCluster.json	{'empty'}	t	f	f	f
462authorshipRecordCluster.json	{'empty'}	t	f	f	f
463authorshipRecordCluster.json	{'empty'}	t	f	f	f
464authorshipRecordCluster.json	{'empty'}	t	f	f	f
465authorshipRecordCluster.json	{'empty'}	t	f	f	f
468authorshipRecordCluster.json	{'empty'}	t	f	f	f
469authorshipRecordCluster.json	{'empty'}	t	f	f	f
46authorshipRecordCluster.json	{'empty'}	t	f	f	f
475authorshipRecordCluster.json	{'empty'}	t	f	f	f
476authorshipRecordCluster.json	{'empty'}	t	f	f	f
485authorshipRecordCluster.json	{'empty'}	t	f	f	f
486authorshipRecordCluster.json	{'empty'}	t	f	f	f
487authorshipRecordCluster.json	{'empty'}	t	f	f	f
488authorshipRecordCluster.json	{'empty'}	t	f	f	f
48authorshipRecordCluster.json	{'empty'}	t	f	f	f
491authorshipRecordCluster.json	{'empty'}	t	f	f	f
492authorshipRecordCluster.json	{'empty'}	t	f	f	f
493authorshipRecordCluster.json	{'empty'}	t	f	f	f
495authorshipRecordCluster.json	{'empty'}	t	f	f	f
499authorshipRecordCluster.json	{'empty'}	t	f	f	f
501authorshipRecordCluster.json	{'empty'}	t	f	f	f
504authorshipRecordCluster.json	{'empty'}	t	f	f	f
505authorshipRecordCluster.json	{'empty'}	t	f	f	f
507authorshipRecordCluster.json	{'empty'}	t	f	f	f
509authorshipRecordCluster.json	{'empty'}	t	f	f	f
50authorshipRecordCluster.json	{'empty'}	t	f	f	f
510authorshipRecordCluster.json	{'empty'}	t	f	f	f
511authorshipRecordCluster.json	{'empty'}	t	f	f	f
512authorshipRecordCluster.json	{'empty'}	t	f	f	f
513authorshipRecordCluster.json	{'empty'}	t	f	f	f
514authorshipRecordCluster.json	{'empty'}	t	f	f	f
515authorshipRecordCluster.json	{'empty'}	t	f	f	f
516authorshipRecordCluster.json	{'empty'}	t	f	f	f
517authorshipRecordCluster.json	{'empty'}	t	f	f	f
518authorshipRecordCluster.json	{'empty'}	t	f	f	f
519authorshipRecordCluster.json	{'empty'}	t	f	f	f
521authorshipRecordCluster.json	{'empty'}	t	f	f	f
523authorshipRecordCluster.json	{'empty'}	t	f	f	f
524authorshipRecordCluster.json	{'empty'}	t	f	f	f
525authorshipRecordCluster.json	{'empty'}	t	f	f	f
527authorshipRecordCluster.json	{'empty'}	t	f	f	f
52authorshipRecordCluster.json	{'empty'}	t	f	f	f
530authorshipRecordCluster.json	{'empty'}	t	f	f	f
531authorshipRecordCluster.json	{'empty'}	t	f	f	f
532authorshipRecordCluster.json	{'empty'}	t	f	f	f
533authorshipRecordCluster.json	{'empty'}	t	f	f	f
534authorshipRecordCluster.json	{'empty'}	t	f	f	f
536authorshipRecordCluster.json	{'empty'}	t	f	f	f
538authorshipRecordCluster.json	{'empty'}	t	f	f	f
540authorshipRecordCluster.json	{'empty'}	t	f	f	f
543authorshipRecordCluster.json	{'empty'}	t	f	f	f
544authorshipRecordCluster.json	{'empty'}	t	f	f	f
546authorshipRecordCluster.json	{'empty'}	t	f	f	f
547authorshipRecordCluster.json	{'empty'}	t	f	f	f
548authorshipRecordCluster.json	{'empty'}	t	f	f	f
549authorshipRecordCluster.json	{'empty'}	t	f	f	f
550authorshipRecordCluster.json	{'empty'}	t	f	f	f
55authorshipRecordCluster.json	{'empty'}	t	f	f	f
561authorshipRecordCluster.json	{'empty'}	t	f	f	f
569authorshipRecordCluster.json	{'empty'}	t	f	f	f
573authorshipRecordCluster.json	{'empty'}	t	f	f	f
578authorshipRecordCluster.json	{'empty'}	t	f	f	f
57authorshipRecordCluster.json	{'empty'}	t	f	f	f
581authorshipRecordCluster.json	{'empty'}	t	f	f	f
582authorshipRecordCluster.json	{'empty'}	t	f	f	f
584authorshipRecordCluster.json	{'empty'}	t	f	f	f
585authorshipRecordCluster.json	{'empty'}	t	f	f	f
587authorshipRecordCluster.json	{'empty'}	t	f	f	f
588authorshipRecordCluster.json	{'empty'}	t	f	f	f
589authorshipRecordCluster.json	{'empty'}	t	f	f	f
591authorshipRecordCluster.json	{'empty'}	t	f	f	f
592authorshipRecordCluster.json	{'empty'}	t	f	f	f
593authorshipRecordCluster.json	{'empty'}	t	f	f	f
594authorshipRecordCluster.json	{'empty'}	t	f	f	f
598authorshipRecordCluster.json	{'empty'}	t	f	f	f
599authorshipRecordCluster.json	{'empty'}	t	f	f	f
59authorshipRecordCluster.json	{'empty'}	t	f	f	f
601authorshipRecordCluster.json	{'empty'}	t	f	f	f
602authorshipRecordCluster.json	{'empty'}	t	f	f	f
604authorshipRecordCluster.json	{'empty'}	t	f	f	f
607authorshipRecordCluster.json	{'empty'}	t	f	f	f
60authorshipRecordCluster.json	{'empty'}	t	f	f	f
610authorshipRecordCluster.json	{'empty'}	t	f	f	f
611authorshipRecordCluster.json	{'empty'}	t	f	f	f
613authorshipRecordCluster.json	{'empty'}	t	f	f	f
615authorshipRecordCluster.json	{'empty'}	t	f	f	f
616authorshipRecordCluster.json	{'empty'}	t	f	f	f
617authorshipRecordCluster.json	{'empty'}	t	f	f	f
620authorshipRecordCluster.json	{'empty'}	t	f	f	f
621authorshipRecordCluster.json	{'empty'}	t	f	f	f
622authorshipRecordCluster.json	{'empty'}	t	f	f	f
625authorshipRecordCluster.json	{'empty'}	t	f	f	f
626authorshipRecordCluster.json	{'empty'}	t	f	f	f
627authorshipRecordCluster.json	{'empty'}	t	f	f	f
629authorshipRecordCluster.json	{'empty'}	t	f	f	f
630authorshipRecordCluster.json	{'empty'}	t	f	f	f
631authorshipRecordCluster.json	{'empty'}	t	f	f	f
632authorshipRecordCluster.json	{'empty'}	t	f	f	f
633authorshipRecordCluster.json	{'empty'}	t	f	f	f
637authorshipRecordCluster.json	{'empty'}	t	f	f	f
645authorshipRecordCluster.json	{'empty'}	t	f	f	f
646authorshipRecordCluster.json	{'empty'}	t	f	f	f
647authorshipRecordCluster.json	{'empty'}	t	f	f	f
648authorshipRecordCluster.json	{'empty'}	t	f	f	f
650authorshipRecordCluster.json	{'empty'}	t	f	f	f
651authorshipRecordCluster.json	{'empty'}	t	f	f	f
655authorshipRecordCluster.json	{'empty'}	t	f	f	f
657authorshipRecordCluster.json	{'empty'}	t	f	f	f
658authorshipRecordCluster.json	{'empty'}	t	f	f	f
659authorshipRecordCluster.json	{'empty'}	t	f	f	f
660authorshipRecordCluster.json	{'empty'}	t	f	f	f
661authorshipRecordCluster.json	{'empty'}	t	f	f	f
662authorshipRecordCluster.json	{'empty'}	t	f	f	f
663authorshipRecordCluster.json	{'empty'}	t	f	f	f
664authorshipRecordCluster.json	{'empty'}	t	f	f	f
665authorshipRecordCluster.json	{'empty'}	t	f	f	f
666authorshipRecordCluster.json	{'empty'}	t	f	f	f
667authorshipRecordCluster.json	{'empty'}	t	f	f	f
668authorshipRecordCluster.json	{'empty'}	t	f	f	f
669authorshipRecordCluster.json	{'empty'}	t	f	f	f
670authorshipRecordCluster.json	{'empty'}	t	f	f	f
671authorshipRecordCluster.json	{'empty'}	t	f	f	f
672authorshipRecordCluster.json	{'empty'}	t	f	f	f
673authorshipRecordCluster.json	{'empty'}	t	f	f	f
674authorshipRecordCluster.json	{'empty'}	t	f	f	f
675authorshipRecordCluster.json	{'empty'}	t	f	f	f
677authorshipRecordCluster.json	{'empty'}	t	f	f	f
678authorshipRecordCluster.json	{'empty'}	t	f	f	f
684authorshipRecordCluster.json	{'empty'}	t	f	f	f
685authorshipRecordCluster.json	{'empty'}	t	f	f	f
687authorshipRecordCluster.json	{'empty'}	t	f	f	f
688authorshipRecordCluster.json	{'empty'}	t	f	f	f
['115authorshipRecordCluster.json', '117authorshipRecordCluster.json']	{'empty'}	t	f	f	f
691authorshipRecordCluster.json	{'empty'}	t	f	f	f
693authorshipRecordCluster.json	{'empty'}	t	f	f	f
694authorshipRecordCluster.json	{'empty'}	t	f	f	f
695authorshipRecordCluster.json	{'empty'}	t	f	f	f
699authorshipRecordCluster.json	{'empty'}	t	f	f	f
69authorshipRecordCluster.json	{'empty'}	t	f	f	f
808authorshipRecordCluster.json	{'empty'}	t	f	f	f
706authorshipRecordCluster.json	{'empty'}	t	f	f	f
707authorshipRecordCluster.json	{'empty'}	t	f	f	f
708authorshipRecordCluster.json	{'empty'}	t	f	f	f
709authorshipRecordCluster.json	{'empty'}	t	f	f	f
714authorshipRecordCluster.json	{'empty'}	t	f	f	f
715authorshipRecordCluster.json	{'empty'}	t	f	f	f
717authorshipRecordCluster.json	{'empty'}	t	f	f	f
718authorshipRecordCluster.json	{'empty'}	t	f	f	f
71authorshipRecordCluster.json	{'empty'}	t	f	f	f
720authorshipRecordCluster.json	{'empty'}	t	f	f	f
721authorshipRecordCluster.json	{'empty'}	t	f	f	f
723authorshipRecordCluster.json	{'empty'}	t	f	f	f
725authorshipRecordCluster.json	{'empty'}	t	f	f	f
728authorshipRecordCluster.json	{'empty'}	t	f	f	f
730authorshipRecordCluster.json	{'empty'}	t	f	f	f
731authorshipRecordCluster.json	{'empty'}	t	f	f	f
735authorshipRecordCluster.json	{'empty'}	t	f	f	f
736authorshipRecordCluster.json	{'empty'}	t	f	f	f
737authorshipRecordCluster.json	{'empty'}	t	f	f	f
738authorshipRecordCluster.json	{'empty'}	t	f	f	f
739authorshipRecordCluster.json	{'empty'}	t	f	f	f
['101authorshipRecordCluster.json', '104authorshipRecordCluster.json']	{'empty'}	t	f	f	f
743authorshipRecordCluster.json	{'empty'}	t	f	f	f
744authorshipRecordCluster.json	{'empty'}	t	f	f	f
745authorshipRecordCluster.json	{'empty'}	t	f	f	f
746authorshipRecordCluster.json	{'empty'}	t	f	f	f
747authorshipRecordCluster.json	{'empty'}	t	f	f	f
748authorshipRecordCluster.json	{'empty'}	t	f	f	f
749authorshipRecordCluster.json	{'empty'}	t	f	f	f
750authorshipRecordCluster.json	{'empty'}	t	f	f	f
751authorshipRecordCluster.json	{'empty'}	t	f	f	f
752authorshipRecordCluster.json	{'empty'}	t	f	f	f
753authorshipRecordCluster.json	{'empty'}	t	f	f	f
754authorshipRecordCluster.json	{'empty'}	t	f	f	f
755authorshipRecordCluster.json	{'empty'}	t	f	f	f
756authorshipRecordCluster.json	{'empty'}	t	f	f	f
757authorshipRecordCluster.json	{'empty'}	t	f	f	f
758authorshipRecordCluster.json	{'empty'}	t	f	f	f
759authorshipRecordCluster.json	{'empty'}	t	f	f	f
760authorshipRecordCluster.json	{'empty'}	t	f	f	f
762authorshipRecordCluster.json	{'empty'}	t	f	f	f
763authorshipRecordCluster.json	{'empty'}	t	f	f	f
764authorshipRecordCluster.json	{'empty'}	t	f	f	f
768authorshipRecordCluster.json	{'empty'}	t	f	f	f
769authorshipRecordCluster.json	{'empty'}	t	f	f	f
76authorshipRecordCluster.json	{'empty'}	t	f	f	f
771authorshipRecordCluster.json	{'empty'}	t	f	f	f
773authorshipRecordCluster.json	{'empty'}	t	f	f	f
774authorshipRecordCluster.json	{'empty'}	t	f	f	f
775authorshipRecordCluster.json	{'empty'}	t	f	f	f
776authorshipRecordCluster.json	{'empty'}	t	f	f	f
777authorshipRecordCluster.json	{'empty'}	t	f	f	f
778authorshipRecordCluster.json	{'empty'}	t	f	f	f
77authorshipRecordCluster.json	{'empty'}	t	f	f	f
780authorshipRecordCluster.json	{'empty'}	t	f	f	f
783authorshipRecordCluster.json	{'empty'}	t	f	f	f
784authorshipRecordCluster.json	{'empty'}	t	f	f	f
785authorshipRecordCluster.json	{'empty'}	t	f	f	f
786authorshipRecordCluster.json	{'empty'}	t	f	f	f
787authorshipRecordCluster.json	{'empty'}	t	f	f	f
788authorshipRecordCluster.json	{'empty'}	t	f	f	f
789authorshipRecordCluster.json	{'empty'}	t	f	f	f
78authorshipRecordCluster.json	{'empty'}	t	f	f	f
791authorshipRecordCluster.json	{'empty'}	t	f	f	f
792authorshipRecordCluster.json	{'empty'}	t	f	f	f
793authorshipRecordCluster.json	{'empty'}	t	f	f	f
794authorshipRecordCluster.json	{'empty'}	t	f	f	f
795authorshipRecordCluster.json	{'empty'}	t	f	f	f
796authorshipRecordCluster.json	{'empty'}	t	f	f	f
797authorshipRecordCluster.json	{'empty'}	t	f	f	f
798authorshipRecordCluster.json	{'empty'}	t	f	f	f
799authorshipRecordCluster.json	{'empty'}	t	f	f	f
801authorshipRecordCluster.json	{'empty'}	t	f	f	f
802authorshipRecordCluster.json	{'empty'}	t	f	f	f
805authorshipRecordCluster.json	{'empty'}	t	f	f	f
807authorshipRecordCluster.json	{'empty'}	t	f	f	f
80authorshipRecordCluster.json	{'empty'}	t	f	f	f
810authorshipRecordCluster.json	{'empty'}	t	f	f	f
811authorshipRecordCluster.json	{'empty'}	t	f	f	f
812authorshipRecordCluster.json	{'empty'}	t	f	f	f
813authorshipRecordCluster.json	{'empty'}	t	f	f	f
814authorshipRecordCluster.json	{'empty'}	t	f	f	f
815authorshipRecordCluster.json	{'empty'}	t	f	f	f
816authorshipRecordCluster.json	{'empty'}	t	f	f	f
817authorshipRecordCluster.json	{'empty'}	t	f	f	f
818authorshipRecordCluster.json	{'empty'}	t	f	f	f
819authorshipRecordCluster.json	{'empty'}	t	f	f	f
820authorshipRecordCluster.json	{'empty'}	t	f	f	f
822authorshipRecordCluster.json	{'empty'}	t	f	f	f
823authorshipRecordCluster.json	{'empty'}	t	f	f	f
824authorshipRecordCluster.json	{'empty'}	t	f	f	f
825authorshipRecordCluster.json	{'empty'}	t	f	f	f
826authorshipRecordCluster.json	{'empty'}	t	f	f	f
827authorshipRecordCluster.json	{'empty'}	t	f	f	f
828authorshipRecordCluster.json	{'empty'}	t	f	f	f
829authorshipRecordCluster.json	{'empty'}	t	f	f	f
830authorshipRecordCluster.json	{'empty'}	t	f	f	f
831authorshipRecordCluster.json	{'empty'}	t	f	f	f
832authorshipRecordCluster.json	{'empty'}	t	f	f	f
833authorshipRecordCluster.json	{'empty'}	t	f	f	f
834authorshipRecordCluster.json	{'empty'}	t	f	f	f
835authorshipRecordCluster.json	{'empty'}	t	f	f	f
836authorshipRecordCluster.json	{'empty'}	t	f	f	f
837authorshipRecordCluster.json	{'empty'}	t	f	f	f
838authorshipRecordCluster.json	{'empty'}	t	f	f	f
839authorshipRecordCluster.json	{'empty'}	t	f	f	f
83authorshipRecordCluster.json	{'empty'}	t	f	f	f
840authorshipRecordCluster.json	{'empty'}	t	f	f	f
841authorshipRecordCluster.json	{'empty'}	t	f	f	f
842authorshipRecordCluster.json	{'empty'}	t	f	f	f
84authorshipRecordCluster.json	{'empty'}	t	f	f	f
87authorshipRecordCluster.json	{'empty'}	t	f	f	f
88authorshipRecordCluster.json	{'empty'}	t	f	f	f
89authorshipRecordCluster.json	{'empty'}	t	f	f	f
91authorshipRecordCluster.json	{'empty'}	t	f	f	f
93authorshipRecordCluster.json	{'empty'}	t	f	f	f
95authorshipRecordCluster.json	{'empty'}	t	f	f	f
97authorshipRecordCluster.json	{'empty'}	t	f	f	f
\.


--
-- Name: ceb ceb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ceb
    ADD CONSTRAINT ceb_pkey PRIMARY KEY (cluster_id);


--
-- PostgreSQL database dump complete
--

