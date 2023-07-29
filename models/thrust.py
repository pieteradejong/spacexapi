from pydantic import BaseModel
from typing import Optional

class Thrust(BaseModel):
    kN: Optional[float]
    lbf: Optional[float]