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
    sql = "SELECT * FROM manufacturers WHERE id = #{id}"
    manufacturer = SqlRunner.run( sql )[0]
    return Manufacturer.new( manufacturer )
  end

  def delete()
    sql = "DELETE FROM manufacturer WHERE id = #{@id}"
    SqlRunner.run( sql )
  end

  def self.delete( id )
    delete( Manufacturer.find( id ) )
  end

  def televisions()

  end

end