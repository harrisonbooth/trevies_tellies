require( 'pg' )

class SqlRunner

  def self.run( sql )
    begin
      db = PG.connect({
        dbname: 'dgl2j6ld49vjo',
        host: 'ec2-54-247-178-166.eu-west-1.compute.amazonaws.com',
        port: 5432, user: 'rywkxypanrogce',
        password: 'a4118df094cb0fe7a61f581f7605229980ca202dd4b8f5934f68cb55c53d5339'
      })

      result = db.exec( sql )
    ensure
      db.close()
    end

    return result
  end

end
