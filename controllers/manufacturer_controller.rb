require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/manufacturer.rb')
require_relative( '../models/television.rb')

# # get new manufacturer form
get( '/manufacturers/new') do
  erb( :"/manufacturer/new" )
end


# # post create manufacturer
post( '/manufacturers' ) do
  @manufacturer = Manufacturer.new( params )
  @manufacturer.save()
  redirect to( '/televisions' )
end

get( '/manufacturers' ) do
  @manufacturers = Manufacturer.all()
  erb( :"/manufacturer/index" )
end

post( '/manufacturers/:id/delete' ) do
  Manufacturer.delete( params[ :id ] )
  redirect to( '/manufacturers' )
end

# # get edit manufacturer form
get( '/manufacturers/:id/edit' ) do
  @manufacturer = Manufacturer.find( params[ :id ] )
  erb( :"manufacturer/edit" )
end

# # update manufacturer
post( '/manufacturers/:id') do
Manufacturer.update( params )
redirect to("/manufacturers")
end