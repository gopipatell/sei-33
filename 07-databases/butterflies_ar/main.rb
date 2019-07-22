require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sqlite3'
require 'active_record'

# Rails will do this for you automatically.
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'database.sqlite3'
)

# Optional bonus
ActiveRecord::Base.logger = Logger.new(STDERR)

# Models
class Butterfly < ActiveRecord::Base
  belongs_to :plant, :optional => true
end

class Plant < ActiveRecord::Base
  has_many :butterflies
end

get '/pry' do
  binding.pry
end

get '/' do
  erb :home
end

# INDEX -- show and link to all the butterflies in the database
get '/butterflies' do
  @butterflies = Butterfly.all
  erb :butterflies_index
end

# NEW -- show the user a form to enter a new butterfly
get '/butterflies/new' do
  erb :butterflies_new
end

# CREATE -- insert a new butterfly into the database
post '/butterflies' do
  butterfly = Butterfly.new
  butterfly.name = params[:name]
  butterfly.family = params[:family]
  butterfly.image = params[:image]
  butterfly.save
  redirect to("/butterflies/#{ butterfly.id }") # GET request
end

# SHOW -- show you all the info for a particular butterfly, based on its ID.
get '/butterflies/:id' do
  @butterfly = Butterfly.find params[:id]
  erb :butterflies_show
end

# EDIT -- show the form to edit a particular existing butterfly
get '/butterflies/:id/edit' do
  @butterfly = Butterfly.find params[:id]
  erb :butterflies_edit
end

# UPDATE -- update the database with new information for some particular butterfly
post '/butterflies/:id' do
  butterfly = Butterfly.find params[:id]
  butterfly.name = params[:name]
  butterfly.family = params[:family]
  butterfly.image = params[:image]
  butterfly.save
  redirect to("/butterflies/#{ params[:id] }")
end

# DESTROY -- delete the butterfly with some butterfly ID from the database
get '/butterflies/:id/delete' do
  butterfly = Butterfly.find params[:id]
  butterfly.destroy
  redirect to('/butterflies')
end

# Plants CRUD ##################################################################
# INDEX
get '/plants' do
  @plants = Plant.all
  erb :plants_index
end

# NEW
get '/plants/new' do
  erb :plants_new
end

# CREATE
post '/plants' do
  plant = Plant.new
  plant.name = params[:name]
  plant.image = params[:image]
  plant.save
  redirect to("/plants/#{ plant.id }")
end

# SHOW
get '/plants/:id' do
  @plant = Plant.find params[:id]
  erb :plants_show
end

# EDIT
get '/plants/:id/edit' do
  @plant = Plant.find params[:id]
  erb :plants_edit
end

# UPDATE
post '/plants/:id' do
  plant = Plant.find params[:id]
  plant.name = params[:name]
  plant.image = params[:image]
  plant.save
  redirect to("/plants/#{ plant.id }")
end

# DESTROY
get '/plants/:id/delete' do
  plant = Plant.find params[:id]
  plant.destroy
  redirect to('/plants')
end

after do
  ActiveRecord::Base.connection.close
end
