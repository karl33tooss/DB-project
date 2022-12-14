PGDMP                     
    z            alien_backup_updated    14.5    14.5 #    .           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            /           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            0           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            1           1262    24867    alien_backup_updated    DATABASE     t   CREATE DATABASE alien_backup_updated WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Ukrainian_Ukraine.1251';
 $   DROP DATABASE alien_backup_updated;
                postgres    false            ?            1259    24868    alien    TABLE     ?   CREATE TABLE public.alien (
    isn character varying NOT NULL,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    birth_date date NOT NULL
);
    DROP TABLE public.alien;
       public         heap    postgres    false            ?            1259    24873    alien_spaceship    TABLE     z   CREATE TABLE public.alien_spaceship (
    isn character varying NOT NULL,
    spaceship_vin character varying NOT NULL
);
 #   DROP TABLE public.alien_spaceship;
       public         heap    postgres    false            ?            1259    24878    aliens_experiment    TABLE     {   CREATE TABLE public.aliens_experiment (
    experiment_code smallint NOT NULL,
    alien_isn character varying NOT NULL
);
 %   DROP TABLE public.aliens_experiment;
       public         heap    postgres    false            ?            1259    24883    aliens_planet    TABLE     v   CREATE TABLE public.aliens_planet (
    isn character varying NOT NULL,
    planet_code character varying NOT NULL
);
 !   DROP TABLE public.aliens_planet;
       public         heap    postgres    false            ?            1259    24888 	   excursion    TABLE     ?   CREATE TABLE public.excursion (
    id smallint NOT NULL,
    name character varying NOT NULL,
    planet_code character varying NOT NULL
);
    DROP TABLE public.excursion;
       public         heap    postgres    false            ?            1259    24893    excursion_instances    TABLE     ?   CREATE TABLE public.excursion_instances (
    id smallint NOT NULL,
    excursion_id smallint NOT NULL,
    human_passport character varying NOT NULL,
    alien_isn character varying NOT NULL,
    excursion_date date NOT NULL
);
 '   DROP TABLE public.excursion_instances;
       public         heap    postgres    false            ?            1259    24898 
   experiment    TABLE     ?   CREATE TABLE public.experiment (
    code smallint NOT NULL,
    name character varying NOT NULL,
    kidnapped_human_passport character varying NOT NULL,
    spaceship_vin character varying NOT NULL,
    experiment_date date
);
    DROP TABLE public.experiment;
       public         heap    postgres    false            ?            1259    24903    human    TABLE     ?   CREATE TABLE public.human (
    passport character varying NOT NULL,
    isn character varying NOT NULL,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    birth_date date NOT NULL
);
    DROP TABLE public.human;
       public         heap    postgres    false            ?            1259    24908    human_kidnapped_alien    TABLE     ?   CREATE TABLE public.human_kidnapped_alien (
    alien_isn character varying NOT NULL,
    human_passport character varying NOT NULL,
    kidnapping_date date
);
 )   DROP TABLE public.human_kidnapped_alien;
       public         heap    postgres    false            ?            1259    24913    human_kill_alien    TABLE     ?   CREATE TABLE public.human_kill_alien (
    human_passport character varying NOT NULL,
    alien_isn character varying NOT NULL
);
 $   DROP TABLE public.human_kill_alien;
       public         heap    postgres    false            ?            1259    24918    planet    TABLE     p   CREATE TABLE public.planet (
    planet_code character varying NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.planet;
       public         heap    postgres    false            ?            1259    24923 	   spaceship    TABLE     ?   CREATE TABLE public.spaceship (
    vin character varying NOT NULL,
    make character varying NOT NULL,
    model character varying NOT NULL,
    capacity smallint NOT NULL
);
    DROP TABLE public.spaceship;
       public         heap    postgres    false                       0    24868    alien 
   TABLE DATA           ?   COPY public.alien (isn, name, surname, birth_date) FROM stdin;
    public          postgres    false    209   ?%       !          0    24873    alien_spaceship 
   TABLE DATA           =   COPY public.alien_spaceship (isn, spaceship_vin) FROM stdin;
    public          postgres    false    210   k'       "          0    24878    aliens_experiment 
   TABLE DATA           G   COPY public.aliens_experiment (experiment_code, alien_isn) FROM stdin;
    public          postgres    false    211   (       #          0    24883    aliens_planet 
   TABLE DATA           9   COPY public.aliens_planet (isn, planet_code) FROM stdin;
    public          postgres    false    212   t(       $          0    24888 	   excursion 
   TABLE DATA           :   COPY public.excursion (id, name, planet_code) FROM stdin;
    public          postgres    false    213   )       %          0    24893    excursion_instances 
   TABLE DATA           j   COPY public.excursion_instances (id, excursion_id, human_passport, alien_isn, excursion_date) FROM stdin;
    public          postgres    false    214   *       &          0    24898 
   experiment 
   TABLE DATA           j   COPY public.experiment (code, name, kidnapped_human_passport, spaceship_vin, experiment_date) FROM stdin;
    public          postgres    false    215   ?*       '          0    24903    human 
   TABLE DATA           I   COPY public.human (passport, isn, name, surname, birth_date) FROM stdin;
    public          postgres    false    216   ?+       (          0    24908    human_kidnapped_alien 
   TABLE DATA           [   COPY public.human_kidnapped_alien (alien_isn, human_passport, kidnapping_date) FROM stdin;
    public          postgres    false    217   .       )          0    24913    human_kill_alien 
   TABLE DATA           E   COPY public.human_kill_alien (human_passport, alien_isn) FROM stdin;
    public          postgres    false    218   C0       *          0    24918    planet 
   TABLE DATA           3   COPY public.planet (planet_code, name) FROM stdin;
    public          postgres    false    219   ?0       +          0    24923 	   spaceship 
   TABLE DATA           ?   COPY public.spaceship (vin, make, model, capacity) FROM stdin;
    public          postgres    false    220   81       ?           2606    24929    experiment Experiment_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.experiment
    ADD CONSTRAINT "Experiment_pkey" PRIMARY KEY (code);
 F   ALTER TABLE ONLY public.experiment DROP CONSTRAINT "Experiment_pkey";
       public            postgres    false    215            ?           2606    24931    alien alien_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.alien
    ADD CONSTRAINT alien_pkey PRIMARY KEY (isn);
 :   ALTER TABLE ONLY public.alien DROP CONSTRAINT alien_pkey;
       public            postgres    false    209            ?           2606    24933 ,   excursion_instances excursion_instances_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.excursion_instances
    ADD CONSTRAINT excursion_instances_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.excursion_instances DROP CONSTRAINT excursion_instances_pkey;
       public            postgres    false    214            ?           2606    24935    excursion excursion_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.excursion
    ADD CONSTRAINT excursion_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.excursion DROP CONSTRAINT excursion_pkey;
       public            postgres    false    213            ?           2606    24937    human human_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.human
    ADD CONSTRAINT human_pkey PRIMARY KEY (passport);
 :   ALTER TABLE ONLY public.human DROP CONSTRAINT human_pkey;
       public            postgres    false    216            ?           2606    24939    planet planet_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_code);
 <   ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_pkey;
       public            postgres    false    219            ?           2606    24941    spaceship spaceship_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.spaceship
    ADD CONSTRAINT spaceship_pkey PRIMARY KEY (vin);
 B   ALTER TABLE ONLY public.spaceship DROP CONSTRAINT spaceship_pkey;
       public            postgres    false    220                ?  x?M??n?0??Իx %׶?Y?d^??s??v1ja?H??}??m](~???Yu????6iM	Ʉr?X??6a?=?C?Zd*!L?Įn%<?!?^??
?iB?H%?-??:?]???J0?#?????2?i2x0?	???^??Ws4????q? =,d?H-6U???b???l?ʸ?Xb????Pprc??68o9wʳR?+?J?z	_?~?k?틚8?ֈJ??????(??"-?m??t??}?q;?D?%??Ŷn?p0?????s????E^?}WI?ᗝ?2.܀Ҭ??+?V??c???ֱ???N?P?J??%IO/a??Wv`F????TT?U?v֏? G3r?LqI?D?v?+?????o??<e6wg??Ui???~?&r?)??Ͽᄅ?Q6??Md?hz茻G??^??J??^k?8ƞч????_?? 䢪      !   ?   x?=?A? ?59????V?X"ʴ????$???G\F$?Ne?3nH???טuK?D?I?MEt;?K?o'?a??a????xl?j+?$w*f?#?1?K??$Ɔ??IsE?]gQ???I??Xs??^͓?^^?????RV?? _??7      "   N   x?5?1
? F?9?aJb???E+B???9:e{???vwfA?9z6?Fd?ǥ*n?ib(?|&5?X-??????????n      #   ?   x?-??? ?3?'?N??J??D?x???C&z?w??_Ɉ?P҉D??RF?f;????-?Y?|??}?\???????8;e??*?sAd??er???)??ʽF?X??d???[ ??q??i? ɕ&?|?8L???z?rݙY?? ?l?2?      $   ?   x??MN?0???S? ??˂?P?C??]u3???"??؃??p$?D?????oV?:/?5ro?AN`ֽ???]?9?????????????|??
??3??E??n)f?mө?J?	#??O???W?0?r?H??I?`?3U?I$??1`?0?G???x?H???ü|V?F??ͶSOУu??~??\&v8'???(??x?VW0d???#/	vM???J?>?U?      %   ?   x?U?Qk!????b?D]?q?{??dۃ?R???E??Wȃ?1??]~ *??w???2+??u????'?Ȟ?P?'?8?DCO,?N"G
C??zYC??????g\?;R?l?r?X???Rz4	?)\h???r\&F???.??Kv6?B???^???]zt0@??^??mG?k`????>Gu???'??????x?r???V?oӲ??#?E<?q?3Z?so???0??X?      &   ?   x????J1???S?Rf&?nz???E)Ńx	kpCפlW??7??z؅B?????aX?<?7*DU???g&!2p\1?h?k&?	Z?M?????j1h&?(i???녪?C|?yh?????\??A?+9??Q?4ȼS?X?m㫮M?:U'u?}??_*E??ӹ?#ϑ܅B{]?eh??2???{?U]????u????uM^K????.??V??????ʔ?      '     x?u?݊?0F??wq???^6lC???$??қ!??#?(O?ϙhCw??;Fg?i?[?Y?????k?J????Ďz_?????DfI?M6?N?ĉ??Z?? K-u??"????X]Q???5p?H?9?S?Y?։?????wM??y?WL??7?(?Z??w??A????)?qr?D???_>=?dj)?t#+
?b???.<j扌?ˌ?d	?]Mb?nJsg??I??0?O?uJO\Z??"?N??m?ؼ?q???ka?逸6?AYu#!W?????v?`r*?6`^?w???d??љx?;{2????????a??b!?{4?`Q ?@?Z+?ϕ?c??5??W}7rp9??6z?????C?IQ? 	tV`g{?G`?pX|o?E??.??㦳???"?#}???????????b,?dߚ??oH????~:?P;:??5????*????若Q?????W??I???ȝeS?G_S?/Ǟ?չ?ux??4?瀻???Q???&???O?|?L&? ??9p      (   &  x?u??j?0?????"?ɲ?:L?ЖR???Q?V?X?@63???#????V?t?A ??D?ۂ?@r?_???"ʌ???6?? \??r?אS?!?P?A?@???????vD?Ҁ??B??"??????s?U<??J?|??8???s?&? I?Z???y??aT???+???q?a?>.??]?)s??Q1 <?F?k?2?%?O?,w?Ez??m???V8q/?9??????[mÅ??*?e??Z????????W??Qa????????Rc{???	???]F=?Ca?Q_??A?ĳ;D?:
??=/?+M?m?'J?A?=*?j?&/m%H????9???l#j??92??(???*C>????=:?Y??m?y}????]?|%????????a?5?!"w??1?3??{?????r???` ??C25?=?,?n*!6?S??*#̑?7?R?lv?C:6[?S??W<?v)?v??ƾ?????jpT???Eɤtȷq`?uO[{a??P}??=?_4C??͈?[	???e???d~~?9?? ??]      )   x   x?U??
?0???Ô?????bu?h)???
???ff?2	q??Hq>=??L???͉???F?l???ͷŢV??}!???ּ??\??c??d????dG???O?>(?D???,@      *   ]   x??=
?0?9?a?C???-ſɥC@Q???????CK\?6?0P,?"?3?????_??????n?????(?0?X̵"q?$?y,?h??/??g??      +   ~   x?̱
?0F?????$?)͘:?????%?AS?v??[????N	?jZ????#??ю??,"dC????٦7n
?.??cq??kq"??z\S.a??\?????8?k?????%??y$??!U     