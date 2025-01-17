PGDMP     9                    |            postgres    15.2    15.4 (    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          postgres    false    216   x/       �          0    16482    pcf_db_authors 
   TABLE DATA           2   COPY public.pcf_db_authors (id, name) FROM stdin;
    public          postgres    false    218   �>       �          0    16475    pcf_db_books 
   TABLE DATA           T   COPY public.pcf_db_books (id, title, author, stock, inc_id, inc_id_str) FROM stdin;
    public          postgres    false    217   �>       �          0    16515    pcf_db_books_texts 
   TABLE DATA           ?   COPY public.pcf_db_books_texts (locale, id, title) FROM stdin;
    public          postgres    false    223   !?       �          0    16508    pcf_db_control_family_master 
   TABLE DATA           �   COPY public.pcf_db_control_family_master (createdat, createdby, modifiedat, modifiedby, id, control_family_id, control_family_name, control_family_desc, customer_id_id, is_active) FROM stdin;
    public          postgres    false    222   >?       �          0    16501    pcf_db_control_master 
   TABLE DATA           �   COPY public.pcf_db_control_master (createdat, createdby, modifiedat, modifiedby, id, control_id, control_family_id, control_name, control_desc, customer_id_id, is_active) FROM stdin;
    public          postgres    false    221   [?       �          0    24738    pcf_db_control_report_mapping 
   TABLE DATA           �   COPY public.pcf_db_control_report_mapping (createdat, createdby, modifiedat, modifiedby, id, report_id_id, control_id_id, customer_id_id, is_active, created_on, changed_on, changed_by, created_by) FROM stdin;
    public          postgres    false    236   x?       �          0    16494    pcf_db_customer_master 
   TABLE DATA           �   COPY public.pcf_db_customer_master (createdat, createdby, modifiedat, modifiedby, id, customer_id, customer_name, customer_address, start_date, end_date, is_active) FROM stdin;
    public          postgres    false    220   �?       �          0    24753    pcf_db_login_user 
   TABLE DATA           �   COPY public.pcf_db_login_user (createdat, createdby, modifiedat, modifiedby, id, user_id, user_name, user_email, user_emp_id, password, customer_id_id, is_active, created_on, changed_on, changed_by, role_id_id, role_name, created_by) FROM stdin;
    public          postgres    false    238   �?       �          0    24840    pcf_db_module_master 
   TABLE DATA           �   COPY public.pcf_db_module_master (id, module_id, module_name, module_desc, parent_module_id_id, is_active, created_on, created_by, changed_on, changed_by, customer_id_id, display_module_name) FROM stdin;
    public          postgres    false    246   @@       �          0    16487    pcf_db_orders 
   TABLE DATA           x   COPY public.pcf_db_orders (createdat, createdby, modifiedat, modifiedby, id, book_id, country_code, amount) FROM stdin;
    public          postgres    false    219   A       �          0    16665    pcf_db_pa0002_employee_master 
   TABLE DATA           2  COPY public.pcf_db_pa0002_employee_master (createdat, createdby, modifiedat, modifiedby, id, sync_id, emp_id, emp_name, emp_address, customer_id_id, client, personnel_number, end_date, start_date, is_active, first_name, last_name, middle_name, date_of_birth, id_number, created_by, created_on) FROM stdin;
    public          postgres    false    230   4A       �          0    24745    pcf_db_price_mismatch_output 
   TABLE DATA             COPY public.pcf_db_price_mismatch_output (createdat, createdby, modifiedat, modifiedby, id, sync_id_id, emp_id_id, invoice_id_id, order_id_id, control_id_id, customer_id_id, simulated_at, simulated_by, is_active, created_on, changed_on, changed_by, created_by) FROM stdin;
    public          postgres    false    237   QA       �          0    24816    pcf_db_privilege 
   TABLE DATA           �   COPY public.pcf_db_privilege (id, privilege_id, privilege_name, privilege_desc, is_active, created_on, changed_on, changed_by, created_by, customer_id_id) FROM stdin;
    public          postgres    false    241   nA       �          0    24731    pcf_db_report_master 
   TABLE DATA           �   COPY public.pcf_db_report_master (createdat, createdby, modifiedat, modifiedby, id, report_id, report_path, report_name, report_created_at, report_destination, customer_id_id, is_active, changed_on, changed_by, created_by, created_on) FROM stdin;
    public          postgres    false    235   �A       �          0    24765    pcf_db_role_master 
   TABLE DATA           �   COPY public.pcf_db_role_master (createdat, createdby, modifiedat, modifiedby, id, role_id, role_name, role_desc, customer_id_id, role_permission, is_active, created_on, changed_on, changed_by, created_by) FROM stdin;
    public          postgres    false    239   �A       �          0    24854 $   pcf_db_role_module_submodule_mapping 
   TABLE DATA           �   COPY public.pcf_db_role_module_submodule_mapping (id, role_id_id, module_id_id, submodule_id_id, is_active, created_on, created_by, changed_on, changed_by, customer_id_id, privilege_flag, privilege_id_id) FROM stdin;
    public          postgres    false    248   �B       �          0    16525    pcf_db_student_master 
   TABLE DATA           |   COPY public.pcf_db_student_master (createdat, createdby, modifiedat, modifiedby, id, name, age, address, email) FROM stdin;
    public          postgres    false    224   yC       �          0    24847    pcf_db_submodule_master 
   TABLE DATA           �   COPY public.pcf_db_submodule_master (id, submodule_id, submodule_name, submodule_desc, parent_module_id_id, is_active, created_on, created_by, changed_on, changed_by, customer_id_id, display_submodule_name) FROM stdin;
    public          postgres    false    247   �C       �          0    24724    pcf_db_sync_details 
   TABLE DATA             COPY public.pcf_db_sync_details (createdat, createdby, modifiedat, modifiedby, id, sync_header_id_id, sync_status, control_id_id, report_id_id, report_destination, sync_started_at, sync_ended_at, changed_by, changed_on, customer_id_id, is_active) FROM stdin;
    public          postgres    false    234   �D       �          0    24717    pcf_db_sync_header 
   TABLE DATA           �   COPY public.pcf_db_sync_header (createdat, createdby, modifiedat, modifiedby, id, sync_id, sync_status, control_id_id, customer_id_id, sync_started_at, sync_ended_at, is_active) FROM stdin;
    public          postgres    false    233   �D       �          0    24823    pcf_db_user_privilege_mapping 
   TABLE DATA           �   COPY public.pcf_db_user_privilege_mapping (id, user_id_id, privilege_id_id, is_active, created_on, changed_on, changed_by, created_by, customer_id_id, module_id_id, submodule_id_id, direct_privilege_flag) FROM stdin;
    public          postgres    false    242   E       �          0    24833    pcf_db_user_role_mapping 
   TABLE DATA           �   COPY public.pcf_db_user_role_mapping (id, user_id_id, role_id_id, is_active, created_on, changed_on, changed_by, created_by, customer_id_id) FROM stdin;
    public          postgres    false    245   `E       �          0    16672    pcf_db_va05_sales_order 
   TABLE DATA           �  COPY public.pcf_db_va05_sales_order (createdat, createdby, modifiedat, modifiedby, id, sales_order_id, sales_order_date, sales_order_desc, sales_order_item, sales_order_unit, sales_order_cost, customer_id_id, sales_document, document_date, created_by, created_on, "time", sold_to_party, net_value, sold_to_party_name, sales_document_item, material_description, personnel_number, is_active) FROM stdin;
    public          postgres    false    231   �E       �          0    16679    pcf_db_zsd0070_billing_report 
   TABLE DATA           }  COPY public.pcf_db_zsd0070_billing_report (createdat, createdby, modifiedat, modifiedby, id, billing_report_id, billing_document, sales_document, customer_id_id, payer_description, item_description, billing_date, net_value, tax_amount, cost, grorss_value, sumof_net_gross_value, delivery_number, ship_to_party1, created_by, created_on, start_date, end_date, is_active) FROM stdin;
    public          postgres    false    232   �E       �          0    16533    sap_common_countries 
   TABLE DATA           A   COPY public.sap_common_countries (name, descr, code) FROM stdin;
    public          postgres    false    225   �E       �          0    16540    sap_common_countries_texts 
   TABLE DATA           O   COPY public.sap_common_countries_texts (locale, name, descr, code) FROM stdin;
    public          postgres    false    226   �E       �           0    0    pcf_db_books_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.pcf_db_books_id_seq', 1, false);
          public          postgres    false    228            �           0    0    pcf_db_login_user_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.pcf_db_login_user_id_seq', 5, true);
          public          postgres    false    240            �           0    0    pcf_db_module_master_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.pcf_db_module_master_id_seq', 4, true);
          public          postgres    false    250            �           0    0    pcf_db_privilege_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.pcf_db_privilege_id_seq', 4, true);
          public          postgres    false    244            �           0    0    pcf_db_role_master_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.pcf_db_role_master_id_seq', 4, true);
          public          postgres    false    249            �           0    0 +   pcf_db_role_module_submodule_mapping_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.pcf_db_role_module_submodule_mapping_id_seq', 59, true);
          public          postgres    false    252            �           0    0    pcf_db_submodule_master_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.pcf_db_submodule_master_id_seq', 9, true);
          public          postgres    false    251            �           0    0 $   pcf_db_user_privilege_mapping_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.pcf_db_user_privilege_mapping_id_seq', 11, true);
          public          postgres    false    243            �           0    0    pcf_db_user_role_mapping_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.pcf_db_user_role_mapping_id_seq', 6, true);
          public          postgres    false    253            �   /  x��]mo�8��_�0�i�3���P��Sd%*[�$�6�+�fRmm�'ˋf����^H�z��8-?%��g���<�!%�-8���Ww����x�w�.L�hw���~?�������p����]&�v�[�_3���0z��G0%{��Z&�.� �-��>�A|	ح����&a��j�&q���M7`w�|�y���8��Y�
�ɧ(��Җލ� �C�>sX�}r=[���s�'��f�,�]�i���k��(���8
N�����b��x�kx�6�o���{��CdB�#�����bp���oaO>�����K��5�i��H�&ZA5�kN_�p�Va���E��Z3�D����6�Pj��x�C�_��e�e�7���k�_��K�Ҷ�bS�}Ӱ{�dR��h�͌6}$���As'W1��NK/�.	���.ꎡy�T����A��)��-��F��.��̞�Wf�]%�^J��s�n���G8��Q�=��@�O4��;����=؁��U6�9�������X������M4ݲ�Ԇ�h$��.�Ax�{~I��U����Ut�%1?�;��*�n��Ө]D�[Ek����^*��7�M�)7N!9;2�k���˹��R&����¼�^}ݞ�\`��t�_m�p�D.ۙL�ҏ0e؂���A�"��D���/a�63��T�i�Ԁ0H4�6�:�����A��9�ǍW|
��|mޛ��H�|�'o�F��5�3��ٱ@i1�s��4�3zvG0 E5����!ؖ��.P(�+mfZ��2��y�m�y�|�o�*"΅8e�YQ���ȒE:�L%�I�C>��@��p�A�1P-�4x�X���B~��P
�=�E�w�
b$M�9
�W�Y	�	$�J�`C���gA#U���X��`���+�,��x*>��Y���v��.�䖬�I͌��^���O�����!9�aV��Y���0���8-jFפ�z����q��X��mn����fZm��-���+O��vqq��7��M� �?S��L�V���M�sf��'EH��s�$�F�D�	˄Hn��0מ���_�.K�Q7��`���ꭃ�O�ѕ鸞�\�` ���Y�@ș9�Z�<(�a�e}�ʿ4����q\�4e���|-�=���O��{���-��,��-,��0���;��W�6���3*�8�C��l�J���3`�<�lI�ƛ�3f�	�`���ܔ#�'@���`0�i�>�"�0���L6��m�����l�s���3KYGC{���mM}φ,�xr}c� ����w���ˇ
^[�\K Wr̡�%��F8~���m9�\xf�:2����'������T��ޝ^\��¿7(�w�>����w�viZ�9��ca��\�V�$�8%��&4���8=Yh�i=Dl.��y�`0	%0��{%AL���sO��OO��`R0x�Yry�-	��q��� �H���W>��2�1"J�R�s;��X�'7�"Ϡ^�u��:��[S��\�!\z��a��?�@���>k�[W[/+6���˽��~���<m�s�x�́
�j��ɀ�G~��?�N����J7ORK��A����KF� 2L�2�y�!�Í��K|�*k��F=��h��`�`B'}	+^K8�ᤌSQ8Ȓ:Ǖ���$+6�ظ�(VofR���r.[l�B5���ֵ&fjuL�N��i�J��g�5�J� ��~�ͯXp0h�w�V%�?�sK�'�����L;�T�w�)� {8">Xh�3p�B3�)`���i�6��	�e�S�
��=Ȟ}�|��`������yS�dm�q�~�tPd�,�J��Y[��*�+�V�����M���s~M��"W�߆�m��>��1�չ�3�o����j7jw�n!0��iм[��4�����x2��Y�b���	�Z���)� p��:�K�8b��6u��M+N0��i��خ����3�k�KA1��lgF�fi���g��]z����3�b+�	mL���0�0ݨ�u)]��4^���s�ջL˴f�$S[H�6��jc� f���L���^z�%}0֊�Ý��دVg��X��ϑg��S��A�w,Ic��j�Aۼq�j�v/4��7�-$�IAa~Wu�H�Q8휙h<��c��m����[�u�*%޸(Z�o[� E'�oY�z4��ȟ�QZd
�}m�}'��.� �������vօs�!0��~�L��X������0��p���pXjyyn���
��kR���pȫc����
��iײ���ap�� ŀKDJ͢s�E��NLS��bd�PAky���g�����ǫ�ԻU����X�Gd:	��jY�	|���z4)E���9g��'-ZlTF9�ey�Z�V3VCs������E7�nΞn�h1��^��E�|�+�-6u����L�Z3@t�;��֧QT�7���ga��q#�����(>o�a����8t�9�[��ة��W�K���]KE*1b���|Ѭ|l�o1�W����nja������GN�ZJZ�乄�N�#U�M�
�(E��
g���n���Ex����Q�p��z=a�ΫPQ)�WX�V`���m�?>Y������JgLi����=W�,ǻ���r�+��
,�[
��dz"�+:,��0�a���=G+BY��H�Ħ���6�R'���Ӏ�'���C������d����H��[�������4�l�>N� ���s=:����Ѱ���w��U��F�	A	�A0��h���_�=
ӊV��*Vr�W������u{6��e�ep�>�U�|�G�e�tK�HL�����U܄���⢦��~�?���_�]��=u�4��%��/��G[h�0u�U��]�A���m�/�q�:יd~�fߦn�N�f���=��r��/�n�:hX �k	�t���݆8;��ez� �\�S���{�>.P��L;�pKa,،��aVɳ�m�~���de�F ���M��ͷ�x��v�c?�܅���܂]pO|�Na��_�g�jFe�͵k��a��Ђ����.�Q�9J"�"��:�	�7�!����m�y(v�hF���q��0�gz�*͝.m����R�gh�,
g�RX��D�JG&����lH�ڑ���G@�kװPh�������#
a�r��2�;�����-�,��&�'����\}��`-D_.����BEւ۶�[��n���KZ��q�B#������*�p>|��ξόA>�n�i̧(�?$���{�����zs��}vT�'��b����6����k�&�{����\��9^����K�d�oa��e�ߠ	�&�ӆwY���~C�c譊�Қ#�� �1A6%"x-�k�LG[z76�d.TV3�b�g�oq z�jK�,����Q
e�%l筙CM奾��Z5̧��ʥj~�O'd,9W�oNC�B�d]�>�!ma���QS�A���r4�2c�_g=��� $-�g�g���m��Μ�;�(��K�Y��}wӪ�J&���}���)^u�J�����u���]��ߎ;���I�
N�*���eփ�*�|M�s�U,Gc�\�D�]�PeĪK�V�2���0�ʕ��&�;~yۭ���i��� ��/1�l�U�#4�`5Z�|E9��vk��r��i�b�V,�U�٥G��!�QX���1c!�b�iK*c�V�E��8���F���3�R��A��B���g�Z\x!�i���Ӆ�3��3����-0���[a�~����е���N��7��ق$�C�2����������o��H��"`d���	\	����ŋ���J      �      x������ � �      �   =   x�3�,�,I5*��*MI,���44�1~\F�R��%�Eic��&��M�K�ᗎ���� �8)      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   ~   x�3202�50�52S00�21�24�37��L��ϫ��/-�4"�3Ə�ё31�!=713G/9?$dhdl�#A*�"l**��:q&&��^c��Μ����l��gb
��"sM��]9SIЯ��� �C�S      �   �   x�uP�
�0��>E�@����t�m��N�YA|{;+��BrwɍE��D���T"�7c-X�Z�+��}?,��Yo��p��r��+�^3tx�Q�&�Ѹ0 ����Z���ţ���"KW��!W�6KE��ӌ>�	="CZb`��5@����q��_�r*6�L��:ڻ75Zx��'�WV#)���hr      �      x������ � �      �      x������ � �      �      x������ � �      �   [   x�3���truq�tv�Spr��U�)���!��~�� �H��DU���	��e�C\����i�]\}\�tB������� 18�      �      x������ � �      �   �   x���㌁!C�ęQ����P�Z�_Z��� �$��AE"���q!�9M@Dph�k�Bh�kgiqj�ByfI�BqAjrfb�B@QfYfNjz*A��@�����gbJnfA� ��?���b{^~Q.�J�#������ �C�      �   �   x�}�K
�@����a����Kd���He�� B�C��E͇������g�S��/��8',6{��̶���r��M\:륜������u{�%��S0�`G��Ŧ	��M����ѵS0�%��%�`�ֲm
�hK0GS�h�#���8Q��@�`���^�l����l�`�m���%��)��%��灜��#է�F���'�_K���6w7V������� d      �      x������ � �      �   0  x�}�ۊ�0���)�	<��2k����z!e4Q1)Idٷ_���Z�����dzd��r1�gU>�FyVyJ�F{��*a�F����#}��滭�~H��j̾�t�Mnp/��V�}:hf�,��k^��,zo�����R?������yQ�I+jc=�ZX����U�E�ڴ�|���V8 ��eM�l����O}����3"5��t�7�����F�9UA�޵L�/�|Ϩ�Y�L?�,J�I5e�����q���V-W�P�V���l�ϐD�di΢��*�\���	���Q�wov
t�B)�S��s      �      x������ � �      �      x������ � �      �   @   x�3�4�H�?d�i��́rF��Ɯf Y\�� YK��	N���Ƹ��������� (]#�      �   3   x�3�4�H�?d�e�	��Ɯ �!l�	�¦���T��������� �^1      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     