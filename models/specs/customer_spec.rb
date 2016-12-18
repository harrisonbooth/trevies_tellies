require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../customer.rb' )
# require_relative( '../filename.rb' )
# require_relative( '../filename.rb' )
# require_relative( '../filename.rb' )
# require_relative( '../filename.rb' )

class FileSpec < MiniTest::Test

  def setup()
    @customer = Customer.new( {
      'first_name' => 'Harrison',
      'last_name' => 'Booth',
      'contact_no' => '07988989898'
    } )
  end

  def test_can_create_customer
    assert_equal( Customer, @customer.class() )
  end

  def test_can_get_name
    assert_equal( 'Harrison Booth', @customer.full_name() )
  end

  def test_can_get_contact_no
    assert_equal( '07988989898', @customer.contact_no() )
  end

end