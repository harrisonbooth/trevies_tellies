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


# # post delete manufacturers


