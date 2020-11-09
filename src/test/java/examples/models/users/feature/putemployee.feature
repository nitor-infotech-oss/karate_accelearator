Feature: Update Employee details.

  @checkUpdateClient
  Scenario: Create the employee by passing parameters and update the employee.
    * def input = call read('postemp.feature@createEmployee') { id :15, name: 'savita Test B', age:34, department: 'IT' }
    * def res = input.input
      # Update the employee details
    * url BaseUrl +'employee/update'
    * set res.name = "Test user"
    * set res.age = 30
    * set res.department = "HR"
    Then print res
    And request res
    When method post
    Then status 200
    And print 'Response is: ',response
    And match response contains "Employee is updated successfully"

     # get updated employee details
    And match res contains { name : #(res.name) }

  @checkUpdateClient
  Scenario: Create employee from faker data and update it.

    * def input = call read('postemployee.feature@createNewEmployeeUsingFakerData')
    * def res = input.result
      # Update the employee details
    * url BaseUrl +'employee/update'
    * set res.name = "Test user update"
    * set res.age = 30
    * set res.department = "IT"
    Then print res
    And request res
    When method post
    Then status 200
    And print 'Response is: ',response
    And match response contains "Employee is updated successfully"
     # get updated employee details
    And match res contains { name : #(res.name)}








    
    
    
    
    
    
    
    