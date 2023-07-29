from pydantic import BaseModel
from typing import Optional, PayloadFairing

class Payloads(BaseModel):
    option_1: Optional[str]
    composite_fairing: Optional[PayloadFairing]
