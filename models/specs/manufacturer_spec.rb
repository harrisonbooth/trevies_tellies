require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../manufacturer.rb' )
# require_relative( '../filename.rb' )
# require_relative( '../filename.rb' )
# require_relative( '../filename.rb' )
# require_relative( '../filename.rb' )

class FileSpec < MiniTest::Test

  def setup()
    @manufacturer1 = Manufacturer.new( {
      'name' => 'LG',
      'model_temp' => 'LG-'
    } )
  end

  def test_can_create_manufacturer
    assert_equal( Manufacturer, @manufacturer1.class() )
  end

  def test_can_get_name
    assert_equal( 'LG', @manufacturer1.name() )
  end

  def test_can_get_model_template
    assert_equal( 'LG-', @manufacturer1.model_temp() ) 
  end

  def test_can_get_id_after_save
    @manufacturer1.save()
    assert_equal( Fixnum, @manufacturer1.id().class() )
  end

end