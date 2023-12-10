# ure-database-project
database based on https://rejestry.ure.gov.pl/

# Entity Relationship Diagram
```mermaid
---
title: Urząd Regulacji Energetyki
---
erDiagram
    concession_fuel ||--o{ concession_withdrawn : places
    concession_promise ||--|{ concession_other_fuel : contains
    concession_expiry }|..|{ DELIVERY-ADDRESS : uses
```
