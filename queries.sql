CREATE DATABASE locadora;

CREATE TABLE categories(
    id SERIAL NOT NULL PRIMARY KEY,
    title TEXT NOT NULL
);

CREATE TABLE movieSurvey(
    id SERIAL NOT NULL PRIMARY KEY,
    grade TEXT NOT NULL
);


CREATE TABLE serviceSurvey(
    id SERIAL NOT NULL PRIMARY KEY,
    grade TEXT NOT NULL
);

CREATE TABLE phones(
    id SERIAL NOT NULL PRIMARY KEY,
    number TEXT NOT NULL,
    "customersId" INTEGER NOT NULL REFERENCES "customers"("id")
);
CREATE TABLE addresses(
    id SERIAL NOT NULL PRIMARY KEY,
    street TEXT NOT NULL,
    number TEXT NOT NULL,
    complement TEXT,
    neighborhood TEXT NOT NULL,
    "zipCode" TEXT NOT NULL UNIQUE,
    city TEXT NOT NULL,
    state TEXT NOT NULL
);

CREATE TABLE actors(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    nationality TEXT NOT NULL,
    "birthDate" DATE NOT NULL
);

CREATE TABLE discs(
    id SERIAL NOT NULL PRIMARY KEY,
    stock TEXT NOT NULL UNIQUE,
    "barCode" TEXT NOT NULL UNIQUE,
    "movieId" INTEGER NOT NULL REFERENCES "movies"("id")
);

CREATE TABLE customers(
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    cpf TEXT NOT NULL UNIQUE,
    "addressId" INTEGER NOT NULL REFERENCES "addresses"("id"),
    "phoneId" INTEGER NOT NULL REFERENCES "phones"("id")
);
CREATE TABLE rentals(
    id SERIAL NOT NULL PRIMARY KEY,
    "rentDate" DATE NOT NULL DEFAULT NOW(),
    "discId" INTEGER NOT NULL REFERENCES "discs"("id"),
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id") 
);

CREATE TABLE renteds(
    id SERIAL NOT NULL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "rentalId" INTEGER NOT NULL REFERENCES "rentals"("id"),
    "totalRenteds" INTEGER NOT NULL
);

CREATE TABLE return(
    id SERIAL NOT NULL PRIMARY KEY,
    "returnDate" DATE NOT NULL DEFAULT NOW(),
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "rentalId" INTEGER NOT NULL REFERENCES "rentals"("id"),
    "rentedId" INTEGER NOT NULL REFERENCES "rentedId"("id"),
    "serviceSurveyId" INTEGER NOT NULL REFERENCES "serviceSurvey"("id"),
    "movieSurveyId" INTEGER NOT NULL REFERENCES "movieSurvey"("id")
);

