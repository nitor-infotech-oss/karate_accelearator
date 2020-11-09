Feature: Database Connection and verification

  @checkDB @ignore
  Scenario: Retrieve employee from MySQL database



# use jdbc to validate
      * def config = read( dataPath + 'database_details.json')
#    * def config =  { username: 'root', password: 'admin123', url: 'jdbc:mysql://localhost:3306/emp', driverClassName: 'com.mysql.cj.jdbc.Driver' }
    * def DbUtils = Java.type('examples.utils.DbUtils')
    * def db = new DbUtils(config)

# Db verification
    * def dbs = db.readRows('SELECT * FROM emp.Employee')
    Then print dbs
    * match  each dbs contains {EmpDept : "IT"}

    * def dbEmpID = db.readRow("SELECT * FROM emp.Employee WHERE EmpID='102'")
    Then print dbEmpID
    * match  dbEmpID contains {EmpID : 102}




