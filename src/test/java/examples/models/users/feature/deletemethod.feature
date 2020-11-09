Feature: Delete Employee method

  @deleteEmployee @ignore
  Scenario: Delete employee by id
    Given param id = idParam
    * url BaseUrl +'/employee/delete?id=id'
    When method delete
    Then status 200
    Then print 'Response is : ', response

















