require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/television.rb')
require_relative( '../models/manufacturer.rb')

# get index televisions
get( '/televisions' ) do
  @televisions = Television.all()
  @manufacturers = Manufacturer.all()
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
  Television.delete( params[ :id ] )
  redirect to( '/' )
end

get( '/televisions/:id/order') do
  @television = Television.find( params[ :id ] )
  erb( :"television/order" )
end

post( '/televisions/:id/update' ) do
  Television.update_stock( params )
  redirect to( '/televisions' )
end

post( '/televisions/:id/sell') do
  @television = Television.find( params[ :id ] )
  @television.sell( 1 )
  @television.update()
  redirect to( '/televisions' )
end

# filter page

get( '/televisions/filter') do
  @manufacturer_id = params[ :manufacturer_id ]
  redirect to( "/televisions/filter/#{ @manufacturer_id }" )
end

get( '/televisions/filter/:id') do
  @manufacturer = Manufacturer.find( params[ :id ] )
  @televisions = @manufacturer.televisions()
  erb( :"television/filtered_index" )
end