# COMP3311 25T1 Assignment 1  
**Data Models for Cheese Database**  
**Database Systems**  
*Last updated: Sunday 2nd March 8:14am*  
*Most recent changes are shown in red ... older changes are shown in brown.*  

[Assignment Spec] | [Database Design] | [Examples] | [Testing]

## Introduction
This document provides both an overview and detailed description of the cheese database:
- Overview: ER diagram
- Details: SQL schema

## ER Model of Cheese DB
![ER Diagram]  
*(Most entities have an ID field as primary key - not normally shown at ER level)*

### Relationships Between Entities
Key relationships:
- Every cheese is made by some cheesemaker
- Every cheese is made according to a particular style
- We know at least the country where each cheesemaker is located
- We know at least the country where each cheese style originated

## SQL Schema for Cheese Database
Implementation notes:
- 1:n relationships implemented via foreign key attributes
- Custom types/domains for readability
- Interval values used for aging durations

### Schema Definition
```sql
-- COMP3311 25T1 Assignment 1 Database Schema

-- Cheese hardness values
CREATE TYPE HardVal AS ENUM ('soft','semi-soft','semi-hard','hard');

-- Types of milk used in cheese making
CREATE TYPE MilkVal AS ENUM ('cow','goat','sheep','buffalo','yak');

-- Percentage of fat in cheese (0-100)
CREATE DOMAIN Percentage AS integer CHECK (value BETWEEN 0 AND 100);

CREATE DOMAIN YearVal AS integer CHECK (value BETWEEN 1000 AND 3000);

-- Location information (always know country, may not know region/town)
CREATE TABLE Places (
    id          integer,
    country     text NOT NULL,
    region      text,
    town        text,
    PRIMARY KEY (id)
);

-- In PostgreSQL intervals, "months" are denoted "mons"
-- Cheeses need to be aged for at least 1 day
CREATE TABLE Styles (
    id          integer,
    name        text NOT NULL UNIQUE,
    hardness    HardVal NOT NULL,
    milk        MilkVal NOT NULL,
    notes       text,
    min_aging   interval NOT NULL,
    max_aging   interval NOT NULL,
    fat         Percentage NOT NULL,
    origin      integer NOT NULL REFERENCES Places(id),
    PRIMARY KEY (id)
);

CREATE TABLE Makers (
    id          integer,
    name        text NOT NULL,
    located_in  integer NOT NULL REFERENCES Places(id),
    founded     YearVal,
    PRIMARY KEY (id)
);

-- Cheese names do not have to be unique
-- (Multiple makers may have cheese called "Vintage Cheddar")
CREATE TABLE Cheeses (
    id          integer,
    name        text NOT NULL,
    style       integer NOT NULL REFERENCES Styles(id),
    aged_for    interval NOT NULL,
    fat         Percentage NOT NULL,
    notes       text,
    made_by     integer NOT NULL REFERENCES Makers(id),
    PRIMARY KEY (id)
);
