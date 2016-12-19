require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb')
require_relative( '../models/sale.rb')
require_relative( '../models/television.rb')
require_relative( '../models/manufacturer.rb')

# get full index sales
get( '/sales') do
  @sales = Sale.all()
  erb( :"sale/full_index" )
end

# get index customer sales
get( '/customers/:id/sales' ) do
  @customer = Customer.find( params[ :id ] )
  @sales = @customer.sales()
  erb( :"sale/index" )
end

# get new sale form
get( '/sales/new' ) do
  @customers = Customer.all()
  @customer_id = @customers[0].id()
  redirect to( "/customers/#{ @customer_id }/sales/new" )
end
  
# get new customer sale form
get( '/customers/:id/sales/new' ) do
  @televisions = Television.all()
  @customers = Customer.all()
  @customer = Customer.find( params[ :id ] )
  erb( :"sale/new" )
end

# post create sale
post( '/customers/:id/sales' ) do
  @sale = Sale.new( params )
  @sale.save()
  redirect to( "/customers/#{ params[ :id ] }/sales" )
end

# post delete sale
post( '/customers/:id/sales/:sale_id/delete' ) do
  Sale.delete( params[ :sale_id ] )
  redirect to( "/customers/#{ params[ :id ] }/sales" )
end