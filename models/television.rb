require_relative( '../db/sql_runner.rb')

class Television
  attr_reader :id, :model_no, :stock, :manufacturer_id

  def initialize( details )
    @id = details[ 'id' ].to_i unless details[ 'id' ].nil?
    @model_no = details[ 'model_no' ]
    @manufacturer_id = details[ 'manufacturer_id' ].to_i
    @stock = details[ 'stock' ].to_i
  end

  def save()
    sql = "INSERT INTO televisions ( model_no, manufacturer_id, stock ) VALUES ( '#{@model_no}', #{@manufacturer_id}, #{@stock} ) RETURNING *;"
    @id = SqlRunner.run( sql )[0][ 'id' ].to_i
  end

  def self.get_many( sql )
    results = SqlRunner.run( sql )
    return results.map { |television| Television.new( television ) }
  end

  def self.delete_all()
    sql = "DELETE FROM televisions;"
    SqlRunner.run( sql )
  end

  def self.find_by_id( id )
    sql = "SELECT * FROM televisions WHERE id = #{id.to_i}"
    television = SqlRunner.run( sql )[0]
    return Television.new( television )
  end

end