PGDMP  +                    }           task_db    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16947    task_db    DATABASE     �   CREATE DATABASE task_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Chinese (Simplified)_China.936';
    DROP DATABASE task_db;
                     postgres    false            �           0    0    DATABASE task_db    ACL     /   GRANT ALL ON DATABASE task_db TO task_service;
                        postgres    false    4853            �           0    0    SCHEMA public    ACL     ,   GRANT ALL ON SCHEMA public TO task_service;
                        pg_database_owner    false    5            �            1255    16973    update_updated_at_column()    FUNCTION     �   CREATE FUNCTION public.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;
 1   DROP FUNCTION public.update_updated_at_column();
       public               postgres    false            �            1259    16976    tasks    TABLE     �   CREATE TABLE public.tasks (
    id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying(255) NOT NULL,
    content text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.tasks;
       public         heap r       task_service    false            �            1259    16975    tasks_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.tasks_id_seq;
       public               task_service    false    218            �           0    0    tasks_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;
          public               task_service    false    217            Y           2604    16979    tasks id    DEFAULT     d   ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);
 7   ALTER TABLE public.tasks ALTER COLUMN id DROP DEFAULT;
       public               task_service    false    217    218    218            �          0    16976    tasks 
   TABLE DATA           T   COPY public.tasks (id, user_id, title, content, created_at, updated_at) FROM stdin;
    public               task_service    false    218   �       �           0    0    tasks_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.tasks_id_seq', 8, true);
          public               task_service    false    217            \           2606    16983    tasks tasks_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tasks DROP CONSTRAINT tasks_pkey;
       public                 task_service    false    218            Z           1259    16984    ix_tasks_id    INDEX     ;   CREATE INDEX ix_tasks_id ON public.tasks USING btree (id);
    DROP INDEX public.ix_tasks_id;
       public                 task_service    false    218            �           826    16961    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     a   ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO task_service;
          public               postgres    false            �   c   x�}���0C�0EhJ`��?�On_=DB����NJ��GP�q���K��;ld���q��Ua��sT�2�����Fkʖ?�J{u��q@�f�!�&�     