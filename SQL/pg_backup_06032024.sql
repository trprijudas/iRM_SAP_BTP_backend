PGDMP             	            |            postgres    15.2    15.4 l    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     s   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3570                       1255    33100 #   get_all_privileges_by_user_id(text)    FUNCTION     3  CREATE FUNCTION public.get_all_privileges_by_user_id(param_user_id text) RETURNS TABLE(user_id integer, user_email character varying, role_id integer, role_name character varying, module_name character varying, submodule_name character varying, display_module_name character varying, display_submodule_name character varying, privilege character varying, customer_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN 
 RETURN QUERY 
(SELECT
LU.ID AS USER_ID, 
LU.USER_EMAIL AS USER_EMAIL,
RM.ID AS ROLE_ID,
RM.ROLE_NAME AS ROLE_NAME,
MM.MODULE_NAME AS MODULE_NAME,
SM.SUBMODULE_NAME AS SUBMODULE_NAME,
MM.DISPLAY_MODULE_NAME AS DISPLAY_MODULE_NAME,
SM.DISPLAY_SUBMODULE_NAME AS DISPLAY_SUBMODULE_NAME,
P.PRIVILEGE_NAME AS PRIVILEGE_NAME,
LU.CUSTOMER_ID_ID AS CUSTOMER_ID 
FROM PCF_DB_LOGIN_USER LU
JOIN  PCF_DB_USER_ROLE_MAPPING URM ON LU.ID=URM.USER_ID_ID
JOIN  PCF_DB_ROLE_MASTER RM ON RM.ID=URM.ROLE_ID_ID
JOIN PCF_DB_ROLE_MODULE_SUBMODULE_MAPPING RMSM ON RMSM.ROLE_ID_ID=URM.ROLE_ID_ID
JOIN PCF_DB_MODULE_MASTER MM ON MM.ID=RMSM.MODULE_ID_ID
JOIN PCF_DB_SUBMODULE_MASTER SM ON SM.ID=RMSM.SUBMODULE_ID_ID
JOIN PCF_DB_PRIVILEGE P ON P.ID=RMSM.PRIVILEGE_ID_ID
WHERE LU.ID=CAST(PARAM_USER_ID AS INT)
 AND LU.IS_ACTIVE='Y' AND URM.IS_ACTIVE='Y' AND RM.IS_ACTIVE='Y'
 AND RMSM.IS_ACTIVE='Y' AND MM.IS_ACTIVE='Y' AND SM.IS_ACTIVE='Y'
 AND P.IS_ACTIVE='Y' 
 )
UNION
(SELECT  
LU.ID AS USER_ID, 
LU.USER_EMAIL AS USER_EMAIL,
NULL AS ROLE_ID,
NULL AS ROLE_NAME,
MM.MODULE_NAME AS MODULE_NAME,
SM.SUBMODULE_NAME AS SUBMODULE_NAME,
MM.DISPLAY_MODULE_NAME AS DISPLAY_MODULE_NAME,
SM.DISPLAY_SUBMODULE_NAME AS DISPLAY_SUBMODULE_NAME,
P.PRIVILEGE_NAME AS PRIVILEGE_NAME,
 LU.CUSTOMER_ID_ID AS CUSTOMER_ID 
FROM PCF_DB_LOGIN_USER LU
JOIN PCF_DB_USER_PRIVILEGE_MAPPING UP ON UP.USER_ID_ID=LU.ID
JOIN PCF_DB_MODULE_MASTER MM ON MM.ID=UP.MODULE_ID_ID
JOIN PCF_DB_SUBMODULE_MASTER SM ON SM.ID=UP.SUBMODULE_ID_ID
JOIN PCF_DB_PRIVILEGE P ON P.ID=UP.PRIVILEGE_ID_ID
WHERE LU.ID=CAST(PARAM_USER_ID AS INT)
AND LU.IS_ACTIVE='Y'
AND UP.IS_ACTIVE='Y' 
AND MM.IS_ACTIVE='Y'
AND SM.IS_ACTIVE='Y'
AND P.IS_ACTIVE='Y');
END; 
$$;
 H   DROP FUNCTION public.get_all_privileges_by_user_id(param_user_id text);
       public          postgres    false            
           1255    24886    get_all_roles_by_user_id(text)    FUNCTION     J  CREATE FUNCTION public.get_all_roles_by_user_id(param_user_id text) RETURNS TABLE(user_id integer, user_email_id character varying, role_id integer, name_of_role character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN 
 RETURN QUERY SELECT 
	CAST(USER_ID_ID AS INT) AS USER_ID,
	(SELECT USER_EMAIL FROM PCF_DB_LOGIN_USER WHERE ID=USER_ID_ID AND IS_ACTIVE='Y'),
	CAST(ROLE_ID_ID AS INT) AS ROLE_ID,
	(SELECT ROLE_NAME FROM PCF_DB_ROLE_MASTER WHERE ID=ROLE_ID_ID AND IS_ACTIVE='Y')
	FROM PCF_DB_USER_ROLE_MAPPING WHERE USER_ID_ID=CAST(PARAM_USER_ID AS INT)  AND IS_ACTIVE='Y' ;
END; 
$$;
 C   DROP FUNCTION public.get_all_roles_by_user_id(param_user_id text);
       public          postgres    false            �            1259    16470 	   cds_model    TABLE     0   CREATE TABLE public.cds_model (
    csn text
);
    DROP TABLE public.cds_model;
       public         heap    postgres    false            �            1259    16475    pcf_db_books    TABLE     �   CREATE TABLE public.pcf_db_books (
    id integer NOT NULL,
    title character varying(255),
    author character varying(255),
    stock integer,
    inc_id integer,
    inc_id_str character varying(36)
);
     DROP TABLE public.pcf_db_books;
       public         heap    postgres    false            �            1259    16515    pcf_db_books_texts    TABLE     �   CREATE TABLE public.pcf_db_books_texts (
    locale character varying(14) NOT NULL,
    id integer NOT NULL,
    title character varying(255)
);
 &   DROP TABLE public.pcf_db_books_texts;
       public         heap    postgres    false            �            1259    16616    localized_pcf_db_books    VIEW     t  CREATE VIEW public.localized_pcf_db_books AS
 SELECT l_0.id,
    COALESCE(localized_1.title, l_0.title) AS title,
    l_0.author,
    l_0.stock,
    l_0.inc_id,
    l_0.inc_id_str
   FROM (public.pcf_db_books l_0
     LEFT JOIN public.pcf_db_books_texts localized_1 ON (((localized_1.id = l_0.id) AND ((localized_1.locale)::text = current_setting('cap.locale'::text)))));
 )   DROP VIEW public.localized_pcf_db_books;
       public          postgres    false    217    217    217    217    217    223    223    223    217            �            1259    16487    pcf_db_orders    TABLE     A  CREATE TABLE public.pcf_db_orders (
    createdat timestamp without time zone,
    createdby character varying(255),
    modifiedat timestamp without time zone,
    modifiedby character varying(255),
    id character varying(36) NOT NULL,
    book_id integer,
    country_code character varying(3),
    amount integer
);
 !   DROP TABLE public.pcf_db_orders;
       public         heap    postgres    false            �            1259    16551    localized_pcf_db_orders    VIEW     �   CREATE VIEW public.localized_pcf_db_orders AS
 SELECT l.createdat,
    l.createdby,
    l.modifiedat,
    l.modifiedby,
    l.id,
    l.book_id,
    l.country_code,
    l.amount
   FROM public.pcf_db_orders l;
 *   DROP VIEW public.localized_pcf_db_orders;
       public          postgres    false    219    219    219    219    219    219    219    219            �            1259    16533    sap_common_countries    TABLE     �   CREATE TABLE public.sap_common_countries (
    name character varying(255),
    descr character varying(1000),
    code character varying(3) NOT NULL
);
 (   DROP TABLE public.sap_common_countries;
       public         heap    postgres    false            �            1259    16540    sap_common_countries_texts    TABLE     �   CREATE TABLE public.sap_common_countries_texts (
    locale character varying(14) NOT NULL,
    name character varying(255),
    descr character varying(1000),
    code character varying(3) NOT NULL
);
 .   DROP TABLE public.sap_common_countries_texts;
       public         heap    postgres    false            �            1259    33103    localized_sap_common_countries    VIEW     �  CREATE VIEW public.localized_sap_common_countries AS
 SELECT COALESCE(localized_1.name, l_0.name) AS name,
    COALESCE(localized_1.descr, l_0.descr) AS descr,
    l_0.code
   FROM (public.sap_common_countries l_0
     LEFT JOIN public.sap_common_countries_texts localized_1 ON ((((localized_1.code)::text = (l_0.code)::text) AND ((localized_1.locale)::text = current_setting('cap.locale'::text)))));
 1   DROP VIEW public.localized_sap_common_countries;
       public          postgres    false    226    225    225    226    225    226    226            �            1259    16482    pcf_db_authors    TABLE     a   CREATE TABLE public.pcf_db_authors (
    id integer NOT NULL,
    name character varying(255)
);
 "   DROP TABLE public.pcf_db_authors;
       public         heap    postgres    false            �            1259    16609    pcf_db_books_id_seq    SEQUENCE     �   ALTER TABLE public.pcf_db_books ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.pcf_db_books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    16508    pcf_db_control_family_master    TABLE     g  CREATE TABLE public.pcf_db_control_family_master (
    createdat timestamp without time zone,
    createdby character varying(255),
    modifiedat timestamp without time zone,
    modifiedby character varying(255),
    id integer NOT NULL,
    control_family_id character varying(36),
    control_family_name character varying(255),
    control_family_desc character varying(255),
    customer_id_id integer,
    is_active character varying(255),
    created_on timestamp without time zone,
    created_by character varying(255),
    changed_on timestamp without time zone,
    changed_by character varying(255)
);
 0   DROP TABLE public.pcf_db_control_family_master;
       public         heap    postgres    false            �            1259    16501    pcf_db_control_master    TABLE     j  CREATE TABLE public.pcf_db_control_master (
    createdat timestamp without time zone,
    createdby character varying(255),
    modifiedat timestamp without time zone,
    modifiedby character varying(255),
    id integer NOT NULL,
    control_id character varying(36),
    control_family_id integer,
    control_name character varying(255),
    control_desc character varying(255),
    customer_id_id integer,
    is_active character varying(255),
    created_on timestamp without time zone,
    created_by character varying(255),
    changed_on timestamp without time zone,
    changed_by character varying(255)
);
 )   DROP TABLE public.pcf_db_control_master;
       public         heap    postgres    false            �            1259    24738    pcf_db_control_report_mapping    TABLE       CREATE TABLE public.pcf_db_control_report_mapping (
    createdat timestamp without time zone,
    createdby character varying(255),
    modifiedat timestamp without time zone,
    modifiedby character varying(255),
    id integer NOT NULL,
    report_id_id integer,
    control_id_id integer,
    customer_id_id integer,
    is_active character varying(255),
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    changed_by character varying(255),
    created_by character varying(255)
);
 1   DROP TABLE public.pcf_db_control_report_mapping;
       public         heap    postgres    false            �            1259    16494    pcf_db_customer_master    TABLE     �  CREATE TABLE public.pcf_db_customer_master (
    createdat timestamp without time zone,
    createdby character varying(255),
    modifiedat timestamp without time zone,
    modifiedby character varying(255),
    id integer NOT NULL,
    customer_id character varying(36),
    customer_name character varying(255),
    customer_address character varying(255),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    is_active character varying(255),
    created_on timestamp without time zone,
    created_by character varying(255),
    changed_on timestamp without time zone,
    changed_by character varying(255)
);
 *   DROP TABLE public.pcf_db_customer_master;
       public         heap    postgres    false            �            1259    24753    pcf_db_login_user    TABLE     �  CREATE TABLE public.pcf_db_login_user (
    createdat timestamp without time zone,
    createdby character varying(255),
    modifiedat timestamp without time zone,
    modifiedby character varying(255),
    id integer NOT NULL,
    user_id character varying(36),
    user_name character varying(255),
    user_email character varying(255),
    user_emp_id character varying(255),
    password character varying(255),
    customer_id_id integer,
    is_active character varying(255) DEFAULT 'Y'::character varying,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    changed_by character varying(255),
    role_id_id integer,
    role_name character varying(255),
    created_by character varying(255)
);
 %   DROP TABLE public.pcf_db_login_user;
       public         heap    postgres    false            �            1259    24794    pcf_db_login_user_id_seq    SEQUENCE     �   ALTER TABLE public.pcf_db_login_user ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pcf_db_login_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    238            �            1259    24840    pcf_db_module_master    TABLE       CREATE TABLE public.pcf_db_module_master (
    id integer NOT NULL,
    module_id character varying(36),
    module_name character varying(255),
    module_desc character varying(255),
    parent_module_id_id integer,
    is_active character varying(255) DEFAULT 'Y'::character varying,
    created_on timestamp without time zone,
    created_by character varying(255),
    changed_on timestamp without time zone,
    changed_by character varying(255),
    customer_id_id integer,
    display_module_name character varying(255)
);
 (   DROP TABLE public.pcf_db_module_master;
       public         heap    postgres    false            �            1259    24867    pcf_db_module_master_id_seq    SEQUENCE     �   ALTER TABLE public.pcf_db_module_master ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pcf_db_module_master_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    246            �            1259    16665    pcf_db_pa0002_employee_master    TABLE     �  CREATE TABLE public.pcf_db_pa0002_employee_master (
    createdat timestamp without time zone,
    createdby character varying(255),
    modifiedat timestamp without time zone,
    modifiedby character varying(255),
    id integer NOT NULL,
    sync_id character varying(255),
    emp_id character varying(36),
    emp_name character varying(255),
    emp_address character varying(255),
    customer_id_id integer,
    client character varying(255),
    personnel_number character varying(255),
    end_date timestamp without time zone,
    start_date timestamp without time zone,
    is_active character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    middle_name character varying(255),
    date_of_birth timestamp without time zone,
    id_number character varying(255),
    created_by character varying(255),
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    changed_by character varying(255)
);
 1   DROP TABLE public.pcf_db_pa0002_employee_master;
       public         heap    postgres    false            �            1259    24745    pcf_db_price_mismatch_output    TABLE     �  CREATE TABLE public.pcf_db_price_mismatch_output (
    createdat timestamp without time zone,
    createdby character varying(255),
    modifiedat timestamp without time zone,
    modifiedby character varying(255),
    id integer NOT NULL,
    sync_id_id integer,
    emp_id_id integer,
    invoice_id_id integer,
    order_id_id integer,
    control_id_id integer,
    customer_id_id integer,
    simulated_at timestamp without time zone,
    simulated_by character varying(255),
    is_active character varying(255),
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    changed_by character varying(255),
    created_by character varying(255)
);
 0   DROP TABLE public.pcf_db_price_mismatch_output;
       public         heap    postgres    false            �            1259    24816    pcf_db_privilege    TABLE     �  CREATE TABLE public.pcf_db_privilege (
    id integer NOT NULL,
    privilege_id character varying(36),
    privilege_name character varying(255),
    privilege_desc character varying(255),
    is_active character varying(255) DEFAULT 'Y'::character varying,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    changed_by character varying(255),
    created_by character varying(255),
    customer_id_id integer
);
 $   DROP TABLE public.pcf_db_privilege;
       public         heap    postgres    false            �            1259    24831    pcf_db_privilege_id_seq    SEQUENCE     �   ALTER TABLE public.pcf_db_privilege ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pcf_db_privilege_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    241            �            1259    24731    pcf_db_report_master    TABLE     �  CREATE TABLE public.pcf_db_report_master (
    createdat timestamp without time zone,
    createdby character varying(255),
    modifiedat timestamp without time zone,
    modifiedby character varying(255),
    id integer NOT NULL,
    report_id character varying(36),
    report_path character varying(255),
    report_name character varying(255),
    report_created_at timestamp without time zone,
    report_destination character varying(255),
    customer_id_id integer,
    is_active character varying(255),
    changed_on timestamp without time zone,
    changed_by character varying(255),
    created_by character varying(255),
    created_on timestamp without time zone
);
 (   DROP TABLE public.pcf_db_report_master;
       public         heap    postgres    false            �            1259    24765    pcf_db_role_master    TABLE     �  CREATE TABLE public.pcf_db_role_master (
    createdat timestamp without time zone,
    createdby character varying(255),
    modifiedat timestamp without time zone,
    modifiedby character varying(255),
    id integer NOT NULL,
    role_id character varying(36),
    role_name character varying(255),
    role_desc character varying(255),
    customer_id_id integer,
    role_permission character varying(255),
    is_active character varying(255) DEFAULT 'Y'::character varying,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    changed_by character varying(255),
    created_by character varying(255)
);
 &   DROP TABLE public.pcf_db_role_master;
       public         heap    postgres    false            �            1259    24866    pcf_db_role_master_id_seq    SEQUENCE     �   ALTER TABLE public.pcf_db_role_master ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pcf_db_role_master_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    239            �            1259    24854 $   pcf_db_role_module_submodule_mapping    TABLE     �  CREATE TABLE public.pcf_db_role_module_submodule_mapping (
    id integer NOT NULL,
    role_id_id integer,
    module_id_id integer,
    submodule_id_id integer,
    is_active character varying(255) DEFAULT 'Y'::character varying,
    created_on timestamp without time zone,
    created_by character varying(255),
    changed_on timestamp without time zone,
    changed_by character varying(255),
    customer_id_id integer,
    privilege_flag character varying(255),
    privilege_id_id integer
);
 8   DROP TABLE public.pcf_db_role_module_submodule_mapping;
       public         heap    postgres    false            �            1259    24869 +   pcf_db_role_module_submodule_mapping_id_seq    SEQUENCE       ALTER TABLE public.pcf_db_role_module_submodule_mapping ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pcf_db_role_module_submodule_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    248            �            1259    16525    pcf_db_student_master    TABLE     c  CREATE TABLE public.pcf_db_student_master (
    createdat timestamp without time zone,
    createdby character varying(255),
    modifiedat timestamp without time zone,
    modifiedby character varying(255),
    id integer NOT NULL,
    name character varying(255),
    age integer,
    address character varying(255),
    email character varying(255)
);
 )   DROP TABLE public.pcf_db_student_master;
       public         heap    postgres    false            �            1259    24847    pcf_db_submodule_master    TABLE     "  CREATE TABLE public.pcf_db_submodule_master (
    id integer NOT NULL,
    submodule_id character varying(36),
    submodule_name character varying(255),
    submodule_desc character varying(255),
    parent_module_id_id integer,
    is_active character varying(255) DEFAULT 'Y'::character varying,
    created_on timestamp without time zone,
    created_by character varying(255),
    changed_on timestamp without time zone,
    changed_by character varying(255),
    customer_id_id integer,
    display_submodule_name character varying(255)
);
 +   DROP TABLE public.pcf_db_submodule_master;
       public         heap    postgres    false            �            1259    24868    pcf_db_submodule_master_id_seq    SEQUENCE     �   ALTER TABLE public.pcf_db_submodule_master ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pcf_db_submodule_master_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    247            �            1259    24724    pcf_db_sync_details    TABLE     �  CREATE TABLE public.pcf_db_sync_details (
    createdat timestamp without time zone,
    createdby character varying(255),
    modifiedat timestamp without time zone,
    modifiedby character varying(255),
    id integer NOT NULL,
    sync_header_id_id integer,
    sync_status character varying(255),
    control_id_id integer,
    report_id_id integer,
    report_destination character varying(255),
    sync_started_at timestamp without time zone,
    sync_ended_at timestamp without time zone,
    changed_by character varying(255),
    changed_on timestamp without time zone,
    customer_id_id integer,
    is_active character varying(255),
    created_on timestamp without time zone,
    created_by character varying(255)
);
 '   DROP TABLE public.pcf_db_sync_details;
       public         heap    postgres    false            �            1259    24717    pcf_db_sync_header    TABLE     �  CREATE TABLE public.pcf_db_sync_header (
    createdat timestamp without time zone,
    createdby character varying(255),
    modifiedat timestamp without time zone,
    modifiedby character varying(255),
    id integer NOT NULL,
    sync_id character varying(36),
    sync_status character varying(255),
    control_id_id integer,
    customer_id_id integer,
    sync_started_at timestamp without time zone,
    sync_ended_at timestamp without time zone,
    is_active character varying(255),
    created_on timestamp without time zone,
    created_by character varying(255),
    changed_on timestamp without time zone,
    changed_by character varying(255)
);
 &   DROP TABLE public.pcf_db_sync_header;
       public         heap    postgres    false            �            1259    24823    pcf_db_user_privilege_mapping    TABLE     �  CREATE TABLE public.pcf_db_user_privilege_mapping (
    id integer NOT NULL,
    user_id_id integer,
    privilege_id_id integer,
    is_active character varying(255) DEFAULT 'Y'::character varying,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    changed_by character varying(255),
    created_by character varying(255),
    customer_id_id integer,
    module_id_id integer,
    submodule_id_id integer,
    direct_privilege_flag character varying(255)
);
 1   DROP TABLE public.pcf_db_user_privilege_mapping;
       public         heap    postgres    false            �            1259    24830 $   pcf_db_user_privilege_mapping_id_seq    SEQUENCE     �   ALTER TABLE public.pcf_db_user_privilege_mapping ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pcf_db_user_privilege_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    242            �            1259    24833    pcf_db_user_role_mapping    TABLE     �  CREATE TABLE public.pcf_db_user_role_mapping (
    id integer NOT NULL,
    user_id_id integer,
    role_id_id integer,
    is_active character varying(255) DEFAULT 'Y'::character varying,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    changed_by character varying(255),
    created_by character varying(255),
    customer_id_id integer
);
 ,   DROP TABLE public.pcf_db_user_role_mapping;
       public         heap    postgres    false            �            1259    24876    pcf_db_user_role_mapping_id_seq    SEQUENCE     �   ALTER TABLE public.pcf_db_user_role_mapping ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pcf_db_user_role_mapping_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    245            �            1259    16672    pcf_db_va05_sales_order    TABLE     o  CREATE TABLE public.pcf_db_va05_sales_order (
    createdat timestamp without time zone,
    createdby character varying(255),
    modifiedat timestamp without time zone,
    modifiedby character varying(255),
    id integer NOT NULL,
    sales_order_id character varying(36),
    sales_order_date timestamp without time zone,
    sales_order_desc character varying(255),
    sales_order_item character varying(255),
    sales_order_unit character varying(255),
    sales_order_cost character varying(255),
    customer_id_id integer,
    sales_document character varying(255),
    document_date timestamp without time zone,
    created_by character varying(255),
    created_on timestamp without time zone,
    "time" time without time zone,
    sold_to_party character varying(255),
    net_value character varying(255),
    sold_to_party_name character varying(255),
    sales_document_item character varying(255),
    material_description character varying(255),
    personnel_number character varying(255),
    is_active character varying(255),
    changed_on timestamp without time zone,
    changed_by character varying(255)
);
 +   DROP TABLE public.pcf_db_va05_sales_order;
       public         heap    postgres    false            �            1259    16679    pcf_db_zsd0070_billing_report    TABLE     _  CREATE TABLE public.pcf_db_zsd0070_billing_report (
    createdat timestamp without time zone,
    createdby character varying(255),
    modifiedat timestamp without time zone,
    modifiedby character varying(255),
    id integer NOT NULL,
    billing_report_id character varying(36),
    billing_document character varying(255),
    sales_document character varying(255),
    customer_id_id integer,
    payer_description character varying(255),
    item_description character varying(255),
    billing_date timestamp without time zone,
    net_value character varying(255),
    tax_amount character varying(255),
    cost character varying(255),
    grorss_value character varying(255),
    sumof_net_gross_value character varying(255),
    delivery_number character varying(255),
    ship_to_party1 character varying(255),
    created_by character varying(255),
    created_on timestamp without time zone,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    is_active character varying(255),
    changed_on timestamp without time zone,
    changed_by character varying(255)
);
 1   DROP TABLE public.pcf_db_zsd0070_billing_report;
       public         heap    postgres    false            �          0    16470 	   cds_model 
   TABLE DATA           (   COPY public.cds_model (csn) FROM stdin;
    public          postgres    false    216   ��       �          0    16482    pcf_db_authors 
   TABLE DATA           2   COPY public.pcf_db_authors (id, name) FROM stdin;
    public          postgres    false    218   ��       �          0    16475    pcf_db_books 
   TABLE DATA           T   COPY public.pcf_db_books (id, title, author, stock, inc_id, inc_id_str) FROM stdin;
    public          postgres    false    217   �       �          0    16515    pcf_db_books_texts 
   TABLE DATA           ?   COPY public.pcf_db_books_texts (locale, id, title) FROM stdin;
    public          postgres    false    223   b�       �          0    16508    pcf_db_control_family_master 
   TABLE DATA           �   COPY public.pcf_db_control_family_master (createdat, createdby, modifiedat, modifiedby, id, control_family_id, control_family_name, control_family_desc, customer_id_id, is_active, created_on, created_by, changed_on, changed_by) FROM stdin;
    public          postgres    false    222   �       �          0    16501    pcf_db_control_master 
   TABLE DATA           �   COPY public.pcf_db_control_master (createdat, createdby, modifiedat, modifiedby, id, control_id, control_family_id, control_name, control_desc, customer_id_id, is_active, created_on, created_by, changed_on, changed_by) FROM stdin;
    public          postgres    false    221   ��       �          0    24738    pcf_db_control_report_mapping 
   TABLE DATA           �   COPY public.pcf_db_control_report_mapping (createdat, createdby, modifiedat, modifiedby, id, report_id_id, control_id_id, customer_id_id, is_active, created_on, changed_on, changed_by, created_by) FROM stdin;
    public          postgres    false    236   ��       �          0    16494    pcf_db_customer_master 
   TABLE DATA           �   COPY public.pcf_db_customer_master (createdat, createdby, modifiedat, modifiedby, id, customer_id, customer_name, customer_address, start_date, end_date, is_active, created_on, created_by, changed_on, changed_by) FROM stdin;
    public          postgres    false    220   ��       �          0    24753    pcf_db_login_user 
   TABLE DATA           �   COPY public.pcf_db_login_user (createdat, createdby, modifiedat, modifiedby, id, user_id, user_name, user_email, user_emp_id, password, customer_id_id, is_active, created_on, changed_on, changed_by, role_id_id, role_name, created_by) FROM stdin;
    public          postgres    false    238   ��       �          0    24840    pcf_db_module_master 
   TABLE DATA           �   COPY public.pcf_db_module_master (id, module_id, module_name, module_desc, parent_module_id_id, is_active, created_on, created_by, changed_on, changed_by, customer_id_id, display_module_name) FROM stdin;
    public          postgres    false    246   I�       �          0    16487    pcf_db_orders 
   TABLE DATA           x   COPY public.pcf_db_orders (createdat, createdby, modifiedat, modifiedby, id, book_id, country_code, amount) FROM stdin;
    public          postgres    false    219   �       �          0    16665    pcf_db_pa0002_employee_master 
   TABLE DATA           J  COPY public.pcf_db_pa0002_employee_master (createdat, createdby, modifiedat, modifiedby, id, sync_id, emp_id, emp_name, emp_address, customer_id_id, client, personnel_number, end_date, start_date, is_active, first_name, last_name, middle_name, date_of_birth, id_number, created_by, created_on, changed_on, changed_by) FROM stdin;
    public          postgres    false    230   )�       �          0    24745    pcf_db_price_mismatch_output 
   TABLE DATA             COPY public.pcf_db_price_mismatch_output (createdat, createdby, modifiedat, modifiedby, id, sync_id_id, emp_id_id, invoice_id_id, order_id_id, control_id_id, customer_id_id, simulated_at, simulated_by, is_active, created_on, changed_on, changed_by, created_by) FROM stdin;
    public          postgres    false    237   F�       �          0    24816    pcf_db_privilege 
   TABLE DATA           �   COPY public.pcf_db_privilege (id, privilege_id, privilege_name, privilege_desc, is_active, created_on, changed_on, changed_by, created_by, customer_id_id) FROM stdin;
    public          postgres    false    241   c�       �          0    24731    pcf_db_report_master 
   TABLE DATA           �   COPY public.pcf_db_report_master (createdat, createdby, modifiedat, modifiedby, id, report_id, report_path, report_name, report_created_at, report_destination, customer_id_id, is_active, changed_on, changed_by, created_by, created_on) FROM stdin;
    public          postgres    false    235   ��       �          0    24765    pcf_db_role_master 
   TABLE DATA           �   COPY public.pcf_db_role_master (createdat, createdby, modifiedat, modifiedby, id, role_id, role_name, role_desc, customer_id_id, role_permission, is_active, created_on, changed_on, changed_by, created_by) FROM stdin;
    public          postgres    false    239   ��       �          0    24854 $   pcf_db_role_module_submodule_mapping 
   TABLE DATA           �   COPY public.pcf_db_role_module_submodule_mapping (id, role_id_id, module_id_id, submodule_id_id, is_active, created_on, created_by, changed_on, changed_by, customer_id_id, privilege_flag, privilege_id_id) FROM stdin;
    public          postgres    false    248   ��       �          0    16525    pcf_db_student_master 
   TABLE DATA           |   COPY public.pcf_db_student_master (createdat, createdby, modifiedat, modifiedby, id, name, age, address, email) FROM stdin;
    public          postgres    false    224   ��       �          0    24847    pcf_db_submodule_master 
   TABLE DATA           �   COPY public.pcf_db_submodule_master (id, submodule_id, submodule_name, submodule_desc, parent_module_id_id, is_active, created_on, created_by, changed_on, changed_by, customer_id_id, display_submodule_name) FROM stdin;
    public          postgres    false    247   ��       �          0    24724    pcf_db_sync_details 
   TABLE DATA             COPY public.pcf_db_sync_details (createdat, createdby, modifiedat, modifiedby, id, sync_header_id_id, sync_status, control_id_id, report_id_id, report_destination, sync_started_at, sync_ended_at, changed_by, changed_on, customer_id_id, is_active, created_on, created_by) FROM stdin;
    public          postgres    false    234   6�       �          0    24717    pcf_db_sync_header 
   TABLE DATA           �   COPY public.pcf_db_sync_header (createdat, createdby, modifiedat, modifiedby, id, sync_id, sync_status, control_id_id, customer_id_id, sync_started_at, sync_ended_at, is_active, created_on, created_by, changed_on, changed_by) FROM stdin;
    public          postgres    false    233   S�       �          0    24823    pcf_db_user_privilege_mapping 
   TABLE DATA           �   COPY public.pcf_db_user_privilege_mapping (id, user_id_id, privilege_id_id, is_active, created_on, changed_on, changed_by, created_by, customer_id_id, module_id_id, submodule_id_id, direct_privilege_flag) FROM stdin;
    public          postgres    false    242   p�       �          0    24833    pcf_db_user_role_mapping 
   TABLE DATA           �   COPY public.pcf_db_user_role_mapping (id, user_id_id, role_id_id, is_active, created_on, changed_on, changed_by, created_by, customer_id_id) FROM stdin;
    public          postgres    false    245   ��       �          0    16672    pcf_db_va05_sales_order 
   TABLE DATA           �  COPY public.pcf_db_va05_sales_order (createdat, createdby, modifiedat, modifiedby, id, sales_order_id, sales_order_date, sales_order_desc, sales_order_item, sales_order_unit, sales_order_cost, customer_id_id, sales_document, document_date, created_by, created_on, "time", sold_to_party, net_value, sold_to_party_name, sales_document_item, material_description, personnel_number, is_active, changed_on, changed_by) FROM stdin;
    public          postgres    false    231   �       �          0    16679    pcf_db_zsd0070_billing_report 
   TABLE DATA           �  COPY public.pcf_db_zsd0070_billing_report (createdat, createdby, modifiedat, modifiedby, id, billing_report_id, billing_document, sales_document, customer_id_id, payer_description, item_description, billing_date, net_value, tax_amount, cost, grorss_value, sumof_net_gross_value, delivery_number, ship_to_party1, created_by, created_on, start_date, end_date, is_active, changed_on, changed_by) FROM stdin;
    public          postgres    false    232    �       �          0    16533    sap_common_countries 
   TABLE DATA           A   COPY public.sap_common_countries (name, descr, code) FROM stdin;
    public          postgres    false    225   =�       �          0    16540    sap_common_countries_texts 
   TABLE DATA           O   COPY public.sap_common_countries_texts (locale, name, descr, code) FROM stdin;
    public          postgres    false    226   Z�       �           0    0    pcf_db_books_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.pcf_db_books_id_seq', 1, false);
          public          postgres    false    228            �           0    0    pcf_db_login_user_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.pcf_db_login_user_id_seq', 9, true);
          public          postgres    false    240            �           0    0    pcf_db_module_master_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.pcf_db_module_master_id_seq', 8, true);
          public          postgres    false    250            �           0    0    pcf_db_privilege_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.pcf_db_privilege_id_seq', 4, true);
          public          postgres    false    244            �           0    0    pcf_db_role_master_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.pcf_db_role_master_id_seq', 5, true);
          public          postgres    false    249            �           0    0 +   pcf_db_role_module_submodule_mapping_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.pcf_db_role_module_submodule_mapping_id_seq', 59, true);
          public          postgres    false    252            �           0    0    pcf_db_submodule_master_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.pcf_db_submodule_master_id_seq', 13, true);
          public          postgres    false    251            �           0    0 $   pcf_db_user_privilege_mapping_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.pcf_db_user_privilege_mapping_id_seq', 11, true);
          public          postgres    false    243            �           0    0    pcf_db_user_role_mapping_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.pcf_db_user_role_mapping_id_seq', 6, true);
          public          postgres    false    253                       2606    16486 "   pcf_db_authors pcf_db_authors_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.pcf_db_authors
    ADD CONSTRAINT pcf_db_authors_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.pcf_db_authors DROP CONSTRAINT pcf_db_authors_pkey;
       public            postgres    false    218                       2606    16481    pcf_db_books pcf_db_books_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.pcf_db_books
    ADD CONSTRAINT pcf_db_books_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.pcf_db_books DROP CONSTRAINT pcf_db_books_pkey;
       public            postgres    false    217                       2606    16519 *   pcf_db_books_texts pcf_db_books_texts_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.pcf_db_books_texts
    ADD CONSTRAINT pcf_db_books_texts_pkey PRIMARY KEY (locale, id);
 T   ALTER TABLE ONLY public.pcf_db_books_texts DROP CONSTRAINT pcf_db_books_texts_pkey;
       public            postgres    false    223    223                       2606    16514 >   pcf_db_control_family_master pcf_db_control_family_master_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.pcf_db_control_family_master
    ADD CONSTRAINT pcf_db_control_family_master_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.pcf_db_control_family_master DROP CONSTRAINT pcf_db_control_family_master_pkey;
       public            postgres    false    222                       2606    16507 0   pcf_db_control_master pcf_db_control_master_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.pcf_db_control_master
    ADD CONSTRAINT pcf_db_control_master_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.pcf_db_control_master DROP CONSTRAINT pcf_db_control_master_pkey;
       public            postgres    false    221            %           2606    24744 @   pcf_db_control_report_mapping pcf_db_control_report_mapping_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.pcf_db_control_report_mapping
    ADD CONSTRAINT pcf_db_control_report_mapping_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.pcf_db_control_report_mapping DROP CONSTRAINT pcf_db_control_report_mapping_pkey;
       public            postgres    false    236                       2606    16500 2   pcf_db_customer_master pcf_db_customer_master_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.pcf_db_customer_master
    ADD CONSTRAINT pcf_db_customer_master_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.pcf_db_customer_master DROP CONSTRAINT pcf_db_customer_master_pkey;
       public            postgres    false    220            )           2606    24759 (   pcf_db_login_user pcf_db_login_user_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.pcf_db_login_user
    ADD CONSTRAINT pcf_db_login_user_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.pcf_db_login_user DROP CONSTRAINT pcf_db_login_user_pkey;
       public            postgres    false    238            3           2606    24846 .   pcf_db_module_master pcf_db_module_master_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.pcf_db_module_master
    ADD CONSTRAINT pcf_db_module_master_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.pcf_db_module_master DROP CONSTRAINT pcf_db_module_master_pkey;
       public            postgres    false    246            	           2606    16493     pcf_db_orders pcf_db_orders_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.pcf_db_orders
    ADD CONSTRAINT pcf_db_orders_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.pcf_db_orders DROP CONSTRAINT pcf_db_orders_pkey;
       public            postgres    false    219                       2606    16671 @   pcf_db_pa0002_employee_master pcf_db_pa0002_employee_master_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.pcf_db_pa0002_employee_master
    ADD CONSTRAINT pcf_db_pa0002_employee_master_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.pcf_db_pa0002_employee_master DROP CONSTRAINT pcf_db_pa0002_employee_master_pkey;
       public            postgres    false    230            '           2606    24751 >   pcf_db_price_mismatch_output pcf_db_price_mismatch_output_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.pcf_db_price_mismatch_output
    ADD CONSTRAINT pcf_db_price_mismatch_output_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.pcf_db_price_mismatch_output DROP CONSTRAINT pcf_db_price_mismatch_output_pkey;
       public            postgres    false    237            -           2606    24822 &   pcf_db_privilege pcf_db_privilege_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.pcf_db_privilege
    ADD CONSTRAINT pcf_db_privilege_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.pcf_db_privilege DROP CONSTRAINT pcf_db_privilege_pkey;
       public            postgres    false    241            #           2606    24737 .   pcf_db_report_master pcf_db_report_master_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.pcf_db_report_master
    ADD CONSTRAINT pcf_db_report_master_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.pcf_db_report_master DROP CONSTRAINT pcf_db_report_master_pkey;
       public            postgres    false    235            +           2606    24771 *   pcf_db_role_master pcf_db_role_master_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.pcf_db_role_master
    ADD CONSTRAINT pcf_db_role_master_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.pcf_db_role_master DROP CONSTRAINT pcf_db_role_master_pkey;
       public            postgres    false    239            7           2606    24860 N   pcf_db_role_module_submodule_mapping pcf_db_role_module_submodule_mapping_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.pcf_db_role_module_submodule_mapping
    ADD CONSTRAINT pcf_db_role_module_submodule_mapping_pkey PRIMARY KEY (id);
 x   ALTER TABLE ONLY public.pcf_db_role_module_submodule_mapping DROP CONSTRAINT pcf_db_role_module_submodule_mapping_pkey;
       public            postgres    false    248                       2606    16531 0   pcf_db_student_master pcf_db_student_master_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.pcf_db_student_master
    ADD CONSTRAINT pcf_db_student_master_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.pcf_db_student_master DROP CONSTRAINT pcf_db_student_master_pkey;
       public            postgres    false    224            5           2606    24853 4   pcf_db_submodule_master pcf_db_submodule_master_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.pcf_db_submodule_master
    ADD CONSTRAINT pcf_db_submodule_master_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.pcf_db_submodule_master DROP CONSTRAINT pcf_db_submodule_master_pkey;
       public            postgres    false    247            !           2606    24730 ,   pcf_db_sync_details pcf_db_sync_details_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.pcf_db_sync_details
    ADD CONSTRAINT pcf_db_sync_details_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.pcf_db_sync_details DROP CONSTRAINT pcf_db_sync_details_pkey;
       public            postgres    false    234                       2606    24723 *   pcf_db_sync_header pcf_db_sync_header_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.pcf_db_sync_header
    ADD CONSTRAINT pcf_db_sync_header_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.pcf_db_sync_header DROP CONSTRAINT pcf_db_sync_header_pkey;
       public            postgres    false    233            /           2606    24829 @   pcf_db_user_privilege_mapping pcf_db_user_privilege_mapping_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.pcf_db_user_privilege_mapping
    ADD CONSTRAINT pcf_db_user_privilege_mapping_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.pcf_db_user_privilege_mapping DROP CONSTRAINT pcf_db_user_privilege_mapping_pkey;
       public            postgres    false    242            1           2606    24839 6   pcf_db_user_role_mapping pcf_db_user_role_mapping_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.pcf_db_user_role_mapping
    ADD CONSTRAINT pcf_db_user_role_mapping_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.pcf_db_user_role_mapping DROP CONSTRAINT pcf_db_user_role_mapping_pkey;
       public            postgres    false    245                       2606    16678 4   pcf_db_va05_sales_order pcf_db_va05_sales_order_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.pcf_db_va05_sales_order
    ADD CONSTRAINT pcf_db_va05_sales_order_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.pcf_db_va05_sales_order DROP CONSTRAINT pcf_db_va05_sales_order_pkey;
       public            postgres    false    231                       2606    16685 @   pcf_db_zsd0070_billing_report pcf_db_zsd0070_billing_report_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.pcf_db_zsd0070_billing_report
    ADD CONSTRAINT pcf_db_zsd0070_billing_report_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.pcf_db_zsd0070_billing_report DROP CONSTRAINT pcf_db_zsd0070_billing_report_pkey;
       public            postgres    false    232                       2606    16539 .   sap_common_countries sap_common_countries_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.sap_common_countries
    ADD CONSTRAINT sap_common_countries_pkey PRIMARY KEY (code);
 X   ALTER TABLE ONLY public.sap_common_countries DROP CONSTRAINT sap_common_countries_pkey;
       public            postgres    false    225                       2606    16546 :   sap_common_countries_texts sap_common_countries_texts_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.sap_common_countries_texts
    ADD CONSTRAINT sap_common_countries_texts_pkey PRIMARY KEY (locale, code);
 d   ALTER TABLE ONLY public.sap_common_countries_texts DROP CONSTRAINT sap_common_countries_texts_pkey;
       public            postgres    false    226    226            �   F  x��]mo�8��_�0�i�3���P��Sd%*[�$�6{W�ͤ�ږO��������Jٵ������3���e�6`��`�f�[>�WFW�x�aF���͗���M}?���l�0y���5����9�w��ћ$>��Q�C���~ln�b��_����p������.��+l&k�`��n��'�t�O��ћ�?�\�㙞e ���|�b),m����'�����'׳����9�}b�n6!�r �������&<��l>�����h���x�!�2�W�6X����m���q� ~I�8�A��j��ϗQ��Q�-��{��������}�`�z.����P�?���W��e��vѪ@��:t�+a�?(�{y��!�/��βu�23���k�����ƶ�bS�}Ӱ{�dR��h�M�6}$���@s'�1��NK/�.	6��.ꎡy�D����Y��)����D��1��Ԟ��f�]%�^J��s�n���8��Q�=�`O�O4������'�1���W3"��!�=?��"©�����h�e����*H��c��i�<��jU3�;����Mb~<+,�v�e��D[�Q��,��V ��Pe�T��o*�0S�*���ȴ�5�n/f��@u�4jJe�-�j����p�j�9�jS��&r���`�~��ab���`�&��Mq�r��ᔧz�H�Ш8J�DCk��c��0��z���p�x�'п����޼-D2f��8yK4ʮ���NΎ
�!�rߞuW�jK!A�`��į�{mv�W��-�$�^�"$�N5�\�p�����Uh���h�Tj[���@�0o��i�NY�3�y6��9���UD�$9e�����@�ȒE:3Β��$s�!��h 
xb�� ��6_7xG�z�M!��i(��"ԻK� M�9
�W�YJ��K�錩̾l UI�"�pUz蕋�9 �r�T@���h<�N��,��Y��~�D(Y/�&�]7t*F�4w�i.�R��'�Lb*�]D�h�	��'�E���4]�b��7F;nu4�	µ�1�L��\p��Ęy�I0׮��_��f����j2\�dpD��i�a�2�t.�S�K�!� )��lG��o@-F �yN  ��p\{63,��ޔ�e7��`;���}ޚ����U
�Z��
�����eȃ�8Yַo�������!|�@Q�#�2�3�[��a���;��g��`���F��9+�,�%�-$���a���<�*[�*��&��`0'`13��{	����p0�"��'�d&����B
e������m�R�T
�yf��5(�[ '�����0I;��F,����N�rl�@ᵕg��Ҽ*��x�nC�rL�l�;��3K��1ы O��|���)	e,��&s'�����o�������Dq���7�e��;�1�6\����2%a��X;v�U����i�=��~��\FC�f��$��h���ј�����������`����K�b�sl�u�3�"�bj����� Ĉ��L������B=�7�9�z%�J�	$�����,1����&<o��G����Ė[����b'���[�mv�8�Ѻ�$�?j%w�����՞�oCЄ���g�N��ʄP���S?wP��xz�&�p &�2�y��l�*r̍A<�����opN^�$������v�4���Y��H̩(�e��x�A���9*�tl'Yq���TU<��L�ڲV�e��\�&�1Ӻ��L!�i����>��Xi��̙&]f�]=R\F���V���kK>:1<ʹ��Ȱ�V1ҳf������\+�^�90N+}���)`���'s�!N�FU��� {,r0w9g�ќ��yS�F�8�U��A%��LVj�7��OU0�n�J�*m���M�<}�������8\�7A���G�dwPgV�<}��$�hۣv��v�����~{͛yL>_oˊw*�5+�@l�T;�Q�v�6e��a�\�z	Y����M��jӊ��}mZh!�+���7 ��������w�3�S��T`����.=���Ιt��s݄6���Z�~N�n�ɺ�.Mr�W4�{��9]X�˴LkM��2@j�qy����2��t������/�S�V�n}�+9j�q�+��+���"C��p*P2H�v4i��%k9h�we�A�h�\s�Cn!������]սԩ�>�b ��t�5�޼ r+�.R��E��m���d�-�\�!��� 9J�`�w��Gq�>�B��g����Y�чt�R��K�ʺ�Ϻ��sÁ
W��������[�AAcX~�q��y���pߙ�q'�W:rP�t@��,:�Y��ԉ�T���3T�Z졡wY�j{l�x��zנ�v}�"+��L'�7P-k=��7���B�!���u9�Y}�I��QNhY�ּ����9���<~%F��n�>�\����{�k���\��ԅjBC3�k�\ ��lbZ�FQ���⦟��Ça�Lk �3�����Q芆�L���nmd�b'�c�^A��[K���Tb�����Y��$�o1�W*�v��Mm ���H�"eeR�2���K>����y���t�`�(��/�P8��sK{�����KGi|�������:�BE��WT\-`�WxX�M�Wʺ���d��r�d�$�tƔv�J+�䪚�x�W�V�q�̃���րB* ������r��a*��v�9�e�4F�8$6�6Y�:YO՞�=����]n���r�_9��GL�w�-@uv��gw�9���0H�`�G�m?S�}�b���n��6�h;&(!�p�@ӳ����@aZ�2X�Z�J�꧚|��}ݞN�oٺf�����A�C�ϻh2�J�X"FbBeՇ�/�&�W���5���q�Yd�Jv].���k��Ϥ��m�U��A�A�
��Y޷	>��~�m�\gL��y�}��;e�}�3~����ȝ�?��]d�a�\�%�bЩ��������/�S�嚞b�63��5ȴ3�4V��ͨy�w`�\�<hk��x��)sxh�5b �E讯���n��ū,H�S�����<�l�'��u
�g��>�W3*Sm�����^���!x��rE���$�Y�j���1�m�a��1X��	�v��"aW�fT���k	#z��0�R�tc�o]?O 5���E���V
˝��_�	�2]ӓ�V;���� �v�f��cm��ߣ�ؕG�!�`X3#5[ Y�5�MxO�ٝ���+�Z��*\
!A��
ւ۶�-xlׇ͖�%-Z�]����KԖ@`V8	��zg�g� �K�A�1���I��$��$oA��ໞ�\�}�򉽣�E���#�	?#?�R�Iro������:��]���H���/]V���4��6��r �}�+�CoU�)�9�Q� dS"�!��~-�t��wo�L�Be5�*�z��s �[U[X*e)5�$�*P(C-a[8o�j*/�]��Ъa>��S.U�|���ɹ�~s�$-�^��k�c��-,4�l�Tn�J�]s4�r�L��z�?�� �����3�s��Tg��;���-t6]f��^黛V�U2�f�K���T��p��U'���J��]�O��>������bU�ԪBpi�_f=hRe��)~�6GK��U�d"���?�W�2b�%A+n���H�r%��	��_�v�t�-k�}�;@��K	]6�*�:�`5Z�|E9��vk��2Kɴj�V+��e�٥G��!�QX���1c!�b�i�T�� �2�q^��m��כg8���5����VMY�ҵ��B*��:a����3����-0���[��Ұ@?ckiR�ZZѦ��������l@�!U�F�����p���i���5R���zW�/�;~����$�@      �      x������ � �      �   =   x�3�,�,I5*��*MI,���44�1~\F�R��%�Eic��&��M�K�ᗎ���� �8)      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   F  x����n!@Ϟ���0���t���RSE�$�2�ڿ/3��L�$�!f�gH!�	ɤYH$n�A��o��e����,���c7O����
������ڜvzƎ	{1]�&����X������é��� ��;@�UVY;��zd��d^`�u�0��P{<`���AV���<�b���Urc���3��tI��,ʌJ����%�t�Ģs}�؎��g2An���lk`8ri@T�.WG��Hq)�L/�ԁ$Ge?>�7�G�%���h%��tMkѬ+��dU���~�:�ߢ9N-��%�N�i!l}XA��a0�i�w ��      �   �  x�u�ߊ� Ư�)|�Q��.3��:	����BQc��4cY��W'e��t�<�����0����:n�j:��3�#��Po�Y}1�͡�W�׿�����ڷ�8��i�.�1e&'�iF�'�F���gdz��>_� ����yy�U����2m�� ;��d��Po,�f�HL2f=q�N�w��/3�>5�n����ݠĈ>\�Ə�]���]��%<*>�0R�\3)�bE�y�r,����<MT��V�6/��1ft6���waг�ʛ<��0���$D	�0L8���~EE�@|#ǋ"LA!�$Z���s�c�4�Tj�ϥ&�Gh�g�m���/�,�4��OHVrZr�Y�`�L�=�VJ�Ra���*d̺��)xmVo������wb9<�^����!��Ӓ'Qg_,J�Fi���"�_ ��>      �      x������ � �      �      x������ � �      �      x������ � �      �   [   x�3���truq�tv�Spr��U�)���!��~�� �H��DU���	��e�C\����i�]\}\�tB������� 18�      �      x������ � �      �   �   x��PMk�0='�" '��P���]t�P�tV��Dۿ��mi{����޼�4%i~*��"�:�Yt�j[d~�=�o��/�)韞��˩�إ.*�:���,so�}c'k��{ܽ�O%��h�]�ܠ|�����4��[~��UG1Ԑ���N_���4K�'R��8�QגsQ�C �`�u�-[�-f���(.$��q. �I ���r�rPAe^�&��~�?c�      �   �   x�}�K
�@����a����Kd���He�� B�C��E͇������g�S��/��8',6{��̶���r��M\:륜������u{�%��S0�`G��Ŧ	��M����ѵS0�%��%�`�ֲm
�hK0GS�h�#���8Q��@�`���^�l����l�`�m���%��)��%��灜��#է�F���'�_K���6w7V������� d      �      x������ � �      �   ?  x���Qk�0���_�?��ĨI���F���ڋ�@���`���p��Iڳ�vu
�{����'���d/��&O��4���
�];���j䆾k��{o����\~>�!s��!�����id�vuSOS��л̢,[/�Y<�U����a<�_ۯ�g�.^���:�F�f��#���Wcݵ���"�/٫�qy�rD]��٠�{���~�E�En�x�����v�>4�T�)�������e~��M��uL��b�2nZE�b�<���c���׀�ދN��m�E{�f ��\6�t�"ʢU-�+h�Z]�oG�۞V�j:��eN ���B
�
,e�1�FcYj�� �C��
���>~\zr��q9á��;T]�v�u.����5��A#@�#�c�a��s��I8TZד��%�2@U�1"
\ɒc�H��$�#A�4�����ve��M���)�wj���͈n-����}/dV�0VT�v�Ū`�ڦ��(o�w��z���ě��/�� jT�*ā�sY,� �Wҫ|^�*4 �7�v�?dt�g6��;��2'���d��	�~f�������      �      x������ � �      �      x������ � �      �   @   x�3�4�H�?d�i��́rF��Ɯf Y\�� YK��	N���Ƹ��������� (]#�      �   3   x�3�4�H�?d�e�	��Ɯ �!l�	�¦���T��������� �^1      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     