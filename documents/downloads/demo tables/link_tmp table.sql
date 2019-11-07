//*
PostgreSQL Tutorial
Downloaded at: http://www.postgresqltutorial.com/postgresql-delete/
*/

-- ----------------------------
-- Table structure for link_tmp
-- ----------------------------
DROP TABLE IF EXISTS "public"."link_tmp";
CREATE TABLE "public"."link_tmp" (
"id" int4 NOT NULL,
"url" varchar(255) COLLATE "default" NOT NULL,
"name" varchar(255) COLLATE "default" NOT NULL,
"description" varchar(255) COLLATE "default",
"rel" varchar(50) COLLATE "default",
"last_update" date
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of link_tmp
-- ----------------------------
INSERT INTO "public"."link_tmp" VALUES ('6', 'http://www.facebook.com', 'Facebook', 'Facebook', 'nofollow', '2013-06-01');
INSERT INTO "public"."link_tmp" VALUES ('7', 'https://www.tumblr.com/', 'Tumblr', 'Tumblr', 'nofollow', '2013-06-02');
