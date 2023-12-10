# ure-database-project
database based on https://rejestry.ure.gov.pl/

# Entity Relationship Diagram
```mermaid
---
title: Urząd Regulacji Energetyki
---
erDiagram
    concession_fuel ||--o{ concession_withdrawn : places
    concession_other_fuel ||--o{ concession_withdrawn : places
    concession_fuel }|..|{  concession_expiry : places
    concession_other_fuel }|..|{  concession_expiry : places
    concession_fuel ||--|{ concession_promise : contains
    concession_other_fuel ||--|{ concession_promise : contains
```
