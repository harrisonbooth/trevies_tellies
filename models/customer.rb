require_relative( '../db/sql_runner.rb' )
require_relative( './sale.rb' )

class Customer

  # make attributes readable
  attr_reader :id, :first_name, :last_name, :contact_no

  # Make sure varibales are set upon new instances
  def initialize( details )
    @id = details[ 'id' ].to_i unless details[ 'id' ].nil?
    @first_name = details[ 'first_name' ]
    @last_name = details[ 'last_name' ]
    @contact_no = details[ 'contact_no' ]
  end

  # return concatination of first and last name
  def full_name()
    return @first_name + " " + @last_name
  end

  # Save instance to database and set id based on sql given id
  def save
    sql = "
    INSERT INTO customers
    ( first_name, last_name, contact_no )
    VALUES
    ( '#{@first_name}', '#{@last_name}', '#{@contact_no}' )
    RETURNING *;
    "
    @id = SqlRunner.run( sql )[0][ 'id' ].to_i
  end

  # convert pg result of many rows to array of instances
  def self.get_many( sql )
    customers = SqlRunner.run( sql )
    return customers.map{ |customer| Customer.new( customer )}
  end

  # search rows by id and delete result if found
  def self.delete( id )
    sql = "DELETE FROM customers WHERE id = #{id};"
    SqlRunner.run( sql )
  end

  # search rows by id and return result if found
  def self.find( id )
    sql = "SELECT * FROM customers WHERE id = #{id};"
    customer = SqlRunner.run( sql )[0]
    return Customer.new( customer )
  end

  # return all sales that a given customer is attached to
  def sales()
    sql = "SELECT * FROM sales WHERE customer_id = #{@id};"
    return Sale.get_many( sql )
  end

  # search rows by id and update results
  def self.update( details )
    sql =
    "
    UPDATE customers SET
    ( first_name, last_name, contact_no )
    =
    ( '#{ details[ 'first_name' ] }', '#{ details[ 'last_name' ] }', '#{ details[ 'contact_no' ] }' )
    WHERE id = #{ details[ 'id' ] };
    "
    SqlRunner.run( sql )
  end

  # returns all customers
  def self.all()
    sql = "SELECT * FROM customers;"
    return Customer.get_many( sql )
  end

end
