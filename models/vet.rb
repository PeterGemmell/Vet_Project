require_relative('../db/sql_runner')

class Vet

  attr_reader :id
  attr_accessor :name, :url

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name'] if options['name']
    @url = options['url'] if options['url']
  end

#CREATE
def save()
  sql = "INSERT INTO vets(name, url)
  VALUES($1,$2) RETURNING id"
  values = [@name, @url]
  @id = SqlRunner.run(sql, values)[0]['id'].to_i
end

def random_vet_name
  return @name
end

#READ
def self.all()
  sql = "SELECT * FROM vets"
  vets = SqlRunner.run(sql)
  return vets.map { |vet|Vet.new(vet) }
end

def self.find_by_id(id)
  sql = "SELECT * FROM vets WHERE id = $1"
  values = [id]
  vet = SqlRunner.run(sql, values)[0]
  return Vet.new(vet)
end

#UPDATE
def update()
  sql = "UPDATE vets SET(name, url) = ($1, $2)
  WHERE id = $3"
  values = [@name, @url, @id]
  SqlRunner.run(sql, values)
end

def self.delete_all()
  sql = "DELETE FROM vets"
  SqlRunner.run(sql)
end


#DELETE
def delete()
  sql = "DELETE FROM vets
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

end
