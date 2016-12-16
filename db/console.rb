require( 'pg' )
require( 'pry' )
require_relative( '../models/television.rb' )
# require_relative( 'models/manufacturer.rb' )

television1 = Television.new( {
      'model_no' => 'UE55JS8000',
      'manufacturer_id' => 1,
      'stock' => 9,
      'cost_price' => 1
    } )

television2 = Television.new( {
      'model_no' => 'KDL-55XD850',
      'manufacturer_id' => 2,
      'stock' => 4,
      'cost_price' => 10
    } )

television3 = Television.new( {
      'model_no' => 'KDL-49WD750',
      'manufacturer_id' => 2,
      'stock' => 2,
      'cost_price' => 100
    } )

television1.save()
television2.save()
television3.save()

binding.pry()