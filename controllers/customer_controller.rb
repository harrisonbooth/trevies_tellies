require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb')
require_relative( '../models/sale.rb')
require_relative( '../models/television.rb')
require_relative( '../models/manufacturer.rb')

# get index customers - done
get( '/customers' ) do
  @customers = Customer.all()
  erb( :"customer/index" )
end

# get new customer form - done
get( '/customers/new' ) do
  erb( :"customer/new" ) 
end

# post create customer - done
post( '/customers' ) do
  @customer = Customer.new( params )
  @customer.save()
  redirect to( '/customers' )
end

# post delete customer - done
post( '/customers/:id/delete' ) do
  Customer.delete( params[ :id ] )
  redirect to( '/customers' )
end

# get edit customer form - done
get( '/customers/:id/edit') do
  @customer = Customer.find( params[ :id ] )
  erb( :"customer/edit" )
end

# post update customer - done
post( '/customers/:id' ) do
  Customer.update( params )
  redirect to( '/customers')
end