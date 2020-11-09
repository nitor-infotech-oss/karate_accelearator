Feature: Verify created employee deleted successfully.

  @checkDeleteEmployee
    # Create new Employee,delete it and verify whether it is present in the list of all employee or not.
  Scenario: Create new employee and delete that employee
    * def input = call read('postemployee.feature@createEmployee')

    # Delete the employee
    * def idParam = input.input.id
    * def result = call read('deletemethod.feature@deleteEmployee') { id: '#(idParam)'}

    # Check the deleted employee present or not in the list of employee
    * def result = call read('getemployee.feature@getEmployeeAll')
    And match result !contains { "id":idParam }

  @checkDeleteEmployee
   # Create employee from faker data and delete it
  Scenario: Create new employee and delete that employee from faker data
    * def input = call read('postemployee.feature@createNewEmployeeUsingFakerData')

    # Delete the employee
    * def idParam = input.result.id
    * def result = call read('deletemethod.feature@deleteEmployee') { id: '#(idParam)'}

    # Check the deleted employee present or not in the list of employee
    * def result = call read('getemployee.feature@getEmployeeAll')
    And match result !contains { "id":idParam }











