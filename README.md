# Celestial Bodies Database

This repository contains the **Celestial Bodies Database** project, completed as part of the freeCodeCamp Relational Database Certification. It is a PostgreSQL database that models a hierarchical universe using relational data structures. 

The database demonstrates the use of primary and foreign keys, various SQL data types (integers, strings, booleans, and numerics), and table constraints (`UNIQUE`, `NOT NULL`) across five interconnected tables.

## Database Schema Overview

The database consists of five tables. Four of these (`galaxy`, `star`, `planet`, and `moon`) form a strict one-to-many (1:N) hierarchical chain. The fifth table (`constellations`) serves as an independent data set to fulfill the five-table project requirement.

### 1. `constellations` Table
An independent table cataloging various star formations.
* **`constellation_id`**: Primary Key (Auto-incrementing integer).
* **`name`**: `VARCHAR(50)`. The name of the constellation (e.g., Andromeda, Leo). Has a `UNIQUE` and `NOT NULL` constraint.
* **`is_zodiac`**: `BOOLEAN`. Indicates whether the constellation is part of the zodiac.

### 2. `galaxy` Table
The top level of the celestial hierarchy.
* **`galaxy_id`**: Primary Key (Auto-incrementing integer).
* **`name`**: `VARCHAR(50)`. The name of the galaxy. Has a `UNIQUE` and `NOT NULL` constraint.
* **`constellation`**: `VARCHAR(50)`. A text reference to where the galaxy is visually located in the night sky.
* **`magnitude`**: `NUMERIC(6,2)`. The apparent visual magnitude of the galaxy.
* **`description`**: `TEXT`. A brief descriptive overview.

### 3. `star` Table
Stars that exist within the defined galaxies.
* **`star_id`**: Primary Key (Auto-incrementing integer).
* **`galaxy_id`**: Foreign Key linking to `galaxy(galaxy_id)`. Establishes the 1:N relationship (one galaxy holds many stars).
* **`name`**: `VARCHAR(50)`. The name of the star. Has a `UNIQUE` and `NOT NULL` constraint.
* **`lifecycle`**: `VARCHAR(50)`. The current evolutionary stage of the star (e.g., Main Sequence, Red Dwarf).
* **`age_in_million_years`**: `INT`. Estimated age of the star.

### 4. `planet` Table
Planets that orbit the stars.
* **`planet_id`**: Primary Key (Auto-incrementing integer).
* **`star_id`**: Foreign Key linking to `star(star_id)`. Establishes the 1:N relationship (one star has many planets).
* **`name`**: `VARCHAR(50)`. The name of the planet. Has a `UNIQUE` and `NOT NULL` constraint.
* **`habitable`**: `BOOLEAN`. Indicates if the planet is capable of supporting life.
* **`color`**: `VARCHAR(50)`. The dominant visual color of the planet.
* **`number_of_moon`**: `INT`. The total count of natural satellites orbiting the planet.

### 5. `moon` Table
Natural satellites that orbit the planets.
* **`moon_id`**: Primary Key (Auto-incrementing integer).
* **`planet_id`**: Foreign Key linking to `planet(planet_id)`. Establishes the 1:N relationship (one planet has many moons).
* **`name`**: `VARCHAR(50)`. The name of the moon. Has a `UNIQUE` and `NOT NULL` constraint.
* **`meaning`**: `TEXT`. The mythological, historical, or linguistic origin of the moon's name.
* **`magnitude`**: `NUMERIC(4,1)`. The visual brightness of the moon.
