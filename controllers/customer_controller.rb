require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb')
require_relative( '../models/sale.rb')
require_relative( '../models/television.rb')
require_relative( '../models/manufacturer.rb')

# get index customers
get( '/customers' ) do
  @customers = Customer.all()
  erb( :"customer/index" )
end

# get new customer form
get( '/customers/new' ) do
  erb( :"customer/new" ) 
end

# post create customer
post( '/customers' ) do
  @customer = Customer.new( params )
  @customer.save()
  redirect to( '/customers' )
end

# post delete customer
post( '/customers/:id/delete' ) do
  Customer.delete( params[ :id ] )
  redirect to( '/customers' )
end

# get edit customer form
get( '/customers/:id/edit') do
  @customer = Customer.find( params[ :id ] )
  erb( :"customer/edit" )
end

# post update customer
post( '/customers/:id' ) do
  Customer.update( params )
  redirect to( '/customers')
end