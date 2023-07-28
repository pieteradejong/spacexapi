# SpaceX Relational Schema API

Based on `https://github.com/r-spacex/SpaceX-API/tree/master` SpaceX REST API. Which uses a MongoDB document data model. This API uses a relational Postgres schema.

## Stack:
* PostgreSQL database
* Python FastAPI
* Shell scripts to:
  * Fetch all data from `SpaceX-API` and save to local mongodb files.
  * Maybe: extract schema from Mongo files.
* SQL script to create manually defined schema based on Mongo schema.
* Migration script to seed Postgres database with data from Mongo.


