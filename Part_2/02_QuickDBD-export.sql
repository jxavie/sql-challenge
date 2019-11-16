-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Gym" (
    "gym_id" INT   NOT NULL,
    "gym_name" VARCHAR   NOT NULL,
    "address" VARCHAR   NOT NULL,
    "city" VARCHAR   NOT NULL,
    "state" VARCHAR   NOT NULL,
    "zipcode" INT   NOT NULL,
    CONSTRAINT "pk_Gym" PRIMARY KEY (
        "gym_id"
     )
);

CREATE TABLE "Trainers" (
    "trainer_id" INT   NOT NULL,
    "gym_id" INT   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Trainers" PRIMARY KEY (
        "trainer_id"
     )
);

CREATE TABLE "Members" (
    "member_id" INT   NOT NULL,
    "payment_id" INT   NOT NULL,
    "trainer_id" INT   NOT NULL,
    "gym_id" INT   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "address" VARCHAR   NOT NULL,
    "city" VARCHAR   NOT NULL,
    "state" VARCHAR   NOT NULL,
    "zipcode" INT   NOT NULL,
    "phone" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Members" PRIMARY KEY (
        "member_id"
     )
);

CREATE TABLE "Payments" (
    "payment_id" INT   NOT NULL,
    "member_id" INT   NOT NULL,
    "card_number" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Payments" PRIMARY KEY (
        "payment_id"
     )
);

ALTER TABLE "Trainers" ADD CONSTRAINT "fk_Trainers_gym_id" FOREIGN KEY("gym_id")
REFERENCES "Gym" ("gym_id");

ALTER TABLE "Members" ADD CONSTRAINT "fk_Members_payment_id" FOREIGN KEY("payment_id")
REFERENCES "Payments" ("payment_id");

ALTER TABLE "Members" ADD CONSTRAINT "fk_Members_trainer_id" FOREIGN KEY("trainer_id")
REFERENCES "Trainers" ("trainer_id");

ALTER TABLE "Members" ADD CONSTRAINT "fk_Members_gym_id" FOREIGN KEY("gym_id")
REFERENCES "Gym" ("gym_id");

ALTER TABLE "Payments" ADD CONSTRAINT "fk_Payments_member_id" FOREIGN KEY("member_id")
REFERENCES "Members" ("member_id");


SELECT * FROM "Gym";
SELECT * FROM "Trainers";
SELECT * FROM "Members";
SELECT * FROM "Payments";