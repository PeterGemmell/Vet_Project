require_relative('../db/sql_runner')
require('pry')

class Pet

  attr_reader :id
  attr_accessor :pet_name, :age, :animal_type, :owner_first_name,
  :owner_last_name, :owner_contact_number, :treatment_notes, :vet_id, :cost #cost added in.

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @pet_name = options['pet_name']
    @age = options['age']
    @animal_type = options['animal_type']
    @owner_first_name = options['owner_first_name']
    @owner_last_name = options['owner_last_name']
    @owner_contact_number = options['owner_contact_number']
    @treatment_notes = options['treatment_notes']
    @vet_id = options['vet_id'].to_i
    @cost = options['cost'].to_i #cost added in.
  end

 #CREATE
 def save()
   sql = "INSERT into pets(pet_name, age, animal_type, owner_first_name,
   owner_last_name, owner_contact_number, treatment_notes, vet_id, cost)
   VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9) RETURNING id"
   values = [@pet_name, @age, @animal_type, @owner_first_name, @owner_last_name,
   @owner_contact_number, @treatment_notes, @vet_id, @cost] #cost added here and extra $ added above.
   @id = SqlRunner.run(sql, values)[0]['id'].to_i
 end


 def random_name
   return @pet_name
 end

def full_name
  return @owner_first_name + " " + @owner_last_name
end

#READ
def self.all()
sql = "SELECT * FROM pets"
pets = SqlRunner.run(sql)
return pets.map { |pet|Pet.new(pet) }
end


def self.find_by_id(id)
  sql = "SELECT * FROM pets WHERE id = $1"
  values = [id]
  pet = SqlRunner.run(sql, values)[0]
  return Pet.new(pet)
end

#UPDATE
def update()
  sql = "UPDATE pets SET(pet_name, age, animal_type, owner_first_name,
  owner_last_name, owner_contact_number, treatment_notes, vet_id, cost) =
  ($1,$2,$3,$4,$5,$6,$7,$8,$9) WHERE id = $10"
  values = [@pet_name, @age, @animal_type, @owner_first_name, @owner_last_name,
  @owner_contact_number, @treatment_notes, @vet_id, @cost, @id] #cost added in here and dollar values changed.
  SqlRunner.run(sql, values)
end

# DELETE ALL FUNCTION
def self.delete_all()
  sql = "DELETE FROM pets"
  SqlRunner.run(sql)
end


#DELETE
def delete()
  sql = "DELETE FROM pets
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

# VET function created allowing us to reference and assign the choosen vet name to currently
# booked in pets in pets.erb

# Created an if statement whereby if there is no vet to assign to a pet,
# it creates a generic vet which will assign it to the pet, thus not deleting the pet.
# This is titled No Vet Assigned in pets.erb and show.erb.

def vet()
  if @vet_id == 0
    return Vet.new({"name": "nil", "url": "nil"})
  end
  sql = "SELECT * FROM vets WHERE id = $1"
  values = [@vet_id]
  vet = SqlRunner.run(sql, values).first
  return Vet.new(vet)
end


end
