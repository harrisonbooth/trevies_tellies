require_relative( '../db/sql_runner.rb' )
require_relative( './sale.rb' )

class Customer
  attr_reader :id, :first_name, :last_name, :contact_no
  
  def initialize( details )
    @id = details[ 'id' ].to_i unless details[ 'id' ].nil?
    @first_name = details[ 'first_name' ]
    @last_name = details[ 'last_name' ]
    @contact_no = details[ 'contact_no' ]
  end

  def full_name()
    return @first_name + " " + @last_name
  end

  def save
    sql = "INSERT INTO customers ( first_name, last_name, contact_no ) VALUES ( '#{@first_name}', '#{@last_name}', '#{@contact_no}' ) RETURNING *;"
    @id = SqlRunner.run( sql )[0][ 'id' ].to_i
  end

  def self.get_many( sql )
    customers = SqlRunner.run( sql )
    return customers.map{ |customer| Customer.new( customer )}
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = #{@id};"
    SqlRunner.run( sql )
  end

  def self.delete( id )
    sql = "DELETE FROM customers WHERE id = #{id};"
    SqlRunner.run( sql )
  end

  def self.find( id )
    sql = "SELECT * FROM customers WHERE id = #{id};"
    customer = SqlRunner.run( sql )[0]
    return Customer.new( customer )
  end

  def sales()
    sql = "SELECT * FROM sales WHERE customer_id = #{@id};"
    return Sale.get_many( sql )
  end

  def update()
    sql = "UPDATE customers SET ( first_name, last_name, contact_no ) = ( '#{@first_name}', '#{@last_name}', '#{@contact_no}' ) WHERE id = #{@id};"
    SqlRunner.run( sql )
  end

  def self.update( details )
    sql = "UPDATE customers SET ( first_name, last_name, contact_no ) = ( '#{ details[ 'first_name' ] }', '#{ details[ 'last_name' ] }', '#{ details[ 'contact_no' ] }' )"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM customers;"
    return Customer.get_many( sql )
  end

end