require( 'pg' )
require( 'pry' )
require_relative( '../models/television.rb' )
# require_relative( 'models/manufacturer.rb' )

television1 = Television.new( {
      'model_no' => 'UE55JS8000',
      'manufacturer_id' => 1,
      'stock' => 9
    } )

television1.save()

binding.pry()