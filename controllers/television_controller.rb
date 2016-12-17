require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/television.rb')
require_relative( '../models/manufacturer.rb')

# get index televisions
get( '/televisions' ) do
  @televisions = Television.all()
  erb( :"television/index" )
end

# get new television form
get( '/televisions/new' ) do
  @manufacturers = Manufacturer.all()
  erb( :"television/new" )
end

# post create television
post( '/televisions' ) do
  @television = Television.new( params )
  @television.save()
  redirect to( '/televisions' )
end

# post delete television
post( '/televisions/:id/delete' ) do
  Television.delete( params[ :id ].to_i )
  redirect to( '/' )
end