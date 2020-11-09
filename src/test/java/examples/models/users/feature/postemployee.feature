Feature: create new employee

  @createEmployee
  Scenario: create new employee and then get it and match the response with request.
    Given  url BaseUrl +'employee/save'
    * def input = read(dataPath + 'input.json')
    And request input
    When method post
    Then status 200
    Then print 'response is : ', response

    #get created employee details
    * def idParam = input.id
    * def result = call read('getemployee.feature@getEmployeeById') { id: '#(idParam)'}
    And match result contains {  "id": '#(result.input.id)' }


  @createNewEmployeeUsingFakerData
  Scenario: create new employee using Faker data
    Given  url BaseUrl +'employee/save'
    * def fakerData =
        """
            function(args) {
              var Faker = Java.type('com.github.javafaker.Faker');
              var faker = new Faker();
              var id = faker.random().nextInt(500);
              var name = faker.name().firstName();
              var age = faker.random().nextInt(100);
              var department = faker.name().fullName();
              var jsonObj = {
              "id": id,
              "name": name,
              "age": age,
              "department": department
               }
            return jsonObj;
            }
        """
    * def result = call fakerData
    * print result

    And request result
    When method post
    Then status 200
    Then print '---Response---: ' ,response
