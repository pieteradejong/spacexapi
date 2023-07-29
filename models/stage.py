from typing import Optional
from pydantic import BaseModel

class Stage(BaseModel):
    reusable: Optional[bool]
    engines: Optional[int]
    fuel_amount_tons: Optional[float]
    burn_time_sec: Optional[float]
    thrust_sea_level: Optional[Thrust]
    thrust_vacuum: Optional[Thrust]