import requests
from pymongo import MongoClient
from pymongo.results import InsertManyResult
from pymongo.errors import PyMongoError

client = MongoClient("mongodb://localhost:27017/")
db = client["spacexapi"]
models = [
            'capsules', 'company', 'cores', 'crew', 'dragons', \
            'history', 'landpads', 'launches', 'launchpads', 'payloads', \
            'roadster', 'rockets', 'ships', 'starlink' \
         ]

for mdl in models:
    response = requests.get(f"https://api.spacexdata.com/latest/{mdl}")
    if response.status_code == 200:
        res_json = response.json()
        print(f"{mdl} Success: request returned {len(res_json)} items")
        
        try:
            mongo_coll = db[mdl]
            result: InsertManyResult = mongo_coll.insert_many(res_json)
            print(f'{mdl} - Inserted {len(result.inserted_ids)} {mdl}s')
        except PyMongoError as e:
            print(f"An error occurred while trying to insert a document: {e}")
        
        
        
    else:
        print(f'{mdl} Request failed with status code {response.status_code}')

