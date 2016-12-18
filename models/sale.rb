require_relative( '../db/sql_runner.rb' )
require_relative( './customer.rb' )
require_relative( './television.rb' )

class Sale
  attr_reader :id, :customer_id, :television_id

  def initialize( details )
    @id = details[ 'id' ].to_i unless details[ 'id' ].nil?
    @customer_id = details[ 'customer_id' ]
    @television_id = details[ 'television_id' ]
  end

  def save()
    sql = "INSERT INTO sales ( customer_id, television_id ) VALUES ( #{@customer_id}, #{@television_id} ) RETURNING *;"
    @id = SqlRunner.run( sql )[0][ 'id' ].to_i
  end

  def self.get_many( sql )
    sales = SqlRunner.run( sql )
    return sales.map { |sale| Sale.new( sale ) }
  end

  def delete()
    sql = "DELETE FROM sales WHERE id = #{@id};"
    SqlRunner.run( sql )
  end

  def self.delete( id )
    sql = "DELETE FROM sales WHERE id = #{id};"
    SqlRunner.run( sql )
  end

  def self.find( id )
    sql = "SELECT * FROM sales WHERE id = #{id};"
    sale = SqlRunner.run( sql )[0]
    return Sale.new( sale )
  end

  def customer()
    sql = "SELECT * FROM customers WHERE id = #{@customer_id};"
    customer = SqlRunner.run( sql )[0]
    return Customer.new( customer )
  end

  def television()
    sql = "SELECT * FROM televisions WHERE id = #{@television_id};"
    television = SqlRunner.run( sql )[0]
    return Television.new( television )
  end

  def self.all()
    sql = "SELECT * FROM sales;"
    return Sale.get_many( sql )
  end

end