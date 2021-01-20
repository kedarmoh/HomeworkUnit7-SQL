-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/85SPSM
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

-- CardHolder Table contains first and last name
-- of credit card holders
CREATE TABLE "card_holder" (
    "id" int   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_card_holder" PRIMARY KEY (
        "id"
     ),
    CONSTRAINT "uc_card_holder_name" UNIQUE (
        "name"
    )
);

-- Credit Card table holders the credit card numbers
-- and the ids of the card holders
CREATE TABLE "credit_card" (
    "card" VARCHAR(20)   NOT NULL,
    "cardholder_id" int   NOT NULL,
    CONSTRAINT "pk_credit_card" PRIMARY KEY (
        "card"
     )
);

CREATE TABLE "merchant_category" (
    "id" int   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_merchant_category" PRIMARY KEY (
        "id"
     ),
    CONSTRAINT "uc_merchant_category_name" UNIQUE (
        "name"
    )
);

-- Table documentation comment 1 (try the PDF/RTF export)
CREATE TABLE "merchant" (
    "id" int   NOT NULL,
    -- Field documentation comment 1
    -- Field documentation comment 2
    -- Field documentation comment 3
    "name" varchar(200)   NOT NULL,
    "id_merchant_category" INT   NOT NULL,
    CONSTRAINT "pk_merchant" PRIMARY KEY (
        "id"
     ),
    CONSTRAINT "uc_merchant_name" UNIQUE (
        "name"
    )
);

CREATE TABLE "transaction" (
    "id" int   NOT NULL,
    "date" TIMESTAMP   NOT NULL,
    "amount" FLOAT   NOT NULL,
    "card" VARCHAR(20)   NOT NULL,
    "id_merchant" int   NOT NULL,
    CONSTRAINT "pk_transaction" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "credit_card" ADD CONSTRAINT "fk_credit_card_cardholder_id" FOREIGN KEY("cardholder_id")
REFERENCES "card_holder" ("id");

ALTER TABLE "merchant" ADD CONSTRAINT "fk_merchant_id_merchant_category" FOREIGN KEY("id_merchant_category")
REFERENCES "merchant_category" ("id");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_card" FOREIGN KEY("card")
REFERENCES "credit_card" ("card");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_id_merchant" FOREIGN KEY("id_merchant")
REFERENCES "merchant" ("id");

