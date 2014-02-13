CREATE TABLE "bets" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "lot_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime, "ancestry" varchar(255), "picture_file_name" varchar(255), "picture_content_type" varchar(255), "picture_file_size" integer, "picture_updated_at" datetime);
CREATE TABLE "images" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime, "updated_at" datetime, "item_image_file_name" varchar(255), "item_image_content_type" varchar(255), "item_image_file_size" integer, "item_image_updated_at" datetime, "item_id" integer);
CREATE TABLE "items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" varchar(255), "category_id" integer, "lot_id" integer, "created_at" datetime, "updated_at" datetime, "price" decimal);
CREATE TABLE "lots" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" varchar(255), "item_id" integer, "created_at" datetime, "updated_at" datetime, "price" decimal(8,2), "expired_time" datetime, "time_step" integer, "start_time" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(255) DEFAULT '' NOT NULL, "reset_password_token" varchar(255), "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "created_at" datetime, "updated_at" datetime, "nickname" varchar(255), "first_name" varchar(255), "last_name" varchar(255), "admin" boolean DEFAULT 'f');
CREATE INDEX "index_categories_on_ancestry" ON "categories" ("ancestry");
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20131210133154');

INSERT INTO schema_migrations (version) VALUES ('20131210140224');

INSERT INTO schema_migrations (version) VALUES ('20131210171422');

INSERT INTO schema_migrations (version) VALUES ('20131210173132');

INSERT INTO schema_migrations (version) VALUES ('20131210183429');

INSERT INTO schema_migrations (version) VALUES ('20131212195354');

INSERT INTO schema_migrations (version) VALUES ('20131217173750');

INSERT INTO schema_migrations (version) VALUES ('20131220104350');

INSERT INTO schema_migrations (version) VALUES ('20131226195707');

INSERT INTO schema_migrations (version) VALUES ('20131226204102');

INSERT INTO schema_migrations (version) VALUES ('20131226205029');

INSERT INTO schema_migrations (version) VALUES ('20131228215827');

INSERT INTO schema_migrations (version) VALUES ('20140131165011');

INSERT INTO schema_migrations (version) VALUES ('20140205124950');

INSERT INTO schema_migrations (version) VALUES ('20140213125013');
