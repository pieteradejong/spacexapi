from pydantic import BaseModel
from typing import Optional, Any

class LandingLegs(BaseModel):
    number: Optional[int]
    material: Optional[Any]