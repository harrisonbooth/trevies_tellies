require( 'pg' )
require( 'pry' )
require_relative( '../models/television.rb' )
require_relative( '../models/manufacturer.rb' )
require_relative( '../models/customer.rb' )
require_relative( '../models/sale.rb' )

television1 = Television.new( {
  'model_no' => '55JS8000',
  'manufacturer_id' => 1,
  'stock' => 9,
  'cost_price' => 1300
  } )

television2 = Television.new( {
  'model_no' => '55XD850',
  'manufacturer_id' => 2,
  'stock' => 4,
  'cost_price' => 1000
  } )

television3 = Television.new( {
  'model_no' => '49WD750',
  'manufacturer_id' => 2,
  'stock' => 2,
  'cost_price' => 550
  } )

television4 = Television.new( {
  'model_no' => '43WD750',
  'manufacturer_id' => 2,
  'stock' => 6,
  'cost_price' => 400
  } )

television5 = Television.new( {
  'model_no' => '55DX800',
  'manufacturer_id' => 3,
  'stock' => 23,
  'cost_price' => 1000
  } )

television6 = Television.new( {
  'model_no' => '49DX700',
  'manufacturer_id' => 3,
  'stock' => 4,
  'cost_price' => 850
  } )

television7 = Television.new( {
  'model_no' => '49JU7500',
  'manufacturer_id' => 1,
  'stock' => 8,
  'cost_price' => 1000
  } )

television8 = Television.new( {
  'model_no' => '55XD930',
  'manufacturer_id' => 2,
  'stock' => 3,
  'cost_price' => 850
  } )

television9 = Television.new( {
  'model_no' => '49JU6100',
  'manufacturer_id' => 1,
  'stock' => 4,
  'cost_price' => 650
  } )

customer1 = Customer.new( {
  'first_name' => 'Harrison',
  'last_name' => 'Booth',
  'contact_no' => '07899898989'
  } )

sale1 = Sale.new( { 
  'customer_id' => 2,
  'television_id' => 3
  } )

television1.save()
television2.save()
television3.save()
television4.save()
television5.save()
television6.save()
television7.save()
television8.save()
television9.save()

customer1.save()

binding.pry()
