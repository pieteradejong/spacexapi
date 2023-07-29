from typing import List, Optional, Dimension
from pydantic import BaseModel

class PayloadFairing(BaseModel):
    height: Optional[Dimension]
    diameter: Optional[Dimension]
