Feature: create new employee

  Background:
    * url BaseUrl

  @createEmployee @ignore
#    add proper comments / docstring for the test cases
  Scenario: create new employee and then get it and match the response with request.
    Given path '/employee/save'
    * def input = read(dataPath + 'input.json')
    * set input.id = id
    * set input.name = name
    * set input.age = age
    * set input.department = department

    And request input
    When method post
    Then status 200
    Then print 'response is : ', response

    # get created employee details
    * def idParam = input.id
    * def result = call read('getemployee.feature@getEmployeeById') { id: '#(idParam)'}
    And match result contains {  "id": '#(result.input.id)' }

