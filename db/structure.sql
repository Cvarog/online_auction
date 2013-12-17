CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(255) DEFAULT '' NOT NULL, "reset_password_token" varchar(255), "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "created_at" datetime, "updated_at" datetime, "nickname" varchar(255), "first_name" varchar(255), "last_name" varchar(255));
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime, "ancestry" varchar(255));
CREATE TABLE "items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" varchar(255), "category_id" integer, "lot_id" integer, "created_at" datetime, "updated_at" datetime, "price" decimal);
CREATE TABLE "lots" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" varchar(255), "end_time" time, "bet_step" float, "time_step" time, "item_id" integer, "created_at" datetime, "updated_at" datetime, "price" decimal);
CREATE INDEX "index_categories_on_ancestry" ON "categories" ("ancestry");
INSERT INTO schema_migrations (version) VALUES ('20131210133154');

INSERT INTO schema_migrations (version) VALUES ('20131210140224');

INSERT INTO schema_migrations (version) VALUES ('20131210171422');

INSERT INTO schema_migrations (version) VALUES ('20131210173132');

INSERT INTO schema_migrations (version) VALUES ('20131210183429');

INSERT INTO schema_migrations (version) VALUES ('20131212195354');

INSERT INTO schema_migrations (version) VALUES ('20131217173750');
