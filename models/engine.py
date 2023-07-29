from pydantic import BaseModel
from typing import Optional, Thrust

class Engine(BaseModel):
    number: Optional[int]
    type: Optional[str]
    version: Optional[str]
    layout: Optional[str]
    isp: Optional[Thrust]
    engine_loss_max: Optional[int]
    propellant_1: Optional[str]
    propellant_2: Optional[str]
    thrust_sea_level: Optional[Thrust]
    thrust_vacuum: Optional[Thrust]
    thrust_to_weight: Optional[float]



