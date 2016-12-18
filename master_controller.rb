require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( './controllers/manufacturer_controller.rb')
require_relative( './controllers/television_controller.rb')
require_relative( './controllers/customer_controller.rb')
require_relative( './controllers/sale_controller.rb')

# sends to index for TVs as welcome page
get( '/' ) do
  redirect to( '/televisions' )
end