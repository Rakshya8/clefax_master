-- User
CREATE TABLE  "USERS" 
   (	"ID" NUMBER(10,0) NOT NULL ENABLE, 
	"FULLNAME" VARCHAR2(255) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(255) NOT NULL ENABLE, 
	"ROLE" VARCHAR2(255) NOT NULL ENABLE, 
	"ADDRESS" VARCHAR2(255), 
	"PHONE" VARCHAR2(255), 
	"DOB" VARCHAR2(255), 
	"GENDER" VARCHAR2(255), 
	"PAYPAL_EMAIL" VARCHAR2(255), 
	"STRIPE_EMAIL" VARCHAR2(255), 
	"EMAIL_VERIFIED_AT" TIMESTAMP (6), 
	"PASSWORD" VARCHAR2(255) NOT NULL ENABLE, 
	"REMEMBER_TOKEN" VARCHAR2(100), 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6), 
	"TWO_FACTOR_SECRET" CLOB, 
	"TWO_FACTOR_RECOVERY_CODES" CLOB, 
	"AVATAR" VARCHAR2(255), 
	 CONSTRAINT "USERS_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/

CREATE UNIQUE INDEX  "USERS_EMAIL_UK" ON  "USERS" (LOWER("EMAIL"))
/
CREATE UNIQUE INDEX  "USERS_ID_PK" ON  "USERS" ("ID")
/


CREATE OR REPLACE EDITIONABLE TRIGGER  "USERS_ID_TRG" 
            before insert on USERS
            for each row
                begin
            if :new.ID is null then
                select users_id_seq.nextval into :new.ID from dual;
            end if;
            end;
/
ALTER TRIGGER  "USERS_ID_TRG" ENABLE
/
 CREATE SEQUENCE   "USERS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/
-- Cart

CREATE TABLE  "CARTS" 
   (	"ID" NUMBER(19,0) NOT NULL ENABLE, 
	"USER_ID" NUMBER(19,0) NOT NULL ENABLE, 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6), 
	 CONSTRAINT "CARTS_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/

CREATE UNIQUE INDEX  "CARTS_ID_PK" ON  "CARTS" ("ID")
/

ALTER TABLE  "CARTS" ADD CONSTRAINT "CARTS_USER_ID_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES  "USERS" ("ID") ENABLE
/
 CREATE SEQUENCE   "CARTS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/



CREATE OR REPLACE EDITIONABLE TRIGGER  "CARTS_ID_TRG" 
            before insert on CARTS
            for each row
                begin
            if :new.ID is null then
                select carts_id_seq.nextval into :new.ID from dual;
            end if;
            end;
/
ALTER TRIGGER  "CARTS_ID_TRG" ENABLE
/


-- Wishlist

CREATE TABLE  "WISHLISTS" 
   (	"ID" NUMBER(19,0) NOT NULL ENABLE, 
	"USER_ID" NUMBER(19,0) NOT NULL ENABLE, 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6), 
	 CONSTRAINT "WISHLISTS_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/
CREATE UNIQUE INDEX  "WISHLISTS_ID_PK" ON  "WISHLISTS" ("ID")
/

ALTER TABLE  "WISHLISTS" ADD CONSTRAINT "WISHLISTS_USER_ID_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES  "USERS" ("ID") ENABLE
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "WISHLISTS_ID_TRG" 
            before insert on WISHLISTS
            for each row
                begin
            if :new.ID is null then
                select wishlists_id_seq.nextval into :new.ID from dual;
            end if;
            end;
/
ALTER TRIGGER  "WISHLISTS_ID_TRG" ENABLE
/
CREATE SEQUENCE   "WISHLISTS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/
-- Shop
CREATE TABLE  "SHOPS" 
   (	"ID" NUMBER(19,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(255) NOT NULL ENABLE, 
	"LOGO" VARCHAR2(255) NOT NULL ENABLE, 
	"STREET_NO" VARCHAR2(255) NOT NULL ENABLE, 
	"CITY" VARCHAR2(255) NOT NULL ENABLE, 
	"PAN" VARCHAR2(255) NOT NULL ENABLE, 
	"USER_ID" NUMBER(19,0) NOT NULL ENABLE, 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6), 
	 CONSTRAINT "SHOPS_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/
CREATE UNIQUE INDEX  "SHOPS_ID_PK" ON  "SHOPS" ("ID")
/

ALTER TABLE  "SHOPS" ADD CONSTRAINT "SHOPS_USER_ID_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES  "USERS" ("ID") ENABLE
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "SHOPS_ID_TRG" 
            before insert on SHOPS
            for each row
                begin
            if :new.ID is null then
                select shops_id_seq.nextval into :new.ID from dual;
            end if;
            end;
/
ALTER TRIGGER  "SHOPS_ID_TRG" ENABLE
/
CREATE SEQUENCE   "SHOPS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/
-- Categories
CREATE TABLE  "CATEGORIES" 
   (	"ID" NUMBER(19,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(255) NOT NULL ENABLE, 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6), 
	 CONSTRAINT "CATEGORIES_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/

CREATE UNIQUE INDEX  "CATEGORIES_ID_PK" ON  "CATEGORIES" ("ID")
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "CATEGORIES_ID_TRG" 
            before insert on CATEGORIES
            for each row
                begin
            if :new.ID is null then
                select categories_id_seq.nextval into :new.ID from dual;
            end if;
            end;
/
ALTER TRIGGER  "CATEGORIES_ID_TRG" ENABLE
/

 CREATE SEQUENCE   "CATEGORIES_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/


-- Offers

CREATE TABLE  "OFFERS" 
   (	"ID" NUMBER(19,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(255) NOT NULL ENABLE, 
	"OFFER_TYPE" VARCHAR2(255) NOT NULL ENABLE, 
	"END_DATE" VARCHAR2(255) NOT NULL ENABLE, 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6), 
	 CONSTRAINT "OFFERS_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/

CREATE UNIQUE INDEX  "OFFERS_ID_PK" ON  "OFFERS" ("ID")
/


CREATE OR REPLACE EDITIONABLE TRIGGER  "OFFERS_ID_TRG" 
            before insert on OFFERS
            for each row
                begin
            if :new.ID is null then
                select offers_id_seq.nextval into :new.ID from dual;
            end if;
            end;
/
ALTER TRIGGER  "OFFERS_ID_TRG" ENABLE
/
CREATE SEQUENCE   "OFFERS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/

-- Products

CREATE TABLE  "PRODUCTS" 
   (	"ID" NUMBER(19,0) NOT NULL ENABLE, 
	"NAME" VARCHAR2(255) NOT NULL ENABLE, 
	"DESCRIPTION" CLOB NOT NULL ENABLE, 
	"PRICE" NUMBER(8,2) NOT NULL ENABLE, 
	"QTY" NUMBER(10,0) NOT NULL ENABLE, 
	"OFFER_ID" NUMBER(19,0) NOT NULL ENABLE, 
	"SHOP_ID" NUMBER(19,0) NOT NULL ENABLE, 
	"CATEGORY_ID" NUMBER(19,0) NOT NULL ENABLE, 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6), 
	 CONSTRAINT "PRODUCTS_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/
CREATE UNIQUE INDEX  "PRODUCTS_ID_PK" ON  "PRODUCTS" ("ID")
/
ALTER TABLE  "PRODUCTS" ADD CONSTRAINT "PRODUCTS_OFFER_ID_FK" FOREIGN KEY ("OFFER_ID")
	  REFERENCES  "OFFERS" ("ID") ENABLE
/
ALTER TABLE  "PRODUCTS" ADD CONSTRAINT "PRODUCTS_SHOP_ID_FK" FOREIGN KEY ("SHOP_ID")
	  REFERENCES  "SHOPS" ("ID") ENABLE
/
ALTER TABLE  "PRODUCTS" ADD CONSTRAINT "PRODUCTS_CATEGORY_ID_FK" FOREIGN KEY ("CATEGORY_ID")
	  REFERENCES  "CATEGORIES" ("ID") ENABLE
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "PRODUCTS_ID_TRG" 
            before insert on PRODUCTS
            for each row
                begin
            if :new.ID is null then
                select products_id_seq.nextval into :new.ID from dual;
            end if;
            end;
/
ALTER TRIGGER  "PRODUCTS_ID_TRG" ENABLE
/
 CREATE SEQUENCE   "PRODUCTS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/


-- Review

CREATE TABLE  "REVIEWS" 
   (	"ID" NUMBER(19,0) NOT NULL ENABLE, 
	"RATING" NUMBER(10,0) NOT NULL ENABLE, 
	"COMMENT" CLOB NOT NULL ENABLE, 
	"USER_ID" NUMBER(19,0) NOT NULL ENABLE, 
	"PRODUCT_ID" NUMBER(19,0) NOT NULL ENABLE, 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6), 
	 CONSTRAINT "REVIEWS_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/
CREATE UNIQUE INDEX  "REVIEWS_ID_PK" ON  "REVIEWS" ("ID")
/

ALTER TABLE  "REVIEWS" ADD CONSTRAINT "REVIEWS_USER_ID_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES  "USERS" ("ID") ENABLE
/
ALTER TABLE  "REVIEWS" ADD CONSTRAINT "REVIEWS_PRODUCT_ID_FK" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES  "PRODUCTS" ("ID") ENABLE
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "REVIEWS_ID_TRG" 
            before insert on REVIEWS
            for each row
                begin
            if :new.ID is null then
                select reviews_id_seq.nextval into :new.ID from dual;
            end if;
            end;
/
ALTER TRIGGER  "REVIEWS_ID_TRG" ENABLE
/
 CREATE SEQUENCE   "REVIEWS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/

--Report

CREATE TABLE  "REPORTS" 
   (	"ID" NUMBER(19,0) NOT NULL ENABLE, 
	"DETAILS" CLOB NOT NULL ENABLE, 
	"USER_ID" NUMBER(19,0) NOT NULL ENABLE, 
	"PRODUCT_ID" NUMBER(19,0) NOT NULL ENABLE, 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6), 
	 CONSTRAINT "REPORTS_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/
CREATE UNIQUE INDEX  "REPORTS_ID_PK" ON  "REPORTS" ("ID")
/
ALTER TABLE  "REPORTS" ADD CONSTRAINT "REPORTS_USER_ID_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES  "USERS" ("ID") ENABLE
/
ALTER TABLE  "REPORTS" ADD CONSTRAINT "REPORTS_PRODUCT_ID_FK" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES  "PRODUCTS" ("ID") ENABLE
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "REPORTS_ID_TRG" 
            before insert on REPORTS
            for each row
                begin
            if :new.ID is null then
                select reports_id_seq.nextval into :new.ID from dual;
            end if;
            end;
/
ALTER TRIGGER  "REPORTS_ID_TRG" ENABLE
/

 CREATE SEQUENCE   "REPORTS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/


--Collection Slot

CREATE TABLE  "COLLECTION_SLOTS" 
   (	"ID" NUMBER(19,0) NOT NULL ENABLE, 
	"TIMES" VARCHAR2(255) NOT NULL ENABLE, 
	"DAY" VARCHAR2(255) NOT NULL ENABLE, 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6), 
	 CONSTRAINT "COLLECTION_SLOTS_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/

CREATE UNIQUE INDEX  "COLLECTION_SLOTS_ID_PK" ON  "COLLECTION_SLOTS" ("ID")
/


CREATE OR REPLACE EDITIONABLE TRIGGER  "COLLECTION_SLOTS_ID_TRG" 
            before insert on COLLECTION_SLOTS
            for each row
                begin
            if :new.ID is null then
                select collection_slots_id_seq.nextval into :new.ID from dual;
            end if;
            end;
/
ALTER TRIGGER  "COLLECTION_SLOTS_ID_TRG" ENABLE
/

 CREATE SEQUENCE   "COLLECTION_SLOTS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/


-- Orders
CREATE TABLE  "ORDERS" 
   (	"ID" NUMBER(19,0) NOT NULL ENABLE, 
	"DATE" DATE NOT NULL ENABLE, 
	"STATUS" CHAR(1) DEFAULT '0' NOT NULL ENABLE, 
	"SUBTOTAL" NUMBER(8,2) NOT NULL ENABLE, 
	"TOTAL" NUMBER(8,2) NOT NULL ENABLE, 
	"CART_ID" NUMBER(19,0) NOT NULL ENABLE, 
	"COLLECTION_ID" NUMBER(19,0) NOT NULL ENABLE, 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6), 
	 CONSTRAINT "ORDERS_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/

CREATE UNIQUE INDEX  "ORDERS_ID_PK" ON  "ORDERS" ("ID")
/

ALTER TABLE  "ORDERS" ADD CONSTRAINT "ORDERS_CART_ID_FK" FOREIGN KEY ("CART_ID")
	  REFERENCES  "CARTS" ("ID") ENABLE
/
ALTER TABLE  "ORDERS" ADD CONSTRAINT "ORDERS_COLLECTION_ID_FK" FOREIGN KEY ("COLLECTION_ID")
	  REFERENCES  "COLLECTION_SLOTS" ("ID") ENABLE
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "ORDERS_ID_TRG" 
            before insert on ORDERS
            for each row
                begin
            if :new.ID is null then
                select orders_id_seq.nextval into :new.ID from dual;
            end if;
            end;
/
ALTER TRIGGER  "ORDERS_ID_TRG" ENABLE
/
 CREATE SEQUENCE   "ORDERS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/

--Payments

CREATE TABLE  "PAYMENTS" 
   (	"ID" NUMBER(19,0) NOT NULL ENABLE, 
	"METHOD" VARCHAR2(255) NOT NULL ENABLE, 
	"AMOUNT" NUMBER(8,2) NOT NULL ENABLE, 
	"ORDER_ID" NUMBER(19,0) NOT NULL ENABLE, 
	"USER_ID" NUMBER(19,0) NOT NULL ENABLE, 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6), 
	 CONSTRAINT "PAYMENTS_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/
CREATE UNIQUE INDEX  "PAYMENTS_ID_PK" ON  "PAYMENTS" ("ID")
/

ALTER TABLE  "PAYMENTS" ADD CONSTRAINT "PAYMENTS_ORDER_ID_FK" FOREIGN KEY ("ORDER_ID")
	  REFERENCES  "ORDERS" ("ID") ENABLE
/
ALTER TABLE  "PAYMENTS" ADD CONSTRAINT "PAYMENTS_USER_ID_FK" FOREIGN KEY ("USER_ID")
	  REFERENCES  "USERS" ("ID") ENABLE
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "PAYMENTS_ID_TRG" 
            before insert on PAYMENTS
            for each row
                begin
            if :new.ID is null then
                select payments_id_seq.nextval into :new.ID from dual;
            end if;
            end;
/
ALTER TRIGGER  "PAYMENTS_ID_TRG" ENABLE
/
 CREATE SEQUENCE   "PAYMENTS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/

-- Wishlist has products

CREATE TABLE  "WISHLIST_HAS_PRODUCTS" 
   (	"ID" NUMBER(19,0) NOT NULL ENABLE, 
	"WISHLIST_ID" NUMBER(19,0) NOT NULL ENABLE, 
	"PRODUCT_ID" NUMBER(19,0) NOT NULL ENABLE, 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6), 
	 CONSTRAINT "WISHLIST_HAS_PRODUCTS_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/
CREATE UNIQUE INDEX  "WISHLIST_HAS_PRODUCTS_ID_PK" ON  "WISHLIST_HAS_PRODUCTS" ("ID")
/

ALTER TABLE  "WISHLIST_HAS_PRODUCTS" ADD CONSTRAINT "WISHLI_HA_PRODUC_WISHLI_ID_FK" FOREIGN KEY ("WISHLIST_ID")
	  REFERENCES  "WISHLISTS" ("ID") ENABLE
/
ALTER TABLE  "WISHLIST_HAS_PRODUCTS" ADD CONSTRAINT "WISHLI_HA_PRODUC_PRODU_ID_FK" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES  "PRODUCTS" ("ID") ENABLE
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "WISHLIST_HAS_PRODUCTS_ID_TRG" 
            before insert on WISHLIST_HAS_PRODUCTS
            for each row
                begin
            if :new.ID is null then
                select wishlist_has_products_id_seq.nextval into :new.ID from dual;
            end if;
            end;
/
ALTER TRIGGER  "WISHLIST_HAS_PRODUCTS_ID_TRG" ENABLE
/
CREATE SEQUENCE "WISHLIST_HAS_PRODUCTS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/
-- Cart has products

CREATE TABLE  "CART_HAS_PRODUCTS" 
   (	"ID" NUMBER(19,0) NOT NULL ENABLE, 
	"CART_ID" NUMBER(19,0) NOT NULL ENABLE, 
	"PRODUCT_ID" NUMBER(19,0) NOT NULL ENABLE, 
	"CREATED_AT" TIMESTAMP (6), 
	"UPDATED_AT" TIMESTAMP (6), 
	 CONSTRAINT "CART_HAS_PRODUCTS_ID_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
   )
/

CREATE UNIQUE INDEX  "CART_HAS_PRODUCTS_ID_PK" ON  "CART_HAS_PRODUCTS" ("ID")
/

ALTER TABLE  "CART_HAS_PRODUCTS" ADD CONSTRAINT "CART_HAS_PRODUCTS_CART_ID_FK" FOREIGN KEY ("CART_ID")
	  REFERENCES  "CARTS" ("ID") ENABLE
/
ALTER TABLE  "CART_HAS_PRODUCTS" ADD CONSTRAINT "CAR_HA_PRODUCT_PRODUC_ID_FK" FOREIGN KEY ("PRODUCT_ID")
	  REFERENCES  "PRODUCTS" ("ID") ENABLE
/

CREATE OR REPLACE EDITIONABLE TRIGGER  "CART_HAS_PRODUCTS_ID_TRG" 
            before insert on CART_HAS_PRODUCTS
            for each row
                begin
            if :new.ID is null then
                select cart_has_products_id_seq.nextval into :new.ID from dual;
            end if;
            end;
/
ALTER TRIGGER  "CART_HAS_PRODUCTS_ID_TRG" ENABLE
/
 CREATE SEQUENCE   "CART_HAS_PRODUCTS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/
