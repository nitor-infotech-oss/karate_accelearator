
Feature: check returned employees by API
  @getAllEmployees
  Scenario Outline: get list of all employees
    Given url BaseUrl +'employee/getall'
    When method get
    Then status 200
    * match each response == { id: '#number', name: '#string', age: '#number', department: '#string' }
#    And match  $[*] contains { "id":<id>,"name":<name>,"age":<age>,"department":<department> }

    Examples:
      | read(dataPath +  "validData.csv") |

  @getEmployeeById @ignore
  Scenario: get employee from external file
    Given param id = idParam
    * url BaseUrl +'employee/getbyid?id=id'
    When method get
    Then status 200
    Then print 'response is : ', response


  @getEmployeeAll
  Scenario: get all employees
    Given url BaseUrl +'employee/getall'
    When method get
    Then status 200
    Then print response





