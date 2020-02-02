require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('./models/pet.rb')
require_relative('./models/vet.rb')
also_reload('./models/*')


get '/' do
  erb(:index)
end


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

post '/pets' do
  @pet = Pet.new(params)
  @pet.save()
  erb(:created) 
end
