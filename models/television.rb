require_relative( '../db/sql_runner.rb')
require_relative( './manufacturer.rb')

class Television
  attr_reader :id, :model_no, :stock, :manufacturer_id, :cost_price, :retail_price

  def initialize( details )
    @id = details[ 'id' ].to_i unless details[ 'id' ].nil?
    @model_no = details[ 'model_no' ]
    @manufacturer_id = details[ 'manufacturer_id' ].to_i
    @stock = details[ 'stock' ].to_i
    @cost_price = details[ 'cost_price' ].to_f
    @retail_price = details[ 'retail_price' ].to_f unless details[ 'retail_price' ].nil?
  end

  def save()
    sql = "INSERT INTO televisions ( model_no, manufacturer_id, stock, cost_price ) VALUES ( '#{@model_no}', #{@manufacturer_id}, #{@stock}, #{@cost_price} ) RETURNING *;"
    @id = SqlRunner.run( sql )[0][ 'id' ].to_i
    calc_retail_price()
    update()
  end

  def self.get_many( sql )
    results = SqlRunner.run( sql )
    return results.map { |television| Television.new( television ) }
  end

  def delete()
    sql = "DELETE FROM televisions WHERE id = #{@id}"
    SqlRunner.run( sql )
  end

  def self.delete( id )
    sql = "DELETE FROM televisions where id = #{id}"
    SqlRunner.run( sql )
  end

  # def self.delete_all()
  #   sql = "DELETE FROM televisions;"
  #   SqlRunner.run( sql )
  # end

  def self.find( id )
    sql = "SELECT * FROM televisions WHERE id = #{id};"
    television = SqlRunner.run( sql )[0]
    return Television.new( television )
  end

  def self.all()
    sql = "SELECT * FROM televisions;"
    return Television.get_many( sql )
  end

  def manufacturer()
    sql = "SELECT * FROM manufacturers WHERE id = #{manufacturer_id}"
    manufacturer = SqlRunner.run( sql )[0]
    return Manufacturer.new( manufacturer )
  end

  def update()
    sql = "UPDATE televisions SET ( model_no, manufacturer_id, stock, cost_price, retail_price ) = ( '#{@model_no}', #{@manufacturer_id}, #{@stock}, #{@cost_price}, #{@retail_price} ) WHERE id = #{@id};"
    SqlRunner.run( sql )
  end

  def update_model()
    sql = "SELECT model_temp FROM manufacturers WHERE id = #{@manufacturer_id};"
    @model_no = SqlRunner.run( sql )[0][ 'model_temp' ].to_s + "-" + @model_no
    update()
  end

  def calc_retail_price()
    sql = "SELECT markup FROM manufacturers WHERE id = #{@manufacturer_id};"
    markup = SqlRunner.run( sql )[0][ 'markup' ].to_f
    @retail_price = @cost_price * markup
  end

end