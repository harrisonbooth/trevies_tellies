require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../television.rb' )
# require_relative( '../filename.rb' )
# require_relative( '../filename.rb' )
# require_relative( '../filename.rb' )
# require_relative( '../filename.rb' )

class FileSpec < MiniTest::Test

  def setup()
    @television1 = Television.new( {
      'model_no' => 'UE55JS8000',
      'manufacturer_id' => 1,
      'stock' => 9
    } )
  end

  def test_can_create_television
    assert_equal( Television, @television1.class() )
  end

  def test_can_get_model
    assert_equal( 'UE55JS8000', @television1.model_no() )
  end

  def test_can_get_stock
    assert_equal( 9, @television1.stock() )
  end

  def test_can_get_manufacturer_id
    assert_equal( 1, @television1.manufacturer_id() )
  end

  def test_can_get_id_after_save
    Television.delete_all()
    @television1.save()
    assert_equal( Fixnum, @television1.id().class() )
    assert_equal( false, @television1.id() == 0)
  end

  

end