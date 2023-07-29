from pydantic import BaseModel
from typing import Optional, Dimension, Stage, Any, Engine, LandingLegs, List

class RocketSchema(BaseModel):
    name: Optional[str]
    type: Optional[str]
    active: Optional[bool]
    stages: Optional[int]
    boosters: Optional[int]
    cost_per_launch: Optional[float]
    success_rate_pct: Optional[float]
    first_flight: Optional[str]
    country: Optional[str]
    company: Optional[str]
    height: Optional[Dimension]
    diameter: Optional[Dimension]
    mass: Optional[Dimension]
    payload_weights: Optional[List[Any]]
    first_stage: Optional[Stage]
    second_stage: Optional[Stage]
    engines: Optional[Engine]
    landing_legs: Optional[LandingLegs]
    flickr_images: Optional[List[str]]
    wikipedia: Optional[str]
    description: Optional[str]

