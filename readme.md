# Trevies Tellies
### Stock, customer, and sales tracker.
First large scale, full stack ruby project.
  - Database
    * Holds manufacturers, televisions, customers, and sales.
    * Manufacturers to televisions: one to many.
    * Customers to sales: one to many.
    * Customers to televisions: many to many (sales as a linking table).
  - Web interface (Full site)
    * Modernly and cleanly designed.
    * Easy to navigate.
    * Provides forms for CRUD actions on manufacturers, televisions, cusutomers and sales.
    * Different formatting on mobile version.
  - Web interface (Mobile site)
    * Removes all CRUD and navigation to any pages aside from the television stock to minimize user error.
    * Adds filter to search for TVs by manufacturer.
    * Intended to be used by salesmen during sales pitches to speed up stock checks.
    
---

### Instructions to run
  - Ensure to have the current version of Ruby, sinatra, and PostGres installed.
  - Move into the cloned repo.
  - Run the following commands in terminal: `ruby build.rb` and `ruby master_controller.rb`
  - Then open your browser to your sinatra port (default: `localhost:4567/`)

---

### Screenshots

![alt text](http://i.imgur.com/sffPbjG.png)
![alt text](http://i.imgur.com/gqKTANC.png)
![alt text](http://i.imgur.com/roKWyu9.png)
![alt text](http://i.imgur.com/ywDU1Fn.png)

