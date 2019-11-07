/*
PostgreSQL Tutorial
Downloaded at: http://www.postgresqltutorial.com/postgresql-delete/
*/


-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS "public"."link";
CREATE TABLE "public"."link" (
"id" int4 DEFAULT nextval('link_id_seq'::regclass) NOT NULL,
"url" varchar(255) COLLATE "default" NOT NULL,
"name" varchar(255) COLLATE "default" NOT NULL,
"description" varchar(255) COLLATE "default",
"rel" varchar(50) COLLATE "default",
"last_update" date DEFAULT ('now'::text)::date
)
WITH (OIDS=FALSE);

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO "public"."link" VALUES ('1', 'http://www.postgresqltutorial.com', 'PostgreSQL Tutorial', 'Learn PostgreSQL fast and easy', 'follow', '2013-06-02');
INSERT INTO "public"."link" VALUES ('2', 'http://www.oreilly.com', 'O''Reilly Media', 'O''Reilly Media', 'nofollow', '2013-06-02');
INSERT INTO "public"."link" VALUES ('3', 'http://www.google.com', 'Google', 'Google', 'nofollow', '2013-06-02');
INSERT INTO "public"."link" VALUES ('4', 'http://www.yahoo.com', 'Yahoo', 'Yahoo', 'nofollow', '2013-06-02');
INSERT INTO "public"."link" VALUES ('5', 'http://www.bing.com', 'Bing', 'Bing', 'nofollow', '2013-06-02');
INSERT INTO "public"."link" VALUES ('6', 'http://www.facebook.com', 'Facebook', 'Facebook', 'nofollow', '2013-06-01');
INSERT INTO "public"."link" VALUES ('7', 'https://www.tumblr.com/', 'Tumblr', 'Tumblr', 'nofollow', '2013-06-02');
INSERT INTO "public"."link" VALUES ('8', 'http://www.postgresql.org', 'PostgreSQL', 'PostgreSQL', 'nofollow', '2013-06-02');

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table link
-- ----------------------------
ALTER TABLE "public"."link" ADD PRIMARY KEY ("id");
