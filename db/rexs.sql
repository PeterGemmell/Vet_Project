DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS vets;

-- VET table created.
CREATE TABLE vets(
 id SERIAL PRIMARY KEY,
 name VARCHAR(255),
 url VARCHAR(255)
);

-- PET table created.
CREATE TABLE pets(
 id SERIAL PRIMARY KEY,
 pet_name VARCHAR(255),
 age VARCHAR(255),
 animal_type VARCHAR(255),
 owner_first_name VARCHAR(255),
 owner_last_name VARCHAR(255),
 owner_contact_number VARCHAR(255),
 vet_id INT REFERENCES vets(id) ON DELETE CASCADE,
 treatment_notes VARCHAR(255),
 cost INT 
);
