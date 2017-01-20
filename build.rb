system('dropdb trevies_tellies')
system('createdb trevies_tellies')
system('psql -d trevies_tellies -f ./db/trevies_tellies.sql && ruby ./db/console.rb')
