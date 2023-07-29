from pydantic import BaseModel
from typing import Optional

class Dimension(BaseModel):
    meters: Optional[float]
    feet: Optional[float]
