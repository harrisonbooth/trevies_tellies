require_relative( '../db/sql_runner.rb' )
require_relative( './television.rb' )

class Manufacturer

  # Make attributes readable
  attr_reader :id, :name, :model_temp, :markup

  # Make sure varibales are set upon new instances
  def initialize( details )
    @id = details[ 'id' ].to_i unless details[ 'id' ].nil?
    @name = details[ 'name']
    @model_temp = details[ 'model_temp' ]
    @markup = details[ 'markup' ].to_f
  end

  # Save instance to database and set id based on sql given id
  def save()
    sql = "
    INSERT INTO manufacturers ( name, model_temp, markup )
    VALUES
    ( '#{@name}', '#{@model_temp}', #{@markup} )
    RETURNING *;
    "
    @id = SqlRunner.run( sql )[0][ 'id' ].to_i
  end

  # convert pg result of many rows to array of instances
  def self.get_many( sql )
    manufacturers = SqlRunner.run( sql )
    return manufacturers.map { |manufacturer| Manufacturer.new( manufacturer ) }
  end

  # search rows by id and return result if found
  def self.find( id )
    sql = "SELECT * FROM manufacturers WHERE id = #{id};"
    manufacturer = SqlRunner.run( sql )[0]
    return Manufacturer.new( manufacturer )
  end

  # search rows by id and delete result if found
  def self.delete( id )
    sql = "DELETE FROM manufacturers WHERE id = #{id};"
    SqlRunner.run( sql )
  end

  # return all television of given manufacturer
  def televisions()
    sql = "SELECT * from televisions WHERE manufacturer_id = #{@id};"
    return Television.get_many( sql )
  end

  # return all manufacturers
  def self.all()
    sql = "SELECT * FROM manufacturers;"
    return Manufacturer.get_many( sql )
  end

  # search rows by id and update results
  def self.update( details )
    sql = "UPDATE manufacturers SET ( name, model_temp, markup )
    =
    ( '#{ details[ 'name' ] }', '#{ details[ 'model_temp' ] }', #{details[ 'markup' ] } )
    WHERE id = #{ details[ 'id' ] };
    "
    SqlRunner.run( sql )
  end

end
