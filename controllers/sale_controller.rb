require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customer.rb')
require_relative( '../models/sale.rb')
require_relative( '../models/television.rb')
require_relative( '../models/manufacturer.rb')
require_relative( './shared_functions.rb')

# get full index sales
get( '/sales') do
  @sales = Sale.all().sort_by { |sale| sale.customer.last_name() }
  erb( :"sale/full_index" )
end

# get index customer sales
get( '/customers/:id/sales' ) do
  @customer = Customer.find( params[ :id ] )
  @sales = @customer.sales().sort_by { |sale| sale.id() }
  erb( :"sale/index" )
end

# get new sale form
get( '/sales/new' ) do
  @customers = Customer.all()
  @customer_id = @customers.sort_by { |customer| customer.last_name }[0].id()
  redirect to( "/customers/#{ @customer_id }/sales/new" )
end

# get new customer sale form
get( '/customers/:id/sales/new' ) do
  @televisions = Television.all().sort { |tele1, tele2| tv_sort_criteria( tele1, tele2 )}
  @customers = Customer.all().sort_by { |customer| customer.last_name }
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
