require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/manufacturer.rb')
require_relative( '../models/television.rb')

# get index manufacturers
get( '/manufacturers' ) do
  @manufacturers = Manufacturer.all()
  erb( :"/manufacturer/index" )
end

# get new manufacturer form
get( '/manufacturers/new') do
  erb( :"/manufacturer/new" )
end

# post create manufacturer
post( '/manufacturers' ) do
  @manufacturer = Manufacturer.new( params )
  @manufacturer.save()
  redirect to( '/manufacturers' )
end

# post delete manufacturer
post( '/manufacturers/:id/delete' ) do
  Manufacturer.delete( params[ :id ] )
  redirect to( '/manufacturers' )
end

# get edit manufacturer form
get( '/manufacturers/:id/edit' ) do
  @manufacturer = Manufacturer.find( params[ :id ] )
  erb( :"manufacturer/edit" )
end

# post update manufacturer
post( '/manufacturers/:id') do
Manufacturer.update( params )
redirect to("/manufacturers")
end