require_relative( '../db/sql_runner.rb' )
require_relative( './customer.rb' )
require_relative( './television.rb' )

class Sale

  # Make attributes readable
  attr_reader :id, :customer_id, :television_id

  # Make sure variables are set upon new instances
  def initialize( details )
    @id = details[ 'id' ].to_i unless details[ 'id' ].nil?
    @customer_id = details[ 'customer_id' ]
    @television_id = details[ 'television_id' ]
  end

  # Save instance to database and set id based on sql given id, also decrease stock of television attached to sale by one
  def save()
    sql = "INSERT INTO sales ( customer_id, television_id ) VALUES ( #{@customer_id}, #{@television_id} ) RETURNING *;"
    @id = SqlRunner.run( sql )[0][ 'id' ].to_i

    @television = Television.find( @television_id )
    @television.sell( 1 )
    @television.update()
  end

  # convert pg result of many rows into array of instances
  def self.get_many( sql )
    sales = SqlRunner.run( sql )
    return sales.map { |sale| Sale.new( sale ) }
  end

  # delete sale
  def delete()
    sql = "DELETE FROM sales WHERE id = #{@id};"
    SqlRunner.run( sql )
  end

  # search rows by id and delete result if found
  def self.delete( id )
    sql = "DELETE FROM sales WHERE id = #{id};"
    SqlRunner.run( sql )
  end

  # search rows by id and return result if found
  def self.find( id )
    sql = "SELECT * FROM sales WHERE id = #{id};"
    sale = SqlRunner.run( sql )[0]
    return Sale.new( sale )
  end

  # return customer attached to given sale
  def customer()
    sql = "SELECT * FROM customers WHERE id = #{@customer_id};"
    customer = SqlRunner.run( sql )[0]
    return Customer.new( customer )
  end

  # return television attached to given sale
  def television()
    sql = "SELECT * FROM televisions WHERE id = #{@television_id};"
    television = SqlRunner.run( sql )[0]
    return Television.new( television )
  end

  # return all sales
  def self.all()
    sql = "SELECT * FROM sales;"
    return Sale.get_many( sql )
  end

end