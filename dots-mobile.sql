DROP TABLE IF EXISTS "public"."activities";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."activities" (
    "id" int8 NOT NULL,
    "title" text,
    "description" text,
    "due_date" timestamptz,
    "assigned_to" int8,
    "action_type" int8,
    "action_data" text,
    "related_object_type" int8,
    "related_object_id" text,
    "related_customer_id" text,
    "status" int8,
    "created_at" timestamp,
    "created_by" int8,
    "deleted_at" timestamp,
    "tenant_id" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."activity_comments";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."activity_comments" (
    "id" int8 NOT NULL,
    "comment" text,
    "activity_id" int8,
    "image_attachment_url" text,
    "created_at" timestamp,
    "created_by" int8,
    "deleted_at" timestamp,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."attendance_reservations";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."attendance_reservations" (
    "id" int8 NOT NULL,
    "branch_id" text,
    "destination_service" int8,
    "reason" text,
    "attend_at_start" timestamptz,
    "attend_at_end" timestamptz,
    "created_at" timestamptz,
    "created_by" int8,
    "deleted_at" timestamptz,
    "tenant_id" text,
    "status" int4,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."customers";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."customers" (
    "id" int8 NOT NULL,
    "external_id" text,
    "full_name" text,
    "identity_number" text,
    "identity_type" int8,
    "email" text,
    "phone_number" text,
    "mobile_number" text,
    "gender" text,
    "address" text,
    "subdistrict" text,
    "district" text,
    "mother_maiden_name" text,
    "dati2_code" text,
    "identity_photo_url" text,
    "selfie_photo_url" text,
    "birth_place" text,
    "birth_date" timestamptz,
    "status" int8,
    "last_synced_at" timestamptz,
    "created_by" int8,
    "updated_by" int8,
    "deleted_by" int8,
    "created_at" timestamptz,
    "updated_at" timestamptz,
    "deleted_at" timestamptz,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."deposits";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS deposits_id_seq;

-- Table Definition
CREATE TABLE "public"."deposits" (
    "id" int8 NOT NULL DEFAULT nextval('deposits_id_seq'::regclass),
    "customer_id" text,
    "external_id" text,
    "current_balance" int8,
    "available_balance" int8,
    "status" int8,
    "product_type" text,
    "last_synced_at" timestamp,
    "created_by" int8,
    "updated_by" int8,
    "deleted_by" int8,
    "created_at" timestamp,
    "updated_at" timestamp,
    "deleted_at" timestamp,
    "tenant_id" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."image";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."image" (
    "id" text NOT NULL,
    "title" text,
    "name" text,
    "created_by" text,
    "start_at" timestamp,
    "end_at" timestamp,
    "type" text,
    "tenant_id" text,
    "description" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."loan_topup";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS loan_topup_id_seq;

-- Table Definition
CREATE TABLE "public"."loan_topup" (
    "id" int8 NOT NULL DEFAULT nextval('loan_topup_id_seq'::regclass),
    "amount" text,
    "loan_id" text,
    "reason" text,
    "status" int8,
    "tenant_id" text,
    "created_by" int8,
    "created_at" timestamp,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."loan_transactions";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."loan_transactions" (
    "id" int8,
    "transaction_id" text,
    "principal_paid" numeric,
    "interest_paid" numeric,
    "penalty_paid" numeric,
    "tenant_id" text,
    "branch_id" text
);

DROP TABLE IF EXISTS "public"."loans";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS loans_id_seq;

-- Table Definition
CREATE TABLE "public"."loans" (
    "id" int8 NOT NULL DEFAULT nextval('loans_id_seq'::regclass),
    "customer_id" text,
    "external_id" text,
    "current_balance" int8,
    "jangkawaktu" int4,
    "available_balance" int8,
    "status" int8,
    "product_type" text,
    "last_synced_at" timestamp,
    "created_by" int8,
    "updated_by" int8,
    "deleted_by" int8,
    "created_at" timestamp,
    "updated_at" timestamp,
    "deleted_at" timestamp,
    "tenant_id" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."migrations";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS migrations_id_seq;

-- Table Definition
CREATE TABLE "public"."migrations" (
    "id" int4 NOT NULL DEFAULT nextval('migrations_id_seq'::regclass),
    "migration" varchar(255) NOT NULL,
    "batch" int4 NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."notification";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS notification_id_seq;

-- Table Definition
CREATE TABLE "public"."notification" (
    "id" text NOT NULL DEFAULT nextval('notification_id_seq'::regclass),
    "title" text,
    "description" text,
    "type" int4,
    "user_id" text,
    "status" int4,
    "created_at" timestamp,
    "created_by" text,
    "parent" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."personal_access_tokens";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS personal_access_tokens_id_seq;

-- Table Definition
CREATE TABLE "public"."personal_access_tokens" (
    "id" int8 NOT NULL DEFAULT nextval('personal_access_tokens_id_seq'::regclass),
    "tokenable_type" varchar(255) NOT NULL,
    "tokenable_id" int8 NOT NULL,
    "name" varchar(255) NOT NULL,
    "token" varchar(64) NOT NULL,
    "abilities" text,
    "last_used_at" timestamp(0),
    "expires_at" timestamp(0),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."savings";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."savings" (
    "id" int8 NOT NULL,
    "customer_id" text,
    "external_id" text,
    "current_balance" int8,
    "available_balance" int8,
    "status" int8,
    "product_type" text,
    "last_synced_at" timestamptz,
    "created_by" int8,
    "updated_by" int8,
    "deleted_by" int8,
    "created_at" timestamptz,
    "updated_at" timestamptz,
    "deleted_at" timestamptz,
    "tenant_id" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."tenant_configurations";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."tenant_configurations" (
    "id" int8,
    "key" text,
    "value" text,
    "tenant_id" text
);

DROP TABLE IF EXISTS "public"."tenants";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."tenants" (
    "id" text NOT NULL,
    "public_id" text,
    "name" text,
    "database_schema_name" text,
    "core_type" text,
    "core_database_type" text,
    "core_database_dsn" text,
    "logo_url_base64" text,
    "client_type" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."transaction_batches";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."transaction_batches" (
    "id" text NOT NULL,
    "tenant_id" text NOT NULL,
    "created_by" text NOT NULL,
    "created_at" timestamp NOT NULL,
    "status" int8 NOT NULL,
    "settled_at" timestamp,
    "settled_by" text,
    "branch_id" text,
    "is_active" bool NOT NULL
);

DROP TABLE IF EXISTS "public"."transactions";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."transactions" (
    "id" text NOT NULL,
    "local_id" text NOT NULL,
    "amount" text NOT NULL,
    "saving_id" text,
    "deposit_id" text,
    "loan_id" text,
    "transaction_type" int8 NOT NULL,
    "created_at" timestamp NOT NULL,
    "created_by" int8 NOT NULL,
    "status" int8 NOT NULL,
    "tenant_id" text NOT NULL,
    "branch_id" text,
    "batch_id" text NOT NULL,
    "payment_method_id" text,
    "recipient" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."users";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."users" (
    "id" int8 NOT NULL,
    "is_active" bool,
    "email" text,
    "email_confirmed_at" timestamp,
    "password" text,
    "first_name" text,
    "last_name" text,
    "username" text,
    "created_at" timestamp,
    "deleted_at" timestamp,
    "customer_id" text,
    "account_officer_id" text,
    "client_type" text,
    "tenant_id" text,
    "branch_id" text,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."activities" ("id", "title", "description", "due_date", "assigned_to", "action_type", "action_data", "related_object_type", "related_object_id", "related_customer_id", "status", "created_at", "created_by", "deleted_at", "tenant_id") VALUES
(1625224364437932551, 'Hubungi Nasabah', NULL, '2021-07-02 15:11:00+07', 1690352918982093779, NULL, NULL, NULL, NULL, '0020378', 1, '2021-07-02 04:12:44.440017', 1690352918982093779, NULL, '5');
INSERT INTO "public"."activities" ("id", "title", "description", "due_date", "assigned_to", "action_type", "action_data", "related_object_type", "related_object_id", "related_customer_id", "status", "created_at", "created_by", "deleted_at", "tenant_id") VALUES
(1628149540128521901, 'Kunjungi Nasabah', NULL, '2021-08-05 14:44:00+07', 1690352918982093779, 3, '0,0?q=Casablanca+East', 1, '0020378', '0020378', 1, '2021-08-05 00:45:40.130928', 1690352918982093779, NULL, '5');
INSERT INTO "public"."activities" ("id", "title", "description", "due_date", "assigned_to", "action_type", "action_data", "related_object_type", "related_object_id", "related_customer_id", "status", "created_at", "created_by", "deleted_at", "tenant_id") VALUES
(1628149540128521902, 'SMS Nasabah', NULL, '2021-08-05 14:44:00+07', 1690352918982093779, 2, '085974453505', 1, '0020378', '0020378', 1, '2021-08-05 00:45:40.130928', 1690352918982093779, NULL, '5');
INSERT INTO "public"."activities" ("id", "title", "description", "due_date", "assigned_to", "action_type", "action_data", "related_object_type", "related_object_id", "related_customer_id", "status", "created_at", "created_by", "deleted_at", "tenant_id") VALUES
(1628149540128521903, 'Telepon Nasabah', NULL, '2021-08-05 14:44:00+07', 1690352918982093779, 1, '085974453505', 1, '0020378', '0020378', 1, '2021-08-05 00:45:40.130928', 1690352918982093779, NULL, '5'),
(1628149540128521904, 'Telepon Nasabah 2 Kali', NULL, '2021-08-05 14:44:00+07', 1690352918982093779, 1, '085974453505', 1, '0020378', '0020378', 1, '2021-08-05 00:45:40.130928', 1690352918982093779, NULL, '5'),
(1628149540128521905, 'Telepon Nasabah 3 Kali', NULL, '2021-08-05 14:44:00+07', 1690352918982093779, 1, '085974453505', 1, '0020378', '0020378', 1, '2021-08-05 00:45:40.130928', 1690352918982093779, NULL, '5'),
(1690248599859321161, 'Kredit Macet Dinas Lingkungan Hidup', 'Penagihan', '2023-07-25 08:27:00+07', 1689934458390956948, NULL, NULL, NULL, NULL, NULL, 1, '2023-07-25 08:29:59.859316', 1689934458390956948, NULL, '2'),
(1690284373481260154, 'Penagihan an. Temtrem', 'Janji bayar ', '2023-07-26 12:00:00+07', 1689934476533218767, NULL, NULL, NULL, NULL, NULL, 1, '2023-07-25 18:26:13.492529', 1689934476533218767, NULL, '2'),
(1690284400692831045, 'Penagihan', 'Tunggkan 4 bln', '2023-07-26 18:23:00+07', 1689934413571611631, NULL, NULL, NULL, NULL, NULL, 1, '2023-07-25 18:26:40.692827', 1689934413571611631, NULL, '2'),
(1690284512128047086, 'nagih', 'sukoco', '2023-07-25 18:27:00+07', 1689934396100611714, NULL, NULL, NULL, NULL, NULL, 1, '2023-07-25 18:28:32.128041', 1689934396100611714, NULL, '2'),
(1690284519273922056, 'Tagihan NPL', 'Abdilah
Romi', '2023-07-25 18:26:00+07', 1689934458390956948, NULL, NULL, NULL, NULL, NULL, 1, '2023-07-25 18:28:39.273915', 1689934458390956948, NULL, '2');

INSERT INTO "public"."activity_comments" ("id", "comment", "activity_id", "image_attachment_url", "created_at", "created_by", "deleted_at") VALUES
(1690248665813610661, 'Kerennnnnnnnnnd,NPL Nol ', 1690248599859321161, NULL, '2023-07-25 08:31:05.813097', 1689934458390956948, NULL);
INSERT INTO "public"."activity_comments" ("id", "comment", "activity_id", "image_attachment_url", "created_at", "created_by", "deleted_at") VALUES
(1690284475234240167, 'Penagihan tunggakan 4 tidak bayar an. Suaeb', 1690284400692831045, NULL, '2023-07-25 18:27:55.234236', 1689934413571611631, NULL);
INSERT INTO "public"."activity_comments" ("id", "comment", "activity_id", "image_attachment_url", "created_at", "created_by", "deleted_at") VALUES
(1690284556174083544, 'penagihan kerumah sukoco', 1690284512128047086, NULL, '2023-07-25 18:29:16.174082', 1689934396100611714, NULL);
INSERT INTO "public"."activity_comments" ("id", "comment", "activity_id", "image_attachment_url", "created_at", "created_by", "deleted_at") VALUES
(1690284730972126541, 'Berhasil ', 1690284519273922056, NULL, '2023-07-25 18:32:10.971617', 1689934458390956948, NULL);

INSERT INTO "public"."attendance_reservations" ("id", "branch_id", "destination_service", "reason", "attend_at_start", "attend_at_end", "created_at", "created_by", "deleted_at", "tenant_id", "status") VALUES
(1700036016319076848, '004', 1, 'Pembayaran', '2023-11-25 09:00:23.054+07', '2023-11-25 10:00:23.054+07', '2023-11-15 08:13:36+07', 1699010811508943532, NULL, '30', 0);
INSERT INTO "public"."attendance_reservations" ("id", "branch_id", "destination_service", "reason", "attend_at_start", "attend_at_end", "created_at", "created_by", "deleted_at", "tenant_id", "status") VALUES
(1700036521732536902, '003', 1, 'Keluhan', '2023-11-25 08:00:46.64+07', '2023-11-25 09:00:46.64+07', '2023-11-15 08:22:01+07', 1699010811508943532, NULL, '30', 0);




INSERT INTO "public"."deposits" ("id", "customer_id", "external_id", "current_balance", "available_balance", "status", "product_type", "last_synced_at", "created_by", "updated_by", "deleted_by", "created_at", "updated_at", "deleted_at", "tenant_id") VALUES
(1699946684803781100, '0006018', NULL, 200000, NULL, 0, '03', NULL, 1699010811508943532, 1699010811508943532, NULL, '2023-11-14 07:24:44', '2023-11-14 07:24:44', NULL, '30');
INSERT INTO "public"."deposits" ("id", "customer_id", "external_id", "current_balance", "available_balance", "status", "product_type", "last_synced_at", "created_by", "updated_by", "deleted_by", "created_at", "updated_at", "deleted_at", "tenant_id") VALUES
(1700020676480966505, '0006018', NULL, 200000, NULL, 0, '03', NULL, 1699010811508943532, 1699010811508943532, NULL, '2023-11-15 03:57:56', '2023-11-15 03:57:56', NULL, '30');


INSERT INTO "public"."image" ("id", "title", "name", "created_by", "start_at", "end_at", "type", "tenant_id", "description") VALUES
('1697606360263961375', 'harqwegweg', 'images/2023-10-18_051920_BPR_Kreasi_Nusantara_Dev.jpeg', '1696056450019418223', '2023-10-13 12:19:00', '2023-10-29 12:19:00', '1', '30', '<h1>Promo 11.11 tahun 2023</h1>
<p style="color: red">Promo yang menarik untuk di ambil tahun ini.</p>
<p>&nbsp;</p>
<ul>
<li>Mengajar</li>
<li>Menulis</li>
<li>membaca</li>
</ul>
<p><strong>Bold,&nbsp;</strong><em>Italic,&nbsp;</em><span style="text-decoration: underline;">Underline</span></p>
<p><strong><span style="text-decoration: underline;">UB,</span>&nbsp;<em>BI,</em></strong><em>&nbsp;</em><span style="text-decoration: underline;"><em>IU,&nbsp;<strong>BIU</strong></em></span></p>
<p><span style="text-decoration: line-through;">Haloo</span></p>
<p><a title="Youtibe nihh" href="https://www.youtube.com/watch?v=mD8v4WUVDGg" target="_blank" rel="noopener">Youtube bisa di klik</a></p>
<p><img src="https://cdn.tiny.cloud/1/gja082pi5uvjftqtfbcn2oshrt4lj8kmcwpyeaymv602uvo4/tinymce/4.9.11-104/plugins/emoticons/img/smiley-embarassed.gif" alt="embarassed" /><img src="https://cdn.tiny.cloud/1/gja082pi5uvjftqtfbcn2oshrt4lj8kmcwpyeaymv602uvo4/tinymce/4.9.11-104/plugins/emoticons/img/smiley-yell.gif" alt="yell" /><img src="https://cdn.tiny.cloud/1/gja082pi5uvjftqtfbcn2oshrt4lj8kmcwpyeaymv602uvo4/tinymce/4.9.11-104/plugins/emoticons/img/smiley-money-mouth.gif" alt="money-mouth" /></p>
<p style="text-align: center;">Tengah</p>
<p style="text-align: right;">Kanan</p>
<p style="text-align: left;">&nbsp;</p>');
INSERT INTO "public"."image" ("id", "title", "name", "created_by", "start_at", "end_at", "type", "tenant_id", "description") VALUES
('1698054964787517550', 'halo', 'images/2023-10-23_095604_BPR_Kreasi_Nusantara_Dev.jpeg', '1696056450019418223', '2023-10-06 16:55:00', '2023-10-31 10:21:00', '1', '30', '<h1>Promo 11.11 tahun 2023</h1>
<p style="color: red">Promo yang menarik untuk di ambil tahun ini.</p>
<p>&nbsp;</p>
<ul>
<li>Mengajar</li>
<li>Menulis</li>
<li>membaca</li>
</ul>
<p><strong>Bold,&nbsp;</strong><em>Italic,&nbsp;</em><span style="text-decoration: underline;">Underline</span></p>
<p><strong><span style="text-decoration: underline;">UB,</span>&nbsp;<em>BI,</em></strong><em>&nbsp;</em><span style="text-decoration: underline;"><em>IU,&nbsp;<strong>BIU</strong></em></span></p>
<p><span style="text-decoration: line-through;">Haloo</span></p>
<p><a title="Youtibe nihh" href="https://www.youtube.com/watch?v=mD8v4WUVDGg" target="_blank" rel="noopener">Youtube bisa di klik</a></p>
<p><img src="https://cdn.tiny.cloud/1/gja082pi5uvjftqtfbcn2oshrt4lj8kmcwpyeaymv602uvo4/tinymce/4.9.11-104/plugins/emoticons/img/smiley-embarassed.gif" alt="embarassed" /><img src="https://cdn.tiny.cloud/1/gja082pi5uvjftqtfbcn2oshrt4lj8kmcwpyeaymv602uvo4/tinymce/4.9.11-104/plugins/emoticons/img/smiley-yell.gif" alt="yell" /><img src="https://cdn.tiny.cloud/1/gja082pi5uvjftqtfbcn2oshrt4lj8kmcwpyeaymv602uvo4/tinymce/4.9.11-104/plugins/emoticons/img/smiley-money-mouth.gif" alt="money-mouth" /></p>
<p style="text-align: center;">Tengah</p>
<p style="text-align: right;">Kanan</p>
<p style="text-align: left;">&nbsp;</p>');
INSERT INTO "public"."image" ("id", "title", "name", "created_by", "start_at", "end_at", "type", "tenant_id", "description") VALUES
('1698114732128677009', 'Produk 11.11', 'images/2023-10-24_023212_BPR_Kreasi_Nusantara_Dev.jpg', '1696056450019418223', '2023-10-04 09:28:00', '2023-11-11 10:32:00', '1', '30', '<h1>Promo 11.11 tahun 2023</h1>
<p style="color: red">Promo yang menarik untuk di ambil tahun ini.</p>
<p>&nbsp;</p>
<ul>
<li>Mengajar</li>
<li>Menulis</li>
<li>membaca</li>
</ul>
<p><strong>Bold,&nbsp;</strong><em>Italic,&nbsp;</em><span style="text-decoration: underline;">Underline</span></p>
<p><strong><span style="text-decoration: underline;">UB,</span>&nbsp;<em>BI,</em></strong><em>&nbsp;</em><span style="text-decoration: underline;"><em>IU,&nbsp;<strong>BIU</strong></em></span></p>
<p><span style="text-decoration: line-through;">Haloo</span></p>
<p><a title="Youtibe nihh" href="https://www.youtube.com/watch?v=mD8v4WUVDGg" target="_blank" rel="noopener">Youtube bisa di klik</a></p>
<p><img src="https://cdn.tiny.cloud/1/gja082pi5uvjftqtfbcn2oshrt4lj8kmcwpyeaymv602uvo4/tinymce/4.9.11-104/plugins/emoticons/img/smiley-embarassed.gif" alt="embarassed" /><img src="https://cdn.tiny.cloud/1/gja082pi5uvjftqtfbcn2oshrt4lj8kmcwpyeaymv602uvo4/tinymce/4.9.11-104/plugins/emoticons/img/smiley-yell.gif" alt="yell" /><img src="https://cdn.tiny.cloud/1/gja082pi5uvjftqtfbcn2oshrt4lj8kmcwpyeaymv602uvo4/tinymce/4.9.11-104/plugins/emoticons/img/smiley-money-mouth.gif" alt="money-mouth" /></p>
<p style="text-align: center;">Tengah</p>
<p style="text-align: right;">Kanan</p>
<p style="text-align: left;">&nbsp;</p>');
INSERT INTO "public"."image" ("id", "title", "name", "created_by", "start_at", "end_at", "type", "tenant_id", "description") VALUES
('1697606461755998309', 'fgsdssdgsg', 'images/2023-10-18_052101_BPR_Kreasi_Nusantara_Dev.jpeg', '1696056450019418223', '2023-10-13 12:20:00', '2023-10-27 12:20:00', '1', '30', '<h1>Promo 11.11 tahun 2023</h1>
<p style="color: red">Promo yang menarik untuk di ambil tahun ini.</p>
<p>&nbsp;</p>
<ul>
<li>Mengajar</li>
<li>Menulis</li>
<li>membaca</li>
</ul>
<p><strong>Bold,&nbsp;</strong><em>Italic,&nbsp;</em><span style="text-decoration: underline;">Underline</span></p>
<p><strong><span style="text-decoration: underline;">UB,</span>&nbsp;<em>BI,</em></strong><em>&nbsp;</em><span style="text-decoration: underline;"><em>IU,&nbsp;<strong>BIU</strong></em></span></p>
<p><span style="text-decoration: line-through;">Haloo</span></p>
<p><a title="Youtibe nihh" href="https://www.youtube.com/watch?v=mD8v4WUVDGg" target="_blank" rel="noopener">Youtube bisa di klik</a></p>
<p><img src="https://cdn.tiny.cloud/1/gja082pi5uvjftqtfbcn2oshrt4lj8kmcwpyeaymv602uvo4/tinymce/4.9.11-104/plugins/emoticons/img/smiley-embarassed.gif" alt="embarassed" /><img src="https://cdn.tiny.cloud/1/gja082pi5uvjftqtfbcn2oshrt4lj8kmcwpyeaymv602uvo4/tinymce/4.9.11-104/plugins/emoticons/img/smiley-yell.gif" alt="yell" /><img src="https://cdn.tiny.cloud/1/gja082pi5uvjftqtfbcn2oshrt4lj8kmcwpyeaymv602uvo4/tinymce/4.9.11-104/plugins/emoticons/img/smiley-money-mouth.gif" alt="money-mouth" /></p>
<p style="text-align: center;">Tengah</p>
<p style="text-align: right;">Kanan</p>
<p style="text-align: left;">&nbsp;</p>'),
('1698039908796754050', 'Sale', 'images/2023-10-23_054508_BPR_Kreasi_Nusantara_Dev.jpeg', '1696056450019418223', '2023-10-18 12:48:00', '2023-10-31 00:00:00', '1', '30', '<h1>Promo 11.11 tahun 2023</h1>
<p style="color: red">Promo yang menarik untuk di ambil tahun ini.</p>
<p>&nbsp;</p>
<ul>
<li>Mengajar</li>
<li>Menulis</li>
<li>membaca</li>
</ul>
<p><strong>Bold,&nbsp;</strong><em>Italic,&nbsp;</em><span style="text-decoration: underline;">Underline</span></p>
<p><strong><span style="text-decoration: underline;">UB,</span>&nbsp;<em>BI,</em></strong><em>&nbsp;</em><span style="text-decoration: underline;"><em>IU,&nbsp;<strong>BIU</strong></em></span></p>
<p><span style="text-decoration: line-through;">Haloo</span></p>
<p><a title="Youtibe nihh" href="https://www.youtube.com/watch?v=mD8v4WUVDGg" target="_blank" rel="noopener">Youtube bisa di klik</a></p>
<p><img src="https://cdn.tiny.cloud/1/gja082pi5uvjftqtfbcn2oshrt4lj8kmcwpyeaymv602uvo4/tinymce/4.9.11-104/plugins/emoticons/img/smiley-embarassed.gif" alt="embarassed" /><img src="https://cdn.tiny.cloud/1/gja082pi5uvjftqtfbcn2oshrt4lj8kmcwpyeaymv602uvo4/tinymce/4.9.11-104/plugins/emoticons/img/smiley-yell.gif" alt="yell" /><img src="https://cdn.tiny.cloud/1/gja082pi5uvjftqtfbcn2oshrt4lj8kmcwpyeaymv602uvo4/tinymce/4.9.11-104/plugins/emoticons/img/smiley-money-mouth.gif" alt="money-mouth" /></p>
<p style="text-align: center;">Tengah</p>
<p style="text-align: right;">Kanan</p>
<p style="text-align: left;">&nbsp;</p>'),
('1699019418488992448', 'Judullll', 'images/2023-11-03_135018_KSP_Sinar_Pelita_Rancaekek.png', '1696056450019418221', '2023-11-15 20:50:00', '2023-11-16 20:50:00', '1', '30', '<p>Halooooo</p>'),
('16995110481025957', 'Promo November', 'images/2023-11-09_062408_KSP_Sinar_Pelita_Rancaekek.png', '1696056450019418221', '2023-11-01 00:00:00', '2023-11-30 23:59:00', '1', '30', '<p>blogsss</p>');

INSERT INTO "public"."loan_topup" ("id", "amount", "loan_id", "reason", "status", "tenant_id", "created_by", "created_at") VALUES
(1700016334223048389, 'Rp. 20.000.000', '00104010000867', 'Mobil', 0, '30', 1699010811508943532, '2023-11-15 02:45:34');
INSERT INTO "public"."loan_topup" ("id", "amount", "loan_id", "reason", "status", "tenant_id", "created_by", "created_at") VALUES
(1700016338707582397, 'Rp. 20.000.000', '00104010000867', 'Mobil', 0, '30', 1699010811508943532, '2023-11-15 02:45:38');
INSERT INTO "public"."loan_topup" ("id", "amount", "loan_id", "reason", "status", "tenant_id", "created_by", "created_at") VALUES
(1700020494598987102, 'Rp. 10.000', '00104010000867', 'Hejajw', 0, '30', 1699010811508943532, '2023-11-15 03:54:54');
INSERT INTO "public"."loan_topup" ("id", "amount", "loan_id", "reason", "status", "tenant_id", "created_by", "created_at") VALUES
(170002053539678463, 'Rp. 18.461', '00104010000867', 'Hahha', 0, '30', 1699010811508943532, '2023-11-15 03:55:35'),
(1700020636532551240, 'Rp. 10.000', '00104010000867', 'Jajwuw', 0, '30', 1699010811508943532, '2023-11-15 03:57:16'),
(170002066095772514, '1000000', '0980980879987', 'Halooo', 0, '30', 1699010811508943532, '2023-11-15 03:57:40'),
(1700034943433129028, 'Rp. 10.000', '00104010000867', 'Ahhah', 0, '30', 1699010811508943532, '2023-11-15 07:55:43'),
(1700034988116678976, 'Rp. 10.000', '00104010000867', 'Ahhah', 0, '30', 1699010811508943532, '2023-11-15 07:56:28'),
(1700035040199082011, 'Rp. 100', '00104010000867', 'Vsgha', 0, '30', 1699010811508943532, '2023-11-15 07:57:20'),
(1700035136589286539, '1000000', '0980980879987', 'Halooo', 0, '30', 1699010811508943532, '2023-11-15 07:58:56'),
(1700035293407695045, 'Rp. 1.000', '00104010000867', 'Ajja', 0, '30', 1699010811508943532, '2023-11-15 08:01:33'),
(1700035408271902335, 'Rp. 10.000', '00104010000867', 'Ahaha', 0, '30', 1699010811508943532, '2023-11-15 08:03:28'),
(1700035483301533429, 'Rp. 10.000', '00104010000867', 'Ahaha', 0, '30', 1699010811508943532, '2023-11-15 08:04:43'),
(1700036124633432864, 'Rp. 100', '00104010000867', 'Shhahw', 0, '30', 1699010811508943532, '2023-11-15 08:15:24'),
(170003616069367879, 'Rp. 100.646', '00104010000867', 'Shhahw', 0, '30', 1699010811508943532, '2023-11-15 08:16:00'),
(170003768358122052, 'Rp. 1.000.000', '00104010000867', 'Ahhaha', 0, '30', 1699010811508943532, '2023-11-15 08:41:23'),
(17000378128205455, 'Rp. 1.000.000', '00104010000867', 'Ahhaha', 0, '30', 1699010811508943532, '2023-11-15 08:43:32'),
(1700039713296654214, 'Rp. 1.000', '00104010000867', 'Gagaha', 0, '30', 1699010811508943532, '2023-11-15 09:15:13'),
(170003972073381168, 'Rp. 1.000', '00104010000867', 'Gagaha', 0, '30', 1699010811508943532, '2023-11-15 09:15:20'),
(1700039722221581072, 'Rp. 1.000', '00104010000867', 'Gagaha', 0, '30', 1699010811508943532, '2023-11-15 09:15:22'),
(1700039731184502630, 'Rp. 1.000', '00104010000867', 'Gagaha', 0, '30', 1699010811508943532, '2023-11-15 09:15:31'),
(1700039733993587126, 'Rp. 1.000', '00104010000867', 'Gagaha', 0, '30', 1699010811508943532, '2023-11-15 09:15:33'),
(1700040002967569018, '1000000', '0980980879987', 'Halooo', 0, '30', 1699010811508943532, '2023-11-15 09:20:02'),
(1700040235804397274, 'Rp. 9.000.000', '00104010000867', 'Muhahahaha', 0, '30', 1699010811508943532, '2023-11-15 09:23:55'),
(1700040334520658269, 'Rp. 616.161', '00104010000867', 'Hahshhwh', 0, '30', 1699010811508943532, '2023-11-15 09:25:34'),
(1700040393607252432, '1000000', '00104010000867', 'Halooo', 0, '30', 1699010811508943532, '2023-11-15 09:26:33'),
(1700040470407013897, 'Rp. 184.919', '00104010000867', 'Gahahah', 0, '30', 1699010811508943532, '2023-11-15 09:27:50'),
(1700040545364566025, 'Rp. 184.919', '00104010000867', 'Gahahah', 0, '30', 1699010811508943532, '2023-11-15 09:29:05'),
(1700040677549378741, 'Rp. 184.919', '00104010000867', 'Gahahah', 0, '30', 1699010811508943532, '2023-11-15 09:31:17'),
(170004086687505384, 'Rp. 184.919', '00104010000867', 'Gahahah', 0, '30', 1699010811508943532, '2023-11-15 09:34:26'),
(1700040900520774065, '1000000', '0980980879987', 'Halooo', 0, '30', 1699010811508943532, '2023-11-15 09:35:00'),
(1700041000433075798, 'Rp. 184.919', '00104010000867', 'Gahahah', 0, '30', 1699010811508943532, '2023-11-15 09:36:40'),
(1700041267907954591, 'Rp. 10.080', '00104010000867', 'Hayay', 0, '30', 1699010811508943532, '2023-11-15 09:41:07'),
(1700041314369636728, 'Rp. 100.801.646', '00104010000867', 'Hayay', 0, '30', 1699010811508943532, '2023-11-15 09:41:54'),
(1700041314536636753, 'Rp. 100.801.646', '00104010000867', 'Hayay', 0, '30', 1699010811508943532, '2023-11-15 09:41:54'),
(1700041314584282189, 'Rp. 100.801.646', '00104010000867', 'Hayay', 0, '30', 1699010811508943532, '2023-11-15 09:41:54'),
(1700041315497795959, 'Rp. 100.801.646', '00104010000867', 'Hayay', 0, '30', 1699010811508943532, '2023-11-15 09:41:55'),
(1700041317457036503, 'Rp. 100.801.646', '00104010000867', 'Hayay', 0, '30', 1699010811508943532, '2023-11-15 09:41:57'),
(1700041541523101398, 'Rp. 949.494', '00104010000867', 'Shahhshw', 0, '30', 1699010811508943532, '2023-11-15 09:45:41'),
(1700041868200867527, 'Rp. 100.880', '00104010000867', 'Ahhah', 0, '30', 1699010811508943532, '2023-11-15 09:51:08'),
(1700042719465408767, 'Rp. 1.000.000', '00104010000867', 'sgagah', 0, '30', 1699010811508943532, '2023-11-15 10:05:19'),
(1700042896353864475, '1000000', '00104010000867', 'sgagah', 0, '30', 1699010811508943532, '2023-11-15 10:08:16'),
(1700042902350081864, '1000000', '00104010000867', 'sgagah', 0, '30', 1699010811508943532, '2023-11-15 10:08:22'),
(1700043110141849782, '1000000', '0980980879987', 'Halooo', 0, '30', 1699010811508943532, '2023-11-15 10:11:50');



INSERT INTO "public"."loans" ("id", "customer_id", "external_id", "current_balance", "jangkawaktu", "available_balance", "status", "product_type", "last_synced_at", "created_by", "updated_by", "deleted_by", "created_at", "updated_at", "deleted_at", "tenant_id") VALUES
(1699946681739021302, '0006018', NULL, 200000, 4, NULL, 0, '02', NULL, 1699010811508943532, 1699010811508943532, NULL, '2023-11-14 07:24:41', '2023-11-14 07:24:41', NULL, '30');
INSERT INTO "public"."loans" ("id", "customer_id", "external_id", "current_balance", "jangkawaktu", "available_balance", "status", "product_type", "last_synced_at", "created_by", "updated_by", "deleted_by", "created_at", "updated_at", "deleted_at", "tenant_id") VALUES
(1700037316651549407, '0006018', NULL, 100000, 4, NULL, 0, '02', NULL, 1699010811508943532, 1699010811508943532, NULL, '2023-11-15 08:35:16', '2023-11-15 08:35:16', NULL, '30');


INSERT INTO "public"."migrations" ("id", "migration", "batch") VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1);


INSERT INTO "public"."notification" ("id", "title", "description", "type", "user_id", "status", "created_at", "created_by", "parent") VALUES
('1700021160483711193', 'Setoran Tabungan anda sedang diproses', '{"No. Rekening":"00102010000456","Metode Pembayaran":{"namabank":"Bank Mandiri"},"Nama Pengirim":"Hhgg","Jumlah":"Rp. 616.461"}', 0, '1699010811508943532', 1, '2023-11-15 04:06:00', '1699010811508943532', '068aa7cf71-ad4a-47a7-b5d2-ccb02d5b81c5');
INSERT INTO "public"."notification" ("id", "title", "description", "type", "user_id", "status", "created_at", "created_by", "parent") VALUES
('1699946675128022806', 'Pengajuan Tabungan anda sedang diproses', '{"Tipe Produk":"SIMP. TERKAIT                 ","Jumlah":"Rp. 230.000"}', 0, '1699010811508943532', 1, '2023-11-14 07:24:35', '1699010811508943532', '021699946675762188405');
INSERT INTO "public"."notification" ("id", "title", "description", "type", "user_id", "status", "created_at", "created_by", "parent") VALUES
('1699946681455593406', 'Pengajuan Kredit anda sedang diproses', '{"Tipe Produk":"PINJAMAN KARYAWAN             ","Jumlah":"Rp. 200.000","Jangka Waktu":"4 Bulan"}', 0, '1699010811508943532', 1, '2023-11-14 07:24:41', '1699010811508943532', '031699946681739021302');
INSERT INTO "public"."notification" ("id", "title", "description", "type", "user_id", "status", "created_at", "created_by", "parent") VALUES
('1699946684318644796', 'Pengajuan Kredit anda sedang diproses', '{"Tipe Produk":"SIMP. BERJANGKA 3 BULAN       ","Jumlah":"Rp. 200.000"}', 0, '1699010811508943532', 1, '2023-11-14 07:24:44', '1699010811508943532', '041699946684803781100'),
('1700019046760077533', 'Pengajuan Tabungan anda sedang diproses', '{"Tipe Produk":"SIMP. ANGGOTA                 ","Jumlah":"Rp. 949.764.679"}', 0, '1699010811508943532', 1, '2023-11-15 03:30:46', '1699010811508943532', '02170001904614084592'),
('1700020660174415491', 'Setoran Tabungan anda sedang diproses', '{"No. Rekening":"0980980879987","Alasan":"Halooo","Jumlah":"Rp. 1.000.000"}', 0, '1699010811508943532', 1, '2023-11-15 03:57:40', '1699010811508943532', '05170002066095772514'),
('1700020676375533353', 'Pengajuan Kredit anda sedang diproses', '{"Tipe Produk":"SIMP. BERJANGKA 3 BULAN       ","Jumlah":"Rp. 200.000"}', 0, '1699010811508943532', 1, '2023-11-15 03:57:56', '1699010811508943532', '041700020676480966505'),
('1700036016360214402', 'Pengajuan Reservasi anda sedang diproses', '{"Kantor Tujuan":"KSP SINAR PELITA  - KC CIANJUR","Alasan":"Pembayaran","Tanggal Pertemuan":"Saturday, 25 November 2023","Pukul":["0900","1000"]}', 0, '1699010811508943532', 1, '2023-11-15 08:13:36', '1699010811508943532', '011700036016319076848'),
('1700021095153715552', 'Setoran Tabungan anda sedang diproses', '{"No. Rekening":"0980980879987","Metode Pembayaran":{"namabank":"Bank Mandiri"},"Nama Pengirim":"Namaaaa","Jumlah":"Rp. 1.000.000"}', 0, '1699010811508943532', 1, '2023-11-15 04:04:55', '1699010811508943532', '06dfe2dd25-1774-4086-9fd8-4bf382cda5a2'),
('1700036527138512424', 'Pengajuan Reservasi anda sedang diproses', '{"Kantor Tujuan":"KSP SINAR PELITA - KC KATAPANG","Alasan":"Keluhan","Tanggal Pertemuan":"Saturday, 25 November 2023","Pukul":["0800","0900"]}', 0, '1699010811508943532', 1, '2023-11-15 08:22:07', '1699010811508943532', '011700036521732536902'),
('170004290218014809', 'Setoran Tabungan anda sedang diproses', '{"No. Rekening":"00104010000867","Alasan":"sgagah","Jumlah":"Rp. 1.000.000"}', 0, '1699010811508943532', 1, '2023-11-15 10:08:22', '1699010811508943532', '051700042902350081864'),
('1700042896940445381', 'Setoran Tabungan anda sedang diproses', '{"No. Rekening":"00104010000867","Alasan":"sgagah","Jumlah":"Rp. 1.000.000"}', 0, '1699010811508943532', 1, '2023-11-15 10:08:16', '1699010811508943532', '051700042896353864475'),
('170004039395698407', 'Setoran Tabungan anda sedang diproses', '{"No. Rekening":"00104010000867","Alasan":"Halooo","Jumlah":"Rp. 1.000.000"}', 0, '1699010811508943532', 1, '2023-11-15 09:26:33', '1699010811508943532', '051700040393607252432'),
('1700021223592289271', 'Setoran Tabungan anda sedang diproses', '{"No. Rekening":"00102010000456","Metode Pembayaran":{"namabank":"Bank Mandiri"},"Nama Pengirim":"Bwhahaja","Jumlah":"Rp. 4.646.494"}', 0, '1699010811508943532', 1, '2023-11-15 04:07:03', '1699010811508943532', '06194c60c2-09c4-43a3-987b-cb2d7e9c534e'),
('1700040900398036628', 'Setoran Tabungan anda sedang diproses', '{"No. Rekening":"0980980879987","Alasan":"Halooo","Jumlah":"Rp. 1.000.000"}', 0, '1699010811508943532', 1, '2023-11-15 09:35:00', '1699010811508943532', '051700040900520774065'),
('1700043110114299716', 'Setoran Tabungan anda sedang diproses', '{"No. Rekening":"0980980879987","Alasan":"Halooo","Jumlah":"Rp. 1.000.000"}', 0, '1699010811508943532', 1, '2023-11-15 10:11:50', '1699010811508943532', '051700043110141849782'),
('1700040002237041446', 'Setoran Tabungan anda sedang diproses', '{"No. Rekening":"0980980879987","Alasan":"Halooo","Jumlah":"Rp. 1.000.000"}', 0, '1699010811508943532', 1, '2023-11-15 09:20:02', '1699010811508943532', '051700040002967569018'),
('1700037317631606565', 'Pengajuan Kredit anda sedang diproses', '{"Tipe Produk":"PINJAMAN KARYAWAN             ","Jumlah":"Rp. 100.000","Jangka Waktu":"4 Bulan"}', 0, '1699010811508943532', 1, '2023-11-15 08:35:17', '1699010811508943532', '031700037316651549407'),
('1700036982744903457', 'Pengajuan Tabungan anda sedang diproses', '{"Tipe Produk":"SIMP. ANGGOTA                 ","Jumlah":"Rp. 818.494"}', 0, '1699010811508943532', 1, '2023-11-15 08:29:42', '1699010811508943532', '021700036982993348402'),
('1700035136680918123', 'Setoran Tabungan anda sedang diproses', '{"No. Rekening":"0980980879987","Alasan":"Halooo","Jumlah":"Rp. 1.000.000"}', 0, '1699010811508943532', 1, '2023-11-15 07:58:56', '1699010811508943532', '051700035136589286539');

INSERT INTO "public"."personal_access_tokens" ("id", "tokenable_type", "tokenable_id", "name", "token", "abilities", "last_used_at", "expires_at", "created_at", "updated_at") VALUES
(880, 'App\Models\User', 1699010811508943532, 'dots_customer', 'daea1e41d429606d861e661bf44d134c03c7ab8c462519241dac067640d43cd1', '["*"]', '2023-11-22 06:41:38', NULL, '2023-11-22 06:41:37', '2023-11-22 06:41:38');
INSERT INTO "public"."personal_access_tokens" ("id", "tokenable_type", "tokenable_id", "name", "token", "abilities", "last_used_at", "expires_at", "created_at", "updated_at") VALUES
(845, 'App\Models\User', 1699010811508943532, 'dots_customer', '9a57bfaf85ba2a2451150337762e145ba3e9bc8cc217f43c1fc42815098e45d8', '["*"]', '2023-11-15 06:56:58', NULL, '2023-11-15 06:56:54', '2023-11-15 06:56:58');
INSERT INTO "public"."personal_access_tokens" ("id", "tokenable_type", "tokenable_id", "name", "token", "abilities", "last_used_at", "expires_at", "created_at", "updated_at") VALUES
(853, 'App\Models\User', 1699010811508943532, 'dots_customer', '707fef6baecebe5bc1cb54d6be761133a72ed5624e6af2c8b9f89a58415315e7', '["*"]', NULL, NULL, '2023-11-15 07:54:09', '2023-11-15 07:54:09');
INSERT INTO "public"."personal_access_tokens" ("id", "tokenable_type", "tokenable_id", "name", "token", "abilities", "last_used_at", "expires_at", "created_at", "updated_at") VALUES
(686, 'App\Models\User', 1699010811508943532, 'dots_customer', '590ee3647cfc2697899a73085db224a8c8012f505eacf0509fa71d13455c51cf', '["*"]', '2023-11-13 08:18:30', NULL, '2023-11-13 08:07:50', '2023-11-13 08:18:30'),
(693, 'App\Models\User', 1699010811508943532, 'dots_customer', 'bf46f772cc8a5803f14ff7bbbe81d94324fbc861b8aa8aa609ebb13697873b7a', '["*"]', NULL, NULL, '2023-11-14 02:31:09', '2023-11-14 02:31:09'),
(704, 'App\Models\User', 1699010811508943532, 'dots_customer', 'ad3c053a71d3f3db9571663b056a12533c83970094d7e6fab1ae0f87f92e22bc', '["*"]', NULL, NULL, '2023-11-14 03:00:52', '2023-11-14 03:00:52'),
(714, 'App\Models\User', 1699010811508943532, 'dots_customer', '506f19d24833273edcbce184baed17d6c19a1a8b5742664ab5eb1eefc1b39d8c', '["*"]', NULL, NULL, '2023-11-14 03:03:59', '2023-11-14 03:03:59'),
(724, 'App\Models\User', 1699010811508943532, 'dots_customer', 'b03568474bccad3e2651f416a64edc0e9a59fd28f45f0335c072f5986d8d8ebb', '["*"]', NULL, NULL, '2023-11-14 03:04:39', '2023-11-14 03:04:39'),
(734, 'App\Models\User', 1699010811508943532, 'dots_customer', '1fdf54ac578eba9e7868cd03f58ee583930a60f9925ccb9df53af7a69f73a38b', '["*"]', NULL, NULL, '2023-11-14 03:06:40', '2023-11-14 03:06:40'),
(744, 'App\Models\User', 1699010811508943532, 'dots_customer', '46c64b43de4cdb586157baad52684918c7f11785ff495bff9cc98fa781c46254', '["*"]', NULL, NULL, '2023-11-14 03:06:45', '2023-11-14 03:06:45'),
(753, 'App\Models\User', 1699010811508943532, 'dots_customer', 'c786f9ae330dfbd65fb10a7fa42ce282f3303600cc0ef6d166cf4b51752f4d3d', '["*"]', NULL, NULL, '2023-11-14 03:06:48', '2023-11-14 03:06:48'),
(761, 'App\Models\User', 1699010811508943532, 'dots_customer', 'a69ef88a0c6cf5ad7c1904886f9898e7144e3ac31cca2fe66b8f1c31ecb5a1c2', '["*"]', NULL, NULL, '2023-11-14 03:06:52', '2023-11-14 03:06:52'),
(769, 'App\Models\User', 1699010811508943532, 'dots_customer', 'a588572c2da8c0cb424c8574bb78d5a8f6bcc564ade870998090a447bd1b2dfd', '["*"]', NULL, NULL, '2023-11-14 03:18:10', '2023-11-14 03:18:10'),
(776, 'App\Models\User', 1699010811508943532, 'dots_customer', 'd604ea4e1a5b5f779256e903f722ce3c2799da52f04da56b19c506d7014861ae', '["*"]', NULL, NULL, '2023-11-14 03:21:59', '2023-11-14 03:21:59'),
(783, 'App\Models\User', 1699010811508943532, 'dots_customer', 'd338704f7a1f5ee30a41f219d507426d38dad9a6fd8361fd119e7d2ef537c898', '["*"]', NULL, NULL, '2023-11-14 03:22:45', '2023-11-14 03:22:45'),
(789, 'App\Models\User', 1699010811508943532, 'dots_customer', '53478c0cfd75ba3b6f5ac5cf1c0830c72dd0599eaa606b4443092d79ac139e89', '["*"]', NULL, NULL, '2023-11-14 03:36:16', '2023-11-14 03:36:16'),
(795, 'App\Models\User', 1699010811508943532, 'dots_customer', '6248f382335c7fe6ab826f9fa30a93fc1967080fd854581ae2c7db33829cfea4', '["*"]', NULL, NULL, '2023-11-14 03:45:26', '2023-11-14 03:45:26'),
(861, 'App\Models\User', 1699010811508943532, 'dots_customer', '0c4ae675dabedb910c9b66bd8aaaccca1a010c6633288a980a98375ff4831dde', '["*"]', '2023-11-15 09:26:33', NULL, '2023-11-15 09:19:16', '2023-11-15 09:26:33'),
(676, 'App\Models\User', 1699010811508943532, 'dots_customer', '5fd04b69fc9d107de5b13045113e0b543ef12cebdbbe9259963d9f25aa9cb427', '["*"]', '2023-11-13 03:43:50', NULL, '2023-11-13 03:37:36', '2023-11-13 03:43:50'),
(801, 'App\Models\User', 1699010811508943532, 'dots_customer', '5eb43dfd4c624ae558594436c03cc47f292e5e3a76b12a114b5597cc0a7a1cd0', '["*"]', '2023-11-14 09:54:21', NULL, '2023-11-14 09:08:54', '2023-11-14 09:54:21'),
(805, 'App\Models\User', 1699010811508943532, 'dots_customer', '740845dddff8540a548eed04ba7c3b72c8c1430ca7ac44bee922b1933429cab8', '["*"]', '2023-11-15 02:19:29', NULL, '2023-11-15 02:18:14', '2023-11-15 02:19:29'),
(813, 'App\Models\User', 1699010811508943532, 'dots_customer', '6f4919d4ed9c72499e0d26ae60cd0de45f6d713918da199d6a00db19220b6d34', '["*"]', '2023-11-15 02:40:02', NULL, '2023-11-15 02:39:48', '2023-11-15 02:40:02'),
(821, 'App\Models\User', 1699010811508943532, 'dots_customer', 'ca3c63bd0f2cf04eba1233b87c086692fb84c9fdbe4f8ef098b0737778af59d8', '["*"]', '2023-11-15 04:27:26', NULL, '2023-11-15 04:27:17', '2023-11-15 04:27:26'),
(829, 'App\Models\User', 1699010811508943532, 'dots_customer', '532850f8c196f53b0ea6228713bf2a52ef82b1ca22ff4b717670f41ce4885ab9', '["*"]', NULL, NULL, '2023-11-15 06:24:16', '2023-11-15 06:24:16'),
(837, 'App\Models\User', 1699010811508943532, 'dots_customer', 'aea2e6717cd895509178a9b3e7901daa8c7caec497339dc8e1090ce3882b7813', '["*"]', NULL, NULL, '2023-11-15 06:43:00', '2023-11-15 06:43:00'),
(866, 'App\Models\User', 1699010811508943532, 'dots_customer', '8d1f9abea5bde64e8338cb0377966308e2793602f8cd4ed494375206e87b44d7', '["*"]', '2023-11-16 09:06:06', NULL, '2023-11-16 08:59:20', '2023-11-16 09:06:06'),
(867, 'App\Models\User', 1699010811508943532, 'dots_customer', 'cd3f186208c469d404bba72fb39ce3d1d8c8f28137be6e8b1e540d5d3675c29c', '["*"]', '2023-11-21 06:14:47', NULL, '2023-11-20 09:05:40', '2023-11-21 06:14:47'),
(868, 'App\Models\User', 1699010811508943532, 'dots_customer', '6bc504528d645fa5656d050093069b756a8c2c044aff5d9025fe03fb37c26fa4', '["*"]', NULL, NULL, '2023-11-21 10:12:45', '2023-11-21 10:12:45'),
(876, 'App\Models\User', 1699010811508943532, 'dots_customer', '37cdad5746e503fed121c67ac44e3065d9f0854e74216a3d205e0fe67ffe1971', '["*"]', NULL, NULL, '2023-11-21 10:29:11', '2023-11-21 10:29:11'),
(687, 'App\Models\User', 1699010811508943532, 'dots_customer', '3b76ce13012df407737e415e512b2ee8b4e78a22f710da6e375038c78eee95f9', '["*"]', NULL, NULL, '2023-11-13 08:18:30', '2023-11-13 08:18:30'),
(694, 'App\Models\User', 1699010811508943532, 'dots_customer', '4d767991c4482d88e3f99fca1787b864d690debbd8489060980ce9eac84b8dab', '["*"]', NULL, NULL, '2023-11-14 02:48:31', '2023-11-14 02:48:31'),
(705, 'App\Models\User', 1699010811508943532, 'dots_customer', 'baee98c7e60bc5b107f408e5595215f2354fceb63f2f2edb6478ae0c4134bb45', '["*"]', NULL, NULL, '2023-11-14 03:02:02', '2023-11-14 03:02:02'),
(715, 'App\Models\User', 1699010811508943532, 'dots_customer', 'f388c66e7b199200d3804cad652e2fc708aa5aad4bdd1f48ab19dfb68d0b743d', '["*"]', NULL, NULL, '2023-11-14 03:04:00', '2023-11-14 03:04:00'),
(725, 'App\Models\User', 1699010811508943532, 'dots_customer', '20cd179027545d719229249295f18dd8fc9466354064d3faf140564805f58bd8', '["*"]', NULL, NULL, '2023-11-14 03:04:40', '2023-11-14 03:04:40'),
(735, 'App\Models\User', 1699010811508943532, 'dots_customer', '1959e8aae3a47d1211ed6e60500e09e50d0fda0aeddbb5c8e7bb8acc2acd14f3', '["*"]', NULL, NULL, '2023-11-14 03:06:41', '2023-11-14 03:06:41'),
(745, 'App\Models\User', 1699010811508943532, 'dots_customer', '8334a2fb737ff8da6c78dc8f5efb62b7f510ec32cb8c4fdc4f37718acb22726f', '["*"]', NULL, NULL, '2023-11-14 03:06:45', '2023-11-14 03:06:45'),
(754, 'App\Models\User', 1699010811508943532, 'dots_customer', '12bb6f82a736035ea87d07600f29fdaf8517aecfb8e2889fb99eb39b1bf631f4', '["*"]', NULL, NULL, '2023-11-14 03:06:48', '2023-11-14 03:06:48'),
(762, 'App\Models\User', 1699010811508943532, 'dots_customer', '4c4d46024420806e4e44bef403969c1be661b2d73b5cd0ecf9158bbca34e64a3', '["*"]', NULL, NULL, '2023-11-14 03:09:48', '2023-11-14 03:09:48'),
(770, 'App\Models\User', 1699010811508943532, 'dots_customer', '531317b09f04e92ee19e82de20d9ef8b60d561debec72d955cae745388f20d95', '["*"]', NULL, NULL, '2023-11-14 03:18:11', '2023-11-14 03:18:11'),
(777, 'App\Models\User', 1699010811508943532, 'dots_customer', '1ecb43d69372c76d31fe7c116038aea88f83b0a4f6246b0622a4d30b72a98ecb', '["*"]', NULL, NULL, '2023-11-14 03:22:00', '2023-11-14 03:22:00'),
(784, 'App\Models\User', 1699010811508943532, 'dots_customer', '79e75d31e4708a8e61c2b9e0c00d71c7fa8206c507cdf58252537df18a5c32ad', '["*"]', NULL, NULL, '2023-11-14 03:22:46', '2023-11-14 03:22:46'),
(790, 'App\Models\User', 1699010811508943532, 'dots_customer', '95ccc860de84d7c26e0e5962394c31e02ba2afcc3e11760422a47acffa233110', '["*"]', NULL, NULL, '2023-11-14 03:41:09', '2023-11-14 03:41:09'),
(796, 'App\Models\User', 1699010811508943532, 'dots_customer', '41c4cefb83b56c630033fbc7a06c1badd0efbf268712b4163e805345a4c7c2e1', '["*"]', '2023-11-14 03:47:27', NULL, '2023-11-14 03:47:27', '2023-11-14 03:47:27'),
(802, 'App\Models\User', 1699010811508943532, 'dots_customer', '59e8c0cfc8925c1d1d7433df4c2491f5272eb3976e10967488bccf06f077fc9d', '["*"]', '2023-11-14 09:54:49', NULL, '2023-11-14 09:54:47', '2023-11-14 09:54:49'),
(677, 'App\Models\User', 1699010811508943532, 'dots_customer', '51852b069de338846dd5f5776730313dce4742b45aa99fc8101e91cd235b2c8d', '["*"]', '2023-11-13 04:42:57', NULL, '2023-11-13 03:47:30', '2023-11-13 04:42:57'),
(806, 'App\Models\User', 1699010811508943532, 'dots_customer', '4bae69c5c3c8a8df48d203efe406d1d72fe45f0e7a06d78196ff6e6955971a9d', '["*"]', '2023-11-15 02:21:23', NULL, '2023-11-15 02:20:31', '2023-11-15 02:21:23'),
(854, 'App\Models\User', 1699010811508943532, 'dots_customer', '017786eedb54f757ce78a12a5cc5a3c3c4b10a7c346dafd74c3030c1fccf3cc6', '["*"]', '2023-11-15 07:56:28', NULL, '2023-11-15 07:54:31', '2023-11-15 07:56:28'),
(822, 'App\Models\User', 1699010811508943532, 'dots_customer', '8f427536d4527ee501ab9de36b574fc0fa06ef3f8bafdeb801088e7269c41745', '["*"]', '2023-11-15 04:35:30', NULL, '2023-11-15 04:32:17', '2023-11-15 04:35:30'),
(830, 'App\Models\User', 1699010811508943532, 'dots_customer', 'd8a4d565a94eff6c9756dab2e1b06ee4cc96f603c251cd12aa53e32298313907', '["*"]', NULL, NULL, '2023-11-15 06:27:21', '2023-11-15 06:27:21'),
(838, 'App\Models\User', 1699010811508943532, 'dots_customer', 'd07f4227531f24afb8d773907cc05fbbbd6c255ecbe4f63e3a2dbd5a99b75195', '["*"]', '2023-11-15 06:44:01', NULL, '2023-11-15 06:44:00', '2023-11-15 06:44:01'),
(846, 'App\Models\User', 1699010811508943532, 'dots_customer', '114d3405a144339a5991c80bc1ff24bf10b43a13c30369ee971b2414ec72a957', '["*"]', '2023-11-15 06:58:37', NULL, '2023-11-15 06:58:17', '2023-11-15 06:58:37'),
(814, 'App\Models\User', 1699010811508943532, 'dots_customer', 'ce8c45d65fe35f11ca7ec4beebb697e97139aad3e1c3c6dbc739f4eb26165c52', '["*"]', '2023-11-15 02:41:17', NULL, '2023-11-15 02:40:38', '2023-11-15 02:41:17'),
(862, 'App\Models\User', 1699010811508943532, 'dots_customer', '68a52173d1e719dd72140613ffe61e965526bfce6071c9458bdd4fd58aa3dc90', '["*"]', '2023-11-15 09:38:15', NULL, '2023-11-15 09:25:10', '2023-11-15 09:38:15'),
(869, 'App\Models\User', 1699010811508943532, 'dots_customer', '0265f660823eb425ff9f3e7c8523b5394de8c5e1f9e3c1125eb8775717279d12', '["*"]', NULL, NULL, '2023-11-21 10:12:48', '2023-11-21 10:12:48'),
(877, 'App\Models\User', 1699010811508943532, 'dots_customer', '5716563d49a60d2eb5f20390a6171e77253d8be9be99f92b1eb56097d8bffd24', '["*"]', NULL, NULL, '2023-11-21 10:30:02', '2023-11-21 10:30:02'),
(881, 'App\Models\User', 1699010811508943532, 'dots_customer', '853b06314ee623f1c48a9bc86ad5efb196c15c6f5423c86831d33e86713f3050', '["*"]', '2023-11-22 06:45:21', NULL, '2023-11-22 06:45:01', '2023-11-22 06:45:21'),
(678, 'App\Models\User', 1699010811508943532, 'dots_customer', '17cb06287a10374f0ea350c0242b0a856e894a8dd1a8ada973e39f0c4ee9ac32', '["*"]', NULL, NULL, '2023-11-13 04:43:13', '2023-11-13 04:43:13'),
(863, 'App\Models\User', 1699010811508943532, 'dots_customer', '1d0d0140b812b2fcd3e88ccf8720ebccfad5ba48077aba102de116bdf634651c', '["*"]', '2023-11-15 09:50:27', NULL, '2023-11-15 09:38:32', '2023-11-15 09:50:27'),
(870, 'App\Models\User', 1699010811508943532, 'dots_customer', '58ee10e67001ff6f1ce683dc16a889fd904fffb814c5b79496329c7b1afb97c4', '["*"]', NULL, NULL, '2023-11-21 10:14:01', '2023-11-21 10:14:01'),
(878, 'App\Models\User', 1699010811508943532, 'dots_customer', 'b18c1602ba5a14cf706879eb87b4f294b184d33e2a066bf56a72d828d216ae95', '["*"]', NULL, NULL, '2023-11-21 10:30:02', '2023-11-21 10:30:02'),
(803, 'App\Models\User', 1699010811508943532, 'dots_customer', '205e8bb8707aeeafc39699ab2e9d9b25a7845aecc2c50cb9442ffbd80b893b2a', '["*"]', '2023-11-14 10:11:07', NULL, '2023-11-14 09:54:48', '2023-11-14 10:11:07'),
(807, 'App\Models\User', 1699010811508943532, 'dots_customer', '07eaad734a288f73febc7b49fff22780598441c62376c3b8614e4ba2630b9c28', '["*"]', '2023-11-15 02:25:57', NULL, '2023-11-15 02:25:32', '2023-11-15 02:25:57'),
(815, 'App\Models\User', 1699010811508943532, 'dots_customer', '5253734791d4a1e2c6e5c89900045345371178c00c26fd6ab8f6befdcf9dbb27', '["*"]', '2023-11-15 02:44:13', NULL, '2023-11-15 02:44:12', '2023-11-15 02:44:13'),
(823, 'App\Models\User', 1699010811508943532, 'dots_customer', '3136bc76843f4e3d5a0e0df465b226bcebada838d437434a859e4b9016f49d90', '["*"]', '2023-11-15 04:35:46', NULL, '2023-11-15 04:35:45', '2023-11-15 04:35:46'),
(831, 'App\Models\User', 1699010811508943532, 'dots_customer', '97133f0de8a9f66c1726d0325706bf1e6e445d5c3c1c550fc89766f214d1c1ac', '["*"]', NULL, NULL, '2023-11-15 06:31:35', '2023-11-15 06:31:35'),
(839, 'App\Models\User', 1699010811508943532, 'dots_customer', '6cdfaec231248fca937c2703ddd2c303dbbc97f76e3d75147716ff2fbb549dac', '["*"]', '2023-11-15 06:45:18', NULL, '2023-11-15 06:44:57', '2023-11-15 06:45:18'),
(847, 'App\Models\User', 1699010811508943532, 'dots_customer', '74e53ecd12878caafe50ec6b7f5bd3e983c611ed1c0db131e93b96b1210ef38d', '["*"]', '2023-11-15 07:00:38', NULL, '2023-11-15 07:00:28', '2023-11-15 07:00:38'),
(688, 'App\Models\User', 1699010811508943532, 'dots_customer', '17237fb6be3a5c8622ccbeb4756bac515189839c4c69b25ea4f96c3f9b45582b', '["*"]', '2023-11-13 08:54:16', NULL, '2023-11-13 08:19:16', '2023-11-13 08:54:16'),
(695, 'App\Models\User', 1699010811508943532, 'dots_customer', 'bc61efe119e1a993f9d3e98cad2ca49c8a733fc8ce709e04db0190ba2363c7cf', '["*"]', NULL, NULL, '2023-11-14 02:48:34', '2023-11-14 02:48:34'),
(706, 'App\Models\User', 1699010811508943532, 'dots_customer', '77d86319776345678c86df3b5173a3bab42b9ab45dccfde6d7590eb857da3ecb', '["*"]', NULL, NULL, '2023-11-14 03:03:51', '2023-11-14 03:03:51'),
(716, 'App\Models\User', 1699010811508943532, 'dots_customer', '29685a95f87536add34ecca39066ddd79a9bf980b5c22f0cd29fdcf970827806', '["*"]', NULL, NULL, '2023-11-14 03:04:13', '2023-11-14 03:04:13'),
(726, 'App\Models\User', 1699010811508943532, 'dots_customer', 'f1c87cc56d2bde85d30b3a792592f057c59233ab988e7eac0bb7067ccff048a4', '["*"]', NULL, NULL, '2023-11-14 03:06:20', '2023-11-14 03:06:20'),
(736, 'App\Models\User', 1699010811508943532, 'dots_customer', 'a016185e858605b8498dfb52f4da6e5bfa24b3520c3d35816e96256495319772', '["*"]', NULL, NULL, '2023-11-14 03:06:41', '2023-11-14 03:06:41'),
(746, 'App\Models\User', 1699010811508943532, 'dots_customer', '40a602c5e12174b1f1d1f7fb464f272d0ddae2cc7dc07d14b64954e11d2cc81a', '["*"]', NULL, NULL, '2023-11-14 03:06:45', '2023-11-14 03:06:45'),
(755, 'App\Models\User', 1699010811508943532, 'dots_customer', 'd4d07effd136f89e7feed1be3705e3757693cb307f005e078a0acff4497633cd', '["*"]', NULL, NULL, '2023-11-14 03:06:48', '2023-11-14 03:06:48'),
(763, 'App\Models\User', 1699010811508943532, 'dots_customer', '2a0f4c7fd4f81b26b7322df975f4a16ee2fa6e13be69440510a7b87fd33d3046', '["*"]', NULL, NULL, '2023-11-14 03:09:51', '2023-11-14 03:09:51'),
(771, 'App\Models\User', 1699010811508943532, 'dots_customer', 'c686ea5c37fce86b644988cbcaecbb6a7869f4ba6e48905a9a6a255c82a207a7', '["*"]', NULL, NULL, '2023-11-14 03:18:12', '2023-11-14 03:18:12'),
(778, 'App\Models\User', 1699010811508943532, 'dots_customer', '72185b5fe30c1f8d3c1868ef2e73c8488746f887eeb86be7f8fafb4de4671274', '["*"]', NULL, NULL, '2023-11-14 03:22:30', '2023-11-14 03:22:30'),
(855, 'App\Models\User', 1699010811508943532, 'dots_customer', '4b6e5487cfb69266418af9165578fac77703adbe32676955ed3c590d531c07ba', '["*"]', '2023-11-15 08:21:26', NULL, '2023-11-15 07:56:57', '2023-11-15 08:21:26'),
(679, 'App\Models\User', 1699010811508943532, 'dots_customer', '382f8a967316230a6c0cae29eee93c1592d045e3b154356eb7beb3d1dd1cbc7e', '["*"]', NULL, NULL, '2023-11-13 04:43:13', '2023-11-13 04:43:13'),
(689, 'App\Models\User', 1699010811508943532, 'dots_customer', '9d31954d1c0c15a0c5132827027df8d8a034807dfa7864991070b2a24b4f76af', '["*"]', NULL, NULL, '2023-11-13 08:54:25', '2023-11-13 08:54:25'),
(696, 'App\Models\User', 1699010811508943532, 'dots_customer', '5fdf8d375cfc89a69223b3b5ac909fac3115ea53c15c0236f6c6860895ae8875', '["*"]', NULL, NULL, '2023-11-14 02:48:35', '2023-11-14 02:48:35'),
(707, 'App\Models\User', 1699010811508943532, 'dots_customer', '9d5a64241cd669a2566fb9511b81de55799963938fef2f2726036dc71769ed19', '["*"]', NULL, NULL, '2023-11-14 03:03:54', '2023-11-14 03:03:54'),
(717, 'App\Models\User', 1699010811508943532, 'dots_customer', 'e033e261db1c220253086b077aa8fb5790aa5b442e3467e0ff720006a4f4e2fd', '["*"]', NULL, NULL, '2023-11-14 03:04:15', '2023-11-14 03:04:15'),
(727, 'App\Models\User', 1699010811508943532, 'dots_customer', '99ad4c78aab4258c85f28586ea0cb20419513927a0c392ddcc9f339fa838dd9a', '["*"]', NULL, NULL, '2023-11-14 03:06:20', '2023-11-14 03:06:20'),
(737, 'App\Models\User', 1699010811508943532, 'dots_customer', 'ba0b32990f49b6ed276f13ab487441464cfdcff6aac4adc9e227d9c93c93d29a', '["*"]', NULL, NULL, '2023-11-14 03:06:41', '2023-11-14 03:06:41'),
(747, 'App\Models\User', 1699010811508943532, 'dots_customer', 'a1078efe5ee9aa88895803cfceef669804f952d63e03d3c33ffdf9183c22befc', '["*"]', NULL, NULL, '2023-11-14 03:06:46', '2023-11-14 03:06:46'),
(756, 'App\Models\User', 1699010811508943532, 'dots_customer', 'f44675f6ad26fd07152d382b9c2988656be9a673385e24664ec7da94b70cbfd7', '["*"]', NULL, NULL, '2023-11-14 03:06:50', '2023-11-14 03:06:50'),
(764, 'App\Models\User', 1699010811508943532, 'dots_customer', 'b3ebac061c2440588e99b28a2cf5d23b9a5d4e71b0832c6ad8bd29f19d69b1ac', '["*"]', NULL, NULL, '2023-11-14 03:09:51', '2023-11-14 03:09:51'),
(772, 'App\Models\User', 1699010811508943532, 'dots_customer', 'b2864ceab4abb987ad76a326ecc6b05821abc24b277c707d996fdafa60a3ad42', '["*"]', NULL, NULL, '2023-11-14 03:19:32', '2023-11-14 03:19:32'),
(779, 'App\Models\User', 1699010811508943532, 'dots_customer', 'e283f4bb1d5bab2af12b6892a47f2b097d05f9a9fffa5bd67be110251f1534dd', '["*"]', NULL, NULL, '2023-11-14 03:22:32', '2023-11-14 03:22:32'),
(785, 'App\Models\User', 1699010811508943532, 'dots_customer', 'bbbae86983ff42f521496fb19eb8d21164309a4ca5a245d2e9d4fe1a25129f84', '["*"]', NULL, NULL, '2023-11-14 03:31:54', '2023-11-14 03:31:54'),
(791, 'App\Models\User', 1699010811508943532, 'dots_customer', 'bff7d9b21a489966f4b3f134fa0ae1517f3d296c5b4e3f5f43a218073036e915', '["*"]', NULL, NULL, '2023-11-14 03:42:12', '2023-11-14 03:42:12'),
(816, 'App\Models\User', 1699010811508943532, 'dots_customer', '9d7e2f16c2d4bf0e95e48ce94be8fbf681883b2eb3e5b74469304d062449f075', '["*"]', '2023-11-15 03:22:26', NULL, '2023-11-15 02:44:50', '2023-11-15 03:22:26'),
(797, 'App\Models\User', 1699010811508943532, 'dots_customer', 'aaa8bba890fb822a2da271a59c74dd6d8e595d13e600d7b8a963897218a6e212', '["*"]', '2023-11-14 04:56:05', NULL, '2023-11-14 03:47:54', '2023-11-14 04:56:05'),
(864, 'App\Models\User', 1699010811508943532, 'dots_customer', '9781e8e23774a524919b10fdcead656eb0396f80411642b0b6a13128600fdcb9', '["*"]', '2023-11-15 10:04:21', NULL, '2023-11-15 09:50:38', '2023-11-15 10:04:21'),
(871, 'App\Models\User', 1699010811508943532, 'dots_customer', '89dafc653dfb2bcb3c566ecf75c2a96643daeb17d10220d4f15464cbbfec20db', '["*"]', NULL, NULL, '2023-11-21 10:15:41', '2023-11-21 10:15:41'),
(824, 'App\Models\User', 1699010811508943532, 'dots_customer', '439db7c899a6e337fdc813ead2d42a17deafbcc6d2e76b9c0708828683d2bb17', '["*"]', '2023-11-15 04:39:28', NULL, '2023-11-15 04:38:10', '2023-11-15 04:39:28'),
(832, 'App\Models\User', 1699010811508943532, 'dots_customer', '89a80e6cc0e7727160a869c0767066a1e5d5b3b7fd6d1b90034f605a0b76c179', '["*"]', NULL, NULL, '2023-11-15 06:32:24', '2023-11-15 06:32:24'),
(840, 'App\Models\User', 1699010811508943532, 'dots_customer', '6eeaa67bdd2dded0143217de744f5cf5576de81d5005d764f39faf95abd03fd7', '["*"]', NULL, NULL, '2023-11-15 06:45:45', '2023-11-15 06:45:45'),
(848, 'App\Models\User', 1699010811508943532, 'dots_customer', '28cc37c03ff17d607333eb373076a16e9ab31446bd3e79a74675ff328e0c02a2', '["*"]', '2023-11-15 07:05:58', NULL, '2023-11-15 07:05:57', '2023-11-15 07:05:58'),
(804, 'App\Models\User', 1699010811508943532, 'dots_customer', 'f9dbeac59c1ca0a4066c220372bb05da7fed0c7126a46c8d5689c7ba138703d6', '["*"]', '2023-11-14 10:16:37', NULL, '2023-11-14 10:11:17', '2023-11-14 10:16:37'),
(808, 'App\Models\User', 1699010811508943532, 'dots_customer', '4a39d999b30a5088e274e125aea142280dce9a0046e71889e7b271a9f6faf78a', '["*"]', '2023-11-15 02:29:43', NULL, '2023-11-15 02:29:10', '2023-11-15 02:29:43'),
(879, 'App\Models\User', 1699010811508943532, 'dots_customer', '238b7b9ce444e1ff4d8f92f40196f81432fe68efca3b7d937daebc5832129964', '["*"]', '2023-11-21 10:39:21', NULL, '2023-11-21 10:30:17', '2023-11-21 10:39:21'),
(856, 'App\Models\User', 1699010811508943532, 'dots_customer', '2c6560b87957fe128e56d64c35f5eaec3428a66352e4942b4d7ac0300519e9a5', '["*"]', '2023-11-15 09:14:04', NULL, '2023-11-15 08:21:34', '2023-11-15 09:14:04'),
(690, 'App\Models\User', 1699010811508943532, 'dots_customer', '349abd88d5e9809370c8f32c5bd49d3645f6b7054917b73139b0cc376b43a8b9', '["*"]', NULL, NULL, '2023-11-13 08:54:27', '2023-11-13 08:54:27'),
(697, 'App\Models\User', 1699010811508943532, 'dots_customer', '012e8431db4affd04c1f4e6b97fb11e47b5ef4ebc58f60f880435a1ed3f3ec8d', '["*"]', NULL, NULL, '2023-11-14 02:48:36', '2023-11-14 02:48:36'),
(708, 'App\Models\User', 1699010811508943532, 'dots_customer', '68e3d39db390c4c6fa71577ccbe4d6821284edb040b827332dd9e394c207707b', '["*"]', NULL, NULL, '2023-11-14 03:03:55', '2023-11-14 03:03:55'),
(718, 'App\Models\User', 1699010811508943532, 'dots_customer', '74a6e1f64d5f96799db083892d271bde4648eab3c51b474a9da755e2ebc70bb6', '["*"]', NULL, NULL, '2023-11-14 03:04:24', '2023-11-14 03:04:24'),
(680, 'App\Models\User', 1699010811508943532, 'dots_customer', '560d931f689addd0da956bd01ea1d690ee13ecb4fd14ed998b180e2ff8669ed9', '["*"]', '2023-11-13 07:01:34', NULL, '2023-11-13 04:43:13', '2023-11-13 07:01:34'),
(728, 'App\Models\User', 1699010811508943532, 'dots_customer', '1dbbe46127e8f789e79ce3384b4beb24a33eb634a2093773d0d8203c1920c26b', '["*"]', NULL, NULL, '2023-11-14 03:06:22', '2023-11-14 03:06:22'),
(738, 'App\Models\User', 1699010811508943532, 'dots_customer', '27bec478ee8b4c50fc3f6638acd6420ec7b6e42b53baf3a2d82b69c32caa1608', '["*"]', NULL, NULL, '2023-11-14 03:06:43', '2023-11-14 03:06:43'),
(748, 'App\Models\User', 1699010811508943532, 'dots_customer', '6452ff6b566ab7868f6495477ea3cf5382441c9488589d4b60dcd0414c3c511b', '["*"]', NULL, NULL, '2023-11-14 03:06:46', '2023-11-14 03:06:46'),
(757, 'App\Models\User', 1699010811508943532, 'dots_customer', '03c4b79d6074d113e3a5dc2c0921380d70518f7d50b104867871544aaa235f4b', '["*"]', NULL, NULL, '2023-11-14 03:06:50', '2023-11-14 03:06:50'),
(765, 'App\Models\User', 1699010811508943532, 'dots_customer', '3d8be657cd101a1d1b66d14cdf343632d9dc7918d3fcc2bac1cebdddadd181a9', '["*"]', NULL, NULL, '2023-11-14 03:16:57', '2023-11-14 03:16:57'),
(773, 'App\Models\User', 1699010811508943532, 'dots_customer', 'c9626eb4b630880953b95a494b21be600665682d08790aa362a339494538c9cf', '["*"]', NULL, NULL, '2023-11-14 03:19:35', '2023-11-14 03:19:35'),
(780, 'App\Models\User', 1699010811508943532, 'dots_customer', 'b8a5c4c035eb048173a555bc332f4974d0d9e0f74731d55e979d4c4545519096', '["*"]', NULL, NULL, '2023-11-14 03:22:32', '2023-11-14 03:22:32'),
(786, 'App\Models\User', 1699010811508943532, 'dots_customer', 'cb087e9427cae5fb9fd6cde3f743130b4296be363dcb3ce42ae4061ad2afa357', '["*"]', NULL, NULL, '2023-11-14 03:31:59', '2023-11-14 03:31:59'),
(792, 'App\Models\User', 1699010811508943532, 'dots_customer', '4769517699ef574de8b3da701d2110c1a260914c162e3c881458f926108b390e', '["*"]', NULL, NULL, '2023-11-14 03:42:49', '2023-11-14 03:42:49'),
(809, 'App\Models\User', 1699010811508943532, 'dots_customer', '63c3008e72af109b1c15aad17f51734dc8e3148f1ca3bd8082288d6686be4217', '["*"]', NULL, NULL, '2023-11-15 02:30:53', '2023-11-15 02:30:53'),
(817, 'App\Models\User', 1699010811508943532, 'dots_customer', '4f04e78e0372d8bf1728f5c885a3a4b293fb835415b1f3907d0f9e0390789007', '["*"]', '2023-11-15 03:43:03', NULL, '2023-11-15 03:28:35', '2023-11-15 03:43:03'),
(825, 'App\Models\User', 1699010811508943532, 'dots_customer', '9b5786018bf22dd5c453b891eefa8efbda03ea465dea92db8722f783be4622ec', '["*"]', '2023-11-15 04:41:05', NULL, '2023-11-15 04:41:05', '2023-11-15 04:41:05'),
(833, 'App\Models\User', 1699010811508943532, 'dots_customer', '7cd6cad9d81726d8eb99f7b6baaec98192d21514ea538b975d24dcf3c97f2775', '["*"]', NULL, NULL, '2023-11-15 06:32:40', '2023-11-15 06:32:40'),
(841, 'App\Models\User', 1699010811508943532, 'dots_customer', '5732685067142264d20c8447d164e9bd97eb33bdbc8f909aa4ea6cd4eab12496', '["*"]', '2023-11-15 06:47:17', NULL, '2023-11-15 06:47:01', '2023-11-15 06:47:17'),
(849, 'App\Models\User', 1699010811508943532, 'dots_customer', '70c088e7c9d906f4bc21074e88fd0053bfd92b06e3f6e4c323d9dd7c1bf2d773', '["*"]', NULL, NULL, '2023-11-15 07:52:29', '2023-11-15 07:52:29'),
(857, 'App\Models\User', 1699010811508943532, 'dots_customer', '31b6fcb6e47f3163ba7a0034d1f7c15d65d85c26812de8eff6f1f62a36f2ae70', '["*"]', '2023-11-15 09:24:58', NULL, '2023-11-15 09:14:23', '2023-11-15 09:24:58'),
(798, 'App\Models\User', 1699010811508943532, 'dots_customer', '638fce5bf4be16b78a32208ea0afe406e44a3df701010dd466212f01b4d19cc6', '["*"]', '2023-11-14 04:33:56', NULL, '2023-11-14 04:27:23', '2023-11-14 04:33:56'),
(865, 'App\Models\User', 1699010811508943532, 'dots_customer', 'd937c1034241d2f076b445cae503dce3a5d7ee47eb8132f4e925b320f338275f', '["*"]', '2023-11-16 08:38:47', NULL, '2023-11-15 10:04:24', '2023-11-16 08:38:47'),
(872, 'App\Models\User', 1699010811508943532, 'dots_customer', 'f9740f01aba3847bba1f1528c88feba3eea64463eba52dc05ed6fe2c97fc4cb8', '["*"]', NULL, NULL, '2023-11-21 10:17:49', '2023-11-21 10:17:49'),
(691, 'App\Models\User', 1699010811508943532, 'dots_customer', 'bb35eda560283894335ba41880ecedb85041629e12518d4d9567e6031c509806', '["*"]', NULL, NULL, '2023-11-13 08:54:29', '2023-11-13 08:54:29'),
(698, 'App\Models\User', 1699010811508943532, 'dots_customer', '8e4396936255dd32a68ca324e99d7d6b31a71da9f33a2fc6628bf95e5eacad5c', '["*"]', NULL, NULL, '2023-11-14 02:48:39', '2023-11-14 02:48:39'),
(709, 'App\Models\User', 1699010811508943532, 'dots_customer', '324f549e59fdc050ecf03deb57cea68cd92a14b9ead9dac7a8ad5895b21de7a6', '["*"]', NULL, NULL, '2023-11-14 03:03:56', '2023-11-14 03:03:56'),
(719, 'App\Models\User', 1699010811508943532, 'dots_customer', 'cbde7eb4cc944518ae32db30bec31eeb58b1f058729a6e3289aaa7095a8d4a9e', '["*"]', NULL, NULL, '2023-11-14 03:04:30', '2023-11-14 03:04:30'),
(729, 'App\Models\User', 1699010811508943532, 'dots_customer', 'f9e1d7ed7d53707c03ddbe4f6a69d530200884ce3b33f3cfd2fa9c023b31edc8', '["*"]', NULL, NULL, '2023-11-14 03:06:22', '2023-11-14 03:06:22'),
(739, 'App\Models\User', 1699010811508943532, 'dots_customer', '96a51a4c1ba15c789aa0e19bf6d3c70f292498a1d29982e8c294b6108bf08ead', '["*"]', NULL, NULL, '2023-11-14 03:06:43', '2023-11-14 03:06:43'),
(749, 'App\Models\User', 1699010811508943532, 'dots_customer', 'da049a56d6e0c623fd00b8a5972d4c492a68cefedefd3a19c2cb6cb44ee4ee22', '["*"]', NULL, NULL, '2023-11-14 03:06:46', '2023-11-14 03:06:46'),
(758, 'App\Models\User', 1699010811508943532, 'dots_customer', 'fb4200d350fe6a8c95ed2516e6d88f0f83d70545321afd817eb150e93a6653e3', '["*"]', NULL, NULL, '2023-11-14 03:06:51', '2023-11-14 03:06:51'),
(766, 'App\Models\User', 1699010811508943532, 'dots_customer', '5d4b2155432215b3bdf8f75291e6a005168a57120e896a49e4e55bfed815dd11', '["*"]', NULL, NULL, '2023-11-14 03:17:06', '2023-11-14 03:17:06'),
(774, 'App\Models\User', 1699010811508943532, 'dots_customer', '140cdebe49117640e4f490fccaaccca3c4a9a9f2787ba883fd0d5a63fe7f0e2b', '["*"]', NULL, NULL, '2023-11-14 03:19:37', '2023-11-14 03:19:37'),
(781, 'App\Models\User', 1699010811508943532, 'dots_customer', 'ae273ab1ee93584d68d66ec15b6dcbf46ec954de6c5b403c668552253689abb7', '["*"]', NULL, NULL, '2023-11-14 03:22:38', '2023-11-14 03:22:38'),
(787, 'App\Models\User', 1699010811508943532, 'dots_customer', 'e12428ce2c01d77769def26b7149c9bae93626a0e18e7628b002ef30387badee', '["*"]', NULL, NULL, '2023-11-14 03:34:19', '2023-11-14 03:34:19'),
(793, 'App\Models\User', 1699010811508943532, 'dots_customer', 'c808c16c79aef606ca1e09aa7cab5e89c185aa3e0b34ecf2290badd5e02bd9a2', '["*"]', NULL, NULL, '2023-11-14 03:43:36', '2023-11-14 03:43:36'),
(810, 'App\Models\User', 1699010811508943532, 'dots_customer', '46a59dddea509d928b12fe8a4934cc8a4ca6d4014e60782ce56b4179e0eb92e0', '["*"]', NULL, NULL, '2023-11-15 02:31:21', '2023-11-15 02:31:21'),
(818, 'App\Models\User', 1699010811508943532, 'dots_customer', 'e52b73192581d2241ffe810a7457c32eda84b283db71c4edff30f9439a618113', '["*"]', '2023-11-15 04:20:50', NULL, '2023-11-15 03:51:15', '2023-11-15 04:20:50'),
(826, 'App\Models\User', 1699010811508943532, 'dots_customer', '2229952455f5a148160796ffaa05b6f0ec86efe92273a074f8bf5b95cb49e711', '["*"]', NULL, NULL, '2023-11-15 06:16:09', '2023-11-15 06:16:09'),
(834, 'App\Models\User', 1699010811508943532, 'dots_customer', 'dc43074b20ee752b5b7c83f21735da0c55233c18c045ca59d8b777bd19af622b', '["*"]', NULL, NULL, '2023-11-15 06:33:06', '2023-11-15 06:33:06'),
(842, 'App\Models\User', 1699010811508943532, 'dots_customer', '640efe62dfc31d21b8e191dab58922a42626099567545ff621f7f4f358e6052f', '["*"]', NULL, NULL, '2023-11-15 06:49:39', '2023-11-15 06:49:39'),
(850, 'App\Models\User', 1699010811508943532, 'dots_customer', 'cd5182b6f9209feebb6a4225d1ad2d2ab0af3bb60f73f05a1e103a08b5f7a0e6', '["*"]', NULL, NULL, '2023-11-15 07:52:52', '2023-11-15 07:52:52'),
(858, 'App\Models\User', 1699010811508943532, 'dots_customer', '92238fdc3a4c945b19336903327d6a0543ef30284d368af52608fe34f6673105', '["*"]', NULL, NULL, '2023-11-15 09:17:13', '2023-11-15 09:17:13'),
(873, 'App\Models\User', 1699010811508943532, 'dots_customer', '6aac3eda9bb16aca1c5fd26f3f7253d475e8ff8460b4ee24c40b7221b22234e7', '["*"]', NULL, NULL, '2023-11-21 10:21:16', '2023-11-21 10:21:16'),
(681, 'App\Models\User', 1699010811508943532, 'dots_customer', 'a13dcaf89b209061c8b36f40235a1c9893af3065d0a6fc977d83c03d57a3b181', '["*"]', '2023-11-13 07:15:26', NULL, '2023-11-13 07:01:56', '2023-11-13 07:15:26'),
(799, 'App\Models\User', 1699010811508943532, 'dots_customer', '15632d40c24cce6c5a9fa99e7217d99f2813b7df31ecd9ae06803ce2daf34f71', '["*"]', '2023-11-14 09:25:28', NULL, '2023-11-14 04:35:15', '2023-11-14 09:25:28'),
(767, 'App\Models\User', 1699010811508943532, 'dots_customer', '165f3277b0e8dac0cbfcf45b29442e9b9759acbf56d15f8743433cdf7ab40bae', '["*"]', '2023-11-15 02:18:04', NULL, '2023-11-14 03:18:04', '2023-11-15 02:18:04'),
(811, 'App\Models\User', 1699010811508943532, 'dots_customer', '0967a418a99f0ea589b95b0ddc9ac7828aa48d3d1cbba5182a6a03a97d67c84e', '["*"]', NULL, NULL, '2023-11-15 02:34:59', '2023-11-15 02:34:59'),
(819, 'App\Models\User', 1699010811508943532, 'dots_customer', '39fe17d73da950e9b8ddafe053da3c50cba594e83a954897495d1c37bea2ee79', '["*"]', '2023-11-15 10:11:55', NULL, '2023-11-15 03:57:02', '2023-11-15 10:11:55'),
(874, 'App\Models\User', 1699010811508943532, 'dots_customer', 'c2760f1b8b178f2568e5482086cd4976984f82e050e660633704e46f4ad3f307', '["*"]', NULL, NULL, '2023-11-21 10:21:20', '2023-11-21 10:21:20'),
(682, 'App\Models\User', 1699010811508943532, 'dots_customer', '56a44a7c284e7f8654008596c9f4433335c8235bae0324739748b97a246f7401', '["*"]', '2023-11-13 08:07:11', NULL, '2023-11-13 07:15:43', '2023-11-13 08:07:11'),
(699, 'App\Models\User', 1699010811508943532, 'dots_customer', 'ab15d3b0769f3368dd741d10a040af6aa973e13b06736d94c3ae5334e20a19d8', '["*"]', NULL, NULL, '2023-11-14 02:48:46', '2023-11-14 02:48:46'),
(827, 'App\Models\User', 1699010811508943532, 'dots_customer', '53d0287b218c55a383f04e6a94de1954d636c52d6450455526d3313bb6fb612e', '["*"]', '2023-11-15 06:17:30', NULL, '2023-11-15 06:17:24', '2023-11-15 06:17:30'),
(835, 'App\Models\User', 1699010811508943532, 'dots_customer', '2d75e75e089779b29a25007a7dc1a44ab2e4d732af32789302010b6eb0e41424', '["*"]', NULL, NULL, '2023-11-15 06:35:30', '2023-11-15 06:35:30'),
(843, 'App\Models\User', 1699010811508943532, 'dots_customer', 'f7df318f1afcd24b7ca6a3ce69c70589de6671b53cc71c5c017179440f1c252e', '["*"]', '2023-11-15 06:55:09', NULL, '2023-11-15 06:55:08', '2023-11-15 06:55:09'),
(851, 'App\Models\User', 1699010811508943532, 'dots_customer', '12aea3da84bb236a0a57b17230c56888aef36182a218bf67d545492a88590935', '["*"]', NULL, NULL, '2023-11-15 07:53:10', '2023-11-15 07:53:10'),
(859, 'App\Models\User', 1699010811508943532, 'dots_customer', '13246cfc22f1158dc3ca92bd8fb1d90eee4232722c9c4f831698ab9444a0e038', '["*"]', NULL, NULL, '2023-11-15 09:19:09', '2023-11-15 09:19:09'),
(692, 'App\Models\User', 1699010811508943532, 'dots_customer', '54688c6c7d15f1974194696d90489ce78490f8a9b9f62abab8bd465cf2304696', '["*"]', '2023-11-14 03:03:36', NULL, '2023-11-13 08:56:10', '2023-11-14 03:03:36'),
(710, 'App\Models\User', 1699010811508943532, 'dots_customer', 'cde3c2947c4cb492090ba835a3253f53f02230cce380efcb5fc31e6fd7dc5ce2', '["*"]', NULL, NULL, '2023-11-14 03:03:56', '2023-11-14 03:03:56'),
(720, 'App\Models\User', 1699010811508943532, 'dots_customer', '6af1402093c383ab98fb7aba763c39c0a9607643542c0a3687aba014286a564e', '["*"]', NULL, NULL, '2023-11-14 03:04:31', '2023-11-14 03:04:31'),
(730, 'App\Models\User', 1699010811508943532, 'dots_customer', '063f8c839039adce4fd572c05e6876b38752cfa4331785a03dd7ddef2394fa0b', '["*"]', NULL, NULL, '2023-11-14 03:06:38', '2023-11-14 03:06:38'),
(740, 'App\Models\User', 1699010811508943532, 'dots_customer', '2bd2423d8f6d36d88b7e5bfe563cda3f0ba136f974be2361e4b89665866df32c', '["*"]', NULL, NULL, '2023-11-14 03:06:43', '2023-11-14 03:06:43'),
(750, 'App\Models\User', 1699010811508943532, 'dots_customer', 'f7d58f98761f045840af35fe09d7b84f23be869b50f515be5ec3e1815c736411', '["*"]', NULL, NULL, '2023-11-14 03:06:47', '2023-11-14 03:06:47'),
(759, 'App\Models\User', 1699010811508943532, 'dots_customer', 'f01712f063276c764683a071c4972c67df3654aa98808f3f99222f1cc7fea38a', '["*"]', NULL, NULL, '2023-11-14 03:06:51', '2023-11-14 03:06:51'),
(523, 'App\Models\User', 1699010811508943532, 'dots_customer', '597616d6c42ca624c44db17b07a444fa7acd5fe7a5b0742a58ba083d74e6ef80', '["*"]', '2023-11-04 06:10:08', NULL, '2023-11-04 06:08:46', '2023-11-04 06:10:08'),
(525, 'App\Models\User', 1699010811508943532, 'dots_customer', '48e54df2ec1fb53a4444d183dfbb489222a460cfdecd2d5c756e6edcdb5db65a', '["*"]', '2023-11-04 06:16:44', NULL, '2023-11-04 06:14:28', '2023-11-04 06:16:44'),
(524, 'App\Models\User', 1699010811508943532, 'dots_customer', '53e90b44ba746f0ceaad002054b82ea723b6614b073aafbd4c8eb85f200b8b64', '["*"]', '2023-11-04 06:14:09', NULL, '2023-11-04 06:14:01', '2023-11-04 06:14:09'),
(526, 'App\Models\User', 1699010811508943532, 'dots_customer', '0586355b868276022d606e6e3858e535ef2abea4ae94b32f276ae0748417bc00', '["*"]', NULL, NULL, '2023-11-04 06:17:40', '2023-11-04 06:17:40'),
(527, 'App\Models\User', 1699010811508943532, 'dots_customer', 'e3cd42acc5475f6f7049a9b7e24854c9758a9fd3e0d86c45906d8d14a92e5727', '["*"]', NULL, NULL, '2023-11-04 06:17:43', '2023-11-04 06:17:43'),
(528, 'App\Models\User', 1699010811508943532, 'dots_customer', '460dd983f7d8eeff0bd8757abe7a41f00cb5fb88af85deceb228f5e7a40bb0ca', '["*"]', NULL, NULL, '2023-11-04 06:18:06', '2023-11-04 06:18:06'),
(529, 'App\Models\User', 1699010811508943532, 'dots_customer', '9fa36ed08c97b58146a0489b69960f21880bc2dbb605ea420666afede8edd743', '["*"]', NULL, NULL, '2023-11-04 06:18:09', '2023-11-04 06:18:09'),
(530, 'App\Models\User', 1699010811508943532, 'dots_customer', '7c69492212501af82d5dffb1d28e08085d6e3c64a0bbc32bf83a7b690017b66f', '["*"]', NULL, NULL, '2023-11-04 06:18:15', '2023-11-04 06:18:15'),
(531, 'App\Models\User', 1699010811508943532, 'dots_customer', '211605e5039f3051415e15159aca33515b3b37d6d6ce4bf9a9b3333892962333', '["*"]', NULL, NULL, '2023-11-04 06:18:16', '2023-11-04 06:18:16'),
(532, 'App\Models\User', 1699010811508943532, 'dots_customer', '608bee9c4fd4e988a2fa6c67654a9d3c7166de70ff3b131c06f11aa7c5fcefae', '["*"]', NULL, NULL, '2023-11-04 06:20:25', '2023-11-04 06:20:25'),
(533, 'App\Models\User', 1699010811508943532, 'dots_customer', '26381a248617de9296677903f3a825080a00ee5f2d3297bd74dc914df118adcf', '["*"]', NULL, NULL, '2023-11-04 06:20:27', '2023-11-04 06:20:27'),
(534, 'App\Models\User', 1699010811508943532, 'dots_customer', '3e419367505a42e0d6de0929e8e7477aa954c47830546a09a6fd5ea458ef072a', '["*"]', NULL, NULL, '2023-11-04 06:20:27', '2023-11-04 06:20:27'),
(535, 'App\Models\User', 1699010811508943532, 'dots_customer', '5b9fc1b66f3fd3ad9a990e9ef89c0e9d0650be4a3561b5a5e206bad27a2b872e', '["*"]', NULL, NULL, '2023-11-04 06:20:28', '2023-11-04 06:20:28'),
(536, 'App\Models\User', 1699010811508943532, 'dots_customer', 'bdd03328b48a7bedfc7025b252720c08cd6405f037ee239c34f2276582151933', '["*"]', NULL, NULL, '2023-11-04 06:20:56', '2023-11-04 06:20:56'),
(537, 'App\Models\User', 1699010811508943532, 'dots_customer', '8fc1e2d38bfa66186f05cbc7f46b57126342e4442f9391b437586588ad0dd2fe', '["*"]', NULL, NULL, '2023-11-04 06:21:17', '2023-11-04 06:21:17'),
(538, 'App\Models\User', 1699010811508943532, 'dots_customer', 'd4f6879a039cd8c33a7967447ea8878e688e682ee290813678bbf0c96aa07458', '["*"]', NULL, NULL, '2023-11-04 06:21:35', '2023-11-04 06:21:35'),
(539, 'App\Models\User', 1699010811508943532, 'dots_customer', '063db87435fcd1647c63342cc54a8630899a7b94dc5a6d448567f0a794151431', '["*"]', NULL, NULL, '2023-11-04 06:24:11', '2023-11-04 06:24:11'),
(540, 'App\Models\User', 1699010811508943532, 'dots_customer', '3796957b91dd185902c1b2da3e207a0ed580545a67f8fb48da5308e25e9244e2', '["*"]', NULL, NULL, '2023-11-04 06:26:39', '2023-11-04 06:26:39'),
(541, 'App\Models\User', 1699010811508943532, 'dots_customer', '4d2b954d5152cc26fc79afec797c9c5644da8e195199e5dfe7a60a0213f7bbdb', '["*"]', NULL, NULL, '2023-11-04 06:26:53', '2023-11-04 06:26:53'),
(542, 'App\Models\User', 1699010811508943532, 'dots_customer', '1e5b74c63e1ada582c588fc4202b6ddb302e32a4404a95ca73b621d1d361ff43', '["*"]', NULL, NULL, '2023-11-04 06:27:03', '2023-11-04 06:27:03'),
(543, 'App\Models\User', 1699010811508943532, 'dots_customer', 'e90682732ba5fcf7af6c1b2c81da9a5197763b93337385d73aef9455d47cd434', '["*"]', NULL, NULL, '2023-11-04 06:27:09', '2023-11-04 06:27:09'),
(683, 'App\Models\User', 1699010811508943532, 'dots_customer', '97e494105300ee0410933324482be11737085beff05c2670a23395cb17583eec', '["*"]', NULL, NULL, '2023-11-13 07:17:12', '2023-11-13 07:17:12'),
(555, 'App\Models\User', 1699010811508943532, 'dots_customer', '98368a54f2342502f55c3e0b292d2289ceff51822ea87dd485f124accfda8800', '["*"]', '2023-11-09 02:57:18', NULL, '2023-11-09 02:55:57', '2023-11-09 02:57:18'),
(556, 'App\Models\User', 1699010811508943532, 'dots_customer', 'fb74b77a6b4b4559ac9ccfa23c8114925b0d92e5ebb144ce9397bf9492f78969', '["*"]', NULL, NULL, '2023-11-09 02:59:14', '2023-11-09 02:59:14'),
(546, 'App\Models\User', 1699010811508943532, 'dots_customer', 'd02022b1881005a60dd3959554c84265718ce67446a4e606dda5a6aa970511a0', '["*"]', '2023-11-04 11:44:54', NULL, '2023-11-04 07:37:22', '2023-11-04 11:44:54'),
(557, 'App\Models\User', 1699010811508943532, 'dots_customer', '2a0a9d72707bf1d77b9e947919cbde34c40fa9d9fc623dfe8eb409e8cce5303c', '["*"]', NULL, NULL, '2023-11-09 02:59:27', '2023-11-09 02:59:27'),
(553, 'App\Models\User', 1699010811508943532, 'dots_customer', '8987ae9031cfe70d560e3c0020ce9749fdff0561b61ef53e71166d3c72364a37', '["*"]', '2023-11-04 11:58:37', NULL, '2023-11-04 11:18:40', '2023-11-04 11:58:37'),
(544, 'App\Models\User', 1699010811508943532, 'dots_customer', '828e36c43c27bc286cc95eaf80eba8908b3ead1ca99e32655ff5e83b6e9f0f8c', '["*"]', '2023-11-04 06:30:10', NULL, '2023-11-04 06:27:24', '2023-11-04 06:30:10'),
(558, 'App\Models\User', 1699010811508943532, 'dots_customer', '9d95e3b6972005db201a53484ecb56346e65a9b99c7562797e55cb524c5d05aa', '["*"]', NULL, NULL, '2023-11-09 02:59:40', '2023-11-09 02:59:40'),
(559, 'App\Models\User', 1699010811508943532, 'dots_customer', 'd7071b9bae076e5cc724499a4d7825efb378992f1fb2db3f9a3b9ac939dbba2f', '["*"]', NULL, NULL, '2023-11-09 02:59:49', '2023-11-09 02:59:49'),
(560, 'App\Models\User', 1699010811508943532, 'dots_customer', 'b6089b39e8b57ddcb7bc6b6f0e17c65adba3fddecfad3d4113d1ec3bcfb68561', '["*"]', NULL, NULL, '2023-11-09 03:00:15', '2023-11-09 03:00:15'),
(545, 'App\Models\User', 1699010811508943532, 'dots_customer', '8204aa708b8c478c47694841b53abb1b46332d86a8471930ab20f9583bbb47bc', '["*"]', '2023-11-04 07:35:00', NULL, '2023-11-04 06:30:53', '2023-11-04 07:35:00'),
(561, 'App\Models\User', 1699010811508943532, 'dots_customer', 'e4c0d5672fa100bf34405cf2359795a4a7ebe0f0b0f897a97b1ddd9fafbbd8a7', '["*"]', NULL, NULL, '2023-11-09 03:00:20', '2023-11-09 03:00:20'),
(547, 'App\Models\User', 1699010811508943532, 'dots_customer', 'a5afedd4f2c8ae881c286d5872d8fd186bc242cd4c8ca50193c93e0e230819f5', '["*"]', NULL, NULL, '2023-11-04 07:37:54', '2023-11-04 07:37:54'),
(550, 'App\Models\User', 1699010811508943532, 'dots_customer', '7c8d3e8d465c9a65ab440078ed2ca9c86664a72373efdf6504ce02ce17874979', '["*"]', '2023-11-04 11:01:44', NULL, '2023-11-04 09:01:06', '2023-11-04 11:01:44'),
(551, 'App\Models\User', 1699010811508943532, 'dots_customer', '24ed20eb256198807892c646cc77477a56492663156acee087c45332db2f8ef5', '["*"]', NULL, NULL, '2023-11-04 11:18:17', '2023-11-04 11:18:17'),
(552, 'App\Models\User', 1699010811508943532, 'dots_customer', 'a60cfad256ec9fa0072d30fcf0425bfed7f9b6326fbcfedbe96b2b181bcbcaef', '["*"]', NULL, NULL, '2023-11-04 11:18:34', '2023-11-04 11:18:34'),
(548, 'App\Models\User', 1699010811508943532, 'dots_customer', '45b01932d7445e8a666a2e5854ca8a3c8c6b1b85bacd74bb2564ff26f925e0da', '["*"]', '2023-11-04 07:39:49', NULL, '2023-11-04 07:38:08', '2023-11-04 07:39:49'),
(549, 'App\Models\User', 1699010811508943532, 'dots_customer', '4595d48a6c93b2767746e9b53160af881df92debc5fd878ebc435e410d32440a', '["*"]', NULL, NULL, '2023-11-04 09:01:02', '2023-11-04 09:01:02'),
(562, 'App\Models\User', 1699010811508943532, 'dots_customer', '76b28ef3bf5f3ca1c6fb980ad4c641c8af13d4d5debb90b3998c07c9a56521fc', '["*"]', NULL, NULL, '2023-11-09 03:04:17', '2023-11-09 03:04:17'),
(563, 'App\Models\User', 1699010811508943532, 'dots_customer', '052f0103329f40747779ad49ffd86c375ab7369630030a7c04fd6c73abeecb88', '["*"]', NULL, NULL, '2023-11-09 03:11:38', '2023-11-09 03:11:38'),
(564, 'App\Models\User', 1699010811508943532, 'dots_customer', 'c0d79473cbc2f9b182d11129d8899cbc028eb218247058e931ca22b691d0621f', '["*"]', NULL, NULL, '2023-11-09 03:11:43', '2023-11-09 03:11:43'),
(565, 'App\Models\User', 1699010811508943532, 'dots_customer', 'f2b7264c82e36eb3ad5f3602fb4bbcb158381f50819dc41e84608c462da32e75', '["*"]', NULL, NULL, '2023-11-09 03:14:27', '2023-11-09 03:14:27'),
(566, 'App\Models\User', 1699010811508943532, 'dots_customer', '46f251baee7bfcb0e0626cb9b518dcee6eeed9f87e50785dfb14f54080f8d004', '["*"]', NULL, NULL, '2023-11-09 03:23:28', '2023-11-09 03:23:28'),
(567, 'App\Models\User', 1699010811508943532, 'dots_customer', 'a7853c7d28917146e43ed5b4bcf36d0b9d92d8ab75e9352321157a05edd32022', '["*"]', NULL, NULL, '2023-11-09 03:23:41', '2023-11-09 03:23:41'),
(568, 'App\Models\User', 1699010811508943532, 'dots_customer', '98d8fee8e13b5ec0036b0edb5ce98347bf1ce8c08fb13512d636a5d6b2eaf6d6', '["*"]', NULL, NULL, '2023-11-09 03:23:46', '2023-11-09 03:23:46'),
(554, 'App\Models\User', 1699010811508943532, 'dots_customer', '8061f92f0f59fedf6f2910023070149220034cadf6110a789b4acd4adc4d4863', '["*"]', '2023-11-06 12:49:39', NULL, '2023-11-06 09:53:20', '2023-11-06 12:49:39'),
(569, 'App\Models\User', 1699010811508943532, 'dots_customer', '60608dd926082af7ced2af236311d46421f82d6c2e04cb7c2b4360cb68b548aa', '["*"]', NULL, NULL, '2023-11-09 03:25:00', '2023-11-09 03:25:00'),
(570, 'App\Models\User', 1699010811508943532, 'dots_customer', '8f3cbbd827e8fe83773f2ed271bd442e1c0fc61a35d2a53205a9b45dab50dc09', '["*"]', NULL, NULL, '2023-11-09 03:25:07', '2023-11-09 03:25:07'),
(571, 'App\Models\User', 1699010811508943532, 'dots_customer', '808ff10f62515900a0401d01c5ecff7c605b6699d519bea4908fa4a12db58128', '["*"]', NULL, NULL, '2023-11-09 03:25:26', '2023-11-09 03:25:26'),
(572, 'App\Models\User', 1699503544718344760, 'dots_customer', 'f8a5bb0217de165b938286fd3b1854014df9cd598311695c133af240259b736a', '["*"]', NULL, NULL, '2023-11-09 04:19:45', '2023-11-09 04:19:45'),
(573, 'App\Models\User', 1699503544718344760, 'dots_customer', '0df2e12d94e4a755935fc8b228c3ac130992a39873ff346b2755b68dd930917d', '["*"]', NULL, NULL, '2023-11-09 04:19:50', '2023-11-09 04:19:50'),
(700, 'App\Models\User', 1699010811508943532, 'dots_customer', '0c712ca1bfb0d554402e580e812f2a230404be3fda64214b9663e3d8e5a33d3d', '["*"]', NULL, NULL, '2023-11-14 02:48:47', '2023-11-14 02:48:47'),
(574, 'App\Models\User', 1699503544718344760, 'dots_customer', '44e18fb55c656e8bdd0972012e472b3583c7c3584ecbaa965b6df483abef703c', '["*"]', NULL, NULL, '2023-11-09 04:19:57', '2023-11-09 04:19:57'),
(575, 'App\Models\User', 1699503544718344760, 'dots_customer', '6719209f5fe71fa266f7b44858ef6c66cdeef4ab8f84dab34a2d393f044b9179', '["*"]', NULL, NULL, '2023-11-09 04:19:59', '2023-11-09 04:19:59'),
(576, 'App\Models\User', 1699503544718344760, 'dots_customer', '626b2ffc7994786a1563590718344e68e87b6ce6503719a1ce56c2ae31ba18c0', '["*"]', NULL, NULL, '2023-11-09 04:20:00', '2023-11-09 04:20:00'),
(577, 'App\Models\User', 1699503544718344760, 'dots_customer', '594b73bee812a3a79c9b0287b72f1e2938d4256150d6e0df8dfff15ce5500f49', '["*"]', NULL, NULL, '2023-11-09 04:20:02', '2023-11-09 04:20:02'),
(578, 'App\Models\User', 1699503544718344760, 'dots_customer', '5c983fd50e99654a65dc4b405e72ae556016c9f786f0228085dd48d53b53ec22', '["*"]', NULL, NULL, '2023-11-09 04:20:04', '2023-11-09 04:20:04'),
(579, 'App\Models\User', 1699010811508943532, 'dots_customer', '4d98bde3131bf3524db5ccf27bf050aa2db23646d6890f2e91c3a1ecd5470812', '["*"]', NULL, NULL, '2023-11-09 04:23:45', '2023-11-09 04:23:45'),
(580, 'App\Models\User', 1699010811508943532, 'dots_customer', 'f4ef9c38b02e51822c98f31015b187e72fed94b36f0c78ad25e70cb2477c3592', '["*"]', NULL, NULL, '2023-11-09 04:23:51', '2023-11-09 04:23:51'),
(581, 'App\Models\User', 1699010811508943532, 'dots_customer', '5b96b4aadf32ade8bce4840594f3bb9085674a12f5a0e9e9d66adc1587bded9d', '["*"]', NULL, NULL, '2023-11-09 06:25:10', '2023-11-09 06:25:10'),
(582, 'App\Models\User', 1699010811508943532, 'dots_customer', '8b9cc5771d4cbb296187139975a13d7a1c96095d62aba844411e8cf2d2ed3d09', '["*"]', NULL, NULL, '2023-11-09 06:25:29', '2023-11-09 06:25:29'),
(583, 'App\Models\User', 1699010811508943532, 'dots_customer', '6e7ab72c25aa8e3d17ec34368923c24dfd4eaf0f2b9ebed404aa3d3e80c21ea6', '["*"]', NULL, NULL, '2023-11-09 06:26:10', '2023-11-09 06:26:10'),
(584, 'App\Models\User', 1699010811508943532, 'dots_customer', 'fa9727455a6608b5504da3cdd3e07570c16cc7386ecd164dd72d54bbcb2bd0c3', '["*"]', NULL, NULL, '2023-11-09 06:26:19', '2023-11-09 06:26:19'),
(601, 'App\Models\User', 1699010811508943532, 'dots_customer', 'ebe4204afd6a2a4e287805f30495217ba945aaf99b9e8787050a9e0bc9e8874c', '["*"]', '2023-11-10 10:32:41', NULL, '2023-11-10 10:31:11', '2023-11-10 10:32:41'),
(684, 'App\Models\User', 1699010811508943532, 'dots_customer', '8b456a629a29b112d99f3ac5b55cc8bba6da96dd4ef97e2e08ffa75f29e3a974', '["*"]', NULL, NULL, '2023-11-13 07:17:27', '2023-11-13 07:17:27'),
(701, 'App\Models\User', 1699010811508943532, 'dots_customer', '5f52ed9686b29d0240d06a8010e853581207e638e957530670eaa43ff0c9a27b', '["*"]', NULL, NULL, '2023-11-14 02:48:48', '2023-11-14 02:48:48'),
(711, 'App\Models\User', 1699010811508943532, 'dots_customer', '2321d7e2294040a6ec92f0df818b3b91b57c492f59c176524762c7e247cf30f5', '["*"]', NULL, NULL, '2023-11-14 03:03:57', '2023-11-14 03:03:57'),
(721, 'App\Models\User', 1699010811508943532, 'dots_customer', '58fc9bdfd51c5a4a88ff77515ab8fe6a990cd7ee6631be9deaa2b090491fea57', '["*"]', NULL, NULL, '2023-11-14 03:04:32', '2023-11-14 03:04:32'),
(731, 'App\Models\User', 1699010811508943532, 'dots_customer', '29b101843fab843507fedc6fe8b5ae4c35e06d659452150d357c7f5a8a9b89ad', '["*"]', NULL, NULL, '2023-11-14 03:06:39', '2023-11-14 03:06:39'),
(585, 'App\Models\User', 1699010811508943532, 'dots_customer', '6218b1c75d7aaab080c4492f75f510afd630e1c47e0d635c1855fdacca2d1d42', '["*"]', '2023-11-09 06:49:18', NULL, '2023-11-09 06:26:29', '2023-11-09 06:49:18'),
(586, 'App\Models\User', 1699010811508943532, 'dots_customer', 'ea7aabe43fce030eab31570dac4d22806cb2377eaf822407d33533415e90dbc4', '["*"]', NULL, NULL, '2023-11-10 06:43:11', '2023-11-10 06:43:11'),
(587, 'App\Models\User', 1699010811508943532, 'dots_customer', 'a69810d60c6b6644f42b6a7624087264288fe966f881e743e7216e13e918fd2d', '["*"]', NULL, NULL, '2023-11-10 06:52:26', '2023-11-10 06:52:26'),
(588, 'App\Models\User', 1699010811508943532, 'dots_customer', '630eea807ccab450b97d2f732bbf6aa1d3f59a5d64bb89b4d77adf111d98b5f0', '["*"]', NULL, NULL, '2023-11-10 07:04:25', '2023-11-10 07:04:25'),
(589, 'App\Models\User', 1699010811508943532, 'dots_customer', '1e672016075839cc9c308096ee9988e633a4320528531e97e1280745dabe02f8', '["*"]', NULL, NULL, '2023-11-10 09:34:57', '2023-11-10 09:34:57'),
(590, 'App\Models\User', 1699010811508943532, 'dots_customer', 'a3ea13e6a66e0564135d657db80d57a9d13d4f50bd596267254c5a0031b962cb', '["*"]', NULL, NULL, '2023-11-10 09:35:37', '2023-11-10 09:35:37'),
(591, 'App\Models\User', 1699010811508943532, 'dots_customer', '8f352d3e080dbe04beec6b9cd6d12551bd9528ea863f76148dac8dc4425ea27e', '["*"]', NULL, NULL, '2023-11-10 10:03:09', '2023-11-10 10:03:09'),
(592, 'App\Models\User', 1699010811508943532, 'dots_customer', 'e92e84118531e948bd1c56be41253512f6be20a12de1680844d9fdd413fc33db', '["*"]', NULL, NULL, '2023-11-10 10:03:51', '2023-11-10 10:03:51'),
(593, 'App\Models\User', 1699010811508943532, 'dots_customer', '09b71201a54f7e633b28bec3b2e3c741a9a21bd3c11591122f66ccf6377a8a03', '["*"]', NULL, NULL, '2023-11-10 10:24:12', '2023-11-10 10:24:12'),
(594, 'App\Models\User', 1699010811508943532, 'dots_customer', '968c22d983d41f1cd0a271f764803fdb4a956c2270f1b25d05db1ef12f07f16d', '["*"]', NULL, NULL, '2023-11-10 10:24:14', '2023-11-10 10:24:14'),
(595, 'App\Models\User', 1699010811508943532, 'dots_customer', 'f9e1d53dcdbc588e34b63146ab872880efd7adbc0eaf1e1dfdb074be53fb62d6', '["*"]', NULL, NULL, '2023-11-10 10:24:23', '2023-11-10 10:24:23'),
(596, 'App\Models\User', 1699010811508943532, 'dots_customer', '96d92cb16a492c12cc40a0a938527256192141f5c1eee70b73263662538293f9', '["*"]', NULL, NULL, '2023-11-10 10:24:25', '2023-11-10 10:24:25'),
(602, 'App\Models\User', 1699010811508943532, 'dots_customer', '9c7fda417e162b406c2805de73cb7b3c10f9517003e3ada0696728d276572661', '["*"]', '2023-11-10 10:37:33', NULL, '2023-11-10 10:33:06', '2023-11-10 10:37:33'),
(603, 'App\Models\User', 1699010811508943532, 'dots_customer', '53e3ee2c37d39399febe152d83ce6701cf7e92e4b156a7f107711521ea5784dc', '["*"]', NULL, NULL, '2023-11-10 10:38:18', '2023-11-10 10:38:18'),
(604, 'App\Models\User', 1699010811508943532, 'dots_customer', '64fe6f8ebcc59fb26188583a6952d243bb148cd45a89c9810ec2170ac520da61', '["*"]', NULL, NULL, '2023-11-10 10:38:22', '2023-11-10 10:38:22'),
(605, 'App\Models\User', 1699010811508943532, 'dots_customer', '61045d6690994470816a5a64ddc2d81ccf44359e317ba0137db64a36828d6140', '["*"]', NULL, NULL, '2023-11-10 10:38:22', '2023-11-10 10:38:22'),
(597, 'App\Models\User', 1699010811508943532, 'dots_customer', '30f786a6e4fd82caf4c70f06bbfe586ed7f70b177aa05923eedb632e0e2e4ec5', '["*"]', '2023-11-10 10:28:31', NULL, '2023-11-10 10:25:14', '2023-11-10 10:28:31'),
(598, 'App\Models\User', 1699010811508943532, 'dots_customer', '7b659bb89b2cf975eec2a0275b0a7f82a0d249bb97ab8db3dd24a271d8fae0eb', '["*"]', NULL, NULL, '2023-11-10 10:28:53', '2023-11-10 10:28:53'),
(606, 'App\Models\User', 1699010811508943532, 'dots_customer', '7aef6288dd1cfd77e8d94c1a6c2f9bf7aeea17ec327797ed43ae449ae2150448', '["*"]', NULL, NULL, '2023-11-10 10:38:23', '2023-11-10 10:38:23'),
(599, 'App\Models\User', 1699010811508943532, 'dots_customer', '613a9f0beb12b040259a83e1cfda7f1795dad41dd50e664d6e1fa046b0b21c3a', '["*"]', '2023-11-10 10:29:36', NULL, '2023-11-10 10:28:56', '2023-11-10 10:29:36'),
(600, 'App\Models\User', 1699010811508943532, 'dots_customer', '05697a1f2f35e794745ef35f2de0493a0f25a7ad7130f64d293272b8352bc9bb', '["*"]', NULL, NULL, '2023-11-10 10:30:15', '2023-11-10 10:30:15'),
(607, 'App\Models\User', 1699010811508943532, 'dots_customer', '1417c004b87df621abb65e13150709a999f70696f6b544890e8b80ef573c3c4a', '["*"]', NULL, NULL, '2023-11-10 10:38:23', '2023-11-10 10:38:23'),
(741, 'App\Models\User', 1699010811508943532, 'dots_customer', 'bb0836bf8cd49cd767583707e21d0e826e463f0d0921a8fb2d9e705dba4b7e99', '["*"]', NULL, NULL, '2023-11-14 03:06:44', '2023-11-14 03:06:44'),
(608, 'App\Models\User', 1699010811508943532, 'dots_customer', 'c939982e9a41cf5789c5f0cc7df9e4aceaadecaea3aa320b8f9284c4655fcafd', '["*"]', NULL, NULL, '2023-11-10 10:38:23', '2023-11-10 10:38:23'),
(609, 'App\Models\User', 1699010811508943532, 'dots_customer', '94968077c8b015c3fc6a4933391159d3873a3e24eca77d1b6c5fbd53f4de92ed', '["*"]', NULL, NULL, '2023-11-10 10:38:24', '2023-11-10 10:38:24'),
(610, 'App\Models\User', 1699010811508943532, 'dots_customer', 'c6d98a2b72adf9856f7d8c04ffc3c6b15e589cd206a04c9837aea6cd0422e63d', '["*"]', NULL, NULL, '2023-11-10 10:38:24', '2023-11-10 10:38:24'),
(611, 'App\Models\User', 1699010811508943532, 'dots_customer', '7d08ff042546fb82670599296b7daf5e3a6ca45839d6e3ba39ae7d0d98424e64', '["*"]', NULL, NULL, '2023-11-10 10:38:24', '2023-11-10 10:38:24'),
(612, 'App\Models\User', 1699010811508943532, 'dots_customer', 'aa14b479fdc3f61c5aa305b88c70a6710662bb438984211559a4c902939da6f4', '["*"]', NULL, NULL, '2023-11-10 10:38:25', '2023-11-10 10:38:25'),
(613, 'App\Models\User', 1699010811508943532, 'dots_customer', '4db06e4cb6dec832dc24d9ec5b90951aa5c28ad183b1f7fe919564878a459444', '["*"]', NULL, NULL, '2023-11-10 10:38:27', '2023-11-10 10:38:27'),
(751, 'App\Models\User', 1699010811508943532, 'dots_customer', 'b7796535e8d01cdb00fc6c730eaaced9b452392bd83a31eba2aadfbb7aee53f4', '["*"]', NULL, NULL, '2023-11-14 03:06:47', '2023-11-14 03:06:47'),
(614, 'App\Models\User', 1699010811508943532, 'dots_customer', 'ebfb3141f8c611454b42babddacab4469f90f1830fc712054c11e1e731861dac', '["*"]', '2023-11-10 10:44:30', NULL, '2023-11-10 10:39:08', '2023-11-10 10:44:30'),
(615, 'App\Models\User', 1699010811508943532, 'dots_customer', '42522c2dc18147a53006ee51347c687c67b332fb8a2bba9d5f7a76fe605513fc', '["*"]', '2023-11-10 10:44:45', NULL, '2023-11-10 10:44:44', '2023-11-10 10:44:45'),
(685, 'App\Models\User', 1699010811508943532, 'dots_customer', '4b6b89b2510a1239be6fa35edf1759ed45502026af6b04d3e316e054b4e2a46e', '["*"]', '2023-11-13 07:18:37', NULL, '2023-11-13 07:18:11', '2023-11-13 07:18:37'),
(702, 'App\Models\User', 1699010811508943532, 'dots_customer', 'a5dd55ea0363c69e00bad02acc1666d4714dfc255f713bb00fd13c5925256b7b', '["*"]', NULL, NULL, '2023-11-14 03:00:37', '2023-11-14 03:00:37'),
(712, 'App\Models\User', 1699010811508943532, 'dots_customer', '3f597434a00ab3309d164b90d13e934db70a990ee4e8644476f6d5dfd9074272', '["*"]', NULL, NULL, '2023-11-14 03:03:57', '2023-11-14 03:03:57'),
(722, 'App\Models\User', 1699010811508943532, 'dots_customer', '7b560cb03d1bf51929ba76b476b5a6300d505af35c5a53a67fbcd54ac9dd1ace', '["*"]', NULL, NULL, '2023-11-14 03:04:33', '2023-11-14 03:04:33'),
(629, 'App\Models\User', 1690352882692784734, 'dots_customer', 'f4c40df03fe91d651af365250432b5aa4064eb95b468948e322fb1b58ea4f56d', '["*"]', '2023-11-10 11:03:10', NULL, '2023-11-10 11:00:48', '2023-11-10 11:03:10'),
(616, 'App\Models\User', 1699010811508943532, 'dots_customer', '7bcc3451ba634f4012e07f606e82f12c44292c8f44495ab190a7338e17bea4eb', '["*"]', '2023-11-10 10:59:23', NULL, '2023-11-10 10:45:07', '2023-11-10 10:59:23'),
(621, 'App\Models\User', 1690352882692784734, 'dots_customer', '22333cc735606e9a393cecb2c3085ecaa4fa0d5e1be80202d0aa07f5b9fc7ab6', '["*"]', NULL, NULL, '2023-11-10 10:59:42', '2023-11-10 10:59:42'),
(622, 'App\Models\User', 1690352882692784734, 'dots_customer', '586dd9685998899c1bc6a38cf93f14afda810ddc51bcf1fe80165929198db6f1', '["*"]', NULL, NULL, '2023-11-10 10:59:44', '2023-11-10 10:59:44'),
(623, 'App\Models\User', 1690352882692784734, 'dots_customer', '64769b0980a83a533512f0ad798bc5560e8b65ca012ca995674e50c270e4595c', '["*"]', NULL, NULL, '2023-11-10 10:59:53', '2023-11-10 10:59:53'),
(624, 'App\Models\User', 1690352882692784734, 'dots_customer', 'f6ffc9b270e0cefca7c25237a4d1f8ee8b42769108dbde6abe151222c643de9a', '["*"]', NULL, NULL, '2023-11-10 10:59:55', '2023-11-10 10:59:55'),
(620, 'App\Models\User', 1699101041189376702, 'dots_customer', '15d01754dbe44be3de85cf5b0aaf83ffff940f68c2d402debf6adb0af18471d4', '["*"]', '2023-11-10 10:58:04', NULL, '2023-11-10 10:57:51', '2023-11-10 10:58:04'),
(625, 'App\Models\User', 1690352882692784734, 'dots_customer', '9ecaa1b38c7f61af4b404eba694578a3d6e99eedb289b4276854f9d1db374d60', '["*"]', NULL, NULL, '2023-11-10 11:00:14', '2023-11-10 11:00:14'),
(626, 'App\Models\User', 1690352882692784734, 'dots_customer', '4fcaf4a7b54b0359d54577b12e7138b399b64104440ecf9ad7384619af9a3e07', '["*"]', NULL, NULL, '2023-11-10 11:00:15', '2023-11-10 11:00:15'),
(627, 'App\Models\User', 1690352882692784734, 'dots_customer', '9d8cde60942778f2d7593524b51f9596d95b587fb11cdb1fa520ff3f4529fca4', '["*"]', NULL, NULL, '2023-11-10 11:00:15', '2023-11-10 11:00:15'),
(617, 'App\Models\User', 1699511631307528945, 'dots_customer', '7772ab28879d75b32ed24965827610102f55a3121584812884f1cc8f3d7465fe', '["*"]', '2023-11-10 10:56:59', NULL, '2023-11-10 10:56:46', '2023-11-10 10:56:59'),
(628, 'App\Models\User', 1690352882692784734, 'dots_customer', '61ce5ca3d8917d554b321d7ad9b9ca31f9443a42fa67cc01343a8262a417f739', '["*"]', NULL, NULL, '2023-11-10 11:00:44', '2023-11-10 11:00:44'),
(630, 'App\Models\User', 1690352882692784734, 'dots_customer', 'f49a9f94fe6ba05d6abcb2dc05fc9246a4a18afb901a6d5c2d65b99470ac0f19', '["*"]', NULL, NULL, '2023-11-10 11:00:53', '2023-11-10 11:00:53'),
(631, 'App\Models\User', 1690352882692784734, 'dots_customer', '48c84b94b0074abc20f7067369744b8c8ba653497e389bc88ae6b46f2a2f9138', '["*"]', NULL, NULL, '2023-11-10 11:00:54', '2023-11-10 11:00:54'),
(632, 'App\Models\User', 1690352882692784734, 'dots_customer', 'e8752d6c54606c7fd84200528e487bc4b97424f91c66525365c848dd657c8cf1', '["*"]', NULL, NULL, '2023-11-10 11:00:54', '2023-11-10 11:00:54'),
(633, 'App\Models\User', 1690352882692784734, 'dots_customer', '2d238cbeb4fac0c56be44bcdac898d61261146d273f7bebb5a9da5d3d2fce821', '["*"]', NULL, NULL, '2023-11-10 11:00:55', '2023-11-10 11:00:55'),
(634, 'App\Models\User', 1690352882692784734, 'dots_customer', '54dbf131e720bcda22fd4daa1f4f2ddf875d14f565de987083729778d80fa570', '["*"]', NULL, NULL, '2023-11-10 11:00:55', '2023-11-10 11:00:55'),
(635, 'App\Models\User', 1690352882692784734, 'dots_customer', '47e6b033d49a4cfcf438493d7651dac140151b0b3072414ca6eb2f63adc32bba', '["*"]', NULL, NULL, '2023-11-10 11:00:55', '2023-11-10 11:00:55'),
(636, 'App\Models\User', 1690352882692784734, 'dots_customer', '7ede4c9816802a9acfd411e6ddd2bab429b58a875b8c0cef5c7521f31e3dfc4a', '["*"]', NULL, NULL, '2023-11-10 11:00:56', '2023-11-10 11:00:56'),
(637, 'App\Models\User', 1690352882692784734, 'dots_customer', 'baa6c9ae1e438b1813907d3b1717535144450abeaf466609011459b5d01a20ec', '["*"]', NULL, NULL, '2023-11-10 11:00:56', '2023-11-10 11:00:56'),
(618, 'App\Models\User', 169900759578682253, 'dots_customer', '20928217a3d4b6819e48647f5f2c3c78ab6546fea447fab7582a72bc534ea059', '["*"]', '2023-11-10 10:57:24', NULL, '2023-11-10 10:57:09', '2023-11-10 10:57:24'),
(638, 'App\Models\User', 1699010811508943532, 'dots_customer', '9e8c4ba297779d5d04dca49985329c3230c12ce05379ba58324de186c02f637d', '["*"]', '2023-11-10 11:04:35', NULL, '2023-11-10 11:01:27', '2023-11-10 11:04:35'),
(619, 'App\Models\User', 1699503544718344760, 'dots_customer', 'af93842fb634c0bd7e0427b7861bd62447770eeb4ec696e599d51273e2e97cfa', '["*"]', '2023-11-10 10:57:41', NULL, '2023-11-10 10:57:31', '2023-11-10 10:57:41'),
(640, 'App\Models\User', 1690352882692784734, 'dots_customer', '97b56c4ec2a6ee0293a9354a8188f15a9802d2267955ba5d06805ab335c98c8a', '["*"]', NULL, NULL, '2023-11-10 11:13:33', '2023-11-10 11:13:33'),
(641, 'App\Models\User', 1690352882692784734, 'dots_customer', '6ca2336723b1eab93e02d10136fcc4d7862d77eb1a5780abf3f04bf94c4bbab3', '["*"]', NULL, NULL, '2023-11-10 11:13:36', '2023-11-10 11:13:36'),
(642, 'App\Models\User', 1690352882692784734, 'dots_customer', 'e9a5db598daac97dc97774fabc923fa91e8a9ffc2cbce6e74bef8b10611abf31', '["*"]', NULL, NULL, '2023-11-10 11:13:38', '2023-11-10 11:13:38'),
(643, 'App\Models\User', 1690352882692784734, 'dots_customer', '98274000e212b11d58019c32386033c521a0e562de78b8c219a2e68b9bb04472', '["*"]', NULL, NULL, '2023-11-10 11:15:13', '2023-11-10 11:15:13'),
(644, 'App\Models\User', 1690352882692784734, 'dots_customer', '1fdfadd453779ca4eba336ef2294573c9228e3e33ace67a77b65308dbfca3151', '["*"]', NULL, NULL, '2023-11-10 11:15:13', '2023-11-10 11:15:13'),
(639, 'App\Models\User', 1690352882692784734, 'dots_customer', 'eb6413d774c6f30c545848fe64c61aed9d30dfd98cb090edb17082d9a3f080d4', '["*"]', NULL, NULL, '2023-11-10 11:03:00', '2023-11-10 11:03:00'),
(645, 'App\Models\User', 1690352882692784734, 'dots_customer', '0fad027c9f356573188ed574ebf6ebf394d5ae799c79b8477bcd1b123aad65ed', '["*"]', NULL, NULL, '2023-11-10 11:15:16', '2023-11-10 11:15:16'),
(646, 'App\Models\User', 1690352882692784734, 'dots_customer', 'f7e8d474dba653be0664adfe69bfaf6b4c3d7cfc1c14a5f87c0d1675ad94150a', '["*"]', NULL, NULL, '2023-11-10 11:15:16', '2023-11-10 11:15:16'),
(647, 'App\Models\User', 1690352882692784734, 'dots_customer', 'a9c3b0dc1e779b3531fa6934f5f12cf045627f0a79e549fe2df08448f48bde73', '["*"]', NULL, NULL, '2023-11-10 11:15:17', '2023-11-10 11:15:17'),
(648, 'App\Models\User', 1690352882692784734, 'dots_customer', 'e4cbf4ebd4a93eadc6a5a0c55be6cd5af7c6f4ff03c3a63d81cde4dcd184bd8f', '["*"]', NULL, NULL, '2023-11-10 11:15:18', '2023-11-10 11:15:18'),
(649, 'App\Models\User', 1690352882692784734, 'dots_customer', '4ff832be6ff187b38038d126c2defe5156d8f37de115f39ee293e5106c83172a', '["*"]', NULL, NULL, '2023-11-10 11:15:18', '2023-11-10 11:15:18'),
(732, 'App\Models\User', 1699010811508943532, 'dots_customer', '82003903cb4bd9e33e464c2e686bd3fe1d8baf7ba95631d7b604ab19abee63d4', '["*"]', NULL, NULL, '2023-11-14 03:06:39', '2023-11-14 03:06:39'),
(650, 'App\Models\User', 1690352882692784734, 'dots_customer', '950a43e2adb90960a6f23a0b46a320e11736262cbfb93967f8650dfd86960e13', '["*"]', NULL, NULL, '2023-11-10 11:15:18', '2023-11-10 11:15:18'),
(651, 'App\Models\User', 1690352882692784734, 'dots_customer', '3daf6c6e48b1673610d5580a6149d40525ea4ef0a5b9314d5d9b9a26c5fcaaf2', '["*"]', NULL, NULL, '2023-11-10 11:15:19', '2023-11-10 11:15:19'),
(652, 'App\Models\User', 1697540384585789784, 'dots_customer', '9794bda5cb0945ee5856851699fcb82224cdd4bd3dd054ab4dd691431512aaa1', '["*"]', NULL, NULL, '2023-11-10 11:16:17', '2023-11-10 11:16:17'),
(653, 'App\Models\User', 1697540384585789784, 'dots_customer', '2fa72f78dd691a901a9a251b431f851f0f28e21a87a454f9984d20979302a59c', '["*"]', NULL, NULL, '2023-11-10 11:16:19', '2023-11-10 11:16:19'),
(742, 'App\Models\User', 1699010811508943532, 'dots_customer', 'bcd380851fb02e2ac97330a6e24079a5edf0ecf75e27f8f0bdbf338af36ff79a', '["*"]', NULL, NULL, '2023-11-14 03:06:44', '2023-11-14 03:06:44'),
(654, 'App\Models\User', 1697540384585789784, 'dots_customer', '53095d600aaeb21c0d26b4e8d5e1affd9f05d57bff44261a6f24dc3f2f97c7b6', '["*"]', NULL, NULL, '2023-11-10 11:16:19', '2023-11-10 11:16:19'),
(655, 'App\Models\User', 1697540384585789784, 'dots_customer', '25358c99342976b46106e38251ea5fd815f9fb692a13b3a5813f54b9e4a05b8b', '["*"]', NULL, NULL, '2023-11-10 11:16:19', '2023-11-10 11:16:19'),
(656, 'App\Models\User', 1697540384585789784, 'dots_customer', '52d2bed14fe71e7a295d2b828a1bf99525eb4060172187a1f4e3cdd3fd44814b', '["*"]', NULL, NULL, '2023-11-10 11:16:20', '2023-11-10 11:16:20'),
(657, 'App\Models\User', 1697540384585789784, 'dots_customer', 'a63d1384bdba7a8f7ac755ee08dd4136a98f90832555aa4df0d27826a8afe7f4', '["*"]', NULL, NULL, '2023-11-10 11:16:25', '2023-11-10 11:16:25'),
(658, 'App\Models\User', 1697540384585789784, 'dots_customer', '81a47424bd9fc5c7afb34f394f64c68f814ee835a7ed431104cbd4b604dfd3b4', '["*"]', NULL, NULL, '2023-11-10 11:16:27', '2023-11-10 11:16:27'),
(659, 'App\Models\User', 1697540384585789784, 'dots_customer', 'acd82d31dc9b48ba1d25405f07b06987f57d6aced20e1a3945bb64d372335fde', '["*"]', NULL, NULL, '2023-11-10 11:16:27', '2023-11-10 11:16:27'),
(660, 'App\Models\User', 1697540384585789784, 'dots_customer', '624d4bd2f143f8019a52a8aa6c3b02700fb9e7bd284743a0c2af6ea90a253491', '["*"]', NULL, NULL, '2023-11-10 11:16:27', '2023-11-10 11:16:27'),
(661, 'App\Models\User', 1697540384585789784, 'dots_customer', 'f15597af385345698ffaacf808b4f9629aef55556bb673a3bc01956627567b19', '["*"]', NULL, NULL, '2023-11-10 11:16:28', '2023-11-10 11:16:28'),
(662, 'App\Models\User', 1697540384585789784, 'dots_customer', 'd6d0c407dcc2dc5c6f9eb80224f0330fd9900b8bb4d3af8ad686f061090abb0b', '["*"]', NULL, NULL, '2023-11-10 11:16:28', '2023-11-10 11:16:28'),
(663, 'App\Models\User', 1697540384585789784, 'dots_customer', '334b871724c1c5e49aead94acfbd42b7300e087ba60ced50cc0a9e8c6263e50b', '["*"]', NULL, NULL, '2023-11-10 11:16:28', '2023-11-10 11:16:28'),
(664, 'App\Models\User', 1697540384585789784, 'dots_customer', '38e1217d510175b0717ab4dbe1240976b901c153a0d319e4a13d16adecb0db11', '["*"]', NULL, NULL, '2023-11-10 11:16:37', '2023-11-10 11:16:37'),
(665, 'App\Models\User', 1697540384585789784, 'dots_customer', '6b49040da577394396b9cea8958eeb418aa2d443d50b1f8698a31dd11f453475', '["*"]', NULL, NULL, '2023-11-10 11:16:40', '2023-11-10 11:16:40'),
(666, 'App\Models\User', 1697540384585789784, 'dots_customer', 'b2018a43a308cf505145d5b5956f353d7faacd8e2d4c809c9b00e45716d7b3ba', '["*"]', NULL, NULL, '2023-11-10 11:16:40', '2023-11-10 11:16:40'),
(667, 'App\Models\User', 1697540384585789784, 'dots_customer', '2ab7f3d1d1343bd60507365bcb7e5187b2c64a18158f8ab7de35b8d30ce77c42', '["*"]', NULL, NULL, '2023-11-10 11:16:40', '2023-11-10 11:16:40'),
(668, 'App\Models\User', 1697540384585789784, 'dots_customer', '3b9c6655e2093298979b8e47d8e3b695631285d033f421c8d821fbe7ad397e66', '["*"]', NULL, NULL, '2023-11-10 11:16:41', '2023-11-10 11:16:41'),
(669, 'App\Models\User', 1697540384585789784, 'dots_customer', '3892892906e948afc2d457722e55be196e2601e175082f72a7cd96941fbe4eaf', '["*"]', NULL, NULL, '2023-11-10 11:16:42', '2023-11-10 11:16:42'),
(670, 'App\Models\User', 1697540384585789784, 'dots_customer', '5884467473cea1e9970df570158257babed1840885a6cd68236b771a6f99d13f', '["*"]', NULL, NULL, '2023-11-10 11:16:42', '2023-11-10 11:16:42'),
(671, 'App\Models\User', 1697540384585789784, 'dots_customer', '6e91af215dca30e95cd3f9f8cd7ce78443e94f5ba1d5c855e72aead013f7a3b0', '["*"]', NULL, NULL, '2023-11-10 11:16:43', '2023-11-10 11:16:43'),
(672, 'App\Models\User', 1697540384585789784, 'dots_customer', '9b3eb1c15771fc7ee3ac75dc455eaa2ea36af87f6311eeb4d66dfa2fdb7bf93e', '["*"]', NULL, NULL, '2023-11-10 11:16:43', '2023-11-10 11:16:43'),
(673, 'App\Models\User', 1697540384585789784, 'dots_customer', 'c7f4e5af15c150b8c9a95666d1aa4e76c195bbcb766602594cec7fbc0036fd53', '["*"]', NULL, NULL, '2023-11-10 11:16:44', '2023-11-10 11:16:44'),
(674, 'App\Models\User', 1697540384585789784, 'dots_customer', 'decae5aef2c8e600776b85ce7cfb613bb21d55a7782e6e830e2744c5bbe80978', '["*"]', NULL, NULL, '2023-11-10 11:16:44', '2023-11-10 11:16:44'),
(675, 'App\Models\User', 1697540384585789784, 'dots_customer', '6bdc47375191b2cbf83777e1653036a381112330ec6b3a83ad48758561e24b29', '["*"]', NULL, NULL, '2023-11-10 11:16:45', '2023-11-10 11:16:45'),
(703, 'App\Models\User', 1699010811508943532, 'dots_customer', '5905f9d9633266e992ec26a58a879bccbf385fdc5166031964dbad3b5c168f40', '["*"]', NULL, NULL, '2023-11-14 03:00:40', '2023-11-14 03:00:40'),
(713, 'App\Models\User', 1699010811508943532, 'dots_customer', 'ea91b2d8db043cb37d956b038a3faf0146105f65a87d512276dcf3e03bda1973', '["*"]', NULL, NULL, '2023-11-14 03:03:57', '2023-11-14 03:03:57'),
(723, 'App\Models\User', 1699010811508943532, 'dots_customer', 'b42151f2b7555e184e29c3858af9e9891e217e291c24b5be30c5e00d94c29704', '["*"]', NULL, NULL, '2023-11-14 03:04:37', '2023-11-14 03:04:37'),
(733, 'App\Models\User', 1699010811508943532, 'dots_customer', '929f2c1bae7f842f631f38a50c94f7dec34ab63915bc89945a1f87bd2d44520a', '["*"]', NULL, NULL, '2023-11-14 03:06:39', '2023-11-14 03:06:39'),
(743, 'App\Models\User', 1699010811508943532, 'dots_customer', '1b0565319d9edebb298a809135f7baa53c9120224345aa790ecb250fa1bc7298', '["*"]', NULL, NULL, '2023-11-14 03:06:44', '2023-11-14 03:06:44'),
(752, 'App\Models\User', 1699010811508943532, 'dots_customer', 'a87057bff6af683c29d6c06dde54b3406c5935ec5432fccf4ba60aba1d760e05', '["*"]', NULL, NULL, '2023-11-14 03:06:47', '2023-11-14 03:06:47'),
(760, 'App\Models\User', 1699010811508943532, 'dots_customer', 'ad707aad3232c20b454f94ee86d31d517b86f34739286669674802eb75182377', '["*"]', NULL, NULL, '2023-11-14 03:06:51', '2023-11-14 03:06:51'),
(768, 'App\Models\User', 1699010811508943532, 'dots_customer', '3dc08f86e93d4c8c3ae019201f20a11df2d87e3caf84ba63cf44c925490f97cc', '["*"]', NULL, NULL, '2023-11-14 03:18:09', '2023-11-14 03:18:09'),
(775, 'App\Models\User', 1699010811508943532, 'dots_customer', '1cd0111ea97c12e20d414289e065af2f040a8885267df6834778804b1a2eb1f1', '["*"]', NULL, NULL, '2023-11-14 03:20:42', '2023-11-14 03:20:42'),
(782, 'App\Models\User', 1699010811508943532, 'dots_customer', 'ae4e73b614cb3ba213ff82d3154e237bb5a704ea4355d0771ffc39f7c4c9c982', '["*"]', NULL, NULL, '2023-11-14 03:22:40', '2023-11-14 03:22:40'),
(788, 'App\Models\User', 1699010811508943532, 'dots_customer', 'f7ef7b57af6a4f34401dcac527e01fc0768c2a58a9a71b2a41a845b3e7ca31ad', '["*"]', NULL, NULL, '2023-11-14 03:36:13', '2023-11-14 03:36:13'),
(794, 'App\Models\User', 1699010811508943532, 'dots_customer', '9cf9eb3aa932826dd36ca96f8f55652990e90fc33a60d6b3c6959e556d245162', '["*"]', NULL, NULL, '2023-11-14 03:45:23', '2023-11-14 03:45:23'),
(875, 'App\Models\User', 1699010811508943532, 'dots_customer', '7bd0b68413328fb03ca7706b8959946ba23dccc2e8a72c687944a9cbec797cd8', '["*"]', NULL, NULL, '2023-11-21 10:25:19', '2023-11-21 10:25:19'),
(844, 'App\Models\User', 1699010811508943532, 'dots_customer', 'bf7a20b7eb24965d29a1270f02202c97bf2f2240a5a0d5589fa4201fb272474c', '["*"]', '2023-11-15 06:56:25', NULL, '2023-11-15 06:56:05', '2023-11-15 06:56:25'),
(820, 'App\Models\User', 1699010811508943532, 'dots_customer', 'cb230e4a108282c815fdd636d73b9dd047ccc0cf8af6a2bd2538793e6cd2cb9c', '["*"]', '2023-11-15 04:24:57', NULL, '2023-11-15 04:24:14', '2023-11-15 04:24:57'),
(800, 'App\Models\User', 1699010811508943532, 'dots_customer', 'a6ed8d725d11fdd66d8b863fa65e711f91bfaad267035d042b8e62cf28635fa7', '["*"]', '2023-11-14 09:08:30', NULL, '2023-11-14 04:56:06', '2023-11-14 09:08:30'),
(812, 'App\Models\User', 1699010811508943532, 'dots_customer', 'ea99aacd620605f3b4bcf0ff415b63564fdb5b76e80a85a9f475cbb1fce2868e', '["*"]', '2023-11-15 02:36:35', NULL, '2023-11-15 02:36:24', '2023-11-15 02:36:35'),
(852, 'App\Models\User', 1699010811508943532, 'dots_customer', '2a0cdca89ec0fe4192ee2f6ea834fde28be11fd132bc8750fcd4e2e10a41d8e1', '["*"]', NULL, NULL, '2023-11-15 07:53:54', '2023-11-15 07:53:54'),
(828, 'App\Models\User', 1699010811508943532, 'dots_customer', '181c3d5de5e5633135aa251e4fe98ba2f49e4acfb6b5f484aaedbb90662ecaa1', '["*"]', NULL, NULL, '2023-11-15 06:19:45', '2023-11-15 06:19:45'),
(836, 'App\Models\User', 1699010811508943532, 'dots_customer', '49d0292186e955c843a7c10398637adc343435018585b591707fb5b608ff3bac', '["*"]', '2023-11-15 06:36:19', NULL, '2023-11-15 06:36:18', '2023-11-15 06:36:19'),
(860, 'App\Models\User', 1699010811508943532, 'dots_customer', 'ba9849fd62dc258aaceebd44fa6a3db3f3f4bc3bc830c70896b8b34df2eaa800', '["*"]', NULL, NULL, '2023-11-15 09:19:15', '2023-11-15 09:19:15');

INSERT INTO "public"."savings" ("id", "customer_id", "external_id", "current_balance", "available_balance", "status", "product_type", "last_synced_at", "created_by", "updated_by", "deleted_by", "created_at", "updated_at", "deleted_at", "tenant_id") VALUES
(1699946675762188405, '0006018', NULL, 230000, NULL, 0, '02', NULL, 1699010811508943532, 1699010811508943532, NULL, '2023-11-14 07:24:35+07', '2023-11-14 07:24:35+07', NULL, '30');
INSERT INTO "public"."savings" ("id", "customer_id", "external_id", "current_balance", "available_balance", "status", "product_type", "last_synced_at", "created_by", "updated_by", "deleted_by", "created_at", "updated_at", "deleted_at", "tenant_id") VALUES
(170001904614084592, '0006018', NULL, 949764679, NULL, 0, '01', NULL, 1699010811508943532, 1699010811508943532, NULL, '2023-11-15 03:30:46+07', '2023-11-15 03:30:46+07', NULL, '30');
INSERT INTO "public"."savings" ("id", "customer_id", "external_id", "current_balance", "available_balance", "status", "product_type", "last_synced_at", "created_by", "updated_by", "deleted_by", "created_at", "updated_at", "deleted_at", "tenant_id") VALUES
(1700036982993348402, '0006018', NULL, 818494, NULL, 0, '01', NULL, 1699010811508943532, 1699010811508943532, NULL, '2023-11-15 08:29:42+07', '2023-11-15 08:29:42+07', NULL, '30');



INSERT INTO "public"."tenants" ("id", "public_id", "name", "database_schema_name", "core_type", "core_database_type", "core_database_dsn", "logo_url_base64", "client_type") VALUES
('6', 'ksp_spb', 'KSP Sinar Pelita Bandung', 'ksp_spb', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_sinar_pelita_bandung', NULL, NULL);
INSERT INTO "public"."tenants" ("id", "public_id", "name", "database_schema_name", "core_type", "core_database_type", "core_database_dsn", "logo_url_base64", "client_type") VALUES
('1', 'bpr_lka', 'BPR Logo Karo Asri', 'karoasri', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.104:1433?database=dots', '', NULL);
INSERT INTO "public"."tenants" ("id", "public_id", "name", "database_schema_name", "core_type", "core_database_type", "core_database_dsn", "logo_url_base64", "client_type") VALUES
('2', 'bpr_ska', 'BPR Sukma Kemang Agung', 'bpr_sukma', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=bpr_sukma', '', NULL);
INSERT INTO "public"."tenants" ("id", "public_id", "name", "database_schema_name", "core_type", "core_database_type", "core_database_dsn", "logo_url_base64", "client_type") VALUES
('3', 'ksu_kolega', 'KSU Kolega Sejahtera', 'ksu_kolega', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksu_kolega', '', NULL),
('4', 'bpr_metro', 'BPR Metropolitan Putra', 'bpr_metropolitan', 'ussi', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksu_kolega', '', NULL),
('5', 'bpr_kn_dev', 'BPR Kreasi Nusantara Dev', 'bpr_kn_dev', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=bpr_sukma', '', NULL),
('7', 'bpr_rcs', 'BPR Restudhana Citrasejahtera', 'bpr_rcs', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=bpr_restudhana', NULL, NULL),
('10', 'ksp_cam', 'KSP Cipta Abadi Mutiara', 'ksp_cipta_abadi_mutiara', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database= ksp_cipta_abadi_mutiara', NULL, NULL),
('11', 'ksp_gr', 'KSP Gotong Royong', 'ksp_gotong_royong', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_gotong_royong', NULL, NULL),
('12', 'ksp_ja', 'KSP Jaya Abadi', 'ksp_jaya_abadi_', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_jaya_abadi_', NULL, NULL),
('13', 'ksp_mnr', 'KSP Murni', 'ksp_murni', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_murni', NULL, NULL),
('14', 'ksp_pj', 'KSP Pelita Jaya', 'ksp_pelita_jaya', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_pelita_jaya', NULL, NULL),
('15', 'ksp_pm', 'KSP Pelita Mekar', 'ksp_pelita_mekar', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_pelita_mekar', NULL, NULL),
('16', 'ksp_ps', 'KSP Pelita Sejahtera', 'ksp_pelita_sejahtera', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_pelita_sejahtera', NULL, NULL),
('17', 'ksp_sem', 'KSP Sehat Ekonomi Mandiri', 'ksp_sehat_ekonomi_mandiri', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_sehat_ekonomi_mandiri', NULL, NULL),
('18', 'ksp_sim', 'KSP Serdang Indah Mandiri', 'ksp_serdang_indah_mandiri', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_serdang_indah_mandiri', NULL, NULL),
('19', 'ksp_sb', 'KSP Sinar Berlian', 'ksp_sinar_berlian', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_sinar_berlian', NULL, NULL),
('20', 'ksp_sk', 'KSP Sinar Kandaga', 'ksp_sinar_kandaga_', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_sinar_kandaga_', NULL, NULL),
('21', 'ksp_sm', 'KSP Sinar Murni', 'ksp_sinar_murni', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_sinar_murni', NULL, NULL),
('22', 'ksp_sts', 'KSP Sinar Tama Sejahtera', 'ksp_sinar_tama_sejahtera', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_sinar_tama_sejahtera', NULL, NULL),
('23', 'ksp_ss', 'KSP Stabat Sejahtera', 'ksp_stabat_sejahtera', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_stabat_sejahtera', NULL, NULL),
('25', 'ksp_spmg', 'KSP Sinar Pelita Mas Gresik', 'ksp_spm_gresik', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_spm_gresik', NULL, NULL),
('26', 'ksp_spms', 'KSP Sinar Pelita Mas Surabaya', 'ksp_spm_surabaya', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_spm_surabaya', NULL, NULL),
('27', 'ksp_spmc', 'KSP Sinar Pelita Mas Cijerah', 'ksp_spm_cijerah', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_spm_cijerah', NULL, NULL),
('29', 'ksp_pmd', 'KSP Sinar Pelita Mas Denpasar', 'ksp_spm_denpasar', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_spm_denpasar', NULL, NULL),
('30', 'ksp_spr', 'KSP Sinar Pelita Rancaekek', 'ksp_sinar_pelita_rancaekek', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_sinar_pelita_rancaekek', NULL, NULL),
('34', 'ksp_spmm', 'KSP Sinar Pelita Mas Mojokerto', 'ksp_spm_mojokerto', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_spm_mojokerto', NULL, NULL),
('8', 'ksp_smk', 'KSP Sinar Mas Kalimantan', 'ksp_sinarmas_kalimantan', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_sinarmas_kalimantan', NULL, NULL),
('9', 'ksp_sj', 'KSP Sinar Jaya', 'ksp_sinar_jaya', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_sinar_jaya', NULL, NULL),
('28', 'ksp_spmbd', 'KSP Sinar Pelita Mas Bandung', 'ksp_spm_bandung', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_spm_bandung', NULL, NULL),
('32', 'ksp_spmbg', 'KSP Sinar Pelita Mas Betung', 'ksp_spm_betung', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_spm_betung', NULL, NULL),
('33', 'ksp_spmpb', 'KSP Sinar Pelita Mas Pekanbaru', 'ksp_spm_pekanbaru', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_spm_pekanbaru', NULL, NULL),
('31', 'ksp_spmpg', 'KSP Sinar Pelita Mas Palembang', 'ksp_spm_palembang', 'dots', 'sqlserver', 'sqlserver://sa:Kreasinusantara123!@10.8.0.16:1433?database=ksp_spm_palembang', NULL, NULL);

INSERT INTO "public"."transaction_batches" ("id", "tenant_id", "created_by", "created_at", "status", "settled_at", "settled_by", "branch_id", "is_active") VALUES
('Ln2V410m80x5VwNOtqOIn', '1', '1676845578346428982', '2023-03-01 05:22:22.644531', 2, NULL, NULL, '', 'f');
INSERT INTO "public"."transaction_batches" ("id", "tenant_id", "created_by", "created_at", "status", "settled_at", "settled_by", "branch_id", "is_active") VALUES
('mpQsCuJNYf9RL8ivyutUJ', '1', '1676845578346428982', '2023-02-21 12:53:45.15628', 2, NULL, NULL, '', 'f');
INSERT INTO "public"."transaction_batches" ("id", "tenant_id", "created_by", "created_at", "status", "settled_at", "settled_by", "branch_id", "is_active") VALUES
('9H6Wq2kaVEjPvziRhsZcK', '1', '1676845578346428982', '2023-03-16 07:54:40.469091', 2, NULL, NULL, '', 'f');
INSERT INTO "public"."transaction_batches" ("id", "tenant_id", "created_by", "created_at", "status", "settled_at", "settled_by", "branch_id", "is_active") VALUES
('VKsWHdwuTubpx58flgcZz', '1', '1676845578346428982', '2023-04-12 12:22:40.063596', 2, NULL, NULL, '', 'f'),
('J5r4iDU-PdB4Zd5j3-laf', '1', '1676845578346428982', '2023-03-07 08:15:46.072952', 2, NULL, NULL, '', 'f'),
('lQ1jDdGuiu8jdjnJEXuEu', '1', '1676845560577008380', '2023-07-26 08:09:02.981151', 2, NULL, NULL, '', 'f'),
('ODK84sfAETwuwFR8mUY34', '2', '1689934458390956948', '2023-07-25 18:33:49.160282', 1, NULL, NULL, '', 't'),
('XiZ5lyjD48pcGew3eZjND', '2', '1689934355390153501', '2023-07-25 18:34:30.49725', 1, NULL, NULL, '', 'f'),
('vnsQf5dwkqlfLjAvcedDV', '1', '1676845578346428982', '2023-09-20 08:05:56.984078', 2, NULL, NULL, '', 'f'),
('mf72dASB0haGdn-jh8Lz2', '1', '1676845578346428982', '2023-05-23 12:43:29.129749', 2, NULL, NULL, '', 'f'),
('b8utYW8AiJc-_Qo1wPQsv', '1', '1676845578346428982', '2023-03-17 07:55:56.051243', 2, NULL, NULL, '', 'f'),
('07FSFA91dIpp2m5F_xkq0', '1', '1676845606602498572', '2023-05-26 07:59:01.608049', 2, NULL, NULL, '', 'f'),
('6z6lMM9pjTa3DaJ7oweuk', '1', '1676845606602498572', '2023-06-13 08:17:27.634694', 2, NULL, NULL, '', 'f'),
('bDeIwoNk5DKEprZCvoR6z', '1', '1676845606602498572', '2023-07-21 08:08:19.932008', 2, NULL, NULL, '', 'f'),
('QyHyJ1-fmMnbWkYX2AH_Y', '1', '1676845606602498572', '2023-07-12 08:14:15.31124', 2, NULL, NULL, '', 'f'),
('88Ewj69EEy8tcj3L3EFLX', '1', '1676845606602498572', '2023-08-29 08:06:42.0059', 2, NULL, NULL, '', 'f'),
('eMo5G57Yc5jhRXT2mlJv5', '1', '1676845606602498572', '2023-08-28 08:10:15.331516', 2, NULL, NULL, '', 'f'),
('uVQPcbv3sGG3sC9-Xdjrf', '1', '1676845606602498572', '2023-07-07 08:04:44.232147', 2, NULL, NULL, '', 'f'),
('BlT-iaknT0lC_D4v9SJr_', '1', '1676845606602498572', '2023-08-09 08:07:21.051554', 2, NULL, NULL, '', 'f'),
('Vbysx3P-AoTDiXgjA-u5u', '1', '1676845606602498572', '2023-08-04 08:14:02.949947', 2, NULL, NULL, '', 'f'),
('t6a1KTS_PoZtVitvmQ5Cw', '1', '1676845606602498572', '2023-05-09 08:09:58.395041', 2, NULL, NULL, '', 'f'),
('q0G3r7WoLIeKedFAGHp39', '1', '1676845606602498572', '2023-03-31 07:56:30.492836', 2, NULL, NULL, '', 'f'),
('EddBoueVNCbfuzn5k5rJp', '1', '1676845606602498572', '2023-04-05 08:01:31.325445', 2, NULL, NULL, '', 'f'),
('q9-qgUm7fb4B9ley90dyq', '1', '1676845606602498572', '2023-03-30 08:00:39.053119', 2, NULL, NULL, '', 'f'),
('GK7puIA_oG5xLJxKaLQ7X', '1', '1676845606602498572', '2023-03-17 08:02:57.940839', 2, NULL, NULL, '', 'f'),
('EXbedee_vGEDZz0b5QFJL', '1', '1676845606602498572', '2023-04-13 07:58:57.483988', 2, NULL, NULL, '', 'f'),
('0ED5jm4W12zBdrXmJrH8e', '1', '1676845578346428982', '2023-04-06 08:13:15.75901', 2, NULL, NULL, '', 'f'),
('2TIDkWDkXGsLZYTAOck3s', '1', '1676845578346428982', '2023-03-01 08:00:35.631701', 2, NULL, NULL, '', 'f'),
('9RoqYOF3M786fHewlnhJH', '1', '1676845578346428982', '2023-08-24 12:24:05.429899', 2, NULL, NULL, '', 'f'),
('ztxboWlsDY3qJggVWFhz_', '1', '1676845578346428982', '2023-03-14 09:34:47.647438', 2, NULL, NULL, '', 'f'),
('7aqI-uRHUp1h-Q7GEdpbx', '1', '1676845578346428982', '2023-08-11 11:27:49.043761', 2, NULL, NULL, '', 'f'),
('ROeOm083zr8x01LQzMBiX', '1', '1676845578346428982', '2023-07-26 08:04:58.927116', 2, NULL, NULL, '', 'f'),
('rGzdy5PHOqUtsR10KVPtP', '1', '1676845578346428982', '2023-02-22 09:32:24.673613', 2, NULL, NULL, '', 'f'),
('vwPc7qdg1U-YiU190Xo9K', '1', '1676845578346428982', '2023-07-18 12:32:28.773948', 2, NULL, NULL, '', 'f'),
('rb8_tr-9u2DX35tWhGDPU', '1', '1676845578346428982', '2023-05-15 13:08:04.505201', 2, NULL, NULL, '', 'f'),
('4Kj7EKdPJCGUkIZxALVPN', '1', '1676845578346428982', '2023-05-24 08:05:57.357956', 2, NULL, NULL, '', 'f'),
('JZ8ekIFNlQZ2VbnX6cCGb', '1', '1676845578346428982', '2023-02-23 07:59:54.376397', 2, NULL, NULL, '', 'f'),
('CcGWlber90-8YefHJQuni', '1', '1676845578346428982', '2023-02-23 08:11:31.0709', 2, NULL, NULL, '', 'f'),
('EeUbGPHikqhZlFYrR7-eP', '1', '1676845606602498572', '2023-09-20 08:06:16.910103', 2, NULL, NULL, '', 'f'),
('p4Qve48pJn6EIlbH7vmKH', '1', '1676845578346428982', '2023-02-28 09:22:22.103565', 2, NULL, NULL, '', 'f'),
('pV0BNCeejxJxb5L4qeOxu', '1', '1676845578346428982', '2023-06-09 08:01:55.244771', 2, NULL, NULL, '', 'f'),
('APIpoQnkvEXuZMIvvJR_u', '1', '1676845578346428982', '2023-08-15 11:50:42.93871', 2, NULL, NULL, '', 'f'),
('GjkkWFyZMUYswQUR6pvgR', '1', '1676845578346428982', '2023-08-23 08:07:31.672123', 2, NULL, NULL, '', 'f'),
('gSfSdIF2waft1Wsus39Sc', '1', '1676845560577008380', '2023-07-03 08:13:38.881117', 2, NULL, NULL, '', 'f'),
('Kkhysadmrfo1HF9byG0Fj', '1', '1676845560577008380', '2023-05-24 08:04:56.177471', 2, NULL, NULL, '', 'f'),
('hpnNqrhn4dENbiJazhcly', '1', '1676845560577008380', '2023-04-27 07:56:22.858272', 2, NULL, NULL, '', 'f'),
('neiZVRpShAqpUum-PJwar', '1', '1676845578346428982', '2023-02-27 07:51:29.726772', 2, NULL, NULL, '', 'f'),
('XfIxE-I3bIMN_cUW_5mNg', '1', '1676845560577008380', '2023-05-26 13:25:58.54704', 2, NULL, NULL, '', 'f'),
('eEUt5t4rKNpdV8vqMcFZO', '1', '1676845560577008380', '2023-07-07 14:19:29.599167', 2, NULL, NULL, '', 'f'),
('ftZFlePvv9U9d-HvV2sRG', '1', '1676845578346428982', '2023-07-05 08:03:17.264079', 2, NULL, NULL, '', 'f'),
('j7a-jaA23hRgYdgx1sX8P', '1', '1676845578346428982', '2023-06-21 12:39:39.123229', 2, NULL, NULL, '', 'f'),
('bNETBEHsn02fiPW7f2ZXP', '1', '1676845560577008380', '2023-07-07 08:05:13.41195', 2, NULL, NULL, '', 'f'),
('i5GWM6811bDb9Nil-DL1e', '1', '1676845560577008380', '2023-09-05 13:40:54.510481', 2, NULL, NULL, '', 'f'),
('jJRj4STLxVUhVO8VwemvR', '1', '1676845560577008380', '2023-07-26 13:47:14.70655', 2, NULL, NULL, '', 'f'),
('BUoEX3Xwq3RtsXoCr-Qip', '1', '1676845560577008380', '2023-08-28 14:16:02.677826', 1, NULL, NULL, '', 'f'),
('F9iD6zCKNHSEiKwms8vxD', '1', '1676845560577008380', '2023-07-05 08:11:36.198843', 2, NULL, NULL, '', 'f'),
('eCJEjImpTXIohFjjSZyDe', '1', '1676845560577008380', '2023-02-24 16:44:37.391029', 2, NULL, NULL, '', 'f'),
('GU-JuMOUJLx50rqd8y8Ix', '7', '1693559389799472818', '2023-09-01 16:18:17.620782', 1, NULL, NULL, '', 'f'),
('wPHbPIoxR_eplA7EZMC13', '1', '1676845606602498572', '2023-04-26 16:48:47.486376', 2, NULL, NULL, '', 'f'),
('Tb-tpzAji-N34zgXt5WLh', '1', '1676845606602498572', '2023-03-07 08:16:55.203956', 2, NULL, NULL, '', 'f'),
('IXC0_yzBqvz9oareZmm0X', '1', '1676845606602498572', '2023-08-07 08:14:47.625163', 2, NULL, NULL, '', 'f'),
('IlctFnWKewifSQFOIcuzD', '1', '1676845606602498572', '2023-08-14 08:10:19.220555', 2, NULL, NULL, '', 'f'),
('4kIBfTVKAwolQ7Lgn2dYN', '1', '1676845606602498572', '2023-06-21 08:37:07.968958', 2, NULL, NULL, '', 'f'),
('R4Zq6KKiKzulvZ0ISZXws', '1', '1676845578346428982', '2023-09-07 08:06:06.755567', 2, NULL, NULL, '', 'f'),
('zd6goRqVrr4mUsAS2j2IE', '1', '1676845578346428982', '2023-03-29 12:42:32.750476', 2, NULL, NULL, '', 'f'),
('mesIsgo-FQkoytd7KbvSt', '1', '1676845606602498572', '2023-06-06 08:02:40.811599', 2, NULL, NULL, '', 'f'),
('YyO_dYKVZvXMRtc-mSY75', '1', '1676845606602498572', '2023-03-10 07:56:32.501479', 2, NULL, NULL, '', 'f'),
('c2qX36TRqo0uHpNGt6BtE', '1', '1676845606602498572', '2023-04-03 08:06:32.75302', 2, NULL, NULL, '', 'f'),
('frOBAl6QulkHgQMYnc77F', '1', '1676845606602498572', '2023-02-21 16:51:38.210184', 2, NULL, NULL, '', 'f'),
('gvf417QksaW2Ix2MvzVa8', '1', '1676845606602498572', '2023-02-24 07:56:36.271193', 2, NULL, NULL, '', 'f'),
('YbP7kDNRedj8Akgy-s4Qu', '1', '1676845578346428982', '2023-07-20 08:12:31.259905', 2, NULL, NULL, '', 'f'),
('U5oHd0JKB2gq3RjhSGKMK', '1', '1676845578346428982', '2023-05-05 07:55:44.057333', 2, NULL, NULL, '', 'f'),
('0y9aNGTNr4BwiDU1D4by9', '1', '1676845578346428982', '2023-06-27 08:35:52.389807', 2, NULL, NULL, '', 'f'),
('iPu5ESUCEht5_j_1ypwka', '1', '1676845578346428982', '2023-08-21 08:03:55.571927', 2, NULL, NULL, '', 'f'),
('Rrslok_Q29qzP0zPQC6sE', '1', '1676845578346428982', '2023-02-23 07:59:10.33738', 2, NULL, NULL, '', 'f'),
('KpcevjTV-bIItdoWDqnRI', '1', '1676845578346428982', '2023-08-04 08:10:00.795622', 2, NULL, NULL, '', 'f'),
('KM8nqiG4r3wTD0pFAi7Kr', '1', '1676845578346428982', '2023-07-27 12:19:32.224588', 2, NULL, NULL, '', 'f'),
('XAiXFmKDZkGiIiK8WnQRi', '1', '1676845578346428982', '2023-05-29 12:44:01.855011', 2, NULL, NULL, '', 'f'),
('yOr6zwE62Al14SFrNHPxa', '1', '1676845578346428982', '2023-06-07 12:36:36.934156', 2, NULL, NULL, '', 'f'),
('d9JC4kIn1lO3mObzk0vsa', '1', '1676845578346428982', '2023-09-18 08:06:17.561522', 2, NULL, NULL, '', 'f'),
('IUBVUrJjabS_5Dzh32H5J', '1', '1676845578346428982', '2023-08-16 08:03:35.827988', 2, NULL, NULL, '', 'f'),
('fJlVzj2GOkua4cyp20zHb', '1', '1676845578346428982', '2023-09-08 08:04:35.127405', 2, NULL, NULL, '', 'f'),
('BvlD-z6aVdZrIVfU11O3m', '1', '1676845578346428982', '2023-02-27 13:20:22.629724', 2, NULL, NULL, '', 'f'),
('9KCNJe_X0VVAR01r-cEn9', '1', '1676845578346428982', '2023-08-24 08:11:28.32464', 2, NULL, NULL, '', 'f'),
('KdOATXXpc2ru4a9tQGFoM', '1', '1676845578346428982', '2023-05-09 08:12:49.361214', 2, NULL, NULL, '', 'f'),
('_jk2ZNBc-lD-W1GqXSDg9', '1', '1676845578346428982', '2023-08-09 08:18:08.744015', 2, NULL, NULL, '', 'f'),
('Da-WRf5jfbNO7T6eRD28r', '1', '1676845560577008380', '2023-05-03 13:24:09.095634', 2, NULL, NULL, '', 'f'),
('lwTxRNF4yzTkGtiXlS48H', '1', '1676845560577008380', '2023-02-23 08:20:19.120022', 2, NULL, NULL, '', 'f'),
('cMf3KsmfdW2e_BBN5frq0', '1', '1676845560577008380', '2023-05-08 13:49:46.964975', 2, NULL, NULL, '', 'f'),
('hlyzrd_2zUQzM_alO4Pgp', '1', '1676845560577008380', '2023-07-13 08:07:43.120677', 2, NULL, NULL, '', 'f'),
('K804K4k8d8uziRnQs_SQ7', '1', '1676845560577008380', '2023-08-21 08:26:52.307626', 2, NULL, NULL, '', 'f'),
('uI8-9Yxh5t5pbMUexXri8', '1', '1676845560577008380', '2023-05-19 14:06:13.996806', 2, NULL, NULL, '', 'f'),
('4Z8uf09RCkvGO66CybRzC', '1', '1676845560577008380', '2023-08-22 13:33:39.671144', 2, NULL, NULL, '', 'f'),
('-xIEy8SKkji1E2ypXxx-c', '1', '1676845560577008380', '2023-03-16 13:47:31.520288', 2, NULL, NULL, '', 'f'),
('w13WO3nWqKRPbN4vrAV-V', '1', '1676845560577008380', '2023-09-04 14:12:52.623594', 2, NULL, NULL, '', 'f'),
('gBPA96hWK45Lzk3dmxKtn', '1', '1676845578346428982', '2023-05-05 11:39:53.702117', 2, NULL, NULL, '', 'f'),
('_GAVyKebUoZshz0WuTatx', '1', '1676845578346428982', '2023-06-06 14:19:24.258284', 2, NULL, NULL, '', 'f'),
('aXZ6PfvQiOuqzHOHUt7h1', '1', '1676845578346428982', '2023-05-22 12:51:09.304766', 2, NULL, NULL, '', 'f'),
('UYxkU1x9OKoWm4VAcIhUm', '1', '1676845560577008380', '2023-03-24 09:37:18.029799', 2, NULL, NULL, '', 'f'),
('g91nzRp04Mj4K0SEzLiax', '1', '1676845560577008380', '2023-06-09 08:05:10.383877', 2, NULL, NULL, '', 'f'),
('bVzcxlPzwDvHmiYE4uSpa', '1', '1676845560577008380', '2023-04-26 09:22:24.924677', 2, NULL, NULL, '', 'f'),
('nzxtFrqUXq3Ufp7LXlUJf', '1', '1676845560577008380', '2023-09-08 13:54:40.43406', 2, NULL, NULL, '', 'f'),
('6n6Yekkp6tBlA-IIJJLqj', '1', '1676845560577008380', '2023-08-25 14:36:02.738556', 2, NULL, NULL, '', 'f'),
('PTxwXRqB21ffUTq0wiOu1', '1', '1676845560577008380', '2023-08-31 13:30:13.472883', 2, NULL, NULL, '', 'f'),
('DOONdRZJPCHkQChcCsu32', '1', '1676845560577008380', '2023-03-31 07:58:39.541749', 2, NULL, NULL, '', 'f'),
('1Z5tm5nYlmcInXRksROFc', '1', '1676845560577008380', '2023-07-31 08:31:54.984197', 2, NULL, NULL, '', 'f'),
('GLfdbZGEFoGOUcpCbIjCS', '1', '1676845560577008380', '2023-09-06 13:58:40.647371', 2, NULL, NULL, '', 'f'),
('36f36LY5SNKsOlY10G76Z', '1', '1676845560577008380', '2023-07-25 13:45:15.012111', 2, NULL, NULL, '', 'f'),
('dNttwEQvFXkskf5XAGLAO', '1', '1676845560577008380', '2023-06-22 08:13:48.852052', 2, NULL, NULL, '', 'f'),
('3hWFJVLpYK6EfN7_l2-e2', '1', '1676845606602498572', '2023-04-06 08:02:58.865553', 2, NULL, NULL, '', 'f'),
('0lF-5mm2NCg6Gh9RHBE7l', '1', '1676845606602498572', '2023-03-20 07:54:32.297405', 2, NULL, NULL, '', 'f'),
('0Wj1_rn4HgW8ifi7cUeH6', '1', '1676845606602498572', '2023-08-31 08:06:38.078123', 2, NULL, NULL, '', 'f'),
('H790Zs-9I9dKn4t-yy4Yn', '1', '1676845606602498572', '2023-03-14 07:58:27.654239', 2, NULL, NULL, '', 'f'),
('gnHv0zWSW1mWCLeul-y8x', '1', '1676845606602498572', '2023-03-08 08:06:12.943746', 2, NULL, NULL, '', 'f'),
('XDhm4a2vWJkDesdZILkb8', '1', '1676845606602498572', '2023-03-01 07:58:50.49135', 2, NULL, NULL, '', 'f'),
('R-p0jNgxuJYEmO3tYcBd3', '1', '1676845606602498572', '2023-05-11 08:05:50.892886', 2, NULL, NULL, '', 'f'),
('6eNMQuBz4UEJVWdcL_d1F', '1', '1676845560577008380', '2023-06-23 08:15:49.522355', 2, NULL, NULL, '', 'f'),
('P7GNPYnC8PhNVYSN6tuyW', '1', '1676845560577008380', '2023-03-29 07:56:08.207946', 2, NULL, NULL, '', 'f'),
('Dx-P8pIlCEilVFgzTqkFX', '1', '1676845606602498572', '2023-03-15 08:03:14.950252', 2, NULL, NULL, '', 'f'),
('MhkpFbHI4ybkS8IOIzbpy', '1', '1676845606602498572', '2023-07-20 07:56:36.233643', 2, NULL, NULL, '', 'f'),
('YX7oxRRVQUzyPYDZmZx0l', '1', '1676845560577008380', '2023-03-14 08:00:46.004668', 2, NULL, NULL, '', 'f'),
('msfzR2yImd9nYVtQY36VB', '1', '1676845560577008380', '2023-03-13 15:16:22.002799', 2, NULL, NULL, '', 'f'),
('k8nOV8DRanDNKzRMvvDYw', '1', '1676845606602498572', '2023-05-10 08:05:37.741082', 2, NULL, NULL, '', 'f'),
('9BwzLHNXbqG6jhh-qFDbr', '1', '1676845606602498572', '2023-05-19 08:06:49.686098', 2, NULL, NULL, '', 'f'),
('DjVRH5QIldO3PnbtuS1ya', '1', '1676845606602498572', '2023-08-23 08:07:13.295229', 2, NULL, NULL, '', 'f'),
('tC8x0PbGVdm0FF0LRMhrp', '1', '1676845560577008380', '2023-07-10 08:05:36.584042', 2, NULL, NULL, '', 'f'),
('se99c5eG62lUkrzEO-fTp', '1', '1676845560577008380', '2023-05-26 07:54:37.716592', 2, NULL, NULL, '', 'f'),
('vhkfS5iPls7HWLNVYnBqh', '1', '1676845606602498572', '2023-05-04 17:27:21.608347', 2, NULL, NULL, '', 'f'),
('9RXnSwHN553xPGgRGpsFQ', '1', '1676845606602498572', '2023-04-18 07:55:47.044331', 2, NULL, NULL, '', 'f'),
('otgcuBbOeud5xVqRkeWoQ', '1', '1676845606602498572', '2023-04-26 17:05:36.068305', 2, NULL, NULL, '', 'f'),
('MhwRSHqu9GwsGUiwGnE4Q', '1', '1676845578346428982', '2023-06-06 14:19:54.381845', 2, NULL, NULL, '', 'f'),
('eC9UT5y7PwI51wwu-B9aZ', '1', '1676845578346428982', '2023-03-03 08:03:28.835197', 2, NULL, NULL, '', 'f'),
('yTM7F0caEj0nT5eEv50RR', '1', '1676845578346428982', '2023-06-06 12:39:42.256235', 2, NULL, NULL, '', 'f'),
('dR0KbpTfmsXCj6A349zm-', '1', '1676845578346428982', '2023-02-22 08:52:26.692445', 2, NULL, NULL, '', 'f'),
('JewPpBcXAfCCVwyABMA2K', '1', '1676845578346428982', '2023-05-29 07:58:35.215899', 2, NULL, NULL, '', 'f'),
('H7CxGQbhbpcnyAPJ3cOhR', '1', '1676845578346428982', '2023-03-10 07:55:42.69846', 2, NULL, NULL, '', 'f'),
('ZlajgMhG3Gu_KHP_tbkyj', '1', '1676845578346428982', '2023-08-03 08:01:57.230237', 2, NULL, NULL, '', 'f'),
('zo21SOwSKo0UTt3QdqQY9', '1', '1676845578346428982', '2023-03-01 12:32:55.491662', 2, NULL, NULL, '', 'f'),
('nsGQRuL_VpTmpqUR9uQRI', '1', '1676845578346428982', '2023-05-26 07:56:29.931567', 2, NULL, NULL, '', 'f'),
('-CqIm0znj_JEYIWBIR8dQ', '1', '1676845578346428982', '2023-08-02 12:45:58.973826', 2, NULL, NULL, '', 'f'),
('9IjG1P_i9pSeJalDCLPAp', '1', '1676845578346428982', '2023-08-14 12:09:20.705519', 2, NULL, NULL, '', 'f'),
('kyXLlwRoGK6vGkcJ-jUQi', '1', '1676845578346428982', '2023-09-15 08:05:59.315052', 2, NULL, NULL, '', 'f'),
('H9vpqBJxaDbe7EpPNb3rY', '1', '1676845578346428982', '2023-02-20 10:21:49.48556', 2, NULL, NULL, '', 'f'),
('tqab7s1zIx0Geagq1fcId', '1', '1676845578346428982', '2023-03-02 12:32:14.675396', 2, NULL, NULL, '', 'f'),
('Qnx-2IEZzMkJswm2Dwjzc', '1', '1676845578346428982', '2023-09-11 12:46:14.28016', 2, NULL, NULL, '', 'f'),
('hqLpO3-nJIL6ZWqw9xyqb', '1', '1676845578346428982', '2023-08-30 08:09:31.5933', 2, NULL, NULL, '', 'f'),
('MkOwaitz0IOGQs4AavKg_', '1', '1676845578346428982', '2023-04-03 08:06:08.152023', 2, NULL, NULL, '', 'f'),
('rqJAzm0eIBgL0oImIS4nF', '1', '1676845578346428982', '2023-09-13 12:43:25.944223', 2, NULL, NULL, '', 'f'),
('6TdNf9Gb2noRv5BgGTQIk', '1', '1676845578346428982', '2023-02-24 11:38:01.04569', 2, NULL, NULL, '', 'f'),
('7TTIEJBLuysLnfro8_R_T', '1', '1676845578346428982', '2023-08-23 12:32:59.714968', 2, NULL, NULL, '', 'f'),
('aa28tSnM_MVYSWOR8a_qp', '1', '1676845560577008380', '2023-02-21 16:42:36.975584', 2, NULL, NULL, '', 'f'),
('dmuHsBT9FbP5kztu1dO26', '1', '1676845560577008380', '2023-08-15 10:10:35.677811', 2, NULL, NULL, '', 'f'),
('Ud6XM65vb5IMzeT_8579i', '1', '1676845560577008380', '2023-08-10 13:35:25.036027', 2, NULL, NULL, '', 'f'),
('Occc4Kj3klEEEwXkFLAmm', '1', '1676845560577008380', '2023-07-06 08:10:14.388366', 2, NULL, NULL, '', 'f'),
('osMCdvSJXAIQ7TGXyNsJ3', '1', '1676845560577008380', '2023-07-14 13:45:36.587582', 2, NULL, NULL, '', 'f'),
('pBQyusRCxf7Jtoin-u0yV', '1', '1676845560577008380', '2023-06-06 08:09:57.34868', 2, NULL, NULL, '', 'f'),
('-lV3ZhhMHxVoDbtWpz4CZ', '1', '1676845560577008380', '2023-04-03 08:23:13.531908', 2, NULL, NULL, '', 'f'),
('kjY4ybRvClCYcyOD8un1m', '1', '1676845560577008380', '2023-08-01 14:06:23.806504', 2, NULL, NULL, '', 'f'),
('Ntl1VtVxF_htn6KQT5hZq', '1', '1676845560577008380', '2023-08-22 08:08:43.129359', 2, NULL, NULL, '', 'f'),
('UsfUV0pgCOTbWdR2wL9f8', '1', '1676845560577008380', '2023-04-12 08:00:19.861184', 2, NULL, NULL, '', 'f'),
('VPNdkaT83c06nE9DnJcyu', '1', '1676845560577008380', '2023-06-20 13:12:13.184373', 2, NULL, NULL, '', 'f'),
('7CFEcwDND0irvtcy6g0lG', '1', '1676845606602498572', '2023-03-20 07:55:00.461004', 2, NULL, NULL, '', 'f'),
('T1BWJXUU9sYh-DewDFuux', '1', '1676845606602498572', '2023-04-26 08:49:21.928222', 2, NULL, NULL, '', 'f'),
('8ExzvPJyCWWYrxroSk3W6', '1', '1676845606602498572', '2023-06-23 08:17:20.109653', 2, NULL, NULL, '', 'f'),
('avFg8tirW7Lu7U5k0T2LD', '1', '1676845606602498572', '2023-06-14 08:01:46.668091', 2, NULL, NULL, '', 'f'),
('A_qeUJKPB6XEZnf8_bi2z', '1', '1676845606602498572', '2023-06-08 08:02:59.788788', 2, NULL, NULL, '', 'f'),
('MTYBhae0Mp6ipt7IUkXxI', '1', '1676845578346428982', '2023-07-14 11:33:00.000504', 2, NULL, NULL, '', 'f'),
('UgiyQZK89TPHdmf8pXSA5', '1', '1676845578346428982', '2023-09-12 12:40:49.868465', 2, NULL, NULL, '', 'f'),
('czBfsBkbtzaQwTfC1jx_D', '1', '1676845560577008380', '2023-03-10 13:47:40.169456', 2, NULL, NULL, '', 'f'),
('BUuD6E56HnNq0x4_Bxog2', '1', '1676845578346428982', '2023-04-18 12:48:17.695985', 2, NULL, NULL, '', 'f'),
('GgTsGIN9BoXUFOE9O3J5E', '1', '1676845578346428982', '2023-04-06 12:12:59.804574', 2, NULL, NULL, '', 'f'),
('qpdTwCJ4DcOjTlt_AAljg', '1', '1676845560577008380', '2023-08-29 08:05:47.109652', 2, NULL, NULL, '', 'f'),
('Xs7o8rKVok9YichANtnru', '1', '1676845560577008380', '2023-08-30 08:15:47.625836', 2, NULL, NULL, '', 'f'),
('H0U6V9ljzjV37UAAUAT9l', '1', '1676845560577008380', '2023-05-02 13:38:48.906699', 2, NULL, NULL, '', 'f'),
('R5rF3G2dWhvQoOsQOWigO', '1', '1676845578346428982', '2023-06-14 12:56:53.048021', 2, NULL, NULL, '', 'f'),
('7GlcyaSvo-kZNbDN760SB', '1', '1676845560577008380', '2023-02-27 15:13:51.943386', 2, NULL, NULL, '', 'f'),
('gi9AGXAamXQnC4LzhcFbe', '1', '1676845560577008380', '2023-06-09 13:07:35.029995', 2, NULL, NULL, '', 'f'),
('ffruCOQrcTUr1mOnPuO1-', '1', '1676845560577008380', '2023-04-28 08:00:33.286733', 2, NULL, NULL, '', 'f'),
('Sa1voLYBX7VwjtlD6xHiq', '1', '1676845578346428982', '2023-03-17 16:43:49.833579', 2, NULL, NULL, '', 'f'),
('7V15fLLvI-Ls3Jxu385NI', '1', '1676845578346428982', '2023-08-01 14:19:42.57287', 2, NULL, NULL, '', 'f'),
('XcvskYP1JYWhl5kAA9knQ', '1', '1676845578346428982', '2023-03-09 13:35:01.5279', 2, NULL, NULL, '', 'f'),
('Z1WM4lRR-MSRY2E5ED10D', '1', '1676845578346428982', '2023-04-14 10:40:18.282145', 2, NULL, NULL, '', 'f'),
('BQ8JoSyHO2enfW7nFL8k8', '1', '1676845578346428982', '2023-07-24 08:03:15.331614', 2, NULL, NULL, '', 'f'),
('eXkh3-G1db7Yr36gfcPG-', '1', '1676845578346428982', '2023-08-29 14:51:34.168485', 2, NULL, NULL, '', 'f'),
('oLvdicCSweVuHWzQnGiKU', '1', '1676845578346428982', '2023-05-09 12:47:36.881818', 2, NULL, NULL, '', 'f'),
('l2MXAXIil-bx9MWVxzBmw', '1', '1676845578346428982', '2023-08-14 08:09:41.855842', 2, NULL, NULL, '', 'f'),
('KXaiwbvcoeSBuAZ2y7DRY', '1', '1676845578346428982', '2023-02-22 12:56:55.906958', 2, NULL, NULL, '', 'f'),
('U88BJkSDi47TQNLqDpmzg', '1', '1676845578346428982', '2023-07-27 08:06:06.116162', 2, NULL, NULL, '', 'f'),
('P85BbBO31Jqov777Ii49D', '1', '1676845578346428982', '2023-03-03 11:55:15.349469', 2, NULL, NULL, '', 'f'),
('qv29WFKSZyQUTzZegttV2', '1', '1676845578346428982', '2023-05-12 07:55:28.142471', 2, NULL, NULL, '', 'f'),
('JbAJTPfbQgK5PBWyNzHAd', '1', '1676845578346428982', '2023-03-24 16:21:48.114409', 2, NULL, NULL, '', 'f'),
('YcBKuyQzNcuKzWXOn7nOV', '1', '1676845578346428982', '2023-05-10 12:24:35.732237', 2, NULL, NULL, '', 'f'),
('EYJU3G8ukrzguoAviQj-7', '1', '1676845578346428982', '2023-07-12 08:02:42.995958', 2, NULL, NULL, '', 'f'),
('b-ZJrMbZompYY1z36rsl3', '1', '1676845578346428982', '2023-07-12 12:46:51.185641', 2, NULL, NULL, '', 'f'),
('UQkLQaOGOII-6WNMlZQPJ', '1', '1676845560577008380', '2023-07-17 13:34:11.215487', 2, NULL, NULL, '', 'f'),
('Yzo_TUl_uwbQ4DXvs2ee9', '1', '1676845560577008380', '2023-06-07 08:06:15.771772', 2, NULL, NULL, '', 'f'),
('7RMgD0M9oMoA501ejmqvY', '1', '1676845560577008380', '2023-03-17 09:43:32.36064', 2, NULL, NULL, '', 'f'),
('uAfTXosWWEguVr5oKib3Y', '1', '1676845560577008380', '2023-09-01 08:16:47.263881', 2, NULL, NULL, '', 'f'),
('AT0QkZFoKEkszXe3E5XfP', '1', '1676845560577008380', '2023-03-08 15:16:15.107223', 2, NULL, NULL, '', 'f'),
('vJ3v8GtezKMJvqKFbVPTz', '1', '1676845606602498572', '2023-06-22 08:16:25.463555', 2, NULL, NULL, '', 'f'),
('BYaJL7WUWdZSRmZaMrlBS', '1', '1676845606602498572', '2023-06-07 08:08:42.210517', 2, NULL, NULL, '', 'f'),
('3jjakAYakrIT9bFuAvimr', '1', '1676845606602498572', '2023-06-05 08:11:50.563575', 2, NULL, NULL, '', 'f'),
('2pSyc2mfJ1JDQKhhJIl0A', '1', '1676845606602498572', '2023-07-27 08:17:15.29217', 2, NULL, NULL, '', 'f'),
('lDzN4xivj6hHBhWFUiheR', '1', '1676845606602498572', '2023-08-30 08:09:36.479276', 2, NULL, NULL, '', 'f'),
('EDIQw8r4QZAc4VYfPAS_A', '1', '1676845578346428982', '2023-03-31 14:09:00.929379', 2, NULL, NULL, '', 'f'),
('SDrNT3LI0o_Vwntj4EYG0', '1', '1676845578346428982', '2023-04-12 16:15:26.198512', 2, NULL, NULL, '', 'f'),
('xD3oYUou6TYcN69tm3GeX', '1', '1676845578346428982', '2023-02-22 08:19:57.096896', 2, NULL, NULL, '', 'f'),
('yN6W0l4S6dUlp17NGSNoa', '1', '1676845578346428982', '2023-07-03 13:08:19.982292', 2, NULL, NULL, '', 'f'),
('k7YftD8boGRJKsfDq0uKH', '1', '1676845578346428982', '2023-09-20 12:45:11.135092', 2, NULL, NULL, '', 'f'),
('SU4Xbtt4_Dh49ZYNF_kkE', '1', '1676845560577008380', '2023-09-01 13:26:32.069375', 2, NULL, NULL, '', 'f'),
('Rwau1y45zBcb7WccfC-zV', '1', '1676845560577008380', '2023-04-14 08:00:50.833589', 2, NULL, NULL, '', 'f'),
('4BJgCa9YMje5VON99CW9l', '1', '1676845560577008380', '2023-07-25 13:45:14.945304', 2, NULL, NULL, '', 'f'),
('jsAuyXOyglEaWzgqvquNj', '1', '1676845560577008380', '2023-06-05 08:06:36.244495', 2, NULL, NULL, '', 'f'),
('ufW6AA9eY6SDsnEdT__1K', '1', '1676845560577008380', '2023-07-28 13:00:06.243102', 2, NULL, NULL, '', 'f'),
('eVohnvEp97WLr-a9iIVLM', '1', '1676845560577008380', '2023-06-13 08:26:06.392416', 2, NULL, NULL, '', 'f'),
('z8xGABSYaGfxA05nImPQj', '1', '1676845578346428982', '2023-07-10 12:13:36.288063', 2, NULL, NULL, '', 'f'),
('UDwi9IHCGMFU3Eg9fCC87', '1', '1676845578346428982', '2023-06-07 08:04:23.960485', 2, NULL, NULL, '', 'f'),
('YL0-C5guqbz6h2vQlASCp', '1', '1676845560577008380', '2023-09-06 08:26:43.668827', 2, NULL, NULL, '', 'f'),
('yvaD0-zr7zwm7gvPBJwWJ', '1', '1676845560577008380', '2023-05-17 08:08:08.818653', 2, NULL, NULL, '', 'f'),
('qxQ7QmNY2kucCvnPmwryZ', '1', '1676845578346428982', '2023-05-12 11:41:07.498976', 2, NULL, NULL, '', 'f'),
('ZHUauRqUYYVku3dENZxS_', '1', '1676845578346428982', '2023-04-11 08:05:01.613311', 2, NULL, NULL, '', 'f'),
('ihHPH5_dXuVEZ6LPohFrf', '1', '1676845560577008380', '2023-02-22 14:31:13.509109', 2, NULL, NULL, '', 'f'),
('k23eQ1w10xja1cByeS0XD', '1', '1676845560577008380', '2023-06-08 12:58:49.093795', 2, NULL, NULL, '', 'f'),
('RoNmSL_ZQYvB7w8raXWO5', '1', '1676845560577008380', '2023-04-06 13:07:03.010814', 2, NULL, NULL, '', 'f'),
('sQhccPloEbYEw9h532onG', '1', '1676845578346428982', '2023-05-31 07:52:54.258731', 2, NULL, NULL, '', 'f'),
('BU4KtuE4HOvOMJpIWnUQw', '1', '1676845578346428982', '2023-07-18 08:03:20.156454', 2, NULL, NULL, '', 'f'),
('tAk_5j1DP_ttJyNYGo0C3', '1', '1676845578346428982', '2023-06-12 08:18:58.253398', 2, NULL, NULL, '', 'f'),
('kKzuTsZ-2rbfAtPpnYwAv', '1', '1676845578346428982', '2023-08-04 11:21:38.793534', 2, NULL, NULL, '', 'f'),
('oq2QwppGQlMZNFb77KECw', '1', '1676845578346428982', '2023-06-08 07:56:38.273158', 2, NULL, NULL, '', 'f'),
('Upr8FrzzDpmvnX3vqJJ9z', '1', '1676845578346428982', '2023-08-15 08:06:39.303877', 2, NULL, NULL, '', 'f'),
('SiZkT-rlw8EFhZve8aKZ_', '1', '1676845578346428982', '2023-03-14 12:52:18.623975', 2, NULL, NULL, '', 'f'),
('JckKgBnaMFu9jsL1A_aAT', '1', '1676845578346428982', '2023-07-10 08:02:50.947837', 2, NULL, NULL, '', 'f'),
('UstsoFHJ0PYQ2inpkiPBs', '1', '1676845578346428982', '2023-08-01 14:02:55.802375', 2, NULL, NULL, '', 'f'),
('4jAVZrIOyEzp23vgceHor', '1', '1676845578346428982', '2023-08-30 12:41:03.618516', 2, NULL, NULL, '', 'f'),
('Hdbn8FgmIsvn8EIEPqvIL', '1', '1676845578346428982', '2023-05-25 12:27:13.414645', 2, NULL, NULL, '', 'f'),
('7rqhhiKJiL6aOU5nFKfNA', '1', '1676845578346428982', '2023-09-01 08:06:08.599411', 2, NULL, NULL, '', 'f'),
('HtNQ58p-yclX-ZfbXtlN1', '1', '1676845578346428982', '2023-09-12 08:07:36.591856', 2, NULL, NULL, '', 'f'),
('_M6CWhFDZjWRJwuMZXZkA', '1', '1676845578346428982', '2023-08-25 11:36:28.801704', 2, NULL, NULL, '', 'f'),
('qqT2G6tWPGpFVk-sx90hz', '1', '1676845578346428982', '2023-08-18 11:19:10.733119', 2, NULL, NULL, '', 'f'),
('Tdd1NelUaBj6yjUSFXsyW', '1', '1676845578346428982', '2023-03-27 08:19:16.491321', 2, NULL, NULL, '', 'f'),
('gotNFueBbPeYpC6-0kuTq', '1', '1676845578346428982', '2023-08-02 08:03:31.20851', 2, NULL, NULL, '', 'f'),
('cem2bKvkVX8w1T-kArmQ9', '1', '1676845578346428982', '2023-09-11 08:04:04.966453', 2, NULL, NULL, '', 'f'),
('Us1Y0RSKEL7mSVQpakbeX', '1', '1676845578346428982', '2023-07-17 08:08:39.840372', 2, NULL, NULL, '', 'f'),
('3UnEL4BwJx7-LHkDm1GLC', '1', '1676845578346428982', '2023-07-21 11:47:04.652884', 2, NULL, NULL, '', 'f'),
('j6vM5aP_tul9m1Atlx7zQ', '1', '1676845560577008380', '2023-09-18 13:39:41.77919', 2, NULL, NULL, '', 'f'),
('uqvdGdtx9fKNlPmHsfrxP', '1', '1676845560577008380', '2023-04-11 08:02:48.888567', 2, NULL, NULL, '', 'f'),
('iiaeFez3fBIf875OVvk_o', '1', '1676845560577008380', '2023-06-13 13:37:31.015271', 2, NULL, NULL, '', 'f'),
('tJ6YJjWSLFxKQvux-UsNu', '1', '1676845560577008380', '2023-07-12 13:29:47.874893', 2, NULL, NULL, '', 'f'),
('cINhGtj1zKp4QyRXrwH3h', '1', '1676845560577008380', '2023-05-16 13:59:58.036763', 2, NULL, NULL, '', 'f'),
('9QzEDf-kUdG4j2DyIhLHU', '1', '1676845560577008380', '2023-08-23 13:20:07.96596', 2, NULL, NULL, '', 'f'),
('63_Oo-0rmz-VTyTpUng8I', '1', '1676845560577008380', '2023-05-15 13:34:47.442567', 2, NULL, NULL, '', 'f'),
('XYmKLCw1Jv6dNWwBOQb38', '1', '1676845560577008380', '2023-03-06 09:21:08.388763', 2, NULL, NULL, '', 'f'),
('J5mLBcmX24R0aLQlcWEiu', '1', '1676845560577008380', '2023-08-07 14:25:09.648119', 2, NULL, NULL, '', 'f'),
('27a5qDvi3tB_2AAhvwqCy', '1', '1676845560577008380', '2023-04-26 13:30:34.28232', 2, NULL, NULL, '', 'f'),
('OCJIy-k8e0ZjkLc2ZOH_v', '1', '1676845560577008380', '2023-03-21 10:44:53.638152', 2, NULL, NULL, '', 'f'),
('am34ywFQAUY1SBxfgEJ1x', '1', '1676845560577008380', '2023-02-22 14:31:13.559426', 2, NULL, NULL, '', 'f'),
('I5Ny3-83UPUGbkm3FMXbJ', '1', '1676845578346428982', '2023-05-04 12:33:43.549065', 2, NULL, NULL, '', 'f'),
('Yo98XlWzVlYhoSJdbg5Uv', '1', '1676845560577008380', '2023-04-17 14:02:44.612721', 2, NULL, NULL, '', 'f'),
('R_HDy-lRrRJjX2Vdr8vkP', '1', '1676845560577008380', '2023-03-14 15:02:54.984196', 2, NULL, NULL, '', 'f'),
('wd4-EnK1IE5-LkX8Ktmxf', '1', '1676845560577008380', '2023-08-15 13:06:00.537346', 2, NULL, NULL, '', 'f'),
('jrin-HRt8BPGz3ewDHo7d', '1', '1676845560577008380', '2023-09-04 08:07:19.924419', 2, NULL, NULL, '', 'f'),
('wJ-xqs8tVl1qbCUB8AAvy', '1', '1676845578346428982', '2023-07-31 14:41:51.201416', 2, NULL, NULL, '', 'f'),
('BL0XNtCJscTNcvUBThp73', '1', '1676845578346428982', '2023-08-31 08:06:51.572075', 2, NULL, NULL, '', 'f'),
('YXwmQ3soBXpT3fQdWLNy0', '1', '1676845578346428982', '2023-03-30 12:31:08.491864', 2, NULL, NULL, '', 'f'),
('KKLFBTsERN-wZy4R2hLYN', '1', '1676845578346428982', '2023-08-08 12:46:30.27419', 2, NULL, NULL, '', 'f'),
('S4c_afWmLpWE-71pdAq7M', '1', '1676845578346428982', '2023-07-03 08:07:38.32344', 2, NULL, NULL, '', 'f'),
('RR7d_h6lETveoMjol0L2W', '1', '1676845578346428982', '2023-08-18 08:06:45.763445', 2, NULL, NULL, '', 'f'),
('5Q3SxnH1M6Bh56mTiQhlz', '1', '1676845578346428982', '2023-03-17 11:55:44.60104', 2, NULL, NULL, '', 'f'),
('_y5sNNeViwshEN0WGRPcD', '1', '1676845578346428982', '2023-04-27 07:50:41.256849', 2, NULL, NULL, '', 'f'),
('RCvVCpMJagfNjAm8ddYnV', '1', '1676845578346428982', '2023-07-18 12:32:30.93719', 2, NULL, NULL, '', 'f'),
('OZBa0qS7MfBqlZlefwdy-', '1', '1676845578346428982', '2023-03-28 08:05:33.938688', 2, NULL, NULL, '', 'f'),
('g_1xgI-Hr-HdfIgRYzLpq', '1', '1676845578346428982', '2023-08-07 08:04:13.208698', 2, NULL, NULL, '', 'f'),
('1ja4sQI5HxRI-vsLkWkpc', '1', '1676845578346428982', '2023-04-14 07:55:15.238307', 2, NULL, NULL, '', 'f'),
('7KAfXBtNcamE8FKI7nRK0', '1', '1676845578346428982', '2023-05-11 08:11:17.598745', 2, NULL, NULL, '', 'f'),
('v0KISHIi63yvUyiqJ5r4v', '1', '1676845578346428982', '2023-07-31 14:18:34.248967', 2, NULL, NULL, '', 'f'),
('KPkbDDLRUKiej77UI-6tf', '1', '1676845578346428982', '2023-07-25 08:15:02.026137', 2, NULL, NULL, '', 'f'),
('7gPwNlvECO6wjtdK66F3e', '1', '1676845578346428982', '2023-03-10 11:55:02.014458', 2, NULL, NULL, '', 'f'),
('dgIyf6itcWTWjG0DLvX2T', '1', '1676845578346428982', '2023-06-21 07:53:36.042583', 2, NULL, NULL, '', 'f'),
('fymCF_W_ES_DHC4ZdKuh6', '1', '1676845578346428982', '2023-06-27 16:30:36.140536', 2, NULL, NULL, '', 'f'),
('CAK7pYX8N3yb1txtpAIDS', '1', '1676845578346428982', '2023-05-16 13:19:46.505997', 2, NULL, NULL, '', 'f'),
('IJUfRGkn1RDoUzEFcBcSo', '1', '1676845578346428982', '2023-07-11 12:48:11.389221', 2, NULL, NULL, '', 'f'),
('KYl9TIAsU95b-8OZX-ipL', '1', '1676845578346428982', '2023-06-26 15:12:16.189926', 2, NULL, NULL, '', 'f'),
('UTK9TLhi6c72UDhYuQKrI', '1', '1676845578346428982', '2023-09-19 08:05:31.811139', 2, NULL, NULL, '', 'f'),
('L8gJ0LoQzY33LJqH3-hZ-', '1', '1676845578346428982', '2023-03-30 07:56:12.60433', 2, NULL, NULL, '', 'f'),
('tcTDusevJz_bRC7EawOvl', '1', '1676845578346428982', '2023-03-28 12:13:37.317215', 2, NULL, NULL, '', 'f'),
('ZwfUgYUXAzK4Emvla90aM', '1', '1676845578346428982', '2023-08-01 09:00:35.863564', 2, NULL, NULL, '', 'f'),
('RfeEg-54QIZTd7AmPXkf2', '1', '1676845578346428982', '2023-07-05 13:04:06.351316', 2, NULL, NULL, '', 'f'),
('2RppZo_CFliy91_jEcwDL', '1', '1676845578346428982', '2023-03-21 12:40:07.806825', 2, NULL, NULL, '', 'f'),
('0NWvVho12BjZIQ8IHIJ-x', '1', '1676845578346428982', '2023-05-22 07:57:39.078337', 2, NULL, NULL, '', 'f'),
('cmMyrmH6Eqxl1_Z8bD365', '1', '1676845578346428982', '2023-05-10 08:12:04.59146', 2, NULL, NULL, '', 'f'),
('g52V5AAf8k0efcafkWDlr', '1', '1676845578346428982', '2023-03-24 11:32:18.043524', 2, NULL, NULL, '', 'f'),
('GuWkiHwdFm0jeYOmnl0rp', '1', '1676845578346428982', '2023-07-28 11:00:37.520878', 2, NULL, NULL, '', 'f'),
('w7Me8WKIlekASHnH4DOtl', '1', '1676845578346428982', '2023-05-26 11:47:21.373535', 2, NULL, NULL, '', 'f'),
('Lnc2JeUzMZwIvQZk8G3iJ', '1', '1676845578346428982', '2023-03-02 07:58:21.594529', 2, NULL, NULL, '', 'f'),
('eTmnqrg8Pg8kvtJpP9_JF', '1', '1676845578346428982', '2023-08-31 13:32:01.889481', 2, NULL, NULL, '', 'f'),
('-b5PcHnTllRJpD3NGFp9d', '1', '1676845578346428982', '2023-09-15 11:34:51.395276', 2, NULL, NULL, '', 'f'),
('pwCnZdYGz-s9nf7YDriJn', '1', '1676845578346428982', '2023-06-16 07:56:54.437022', 2, NULL, NULL, '', 'f'),
('1CB4HL5mVl7UeAd7nwQjp', '1', '1676845578346428982', '2023-03-17 11:53:28.711185', 2, NULL, NULL, '', 'f'),
('X6b-HunsBVmEHZyD_p9Um', '1', '1676845578346428982', '2023-03-15 08:15:13.049467', 2, NULL, NULL, '', 'f'),
('aOUuXfSNcXOEbjf7gVF3K', '1', '1676845578346428982', '2023-04-10 07:58:07.489016', 2, NULL, NULL, '', 'f'),
('TlYxwU6sHcdZ0O5s6RiMH', '1', '1676845578346428982', '2023-05-31 13:16:24.10288', 2, NULL, NULL, '', 'f'),
('u-DgWFRhIAciWDg8DmGre', '1', '1676845578346428982', '2023-09-06 08:04:41.450389', 2, NULL, NULL, '', 'f'),
('yqOwgBo2yWWQpXSZpxRT_', '1', '1676845578346428982', '2023-09-05 08:10:38.090765', 2, NULL, NULL, '', 'f'),
('HboasO3CX6aewa_fizw3M', '1', '1676845578346428982', '2023-08-25 08:05:04.732127', 2, NULL, NULL, '', 'f'),
('CRY4-ySyOP2ICicNoOYq7', '1', '1676845578346428982', '2023-09-21 08:12:48.269437', 1, NULL, NULL, '', 't'),
('Flv3pXug7AW_FTJjzdPQr', '1', '1676845560577008380', '2023-06-21 08:21:53.721154', 2, NULL, NULL, '', 'f'),
('WXuLlNf37YZIn3pNydW9P', '1', '1676845560577008380', '2023-08-25 08:08:01.637961', 2, NULL, NULL, '', 'f'),
('A3XpgFTHIPKDN2SahhmoH', '1', '1676845560577008380', '2023-04-10 08:10:49.746694', 2, NULL, NULL, '', 'f'),
('-ggwdo0M7LMz6uwEja5bO', '1', '1676845560577008380', '2023-08-14 08:19:29.423457', 2, NULL, NULL, '', 'f'),
('bNTbyzSd4CweOh7KKiXnS', '1', '1676845560577008380', '2023-08-23 08:05:30.719933', 2, NULL, NULL, '', 'f'),
('KeLpBxQLaRASopha7le3O', '1', '1676845560577008380', '2023-05-17 13:41:01.394373', 2, NULL, NULL, '', 'f'),
('JR216eP7CwM3RUYtQVjQz', '1', '1676845560577008380', '2023-07-18 08:07:34.091781', 2, NULL, NULL, '', 'f'),
('CJy28j8gfOObpqFkwcAOC', '1', '1676845560577008380', '2023-04-04 14:08:58.230871', 2, NULL, NULL, '', 'f'),
('1ZIWwdFe9kPbwjju8ji5_', '1', '1676845560577008380', '2023-08-02 13:27:15.250352', 2, NULL, NULL, '', 'f'),
('yZm-ZOR1dlfObC90Ym37g', '1', '1676845560577008380', '2023-08-21 13:43:50.101528', 2, NULL, NULL, '', 'f'),
('97n3LK04U5IbIEuLFUEK9', '1', '1676845560577008380', '2023-06-20 08:30:02.442299', 2, NULL, NULL, '', 'f'),
('kZmAMJL5BNYYYAOODombu', '1', '1676845560577008380', '2023-03-28 08:00:09.549158', 2, NULL, NULL, '', 'f'),
('WVklzMRypREErK5fo9Nqj', '1', '1676845560577008380', '2023-06-27 13:36:57.60253', 2, NULL, NULL, '', 'f'),
('76tR6nrGp6hd9IXqDd-Ln', '1', '1676845560577008380', '2023-08-11 08:07:50.57046', 2, NULL, NULL, '', 'f'),
('rgiYQnD-y89gbEeRBkK5_', '1', '1676845560577008380', '2023-06-19 12:58:55.771641', 2, NULL, NULL, '', 'f'),
('TgFrLpdvLYNyuv3Eh0Rb4', '1', '1676845560577008380', '2023-02-22 09:24:47.945806', 2, NULL, NULL, '', 'f'),
('frIMlyWWl0D-TYZROBbwS', '1', '1676845560577008380', '2023-08-07 08:26:21.915547', 2, NULL, NULL, '', 'f'),
('pPNN7IQvwpQuofE2nX5q_', '1', '1676845560577008380', '2023-08-02 08:11:31.316856', 2, NULL, NULL, '', 'f'),
('KYHzCQpnLBdkeFajMZyby', '1', '1676845560577008380', '2023-06-15 13:37:28.477148', 2, NULL, NULL, '', 'f'),
('FNnK86ciLFry0kmboyjgJ', '1', '1676845560577008380', '2023-03-20 13:31:42.378912', 2, NULL, NULL, '', 'f'),
('zVO4v-uSc2qWRa0IwrBCO', '1', '1676845560577008380', '2023-07-04 13:42:43.930839', 2, NULL, NULL, '', 'f'),
('qdbRY3YeVnGLZfYZhtj7g', '1', '1676845578346428982', '2023-09-19 12:39:33.864038', 2, NULL, NULL, '', 'f'),
('mJ_hqi-aovjU5H02e_rGI', '1', '1676845560577008380', '2023-08-08 13:18:06.990524', 2, NULL, NULL, '', 'f'),
('yMUp0eMhfomWoF0f_qtg9', '1', '1676845560577008380', '2023-09-07 08:09:53.952668', 2, NULL, NULL, '', 'f'),
('aOat3iPs5QQrZlG3rlhtU', '1', '1676845560577008380', '2023-09-12 08:10:54.762831', 2, NULL, NULL, '', 'f'),
('dn8HiqC0cdiVTLKViugYk', '1', '1676845560577008380', '2023-09-15 13:27:06.51633', 2, NULL, NULL, '', 'f'),
('vTsUGazaqUKHe-io8qs2O', '1', '1676845560577008380', '2023-07-14 13:44:25.190212', 2, NULL, NULL, '', 'f'),
('Qnpn3MutDRbrXtAr9i5aq', '1', '1676845560577008380', '2023-08-04 08:11:29.656823', 2, NULL, NULL, '', 'f'),
('SwgRuitTh5n82JBblE6xh', '1', '1676845560577008380', '2023-07-17 08:21:43.043319', 2, NULL, NULL, '', 'f'),
('qr1e2iRS3P4g2kG0Dqf9C', '1', '1676845560577008380', '2023-02-23 15:05:04.328156', 2, NULL, NULL, '', 'f'),
('fhuqm4q4qZpYYSenX9Ybc', '1', '1676845560577008380', '2023-08-30 13:08:32.14108', 2, NULL, NULL, '', 'f'),
('-xd1l93RVndX1TQJwzAXK', '1', '1676845560577008380', '2023-08-31 08:08:17.005493', 2, NULL, NULL, '', 'f'),
('UimJ3OwxZUsfs2uQxm_ix', '1', '1676845560577008380', '2023-07-10 13:58:32.471298', 2, NULL, NULL, '', 'f'),
('QIR1wW4soNts2KVOs8ixw', '1', '1676845560577008380', '2023-03-17 13:13:53.446613', 2, NULL, NULL, '', 'f'),
('F6MAn9qKejtXDDYnA9jGz', '1', '1676845560577008380', '2023-07-11 08:20:09.377637', 2, NULL, NULL, '', 'f'),
('FSuSa-ODVM2mxiMVskvh3', '1', '1676845560577008380', '2023-09-11 08:14:21.506213', 2, NULL, NULL, '', 'f'),
('E_W-5i65II_t9tqQsM7Fw', '1', '1676845560577008380', '2023-04-13 12:52:58.478431', 2, NULL, NULL, '', 'f'),
('onaYp19j-aiJrWZYeDcCo', '1', '1676845578346428982', '2023-08-22 08:06:37.656177', 2, NULL, NULL, '', 'f'),
('WqmaHuAZtzNy3CvGZcgpf', '1', '1676845578346428982', '2023-05-15 07:51:43.705094', 2, NULL, NULL, '', 'f'),
('vuitfFWGvSW3qzQOYR6ct', '1', '1676845578346428982', '2023-08-04 08:05:20.196962', 2, NULL, NULL, '', 'f'),
('_QaTNReUqb_VXEuq2XP2x', '1', '1676845578346428982', '2023-03-07 14:48:46.406941', 2, NULL, NULL, '', 'f'),
('FPh7K9ZHBsStrqU4wIcNK', '1', '1676845578346428982', '2023-07-31 08:14:12.010083', 2, NULL, NULL, '', 'f'),
('L-NEpnxUAQxrL1m0y9g3P', '1', '1676845578346428982', '2023-08-29 12:40:28.6408', 2, NULL, NULL, '', 'f'),
('-zUCTR_BwppEyOMvBi8rg', '1', '1676845578346428982', '2023-04-12 16:16:19.995653', 2, NULL, NULL, '', 'f'),
('X8h-E0T86eFbS3OxGqgGq', '1', '1676845578346428982', '2023-09-07 12:47:09.432782', 2, NULL, NULL, '', 'f'),
('ywdn2zo5ecr2zyysmqxlI', '1', '1676845578346428982', '2023-09-06 12:37:03.824049', 2, NULL, NULL, '', 'f'),
('goo4Ay90NOwzSKFJy-SPy', '1', '1676845578346428982', '2023-06-05 12:48:37.251947', 2, NULL, NULL, '', 'f'),
('2qqeQN2Z_TCjneqfhUUOI', '1', '1676845578346428982', '2023-08-07 12:42:28.346307', 2, NULL, NULL, '', 'f'),
('vVlJni0XYTMXDZ699x30D', '1', '1676845578346428982', '2023-05-11 12:36:17.23885', 2, NULL, NULL, '', 'f'),
('_IlEs0gEtUV1X_fT5uRhd', '1', '1676845578346428982', '2023-09-14 12:37:56.470805', 2, NULL, NULL, '', 'f'),
('8DWf1YGkBEvw7LZ0s9Mkb', '1', '1676845578346428982', '2023-08-01 13:07:36.997946', 2, NULL, NULL, '', 'f'),
('z_61BI-X__UAoX6e3OiQR', '1', '1676845560577008380', '2023-03-15 10:43:05.263355', 2, NULL, NULL, '', 'f'),
('5PCFCFKhnQMwnoQQUTBQN', '1', '1676845560577008380', '2023-02-27 08:11:06.264014', 2, NULL, NULL, '', 'f'),
('WDt-hnqH49BX5ixF_5TJ1', '1', '1676845560577008380', '2023-09-13 08:07:01.888417', 2, NULL, NULL, '', 'f'),
('pOWaz0U8kfLhpy-9g7nEt', '1', '1676845560577008380', '2023-05-02 08:03:35.208688', 2, NULL, NULL, '', 'f'),
('U-73EoNG6nvVOr_5zo_04', '1', '1676845560577008380', '2023-05-23 13:28:52.616923', 2, NULL, NULL, '', 'f'),
('thRjaDK0oziGC8fdm8AaA', '1', '1676845560577008380', '2023-03-29 12:53:19.746475', 2, NULL, NULL, '', 'f'),
('105kIw7VTAMEcI1muz5Al', '1', '1676845560577008380', '2023-06-15 08:21:31.354737', 2, NULL, NULL, '', 'f'),
('JUs7iBH0Y0HY61bDOBkv6', '1', '1676845560577008380', '2023-04-05 13:11:11.950407', 2, NULL, NULL, '', 'f'),
('ClneyIFdpgfofmdzvVh88', '1', '1676845560577008380', '2023-09-14 08:06:54.474964', 2, NULL, NULL, '', 'f'),
('f29DtFVThMNWG9tvlM9YX', '1', '1676845560577008380', '2023-08-03 08:11:16.466653', 2, NULL, NULL, '', 'f'),
('Dj2bnxr0vybJ6dQuvQCo3', '1', '1676845560577008380', '2023-04-04 07:58:02.764351', 2, NULL, NULL, '', 'f'),
('0kgKBGabW60klJUbopGil', '1', '1676845560577008380', '2023-06-26 08:16:57.121878', 2, NULL, NULL, '', 'f'),
('V6r1nGaNxsQynR5xh-P35', '1', '1676845560577008380', '2023-05-30 08:01:23.623974', 2, NULL, NULL, '', 'f'),
('LBdz-Q6SC7F67QTLF4nFi', '1', '1676845560577008380', '2023-05-30 13:42:13.409798', 2, NULL, NULL, '', 'f'),
('fQEi5obdY_kVpjKnXwej7', '1', '1676845560577008380', '2023-02-28 10:09:21.977671', 2, NULL, NULL, '', 'f'),
('pnGnWKnM8hanPFtA4tcwT', '1', '1676845560577008380', '2023-07-06 14:27:41.903854', 2, NULL, NULL, '', 'f'),
('0XQ1RuPZlCVPmYHagVU7K', '1', '1676845560577008380', '2023-09-05 08:10:59.204158', 2, NULL, NULL, '', 'f'),
('SvTBHoYpmnd2HO9pQi6CU', '1', '1676845560577008380', '2023-07-27 13:30:23.067516', 2, NULL, NULL, '', 'f'),
('up4V5teNORqzHQrQuVQWd', '1', '1676845560577008380', '2023-07-31 13:40:12.8857', 2, NULL, NULL, '', 'f'),
('YLbbhMs88fYRiUXQJVIOI', '1', '1676845560577008380', '2023-05-23 08:28:48.384232', 2, NULL, NULL, '', 'f'),
('kFNUK7I7oGH-0Eknpshyl', '1', '1676845560577008380', '2023-05-03 07:54:59.756412', 2, NULL, NULL, '', 'f'),
('GU07Txj2h47rXo7uyrUpM', '1', '1676845560577008380', '2023-05-09 08:10:52.218532', 2, NULL, NULL, '', 'f'),
('sEFXfvUcwBIx3DlKr3z8F', '1', '1676845560577008380', '2023-03-28 13:06:45.514631', 2, NULL, NULL, '', 'f'),
('-KhjNeFFDBUoeDhtiih4l', '1', '1676845560577008380', '2023-02-22 08:10:18.552595', 2, NULL, NULL, '', 'f'),
('xlUmTnhZkT1eCe7PeTqzJ', '1', '1676845560577008380', '2023-03-07 08:25:44.914966', 2, NULL, NULL, '', 'f'),
('LSfxIdTGTyhrTOiDBSZy3', '1', '1676845560577008380', '2023-08-24 13:10:00.190671', 2, NULL, NULL, '', 'f'),
('WRWP-Jp4TfjWq0sPzZk76', '1', '1676845560577008380', '2023-08-08 08:20:10.013527', 2, NULL, NULL, '', 'f'),
('zxIlzYlHbJB4ibm7VfFd4', '1', '1676845560577008380', '2023-08-10 08:12:57.745242', 2, NULL, NULL, '', 'f'),
('OeWfbanMa7ffsxFXU6lnB', '1', '1676845560577008380', '2023-04-03 13:21:45.802993', 2, NULL, NULL, '', 'f'),
('Cfu8AUV3i_Lg_FmfyBJcu', '1', '1676845560577008380', '2023-09-19 08:05:47.487918', 2, NULL, NULL, '', 'f'),
('FLqOBwCDHnuRUnqDDzn4k', '1', '1676845560577008380', '2023-09-18 08:07:03.10426', 2, NULL, NULL, '', 'f'),
('ogpxA-IxkNtdoaohBJuWu', '1', '1676845560577008380', '2023-05-24 13:25:16.505538', 2, NULL, NULL, '', 'f'),
('pR7WlyjFyxcrsYDWoznZZ', '1', '1676845560577008380', '2023-06-16 08:15:17.914869', 2, NULL, NULL, '', 'f'),
('s0uPNdjFlP5tMhqHOfS-6', '1', '1676845560577008380', '2023-06-16 12:36:22.625975', 2, NULL, NULL, '', 'f'),
('V3JLH4NMTCb6CC_9Z1UHr', '1', '1676845560577008380', '2023-07-21 08:06:12.52568', 2, NULL, NULL, '', 'f'),
('TNV8fc8qkLObpuqYssyIV', '1', '1676845560577008380', '2023-03-15 15:09:50.939591', 2, NULL, NULL, '', 'f'),
('qrn9nJAA9XgS4m6P8ztg2', '1', '1676845560577008380', '2023-05-09 13:38:31.391385', 2, NULL, NULL, '', 'f'),
('sbW1QuieYV1ZqDLW4kNgE', '1', '1676845560577008380', '2023-08-15 08:14:05.270758', 2, NULL, NULL, '', 'f'),
('vDQCPn_RPFkauyQntRfUo', '1', '1676845560577008380', '2023-03-09 13:28:22.347962', 2, NULL, NULL, '', 'f'),
('oKAKIYt_ajDatGdEAyrhZ', '1', '1676845560577008380', '2023-08-09 14:26:56.856799', 2, NULL, NULL, '', 'f'),
('cv1iIwZAAq_HBmYMhEgeT', '1', '1676845560577008380', '2023-07-27 08:12:42.899602', 2, NULL, NULL, '', 'f'),
('rZvrRDR-uQhUqQWUd8avM', '1', '1676845560577008380', '2023-03-24 12:22:53.47424', 2, NULL, NULL, '', 'f'),
('W0uEl53yv_JogOafPbcXX', '1', '1676845560577008380', '2023-04-18 13:31:34.52628', 2, NULL, NULL, '', 'f'),
('LgtF8eGml0deK_xahRTrF', '1', '1676845560577008380', '2023-06-07 13:29:26.220986', 2, NULL, NULL, '', 'f'),
('DTxD0VDODP7xkLIOd6fyy', '1', '1676845560577008380', '2023-09-08 08:06:37.699706', 2, NULL, NULL, '', 'f'),
('NXT252teenQ3oniJp-bbi', '1', '1676845560577008380', '2023-07-21 14:00:27.901591', 2, NULL, NULL, '', 'f'),
('Hj3wx4yzQrE1r-2tvlcL2', '1', '1676845560577008380', '2023-07-20 08:20:16.408445', 2, NULL, NULL, '', 'f'),
('lOJDCsFW8By0rpD2aGf7-', '1', '1676845560577008380', '2023-05-22 13:56:10.462055', 2, NULL, NULL, '', 'f'),
('XJLeRzkJZ6dHAjw4qmLWq', '1', '1676845560577008380', '2023-07-14 08:07:27.245573', 2, NULL, NULL, '', 'f'),
('Bx_z-DEYhxDUTn-kt54eh', '1', '1676845560577008380', '2023-07-11 14:02:51.427338', 2, NULL, NULL, '', 'f'),
('aD2JS4PzGcR075X1wNXsd', '1', '1676845560577008380', '2023-08-09 08:18:06.111267', 2, NULL, NULL, '', 'f'),
('GoE3kCBvDvdYLV5Ft_Awg', '1', '1676845560577008380', '2023-06-06 13:34:38.251468', 2, NULL, NULL, '', 'f'),
('UQFIKtGIW0GKhbgz4Wh1R', '1', '1676845560577008380', '2023-06-19 08:45:48.791976', 2, NULL, NULL, '', 'f'),
('zxiHXA2OSuhqPPldO6lcC', '1', '1676845560577008380', '2023-04-18 08:00:56.004623', 2, NULL, NULL, '', 'f'),
('GnPnJ_2Zq8q40QwtO1GVO', '1', '1676845560577008380', '2023-03-27 13:12:56.715188', 2, NULL, NULL, '', 'f'),
('Cs7lizrwcjcDM-mRBfprW', '1', '1676845560577008380', '2023-07-04 08:06:59.471401', 2, NULL, NULL, '', 'f'),
('MVpP31cOeEtVxHLtmxXOt', '1', '1676845560577008380', '2023-07-13 13:32:48.79943', 2, NULL, NULL, '', 'f'),
('BSlvzLsZfPpZlHamhNqHN', '1', '1676845560577008380', '2023-06-23 12:31:17.0263', 2, NULL, NULL, '', 'f'),
('L8GMLmX_xwStlzMMQZ-jX', '1', '1676845560577008380', '2023-06-27 13:35:36.806087', 2, NULL, NULL, '', 'f'),
('D9iQKdOb7gLClo6ZDS9UT', '1', '1676845560577008380', '2023-05-04 13:44:27.320491', 2, NULL, NULL, '', 'f'),
('4WC6TAdqdDmR5X2arrdkn', '1', '1676845560577008380', '2023-08-28 08:17:31.144478', 2, NULL, NULL, '', 'f'),
('vkiqrs1073tX_gI2bqYq4', '1', '1676845578346428982', '2023-08-01 13:10:10.101374', 2, NULL, NULL, '', 'f'),
('oUOl1pqj0JWP-lCx1OMYg', '1', '1676845560577008380', '2023-05-31 08:05:25.298695', 2, NULL, NULL, '', 'f'),
('gXkS9YsdY8QgXaPgmUPyh', '1', '1676845560577008380', '2023-04-13 08:00:46.570472', 2, NULL, NULL, '', 'f'),
('j3gkqjYQb4yhlLY7DmTKq', '1', '1676845560577008380', '2023-05-12 08:03:37.427086', 2, NULL, NULL, '', 'f'),
('_Bo4z-c5w5I_WwRXS4_aa', '1', '1676845560577008380', '2023-06-05 13:38:17.54162', 2, NULL, NULL, '', 'f'),
('0hA8wSezZzSJf54qcW4SH', '1', '1676845560577008380', '2023-05-29 08:18:41.457107', 2, NULL, NULL, '', 'f'),
('Eil9ZCGKnrwq4Dqq3OGTv', '1', '1676845560577008380', '2023-06-12 13:46:00.178004', 2, NULL, NULL, '', 'f'),
('HjsuvYSninR5hNB8y8UP1', '1', '1676845560577008380', '2023-03-10 10:44:15.731191', 2, NULL, NULL, '', 'f'),
('KzZcuNHcxrUeMLwdMaYPB', '1', '1676845560577008380', '2023-05-11 12:48:42.074356', 2, NULL, NULL, '', 'f'),
('k-_EgYyDw5hBW-Y8Kw5JP', '1', '1676845560577008380', '2023-04-10 12:58:33.182684', 2, NULL, NULL, '', 'f'),
('IS9D_gSDnCCPczehcwuuC', '1', '1676845560577008380', '2023-07-25 08:11:04.563419', 2, NULL, NULL, '', 'f'),
('b01BhXzIIvIhA8iwwR92W', '1', '1676845560577008380', '2023-07-18 13:46:19.311423', 2, NULL, NULL, '', 'f'),
('ooQZeu2nLFyxjUHpRIwXC', '1', '1676845560577008380', '2023-09-21 08:16:45.026996', 1, NULL, NULL, '', 't'),
('VjCoqx5s50Wk96QW8gYO1', '1', '1676845578346428982', '2023-08-01 13:12:30.9294', 2, NULL, NULL, '', 'f'),
('9QiHMVFrX_XEe0oY67ulY', '1', '1676845578346428982', '2023-08-01 13:15:25.283109', 2, NULL, NULL, '', 'f'),
('7JmhykK1P9w6_c4Kn-X0Y', '1', '1676845578346428982', '2023-07-28 08:07:25.24715', 2, NULL, NULL, '', 'f'),
('W6tYM1vcx8yYmw-OzyVQz', '1', '1676845578346428982', '2023-07-11 08:13:43.306128', 2, NULL, NULL, '', 'f'),
('KUTgeS0w4b1I9cl4USm8c', '1', '1676845578346428982', '2023-06-27 15:36:46.59285', 2, NULL, NULL, '', 'f'),
('G2peBpc011Ppkv5_pTKh2', '1', '1676845578346428982', '2023-06-08 13:34:31.107091', 2, NULL, NULL, '', 'f'),
('7xsYRwctx8UWtUoi3PKwM', '1', '1676845578346428982', '2023-04-27 12:33:27.327387', 2, NULL, NULL, '', 'f'),
('WHy7ir0rOJKsQCxaFhUPj', '1', '1676845578346428982', '2023-04-17 13:11:06.202726', 2, NULL, NULL, '', 'f'),
('9WsBjJC0gZoqyAHrcWOP4', '1', '1676845578346428982', '2023-06-20 08:08:49.018895', 2, NULL, NULL, '', 'f'),
('J4AZXuqubpz0oySZs_K96', '1', '1676845578346428982', '2023-07-17 13:18:25.066502', 2, NULL, NULL, '', 'f'),
('ao0vfo11DHXv1sI-KCmZY', '1', '1676845578346428982', '2023-06-09 11:40:14.434886', 2, NULL, NULL, '', 'f'),
('y3jQaYBU9SVtrYpFpy3p6', '1', '1676845578346428982', '2023-05-30 07:49:00.880096', 2, NULL, NULL, '', 'f'),
('M1NnxtrnzD2D7ZmRIFK_s', '1', '1676845578346428982', '2023-05-17 12:55:09.450475', 2, NULL, NULL, '', 'f'),
('Qog6Mwmm-goFKTMEjLF4r', '1', '1676845578346428982', '2023-02-28 08:00:36.97298', 2, NULL, NULL, '', 'f'),
('nLGMSxYpuIYp1Xe7P2rCQ', '1', '1676845578346428982', '2023-05-16 08:06:42.005421', 2, NULL, NULL, '', 'f'),
('dH0QrIP4Ev5FcE5MmRM3r', '1', '1676845578346428982', '2023-03-21 07:57:41.128869', 2, NULL, NULL, '', 'f'),
('olJRf4BBpTxDyxtEOaLO-', '1', '1676845578346428982', '2023-07-13 12:54:43.645706', 2, NULL, NULL, '', 'f'),
('iffvfrY3GmcLSk2vxJTnU', '1', '1676845578346428982', '2023-06-15 12:38:03.800428', 2, NULL, NULL, '', 'f'),
('khUA6rRI1JQeX8pkMgJg1', '1', '1676845578346428982', '2023-06-19 08:04:32.112619', 2, NULL, NULL, '', 'f'),
('BLdMVv800xTTuKdKOqN1j', '1', '1676845578346428982', '2023-05-19 11:40:08.638369', 2, NULL, NULL, '', 'f'),
('ee94KJCBQLJmhaXJuFhci', '1', '1676845578346428982', '2023-07-26 12:28:20.584411', 2, NULL, NULL, '', 'f');

INSERT INTO "public"."transactions" ("id", "local_id", "amount", "saving_id", "deposit_id", "loan_id", "transaction_type", "created_at", "created_by", "status", "tenant_id", "branch_id", "batch_id", "payment_method_id", "recipient") VALUES
('ee7e1e22-c37b-45a5-bf6a-ece28b47ebac', 'ee7e1e22-c37b-45a5-bf6a-ece28b47ebac', 'Rp. 12.000.000', NULL, NULL, '00104010000867', 3, '2023-11-15 02:46:09', 1699010811508943532, 0, '30', '001', 'mobile', '00105000000476', 'Dana id');
INSERT INTO "public"."transactions" ("id", "local_id", "amount", "saving_id", "deposit_id", "loan_id", "transaction_type", "created_at", "created_by", "status", "tenant_id", "branch_id", "batch_id", "payment_method_id", "recipient") VALUES
('51c45e80-fd13-4b07-8b97-bd75ba1fe751', '51c45e80-fd13-4b07-8b97-bd75ba1fe751', 'Rp. 12.000.000', NULL, NULL, '00104010000867', 3, '2023-11-15 02:46:09', 1699010811508943532, 0, '30', '001', 'mobile', '00105000000476', 'Dana id');
INSERT INTO "public"."transactions" ("id", "local_id", "amount", "saving_id", "deposit_id", "loan_id", "transaction_type", "created_at", "created_by", "status", "tenant_id", "branch_id", "batch_id", "payment_method_id", "recipient") VALUES
('5f3f5e9b-c9bd-4c00-9651-4c27086b7da1', '5f3f5e9b-c9bd-4c00-9651-4c27086b7da1', '2000000', '00102010000456', NULL, NULL, 1, '2023-11-15 02:47:04', 1699010811508943532, 0, '30', '001', 'mobile', '00105000000478', 'Dnid');
INSERT INTO "public"."transactions" ("id", "local_id", "amount", "saving_id", "deposit_id", "loan_id", "transaction_type", "created_at", "created_by", "status", "tenant_id", "branch_id", "batch_id", "payment_method_id", "recipient") VALUES
('eb548682-11bb-478e-a284-334364a0e0e7', 'eb548682-11bb-478e-a284-334364a0e0e7', '100000', '00102010000456', NULL, NULL, 1, '2023-11-15 03:28:51', 1699010811508943532, 0, '30', '001', 'mobile', '00105000000478', 'Jajaja'),
('c4dd9366-5c1e-42ff-8720-6956c7679fbb', 'c4dd9366-5c1e-42ff-8720-6956c7679fbb', '100000', '00102010000456', NULL, NULL, 1, '2023-11-15 03:29:05', 1699010811508943532, 0, '30', '001', 'mobile', '00105000000478', 'Jajaja'),
('9d808a85-9280-4f1c-814e-34eb47159d86', '9d808a85-9280-4f1c-814e-34eb47159d86', '100000', '00102010000456', NULL, NULL, 1, '2023-11-15 03:29:56', 1699010811508943532, 0, '30', '001', 'mobile', '00105000000478', 'Jajaja'),
('b08e052e-083e-4349-bc20-629381345a36', 'b08e052e-083e-4349-bc20-629381345a36', '100000', '00102010000456', NULL, NULL, 1, '2023-11-15 03:29:58', 1699010811508943532, 0, '30', '001', 'mobile', '00105000000478', 'Jajaja'),
('d1b1fe1d-a317-42c9-8437-2b38105da116', 'd1b1fe1d-a317-42c9-8437-2b38105da116', '100000', '00102010000456', NULL, NULL, 1, '2023-11-15 03:29:59', 1699010811508943532, 0, '30', '001', 'mobile', '00105000000478', 'Jajaja'),
('9352203b-60c8-439e-83ce-7da8612070b2', '9352203b-60c8-439e-83ce-7da8612070b2', '100000', '00102010000456', NULL, NULL, 1, '2023-11-15 03:30:10', 1699010811508943532, 0, '30', '001', 'mobile', '00105000000478', 'Jajaja'),
('a970bd20-4281-40d2-9ca7-69ec11d78843', 'a970bd20-4281-40d2-9ca7-69ec11d78843', '100000', '00102010000456', NULL, NULL, 1, '2023-11-15 03:30:21', 1699010811508943532, 0, '30', '001', 'mobile', '00105000000478', 'Jajaja'),
('192c044c-2983-4688-9253-c4bc060065ed', '192c044c-2983-4688-9253-c4bc060065ed', '1000000', '0980980879987', NULL, NULL, 1, '2023-11-15 03:57:17', 1699010811508943532, 0, '30', '098', 'mobile', '1698295258548618648', 'Namaaaa'),
('6e430fb3-1395-4170-a828-cf1583ee8aef', '6e430fb3-1395-4170-a828-cf1583ee8aef', '1000000', NULL, NULL, '0980980879987', 3, '2023-11-15 03:57:46', 1699010811508943532, 0, '30', '098', 'mobile', '01299', 'DANA'),
('3dad74f3-7ad8-4350-a5d5-7fbec332c5c4', '3dad74f3-7ad8-4350-a5d5-7fbec332c5c4', '1000000', '0980980879987', NULL, NULL, 1, '2023-11-15 03:58:05', 1699010811508943532, 0, '30', '098', 'mobile', '1698295258548618648', 'Namaaaa'),
('dfe2dd25-1774-4086-9fd8-4bf382cda5a2', 'dfe2dd25-1774-4086-9fd8-4bf382cda5a2', '1000000', '0980980879987', NULL, NULL, 1, '2023-11-15 04:04:55', 1699010811508943532, 0, '30', '098', 'mobile', '00105000000476', 'Namaaaa'),
('8aa7cf71-ad4a-47a7-b5d2-ccb02d5b81c5', '8aa7cf71-ad4a-47a7-b5d2-ccb02d5b81c5', '616461', '00102010000456', NULL, NULL, 1, '2023-11-15 04:06:00', 1699010811508943532, 0, '30', '001', 'mobile', '00105000000476', 'Hhgg'),
('194c60c2-09c4-43a3-987b-cb2d7e9c534e', '194c60c2-09c4-43a3-987b-cb2d7e9c534e', '4646494', '00102010000456', NULL, NULL, 1, '2023-11-15 04:07:03', 1699010811508943532, 0, '30', '001', 'mobile', '00105000000478', 'Bwhahaja');

INSERT INTO "public"."users" ("id", "is_active", "email", "email_confirmed_at", "password", "first_name", "last_name", "username", "created_at", "deleted_at", "customer_id", "account_officer_id", "client_type", "tenant_id", "branch_id") VALUES
(1624525458315228410, 'f', 'anton@kreasinusantara.id', NULL, '$2a$04$PW4FwMESK1AR/22hR/M1h.D.RE3mji8Phy9zVOt2HyFb/4us5Xjry', 'Account Officer 1', '', 'ao1', '2021-06-24 09:04:18.435895', NULL, NULL, '0000', 'CORPORATE', '1', '001');
INSERT INTO "public"."users" ("id", "is_active", "email", "email_confirmed_at", "password", "first_name", "last_name", "username", "created_at", "deleted_at", "customer_id", "account_officer_id", "client_type", "tenant_id", "branch_id") VALUES
(1660669304388724383, 'f', 'dev@dotsco.re', NULL, '$2a$04$PW4FwMESK1AR/22hR/M1h.D.RE3mji8Phy9zVOt2HyFb/4us5Xjry', 'Dots', 'Core', 'dotscore', '2022-08-16 10:01:44.527166', NULL, NULL, NULL, 'API', '1', '001');
INSERT INTO "public"."users" ("id", "is_active", "email", "email_confirmed_at", "password", "first_name", "last_name", "username", "created_at", "deleted_at", "customer_id", "account_officer_id", "client_type", "tenant_id", "branch_id") VALUES
(1689934379457021063, 'f', 'hiras@gmail.com', NULL, '$2a$04$ADaTO//WyWHYuD1dgdV6le2rWMKfvJq3w./sWqdrCgjMR5DpE0qYe', 'Hiras', '', 'hiras', '2023-07-21 17:12:59.45844', NULL, NULL, '0000', 'CORPORATE', '2', '001');
INSERT INTO "public"."users" ("id", "is_active", "email", "email_confirmed_at", "password", "first_name", "last_name", "username", "created_at", "deleted_at", "customer_id", "account_officer_id", "client_type", "tenant_id", "branch_id") VALUES
(1678876786602590114, 'f', 'ika_roman@kreasinusantara.id', NULL, '$2a$04$hG81.Oj9GI2IvRYhzxROoeJzDSNx3a34kXdlS6bUXVZYc..kEawdW', 'Ika Roman', '', 'ika', '2023-03-15 17:39:46.791513', NULL, NULL, '0000', 'CORPORATE', '3', '001'),
(1678876881981753058, 'f', 'nurmadila@kreasinusantara.id', NULL, '$2a$04$0erNsNsj6VWOWUhes8RYVemtTElvyaNckEBrfD8E918mkJqZhrKYG', 'Nurmadila', '', 'nurmadila', '2023-03-15 17:41:21.983283', NULL, NULL, '0000', 'CORPORATE', '3', '001'),
(1676845360888262735, 'f', 'edi@gmail.com', NULL, '$2a$04$Jrp3cEqwB5FvGweonp6ju.05MK0ru6u1A8TN67qlHcPetNpD06AUK', 'Edi Juanda', '', 'edi.juanda', '2023-02-20 05:22:41.437394', NULL, NULL, '0001', 'CORPORATE', '1', '001'),
(1678876898942384964, 'f', 'jahoras@kreasinusantara.id', NULL, '$2a$04$KmyXT3pj5uOilVxGFGNip.3dV7M/YTxdFtCfDOgKLrzXUnL5LaAu2', 'Jahoras', '', 'jahoras', '2023-03-15 17:41:38.943344', NULL, NULL, '0000', 'CORPORATE', '3', '001'),
(1678874808100561625, 'f', 'ksuks_dotscore@kreasinusantara.id', NULL, '$2a$04$etTDTqyTATS5aAo9GNQzXeUqs1tU/F7GXSYToWpheG98JWNQLdzGu', 'KSUKS Dotscore', '', 'ksuks_dotscore', '2023-03-15 17:06:48.101585', NULL, NULL, '0000', 'API', '3', '001'),
(1676845476595559726, 'f', 'mechael@gmail.com', NULL, '$2a$04$Anlu6L49oumljDJK0UkAR.4dHbGG1ivbxtU1ukIQcWv0/.nbLIX0m', 'MECHAEL SEMBIRING', '', 'mechael.sembiring', '2023-02-20 05:24:36.70479', NULL, NULL, '0002', 'CORPORATE', '1', '001'),
(1676845506616100338, 'f', 'sinaria@gmail.com', NULL, '$2a$04$VkUegfON.UPzCLSf0JSEcefH8m.rGE2A5Agcc08Ama/8Q.nc6QWDe', 'SINARIA SINULINGA', '', 'sinaria.sinulingga', '2023-02-20 05:25:07.232247', NULL, NULL, '0003', 'CORPORATE', '1', '001'),
(1676845534243174283, 'f', 'willem@gmail.com', NULL, '$2a$04$v5e7wSFIIY0lt05q54dh2.bU7PZ0WIdh27TocpIqXrLEzZsX0vylq', 'WILLEM GINTING', '', 'willem.ginting', '2023-02-20 05:25:34.340656', NULL, NULL, '0004', 'CORPORATE', '1', '001'),
(1676845560577008380, 'f', 'andi@gmail.com', NULL, '$2a$04$0koar6NExlQO.MlVXh2.nOjaxDCIakY3sQXIhtOW7AKNC49J0FfBW', 'ANDI NAKASI', '', 'andi.nakasi', '2023-02-20 05:26:01.160437', NULL, NULL, '0005', 'CORPORATE', '1', '001'),
(1676845578346428982, 'f', 'dadang@gmail.com', NULL, '$2a$04$E.OrGj1DIcCSsBYf/tw6o.NWG6/Uh9YCZhBGH16PAaMsAaOsLGaEu', 'DADANG YUSERI', '', 'dadang.yuseri', '2023-02-20 05:26:18.462128', NULL, NULL, '0006', 'CORPORATE', '1', '001'),
(1676845606602498572, 'f', 'dedy@gmail.com', NULL, '$2a$04$g4nBT.8aA6uqunyUxCXq6ez3qkihrYep4QyQrwS747YiMX6JWppky', 'DEDY APRIYANDI', '', 'dedy.apriyandi', '2023-02-20 05:26:46.718017', NULL, NULL, '0007', 'CORPORATE', '1', '001'),
(1684225151823806313, 'f', 'bpr.sukma.api@gmail.com', NULL, '$2a$04$gYzLrJBzUShVee7aCUfhOOVJVt/fzb2.8an1K7D/i4FrLEvf.3VSS', 'BPR Sukma API', '', 'bpr.sukma.api', '2023-05-16 15:19:11.913309', NULL, NULL, '0000', 'API', '2', '001'),
(1676860324420887381, 'f', 'bpr.sukma@kreasinusantara.id', NULL, '$2a$04$p.Ell.Xlv5smkZbndvaPfe9/kp3mxMHJyXxLsPisQh0r/zSR63u5S', 'AO BPR SUKMA', '', 'ao1', '2023-02-20 09:32:04.422989', NULL, NULL, '0000', 'CORPORATE', '2', '001'),
(1677484112390994124, 'f', 'ksu.kolega@kreasinusantara.id', NULL, '$2a$04$iKTRNz2GhvG9xchdtqjImOH94zglUER.JLciGfUgXQGsKFCoKyK4m', 'KSU KOLEGA', '', 'ksu_kolega', '2023-02-27 14:48:32.392957', NULL, NULL, '0000', 'CORPORATE', '3', '001'),
(1677571284566070730, 'f', 'annastya@kreasinusantara.id', NULL, '$2a$04$6yuP6NNTOVQWAu2/zOQgluJl5L23F14/Dp9jDbN4yjZKkNwBVRTfi', 'Annastya', '', 'annastya', '2023-02-28 15:01:24.649639', NULL, NULL, '0000', 'CORPORATE', '3', '001'),
(1677571294701518746, 'f', 'erpan@kreasinusantara.id', NULL, '$2a$04$.rGoaee5lpLLjXr3r2KGUuyZs/NaweWehRGDR3rJEbR2sJGRD062y', 'Erpan', '', 'erpan', '2023-02-28 15:01:34.702382', NULL, NULL, '0000', 'CORPORATE', '3', '001'),
(1677571307731310760, 'f', 'elliza@kreasinusantara.id', NULL, '$2a$04$GiQRNtyKNskMLsXagQIvieX.MqS2YD2RJTBGq.EiBuQkqxiCm9fkO', 'Elliza', '', 'elliza', '2023-02-28 15:01:47.732737', NULL, NULL, '0000', 'CORPORATE', '3', '001'),
(1677623195669460631, 'f', 'bpr_lka_test@kreasinusantara.id', NULL, '$2a$04$u7eggaSe9ACaRd1cuJkBtuCufuA5ZZZZaSH/kt.Tkm/hF/m7oweYW', 'BPR Logo Test', '', 'bpr_lka_test', '2023-03-01 05:26:35.856744', NULL, NULL, '0000', 'CORPORATE', '1', '001'),
(1689934355390153501, 'f', 'atip@gmail.com', NULL, '$2a$04$38YYT51PaJB0Xh8uZ5gBPeJRZoTSropzLL8yRt.jxpsAydjWXgw8W', 'Atip', '', 'atip', '2023-07-21 17:12:35.391686', NULL, NULL, '0000', 'CORPORATE', '2', '001'),
(1684225356124313394, 'f', 'dian.sumarlan@gmail.com', NULL, '$2a$04$k/lnFx3P3ozri35InWCKx.a.Kl1BMo06oMow9dEA1I3CN36YGh7/G', 'Dian Sumarlan', '', 'dian.sumarlan', '2023-05-16 15:22:36.125712', NULL, NULL, '0000', 'CORPORATE', '2', '001'),
(1689934396100611714, 'f', 'isma.k@gmail.com', NULL, '$2a$04$wB2WgcQOtY1a4Obr1MFcF.vf3pCj6HUKLi90y39UH4i.fU/yu779a', 'Isma', '', 'isma.kurniawan', '2023-07-21 17:13:16.101949', NULL, NULL, '0000', 'CORPORATE', '2', '001'),
(1685160548534563900, 'f', 'api@bprmetro.com', NULL, '$2a$04$HPCclBWehqEWas5J5AVxN.9FwIQRkoPPRuWyIyoLwVSyV4au0yP5S', 'Core API', '', 'metro.core.api', '2023-05-27 11:09:08.620211', NULL, NULL, '0000', 'API', '4', '001'),
(1689934413571611631, 'f', 'romi.k@gmail.com', NULL, '$2a$04$dJfBf/N4JKs9fkUvdi6MuOIuQSfsAToTtQYMkPqfvgYGMGFDIvglG', 'Romi Kurniawan', '', 'romi.kurniawan', '2023-07-21 17:13:33.573046', NULL, NULL, '0000', 'CORPORATE', '2', '001'),
(1685161863400590671, 'f', 'tiwi@bprmetro.com', NULL, '$2a$04$gFuMAg.LRaI1N8NS6ENcbuyjnNayg8X0P26JH44VfjjMB7jBYL0Za', 'tiwi', '', 'tiwi', '2023-05-27 11:31:03.402028', NULL, NULL, '0000', 'CORPORATE', '4', '001'),
(1689934448082535944, 'f', 'heri.sumekto@gmail.com', NULL, '$2a$04$uqpmbciDuDWJypL0maf9COotL5TpHzEgfX4m6Ju6rsRsvVfmIIXyW', 'Heri Sumekto', '', 'heri.sumekto', '2023-07-21 17:14:08.08374', NULL, NULL, '0000', 'CORPORATE', '2', '001'),
(1689934458390956948, 'f', 'heri.gunawan@gmail.com', NULL, '$2a$04$dV25GCLxtxZKmzOT.nEbC.o5jmtkJXGtMNulKRomtgaPR7pOARlT2', 'Heri Gunawan', '', 'heri.gunawan', '2023-07-21 17:14:18.392488', NULL, NULL, '0000', 'CORPORATE', '2', '001'),
(1689934476533218767, 'f', 'asep.suganda@gmail.com', NULL, '$2a$04$i7qHIch6N1q8P87MLRQaxeFgv.hJKitZnwjqYnrBbrnsY/xWPzSDS', 'Asep Suganda', '', 'asep.suganda', '2023-07-21 17:14:36.534379', NULL, NULL, '0000', 'CORPORATE', '2', '001'),
(1689934490739189531, 'f', 'dedi.supriadi@gmail.com', NULL, '$2a$04$xWyNNb9KS/yUvVMrhRZo8.CE.I81LSei8DzX8gIsZGA6tcaxWt6iO', 'Dedi Supriadi', '', 'dedi.supriadi', '2023-07-21 17:14:50.740437', NULL, NULL, '0000', 'CORPORATE', '2', '001'),
(1689934506908129803, 'f', 'ade.cahya@gmail.com', NULL, '$2a$04$ZEAX3t0Unax164Y0HNCDwOJs4eZqcrOwgPTVvEOhb0mm15vo0qcMK', 'Ade Cahya', '', 'ade.cahya', '2023-07-21 17:15:06.909658', NULL, NULL, '0000', 'CORPORATE', '2', '001'),
(1689934534284421593, 'f', 'lubis@gmail.com', NULL, '$2a$04$z2wl5tXPMqBJzo3BNy2Jde5F/ELC9itKKXfm0op8tstt4I662PtA.', 'Elfi Husaini Lubis', '', 'lubis', '2023-07-21 17:15:34.285678', NULL, NULL, '0000', 'CORPORATE', '2', '001'),
(1689934563199668904, 'f', 'manihar@gmail.com', NULL, '$2a$04$CNe9ub6lRJmKbrww.PEGwOMLWKHoyuXSzWQ6StImhMiKAT7JXPiHW', 'Manihar', '', 'manihar', '2023-07-21 17:16:03.200839', NULL, NULL, '0000', 'CORPORATE', '2', '001'),
(1689934572731686105, 'f', 'fytria@gmail.com', NULL, '$2a$04$IrgkGNEhODUiqIOoZ2c5SORHWl1pqegM/JnPjeKHWkKAAyyUBTAyO', 'Fytria', '', 'fytria', '2023-07-21 17:16:12.732709', NULL, NULL, '0000', 'CORPORATE', '2', '001'),
(1689935487905714936, 'f', 'sancrissy@gmail.com', NULL, '$2a$04$V2JYmfTeNpa5FFk0R3bu1O5ZemDJfv/ur596JC0zw60Gq7HaZCyBW', 'Sancrissy', '', 'sancrissy', '2023-07-21 17:31:27.989143', NULL, NULL, '0000', 'CORPORATE', '2', '001'),
(1690190910593519287, 'f', 'atip@gmail.com', NULL, '$2a$04$eqTWfN2NwmdrRclHl21BCufOJqO4Vsb59x3ItbJQYipPWcqeKNeu.', 'Atip', '', 'atip', '2023-07-24 16:28:30.594955', NULL, NULL, '0000', 'CORPORATE', '2', '001'),
(1690190944143831133, 'f', 'abdillah@gmail.com', NULL, '$2a$04$8Kreq7J9ahHDNKFedoA/cOEP3ZuV/XMSQpAYMiaiOgHIrg1Wr.U0.', 'Abdillah', '', 'abdillah', '2023-07-24 16:29:04.145144', NULL, NULL, '0000', 'CORPORATE', '2', '001'),
(1690352934463323198, 'f', 'api@dev.com', NULL, '$2a$04$VCEPHj.5AsDdTKxgfZqpq.GZVVdxrcmkrWUbwgVKoDF7.PsTUO/AW', 'API Dev', '', 'dev.api', '2023-07-26 13:28:54.464687', NULL, NULL, NULL, 'API', '5', '001'),
(1690352918982093779, 'f', 'jimmy@gmail.com', NULL, '$2a$04$4d7PorSkeig9btL7twktZOB1KO58k2avjjhpWUJtlhDCEGuw5BwH2', 'Jimmy', '', 'jimmy', '2023-07-26 13:28:38.983683', NULL, NULL, '0000', 'CORPORATE', '5', '001'),
(1691572184608585117, 'f', 'ksp_spb@gmail.com', NULL, '$2a$04$c34HE/Z4wrClyk.Z9omyOuLpph63xn5H8j.KxxCmiY2AHfynn22hy', 'KSP Sinar Pelita', '', 'ksp_spb', '2023-08-09 16:09:44.61058', NULL, NULL, NULL, 'CORPORATE', '6', '001'),
(1691572303586160003, 'f', 'ksp_spb@gmail.com', NULL, '$2a$04$sfHSKXcq70JsbWILO/Bn3Omsp0FBwm.jPrym34fLhxzfRIgzB/cH.', 'KSP Sinar Pelita API', '', 'ksp_spb_api', '2023-08-09 16:11:43.587908', NULL, NULL, NULL, 'API', '6', '001'),
(1693559389799472818, 'f', 'yuni@gmail.com', NULL, '$2a$04$.JBijFS73MXUQruB4hDTD.iea.Fk14b6.Ihp.ruaos/sBfcvN4htK', 'Yuni', '', 'yuni', '2023-09-01 16:09:49.920543', NULL, NULL, NULL, 'CORPORATE', '7', '001'),
(1693559406708376321, 'f', 'dini@gmail.com', NULL, '$2a$04$ACCYWkbmmdeFWTVJ287s1uu.nLb9vMBjUbXxeRj1ac.Q2Tx2ExpYO', 'Dini', '', 'dini', '2023-09-01 16:10:06.709964', NULL, NULL, NULL, 'CORPORATE', '7', '002'),
(1693559415582794671, 'f', 'manda@gmail.com', NULL, '$2a$04$MPOcpvZzPf8qEQXWl72TOeadzDEaBW4zIoc3SEfgfeiBhL9S8IkBK', 'Manda', '', 'manda', '2023-09-01 16:10:15.584398', NULL, NULL, NULL, 'CORPORATE', '7', '003'),
(1693559421214952618, 'f', 'mira@gmail.com', NULL, '$2a$04$FnGhPC3lQTz7.u4M/8YdjO8LnhAkskd7Hk57ucdnchGP2Boy2UDbq', 'Mira', '', 'mira', '2023-09-01 16:10:21.227497', NULL, NULL, NULL, 'CORPORATE', '7', '001'),
(1693559514605504456, 'f', 'bpr.rcs.core@kreasinusantara.id', NULL, '$2a$04$862bg9sNuHh3Z3phaOGh6uCaFzVAjLsl4ZCo0SuI0OSdve.3Wb2TO', 'BPR RCS Core', '', 'bpr.rcs.core', '2023-09-01 16:11:54.607826', NULL, NULL, NULL, 'API', '7', '001'),
(1696056325281891580, 'f', 'test@example.com', NULL, '$2a$04$ZS1sBsW6WUkG7QuIYvUWGeUEt9ITnk6T8qlB4ARlqPITdy4cQBbaG', 'Test', 'User', 'testuser', '2023-09-30 13:45:25.535302', NULL, NULL, NULL, '', NULL, NULL),
(1696056450019418234, 'f', 'arya@gmail.com', NULL, '$2a$04$LMp1Vjwp7RmJV/BQsOF3weOuRaVAlbci9dxm6M0E.y/QS8LNe4gqG', '', '', 'arya', '2023-09-30 13:47:30.020897', NULL, NULL, NULL, 'CUSTOMER', '5', NULL),
(1696056450019418223, NULL, 'admin123@gmail.com', NULL, '$2y$10$T3kamaPAeCUuT65C/GgIeOR12H2R9B3dU8hqsyDSTMyb43LmlmED6', 'admin123', NULL, 'admin123', NULL, NULL, NULL, NULL, 'ADMIN', '5', NULL),
(1699010811508943532, NULL, NULL, NULL, '$2y$10$rEOvjGZxfLaILzuQoOL9Du2H77fWtr1uJZouoZ/Eu.Sl1tk550kdW', 'ROSIMAH,NY', NULL, 'ibu', '2023-11-03 11:26:51', NULL, '0006018', NULL, 'CUSTOMER', '30', NULL),
(1696056450019418221, NULL, 'admin3@gmail.com', NULL, '$2y$10$T3kamaPAeCUuT65C/GgIeOR12H2R9B3dU8hqsyDSTMyb43LmlmED6', 'admin123', NULL, 'admin3', NULL, NULL, NULL, NULL, 'ADMIN', '30', NULL),
(1699101041189376702, NULL, NULL, NULL, '$2y$10$rEOvjGZxfLaILzuQoOL9Du2H77fWtr1uJZouoZ/Eu.Sl1tk550kdW', 'RESTI YULYANI', NULL, '900001_0000004', '2023-11-04 12:30:41', NULL, '0000004', NULL, 'CUSTOMER', '30', NULL),
(1699511631307528945, NULL, NULL, NULL, '$2y$10$rEOvjGZxfLaILzuQoOL9Du2H77fWtr1uJZouoZ/Eu.Sl1tk550kdW', 'INDAH PUSVA JULIANI', NULL, 'ibu2', '2023-11-09 06:33:51', NULL, '0000001', NULL, 'CUSTOMER', '30', NULL),
(169900759578682253, NULL, NULL, NULL, '$2y$10$rEOvjGZxfLaILzuQoOL9Du2H77fWtr1uJZouoZ/Eu.Sl1tk550kdW', 'ASEP AGUS,TN', NULL, 'ibu3', '2023-11-03 10:33:15', NULL, '0000019', NULL, 'CUSTOMER', '30', NULL),
(1699503544718344760, NULL, NULL, NULL, '$2y$10$rEOvjGZxfLaILzuQoOL9Du2H77fWtr1uJZouoZ/Eu.Sl1tk550kdW', 'ASEP AGUS,TN', NULL, 'ibu4', '2023-11-09 04:19:04', NULL, '0000019', NULL, 'CUSTOMER', '30', NULL),
(1690352882692784734, 'f', 'karom@gmail.com', NULL, '$2y$10$T3kamaPAeCUuT65C/GgIeOR12H2R9B3dU8hqsyDSTMyb43LmlmED6', 'Karom', '', 'karom', '2023-07-26 13:28:02.776956', NULL, '0020378', '', 'CUSTOMER', '5', '001'),
(1698222662851107912, NULL, NULL, NULL, '$2y$10$rEOvjGZxfLaILzuQoOL9Du2H77fWtr1uJZouoZ/Eu.Sl1tk550kdW', 'BUDI RAJIN', NULL, 'bpr_kn_dev_0021959', '2023-10-25 08:31:02', NULL, '0021959', NULL, 'CUSTOMER', '5', NULL),
(1698205817781133569, NULL, NULL, NULL, '$2y$10$co6Pq.TqANGG1sRc8NfWzeKctiKFubQB4W9/Dvjq/shzC29oU1gAa', NULL, NULL, 'bpr_kn_dev_', '2023-10-25 03:50:17', NULL, NULL, NULL, 'CUSTOMER', '5', NULL),
(1696056450019418227, NULL, 'admin2@gmail.com', NULL, '$2y$10$T3kamaPAeCUuT65C/GgIeOR12H2R9B3dU8hqsyDSTMyb43LmlmED6', 'admin123', NULL, 'admin2', NULL, NULL, NULL, NULL, 'ADMIN', '6', NULL),
(1699006985999834282, NULL, NULL, NULL, '$2y$10$ukVy9ktYg/MO14Qpxy9HQON1jpWeuUSP9ubmBCdNv0.ffZYY8/vHi', 'LUBENAH SH', NULL, 'bpr_restudhana_0000001', '2023-11-03 10:23:05', NULL, '0000001', NULL, 'CUSTOMER', '6', NULL),
(1697540384585789784, NULL, NULL, NULL, '$2y$10$rEOvjGZxfLaILzuQoOL9Du2H77fWtr1uJZouoZ/Eu.Sl1tk550kdW', 'MXD XRXF MXXLXNX', NULL, 'bpk2', NULL, NULL, '0002798', NULL, 'CUSTOMER', '5', NULL),
(1698222672195374242, NULL, NULL, NULL, '$2y$10$rEOvjGZxfLaILzuQoOL9Du2H77fWtr1uJZouoZ/Eu.Sl1tk550kdW', 'BUDI RAJIN', NULL, 'bpk4', '2023-10-25 08:31:12', NULL, '0021959', NULL, 'CUSTOMER', '5', NULL),
(169820581780987632, NULL, NULL, NULL, '$2y$10$rv3QXVAYaYdAyZrt8uM2nOtT1ua0iHWDX7kNVtrYYVNusyMCvLVh.', NULL, NULL, 'bpk5', '2023-10-25 03:50:17', NULL, NULL, NULL, 'CUSTOMER', '5', NULL),
(1698205824944954763, NULL, NULL, NULL, '$2y$10$rEOvjGZxfLaILzuQoOL9Du2H77fWtr1uJZouoZ/Eu.Sl1tk550kdW', NULL, NULL, 'bpk3', '2023-10-25 03:50:24', NULL, NULL, NULL, 'CUSTOMER', '5', NULL),
(1698208257523562162, NULL, NULL, NULL, '$2y$10$rEOvjGZxfLaILzuQoOL9Du2H77fWtr1uJZouoZ/Eu.Sl1tk550kdW', NULL, NULL, 'bpk1', '2023-10-25 04:30:57', NULL, NULL, NULL, 'CUSTOMER', '5', NULL);
