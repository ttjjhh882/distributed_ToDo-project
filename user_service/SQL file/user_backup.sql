PGDMP  !                    }           user_db    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16945    user_db    DATABASE     �   CREATE DATABASE user_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Chinese (Simplified)_China.936';
    DROP DATABASE user_db;
                     postgres    false            �           0    0    DATABASE user_db    ACL     /   GRANT ALL ON DATABASE user_db TO user_service;
                        postgres    false    4854            �           0    0    SCHEMA public    ACL     ,   GRANT ALL ON SCHEMA public TO user_service;
                        pg_database_owner    false    5            �            1259    16998    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying,
    password character varying,
    token character varying
);
    DROP TABLE public.users;
       public         heap r       user_service    false            �            1259    16997    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public               user_service    false    218            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public               user_service    false    217            X           2604    17001    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               user_service    false    217    218    218            �          0    16998    users 
   TABLE DATA           >   COPY public.users (id, username, password, token) FROM stdin;
    public               user_service    false    218   '       �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public               user_service    false    217            ]           2606    17005    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 user_service    false    218            Y           1259    17006    ix_users_id    INDEX     ;   CREATE INDEX ix_users_id ON public.users USING btree (id);
    DROP INDEX public.ix_users_id;
       public                 user_service    false    218            Z           1259    17008    ix_users_token    INDEX     H   CREATE UNIQUE INDEX ix_users_token ON public.users USING btree (token);
 "   DROP INDEX public.ix_users_token;
       public                 user_service    false    218            [           1259    17007    ix_users_username    INDEX     N   CREATE UNIQUE INDEX ix_users_username ON public.users USING btree (username);
 %   DROP INDEX public.ix_users_username;
       public                 user_service    false    218            �           826    16949    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     a   ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO user_service;
          public               postgres    false            �   B   x�3�,I-.)-N-�442615�LN�0L231�M25M�517���MuӒ-SL�R�S-�b���� ��j     