require_relative( '../db/sql_runner.rb' )
require_relative( './television.rb' )

class Manufacturer

  attr_reader :id, :name, :model_temp

  def initialize( details )
    @id = details[ 'id' ].to_i unless details[ 'id' ].nil?
    @name = details[ 'name'] 
    @model_temp = details[ 'model_temp' ]
  end

  def save()
    sql = "INSERT INTO manufacturers ( name, model_temp ) VALUES ( '#{@name}', '#{model_temp}' ) RETURNING *;"
    @id = SqlRunner.run( sql )[0][ 'id' ].to_i
  end

  def self.get_many( sql )
    manufacturers = SqlRunner.run( sql )
    return manufacturers.map { |manufacturer| Manufacturer.new( manufacturer ) }
  end

  def self.find( id )
    sql = "SELECT * FROM manufacturers WHERE id = #{id};"
    manufacturer = SqlRunner.run( sql )[0]
    return Manufacturer.new( manufacturer )
  end

  def self.delete( id )
    sql = "DELETE FROM manufacturers WHERE id = #{id};"
    SqlRunner.run( sql )
  end

  def televisions()
    sql = "SELECT * from televisions WHERE manufacturer_id = #{@id}"
    return Television.get_many( sql )
  end

  def self.all()
    sql = "SELECT * FROM manufacturers;"
    return Manufacturer.get_many( sql )
  end

end