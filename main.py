from fastapi import FastAPI
from motor.motor_asyncio import AsyncIOMotorClient
from models import *

app = FastAPI()

@app.on_event('startup')
async def startup_db_client():
    app.mongodb_client = AsyncIOMotorClient('mongodb://localhost:27017')
    app.mongodb = app.mongodb_client('spacexapi')

@app.on_event('shutdown')
async def shutdown_db_client():
    app.mongodb_client.close()

