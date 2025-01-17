PGDMP     %                    |            postgres    15.2    15.4 (    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     s   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE postgres;
                postgres    false            �          0    16470 	   cds_model 
   TABLE DATA           (   COPY public.cds_model (csn) FROM stdin;
    public          postgres    false    216   �0       �          0    16482    pcf_db_authors 
   TABLE DATA           2   COPY public.pcf_db_authors (id, name) FROM stdin;
    public          postgres    false    218   �?       �          0    16475    pcf_db_books 
   TABLE DATA           T   COPY public.pcf_db_books (id, title, author, stock, inc_id, inc_id_str) FROM stdin;
    public          postgres    false    217   @       �          0    16515    pcf_db_books_texts 
   TABLE DATA           ?   COPY public.pcf_db_books_texts (locale, id, title) FROM stdin;
    public          postgres    false    223   Y@       �          0    16508    pcf_db_control_family_master 
   TABLE DATA           �   COPY public.pcf_db_control_family_master (createdat, createdby, modifiedat, modifiedby, id, control_family_id, control_family_name, control_family_desc, customer_id_id, is_active, created_on, created_by, changed_on, changed_by) FROM stdin;
    public          postgres    false    222   v@       �          0    16501    pcf_db_control_master 
   TABLE DATA           �   COPY public.pcf_db_control_master (createdat, createdby, modifiedat, modifiedby, id, control_id, control_family_id, control_name, control_desc, customer_id_id, is_active, created_on, created_by, changed_on, changed_by) FROM stdin;
    public          postgres    false    221   �@       �          0    24738    pcf_db_control_report_mapping 
   TABLE DATA           �   COPY public.pcf_db_control_report_mapping (createdat, createdby, modifiedat, modifiedby, id, report_id_id, control_id_id, customer_id_id, is_active, created_on, changed_on, changed_by, created_by) FROM stdin;
    public          postgres    false    236   �@       �          0    16494    pcf_db_customer_master 
   TABLE DATA           �   COPY public.pcf_db_customer_master (createdat, createdby, modifiedat, modifiedby, id, customer_id, customer_name, customer_address, start_date, end_date, is_active, created_on, created_by, changed_on, changed_by) FROM stdin;
    public          postgres    false    220   �@       �          0    24753    pcf_db_login_user 
   TABLE DATA           �   COPY public.pcf_db_login_user (createdat, createdby, modifiedat, modifiedby, id, user_id, user_name, user_email, user_emp_id, password, customer_id_id, is_active, created_on, changed_on, changed_by, role_id_id, role_name, created_by) FROM stdin;
    public          postgres    false    238   �@       �          0    24840    pcf_db_module_master 
   TABLE DATA           �   COPY public.pcf_db_module_master (id, module_id, module_name, module_desc, parent_module_id_id, is_active, created_on, created_by, changed_on, changed_by, customer_id_id, display_module_name) FROM stdin;
    public          postgres    false    246   @B       �          0    16487    pcf_db_orders 
   TABLE DATA           x   COPY public.pcf_db_orders (createdat, createdby, modifiedat, modifiedby, id, book_id, country_code, amount) FROM stdin;
    public          postgres    false    219   8D       �          0    16665    pcf_db_pa0002_employee_master 
   TABLE DATA           J  COPY public.pcf_db_pa0002_employee_master (createdat, createdby, modifiedat, modifiedby, id, sync_id, emp_id, emp_name, emp_address, customer_id_id, client, personnel_number, end_date, start_date, is_active, first_name, last_name, middle_name, date_of_birth, id_number, created_by, created_on, changed_on, changed_by) FROM stdin;
    public          postgres    false    230   UD       �          0    24745    pcf_db_price_mismatch_output 
   TABLE DATA             COPY public.pcf_db_price_mismatch_output (createdat, createdby, modifiedat, modifiedby, id, sync_id_id, emp_id_id, invoice_id_id, order_id_id, control_id_id, customer_id_id, simulated_at, simulated_by, is_active, created_on, changed_on, changed_by, created_by) FROM stdin;
    public          postgres    false    237   rD       �          0    24816    pcf_db_privilege 
   TABLE DATA           �   COPY public.pcf_db_privilege (id, privilege_id, privilege_name, privilege_desc, is_active, created_on, changed_on, changed_by, created_by, customer_id_id) FROM stdin;
    public          postgres    false    241   �D       �          0    24731    pcf_db_report_master 
   TABLE DATA           �   COPY public.pcf_db_report_master (createdat, createdby, modifiedat, modifiedby, id, report_id, report_path, report_name, report_created_at, report_destination, customer_id_id, is_active, changed_on, changed_by, created_by, created_on) FROM stdin;
    public          postgres    false    235   �D       �          0    24765    pcf_db_role_master 
   TABLE DATA           �   COPY public.pcf_db_role_master (createdat, createdby, modifiedat, modifiedby, id, role_id, role_name, role_desc, customer_id_id, role_permission, is_active, created_on, changed_on, changed_by, created_by) FROM stdin;
    public          postgres    false    239   E       �          0    24854 $   pcf_db_role_module_submodule_mapping 
   TABLE DATA           �   COPY public.pcf_db_role_module_submodule_mapping (id, role_id_id, module_id_id, submodule_id_id, is_active, created_on, created_by, changed_on, changed_by, customer_id_id, privilege_flag, privilege_id_id) FROM stdin;
    public          postgres    false    248   
F       �          0    16525    pcf_db_student_master 
   TABLE DATA           |   COPY public.pcf_db_student_master (createdat, createdby, modifiedat, modifiedby, id, name, age, address, email) FROM stdin;
    public          postgres    false    224   �F       �          0    24847    pcf_db_submodule_master 
   TABLE DATA           �   COPY public.pcf_db_submodule_master (id, submodule_id, submodule_name, submodule_desc, parent_module_id_id, is_active, created_on, created_by, changed_on, changed_by, customer_id_id, display_submodule_name) FROM stdin;
    public          postgres    false    247   G       �          0    24724    pcf_db_sync_details 
   TABLE DATA             COPY public.pcf_db_sync_details (createdat, createdby, modifiedat, modifiedby, id, sync_header_id_id, sync_status, control_id_id, report_id_id, report_destination, sync_started_at, sync_ended_at, changed_by, changed_on, customer_id_id, is_active, created_on, created_by) FROM stdin;
    public          postgres    false    234   bI       �          0    24717    pcf_db_sync_header 
   TABLE DATA           �   COPY public.pcf_db_sync_header (createdat, createdby, modifiedat, modifiedby, id, sync_id, sync_status, control_id_id, customer_id_id, sync_started_at, sync_ended_at, is_active, created_on, created_by, changed_on, changed_by) FROM stdin;
    public          postgres    false    233   I       �          0    24823    pcf_db_user_privilege_mapping 
   TABLE DATA           �   COPY public.pcf_db_user_privilege_mapping (id, user_id_id, privilege_id_id, is_active, created_on, changed_on, changed_by, created_by, customer_id_id, module_id_id, submodule_id_id, direct_privilege_flag) FROM stdin;
    public          postgres    false    242   �I       �          0    24833    pcf_db_user_role_mapping 
   TABLE DATA           �   COPY public.pcf_db_user_role_mapping (id, user_id_id, role_id_id, is_active, created_on, changed_on, changed_by, created_by, customer_id_id) FROM stdin;
    public          postgres    false    245   �I       �          0    16672    pcf_db_va05_sales_order 
   TABLE DATA           �  COPY public.pcf_db_va05_sales_order (createdat, createdby, modifiedat, modifiedby, id, sales_order_id, sales_order_date, sales_order_desc, sales_order_item, sales_order_unit, sales_order_cost, customer_id_id, sales_document, document_date, created_by, created_on, "time", sold_to_party, net_value, sold_to_party_name, sales_document_item, material_description, personnel_number, is_active, changed_on, changed_by) FROM stdin;
    public          postgres    false    231   /J       �          0    16679    pcf_db_zsd0070_billing_report 
   TABLE DATA           �  COPY public.pcf_db_zsd0070_billing_report (createdat, createdby, modifiedat, modifiedby, id, billing_report_id, billing_document, sales_document, customer_id_id, payer_description, item_description, billing_date, net_value, tax_amount, cost, grorss_value, sumof_net_gross_value, delivery_number, ship_to_party1, created_by, created_on, start_date, end_date, is_active, changed_on, changed_by) FROM stdin;
    public          postgres    false    232   LJ       �          0    16533    sap_common_countries 
   TABLE DATA           A   COPY public.sap_common_countries (name, descr, code) FROM stdin;
    public          postgres    false    225   iJ       �          0    16540    sap_common_countries_texts 
   TABLE DATA           O   COPY public.sap_common_countries_texts (locale, name, descr, code) FROM stdin;
    public          postgres    false    226   �J       �           0    0    pcf_db_books_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.pcf_db_books_id_seq', 1, false);
          public          postgres    false    228            �           0    0    pcf_db_login_user_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.pcf_db_login_user_id_seq', 9, true);
          public          postgres    false    240            �           0    0    pcf_db_module_master_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.pcf_db_module_master_id_seq', 9, true);
          public          postgres    false    250            �           0    0    pcf_db_privilege_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.pcf_db_privilege_id_seq', 4, true);
          public          postgres    false    244            �           0    0    pcf_db_role_master_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.pcf_db_role_master_id_seq', 5, true);
          public          postgres    false    249            �           0    0 +   pcf_db_role_module_submodule_mapping_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.pcf_db_role_module_submodule_mapping_id_seq', 59, true);
          public          postgres    false    252            �           0    0    pcf_db_submodule_master_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.pcf_db_submodule_master_id_seq', 13, true);
          public          postgres    false    251            �           0    0 $   pcf_db_user_privilege_mapping_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.pcf_db_user_privilege_mapping_id_seq', 11, true);
          public          postgres    false    243            �           0    0    pcf_db_user_role_mapping_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.pcf_db_user_role_mapping_id_seq', 6, true);
          public          postgres    false    253            �   F  x��]mo�8��_�0�i�3���P��Sd%*[�$�6{W�ͤ�ږO��������Jٵ������3���e�6`��`�f�[>�WFW�x�aF���͗���M}?���l�0y���5����9�w��ћ$>��Q�C���~ln�b��_����p������.��+l&k�`��n��'�t�O��ћ�?�\�㙞e ���|�b),m����'�����'׳����9�}b�n6!�r �������&<��l>�����h���x�!�2�W�6X����m���q� ~I�8�A��j��ϗQ��Q�-��{��������}�`�z.����P�?���W��e��vѪ@��:t�+a�?(�{y��!�/��βu�23���k�����ƶ�bS�}Ӱ{�dR��h�M�6}$���@s'�1��NK/�.	6��.ꎡy�D����Y��)����D��1��Ԟ��f�]%�^J��s�n���8��Q�=�`O�O4������'�1���W3"��!�=?��"©�����h�e����*H��c��i�<��jU3�;����Mb~<+,�v�e��D[�Q��,��V ��Pe�T��o*�0S�*���ȴ�5�n/f��@u�4jJe�-�j����p�j�9�jS��&r���`�~��ab���`�&��Mq�r��ᔧz�H�Ш8J�DCk��c��0��z���p�x�'п����޼-D2f��8yK4ʮ���NΎ
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
������ڜvzƎ	{1]�&����X������é��� ��;@�UVY;��zd��d^`�u�0��P{<`���AV���<�b���Urc���3��tI��,ʌJ����%�t�Ģs}�؎��g2An���lk`8ri@T�.WG��Hq)�L/�ԁ$Ge?>�7�G�%���h%��tMkѬ+��dU���~�:�ߢ9N-��%�N�i!l}XA��a0�i�w ��      �   �  x���ߊ�0Ư���D�OM�s���BGa�^,JcW���e���8���鰋ᐣ'���P�/�"��u�/@�G�~7m�Z�+T���zw��8L�?�p����lJ_��v�
Nz]����f1�Q7݀tH�_�og7 _���������V�Wϻ�|�*`u����z��	q�ߡ�����C����>����q��<���S��.�]ۺ����Xݢw����z�S�]n�sxT�/`
���qc��¢�mfD&�MqV�u��*@c@'_]�pa7z
]�[l:t&'I 1�&�(͸+R1�J��"L�2��5�3,�����`f��\H��#��1�x�G���4bL���f�eBDIJ��L
P�ں���:��2����`�P^)%x)���p�`_;1�<\o��/�'CxF�Lđ���U&�(I���cB�%<aU��R5�*l�TaE�Ԕ�������:\̿�MM�`��Q,�������B�!��      �      x������ � �      �      x������ � �      �      x������ � �      �   [   x�3���truq�tv�Spr��U�)���!��~�� �H��DU���	��e�C\����i�]\}\�tB������� 18�      �      x������ � �      �   �   x��PMk�0='�" '��P���]t�P�tV��Dۿ��mi{����޼�4%i~*��"�:�Yt�j[d~�=�o��/�)韞��˩�إ.*�:���,so�}c'k��{ܽ�O%��h�]�ܠ|�����4��[~��UG1Ԑ���N_���4K�'R��8�QגsQ�C �`�u�-[�-f���(.$��q. �I ���r�rPAe^�&��~�?c�      �   �   x�}�K
�@����a����Kd���He�� B�C��E͇������g�S��/��8',6{��̶���r��M\:륜������u{�%��S0�`G��Ŧ	��M����ѵS0�%��%�`�ֲm
�hK0GS�h�#���8Q��@�`���^�l����l�`�m���%��)��%��灜��#է�F���'�_K���6w7V������� d      �      x������ � �      �   ?  x���Qk�0���_�?��ĨI���F���ڋ�@���`���p��Iڳ�vu
�{����'���d/��&O��4���
�];���j䆾k��{o����\~>�!s��!�����id�vuSOS��л̢,[/�Y<�U����a<�_ۯ�g�.^���:�F�f��#���Wcݵ���"�/٫�qy�rD]��٠�{���~�E�En�x�����v�>4�T�)�������e~��M��uL��b�2nZE�b�<���c���׀�ދN��m�E{�f ��\6�t�"ʢU-�+h�Z]�oG�۞V�j:��eN ���B
�
,e�1�FcYj�� �C��
���>~\zr��q9á��;T]�v�u.����5��A#@�#�c�a��s��I8TZד��%�2@U�1"
\ɒc�H��$�#A�4�����ve��M���)�wj���͈n-����}/dV�0VT�v�Ū`�ڦ��(o�w��z���ě��/�� jT�*ā�sY,� �Wҫ|^�*4 �7�v�?dt�g6��;��2'���d��	�~f�������      �      x������ � �      �      x������ � �      �   @   x�3�4�H�?d�i��́rF��Ɯf Y\�� YK��	N���Ƹ��������� (]#�      �   3   x�3�4�H�?d�e�	��Ɯ �!l�	�¦���T��������� �^1      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     