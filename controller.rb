require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('./models/pet.rb')
require_relative('./models/vet.rb')
also_reload('./models/*')


# get '/pets' do
#   @pets = Pet.all()
#   erb(:index)
# end

# get '/pets/' do
#   erb(:index)
# end

get '/pets' do
  @pets = Pet.all()
  erb(:pets)
end

get '/vets' do
  @vets = Vet.all()
  erb(:vets)
end

get '/pets/new' do
  erb(:new)
end

get '/pets/:id' do
  pet_id = params[:id]
  @pet = Pet.find_by_id(pet_id) #change back to just id if worse.
  erb(:show)
end

post '/pets' do
  @pet = Pet.new(params)
  @pet.save()
  erb(:created)
end

get '/pets/:id/edit' do
  pet_id = params[:id]
  @pet = Pet.find_by_id(pet_id)
  erb(:edit)
end

post '/pets/:id/delete' do
  pet_id = params[:id]
  @pet = Pet.find_by_id(pet_id) #back to just id.
  @pet.delete
  erb(:delete)
end

post '/pets/:id' do
  pet = Pet.new(params)
  pet.update
  redirect to '/pets'
end
