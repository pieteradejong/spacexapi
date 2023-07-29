# SpaceX Relational Schema API

Based on `https://github.com/r-spacex/SpaceX-API/tree/master` SpaceX REST API. Which uses a MongoDB document data model. This API uses a relational Postgres schema.

## Stack:
* PostgreSQL database
* Python FastAPI
* Setup local Mongo database.
* SQL script to create manually defined schema based on Mongo schema.
* Migration script to seed Postgres database with data from Mongo.

## Project

Module: data crawl
Module: expose data via FastAPI
Dockerize: add Dockerfile, docker-compose; runnable as Docker container
