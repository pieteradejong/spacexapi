# SpaceX-API notes

Source:
`https://github.com/r-spacex/SpaceX-API/tree/master`

## Schema

* Capsule ref: Dragon, Launch
* Company
* Core ref: Launch
* Crew ref: Launch
* Dragon 
* History 
* Landpad ref: Launch
* Launch ref: Rocket(has-one), Ships(has-many), Crew(has-many), Capsules(has-many), Payloads(has-many), Launchpad(has-one), Core(has-many)
* Launchpad ref: Rocket(has-many), Launches(has-many)
* Payload ref: Launch(has-one), Capsule(has-one) 
* Roadster 
* Rocket 
* Ship ref: Launches(has-many)
* Starlink ref: Launches(has-one)
* User 


