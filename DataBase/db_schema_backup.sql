PGDMP      %    6                z           postgres    13.7 (Debian 13.7-0+deb11u1)    14.1 7                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    13443    postgres    DATABASE     Y   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C.UTF-8';
    DROP DATABASE postgres;
                postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3075                       0    0    postgres    DATABASE PROPERTIES     �   ALTER ROLE postgres IN DATABASE postgres SET idle_in_transaction_session_timeout TO '20000';
ALTER ROLE oveezion IN DATABASE postgres SET idle_in_transaction_session_timeout TO '20000';
                     postgres    false                        2615    16962    chymera    SCHEMA        CREATE SCHEMA chymera;
    DROP SCHEMA chymera;
                postgres    false                       0    0    SCHEMA chymera    ACL     +   GRANT USAGE ON SCHEMA chymera TO oveezion;
                   postgres    false    5            �            1259    16987    blocked_people    TABLE     P   CREATE TABLE chymera.blocked_people (
    email text NOT NULL,
    list text
);
 #   DROP TABLE chymera.blocked_people;
       chymera         heap    postgres    false    5                       0    0    TABLE blocked_people    ACL     7   GRANT ALL ON TABLE chymera.blocked_people TO oveezion;
          chymera          postgres    false    205            �            1259    17140    favorite    TABLE     K   CREATE TABLE chymera.favorite (
    email text NOT NULL,
    posts text
);
    DROP TABLE chymera.favorite;
       chymera         heap    postgres    false    5                       0    0    TABLE favorite    ACL     1   GRANT ALL ON TABLE chymera.favorite TO oveezion;
          chymera          postgres    false    211            �            1259    16971    friend_requests    TABLE     ]   CREATE TABLE chymera.friend_requests (
    handle text NOT NULL,
    active_requests text
);
 $   DROP TABLE chymera.friend_requests;
       chymera         heap    postgres    false    5            	           0    0    TABLE friend_requests    ACL     8   GRANT ALL ON TABLE chymera.friend_requests TO oveezion;
          chymera          postgres    false    203            �            1259    16979    friends    TABLE     I   CREATE TABLE chymera.friends (
    email text NOT NULL,
    list text
);
    DROP TABLE chymera.friends;
       chymera         heap    postgres    false    5            
           0    0    TABLE friends    ACL     0   GRANT ALL ON TABLE chymera.friends TO oveezion;
          chymera          postgres    false    204            �            1259    16995 
   group_chat    TABLE     }   CREATE TABLE chymera.group_chat (
    chat_id integer NOT NULL,
    owner_handle text NOT NULL,
    members text NOT NULL
);
    DROP TABLE chymera.group_chat;
       chymera         heap    postgres    false    5                       0    0    TABLE group_chat    ACL     3   GRANT ALL ON TABLE chymera.group_chat TO oveezion;
          chymera          postgres    false    206            �            1259    17155    likes    TABLE     H   CREATE TABLE chymera.likes (
    email text NOT NULL,
    posts text
);
    DROP TABLE chymera.likes;
       chymera         heap    postgres    false    5            �            1259    17125    muted_people    TABLE     N   CREATE TABLE chymera.muted_people (
    email text NOT NULL,
    list text
);
 !   DROP TABLE chymera.muted_people;
       chymera         heap    postgres    false    5                       0    0    TABLE muted_people    ACL     5   GRANT ALL ON TABLE chymera.muted_people TO oveezion;
          chymera          postgres    false    210            �            1259    17003    my_group_chats    TABLE     `   CREATE TABLE chymera.my_group_chats (
    chat_id integer NOT NULL,
    handle text NOT NULL
);
 #   DROP TABLE chymera.my_group_chats;
       chymera         heap    postgres    false    5                       0    0    TABLE my_group_chats    ACL     7   GRANT ALL ON TABLE chymera.my_group_chats TO oveezion;
          chymera          postgres    false    207            �            1259    17092    post    TABLE     �   CREATE TABLE chymera.post (
    handle text NOT NULL,
    post_id text NOT NULL,
    media text,
    text_message text NOT NULL,
    likes integer,
    isvideo boolean,
    comments_number integer,
    date text
);
    DROP TABLE chymera.post;
       chymera         heap    postgres    false    5                       0    0 
   TABLE post    ACL     -   GRANT ALL ON TABLE chymera.post TO oveezion;
          chymera          postgres    false    208            �            1259    17105    post_comment    TABLE     �   CREATE TABLE chymera.post_comment (
    comment_id text NOT NULL,
    post_id text NOT NULL,
    media text,
    text_message text NOT NULL,
    likes integer
);
 !   DROP TABLE chymera.post_comment;
       chymera         heap    postgres    false    5                       0    0    TABLE post_comment    ACL     5   GRANT ALL ON TABLE chymera.post_comment TO oveezion;
          chymera          postgres    false    209            �            1259    16963    users    TABLE     A  CREATE TABLE chymera.users (
    email text NOT NULL,
    handle text NOT NULL,
    profile_pic text,
    age character varying(3) NOT NULL,
    account_name text,
    private_account boolean NOT NULL,
    bio text,
    news_options text NOT NULL,
    local_news boolean NOT NULL,
    french_language boolean NOT NULL
);
    DROP TABLE chymera.users;
       chymera         heap    postgres    false    5                       0    0    TABLE users    ACL     .   GRANT ALL ON TABLE chymera.users TO oveezion;
          chymera          postgres    false    202            �          0    16987    blocked_people 
   TABLE DATA                 chymera          postgres    false    205   �4       �          0    17140    favorite 
   TABLE DATA                 chymera          postgres    false    211   5       �          0    16971    friend_requests 
   TABLE DATA                 chymera          postgres    false    203   �5       �          0    16979    friends 
   TABLE DATA                 chymera          postgres    false    204   �5       �          0    16995 
   group_chat 
   TABLE DATA                 chymera          postgres    false    206   {6       �          0    17155    likes 
   TABLE DATA                 chymera          postgres    false    212   �6       �          0    17125    muted_people 
   TABLE DATA                 chymera          postgres    false    210   �6       �          0    17003    my_group_chats 
   TABLE DATA                 chymera          postgres    false    207   �6       �          0    17092    post 
   TABLE DATA                 chymera          postgres    false    208   �6       �          0    17105    post_comment 
   TABLE DATA                 chymera          postgres    false    209   }8       �          0    16963    users 
   TABLE DATA                 chymera          postgres    false    202   �8       _           2606    16994 "   blocked_people blocked_people_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY chymera.blocked_people
    ADD CONSTRAINT blocked_people_pkey PRIMARY KEY (email);
 M   ALTER TABLE ONLY chymera.blocked_people DROP CONSTRAINT blocked_people_pkey;
       chymera            postgres    false    205            W           2606    17134    users email_unique 
   CONSTRAINT     O   ALTER TABLE ONLY chymera.users
    ADD CONSTRAINT email_unique UNIQUE (email);
 =   ALTER TABLE ONLY chymera.users DROP CONSTRAINT email_unique;
       chymera            postgres    false    202            k           2606    17147    favorite favorite_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY chymera.favorite
    ADD CONSTRAINT favorite_pkey PRIMARY KEY (email);
 A   ALTER TABLE ONLY chymera.favorite DROP CONSTRAINT favorite_pkey;
       chymera            postgres    false    211            [           2606    16978 $   friend_requests friend_requests_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY chymera.friend_requests
    ADD CONSTRAINT friend_requests_pkey PRIMARY KEY (handle);
 O   ALTER TABLE ONLY chymera.friend_requests DROP CONSTRAINT friend_requests_pkey;
       chymera            postgres    false    203            a           2606    17002    group_chat group_chat_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY chymera.group_chat
    ADD CONSTRAINT group_chat_pkey PRIMARY KEY (chat_id);
 E   ALTER TABLE ONLY chymera.group_chat DROP CONSTRAINT group_chat_pkey;
       chymera            postgres    false    206            m           2606    17162    likes likes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY chymera.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (email);
 ;   ALTER TABLE ONLY chymera.likes DROP CONSTRAINT likes_pkey;
       chymera            postgres    false    212            i           2606    17132    muted_people muted_people_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY chymera.muted_people
    ADD CONSTRAINT muted_people_pkey PRIMARY KEY (email);
 I   ALTER TABLE ONLY chymera.muted_people DROP CONSTRAINT muted_people_pkey;
       chymera            postgres    false    210            c           2606    17010 "   my_group_chats my_group_chats_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY chymera.my_group_chats
    ADD CONSTRAINT my_group_chats_pkey PRIMARY KEY (handle, chat_id);
 M   ALTER TABLE ONLY chymera.my_group_chats DROP CONSTRAINT my_group_chats_pkey;
       chymera            postgres    false    207    207            g           2606    17112    post_comment post_comment_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY chymera.post_comment
    ADD CONSTRAINT post_comment_pkey PRIMARY KEY (comment_id);
 I   ALTER TABLE ONLY chymera.post_comment DROP CONSTRAINT post_comment_pkey;
       chymera            postgres    false    209            e           2606    17099    post post_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY chymera.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (post_id);
 9   ALTER TABLE ONLY chymera.post DROP CONSTRAINT post_pkey;
       chymera            postgres    false    208            ]           2606    17149    friends primaryKey 
   CONSTRAINT     V   ALTER TABLE ONLY chymera.friends
    ADD CONSTRAINT "primaryKey" PRIMARY KEY (email);
 ?   ALTER TABLE ONLY chymera.friends DROP CONSTRAINT "primaryKey";
       chymera            postgres    false    204            Y           2606    16970    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY chymera.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (handle);
 ;   ALTER TABLE ONLY chymera.users DROP CONSTRAINT users_pkey;
       chymera            postgres    false    202            n           2606    17150    friends foreignEmail    FK CONSTRAINT     �   ALTER TABLE ONLY chymera.friends
    ADD CONSTRAINT "foreignEmail" FOREIGN KEY (email) REFERENCES chymera.users(email) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 A   ALTER TABLE ONLY chymera.friends DROP CONSTRAINT "foreignEmail";
       chymera          postgres    false    2903    204    202            p           2606    17113 &   post_comment post_comment_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY chymera.post_comment
    ADD CONSTRAINT post_comment_post_id_fkey FOREIGN KEY (post_id) REFERENCES chymera.post(post_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY chymera.post_comment DROP CONSTRAINT post_comment_post_id_fkey;
       chymera          postgres    false    209    208    2917            o           2606    17100    post post_handle_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY chymera.post
    ADD CONSTRAINT post_handle_fkey FOREIGN KEY (handle) REFERENCES chymera.users(handle) ON UPDATE CASCADE ON DELETE CASCADE;
 @   ALTER TABLE ONLY chymera.post DROP CONSTRAINT post_handle_fkey;
       chymera          postgres    false    208    202    2905            �   
   x^��          �   �   x^���
�0E�~��T����v�B(��>�dbL�����jw�vw�ܲ��{e��@��@�8ub��	�m�sH�y�>��دDo��$�gt�cE���5��
�*N��GD3�s$��~mF�ZI��ޠ��X㬱��"-�9v�Ú�m��ֶ�[l� f��hE\:      �   
   x^��          �   �   x^��v
Q���WHΨ�M-J�K+�L�K)V�H�M���Q��,.�Ts�	uV�POKM)��svH��%���(�'�y�
�e��U��y��\���Z�9/b�k)��@�C}��21#?�.. Uaf      �   
   x^��          �   
   x^��          �   
   x^��          �   
   x^��          �   �  x^͔�j�0��y���-(�װ��Ӗ�ȦФ��[cKc�I��+�Ҳ��V�B?H3#�ff��=<�a��?Be�2�9D�6�k��݁� ��������0�$��� 
G��*v}?:�� -#��������39:I!��FaM���dPU]P��f��+ư���ⲧ*�ȥ'���g�h(�w�=�P�>��wHI��)��6���ϛ���b}1��LS��ص�Ui����U�Z�}�Y�]��T��zb����;I�e�kY��,0�XO��׬�$ڿǰe���\���zÑ��3��r&,�K�s;K����G�~�ΔՀ�2h�f�1iE q�s�0w #ܥ;�A�p���B+�&_�Yw�[�v�z���#�<�β�{�:��X��      �   
   x^��          �     x^Օ�n�0��y�s�V�B-���i*Ӡ���s�xs�(v����8�e��I�������d��Y����i�^*lX�l�`ń�d*�B��\HLk�C`%�s�*�*Vu��YL�i;�CP�7����ʄ 5g2uYy����d�h��-��}{^l�&�1�ŧ��@�u�L���lU��P���$v��n�%�@
l(˙4��`��&��m����X
�G�"/���8�R��6��mZ*�U��<X]1�+���z|]�ECfZ3<�:V3�D���Z��
�OԖ� }�1�ӭxc7k��9�Q�໖�R�S�k��_�������2��q]Tw��NK�iC6e$А���3�"���뿖�Z;�^�#�N�u��yp�x;?��yzՂF�w���PY�u����/�N�$��8��w���C�^W��-��du3fR�m�V�R�Zz�s��2��d2=��F�����$>�r����B�!��sշ���55���)~Ӕ~�z'E����/���6�bc�P*���"�{8�0-�     