## Karate Accelerator Component

>### Karate is a relatively new open source framework for testing Web services. Even though Karate is in Java, its main value proposition is that testers don’t need to do any Java programming in order to write fully automated tests. Instead, testers use a Gherkin-like language with steps for making requests and validating responses. It’s like Cucumber with out-of-the-box Web API steps.

<br />

### Folder structure
- In Karate, we write test cases in ".feature" file and it should be created under src\test\java\<folder>
- Test data should be kept under the folders \src\test\java\examples\data\ in individual folder as per the environment.
- Common utility files can be found under utils folder

### Dependencies
-   Java version 1.8
-   Maven version 3.6.1
-   Junit 5
-   Cucumber Reporting 4.8.0
-	Karate Version 0.9.5
-   mysql (Optional)


### Prerequisite

#### To get the test api running
- Open cmd and run the below command to start api on your local
-  java -jar demo-0.0.1-SNAPSHOT.jar

<br />

### Configuration

- The solution is based on maven and we install the dependencies using pom.xml
- DbUtils files under examples/utils folder, allows you to create a DB connection and get data from DB
- Currently, pom.xml has dependency for MySQL added, you can change it as per your need.
- database.feature under examples/users/feature, show a sample code for connecting the database and getting data.
- test data and SQL credentials are provided using .json files under examples/data/dev folder
- To run the databse.feature, please remove ignore tag.

### Running Tests

##### Execution from IDE

To execute the tests from IDE,
-   Right click on UserRunner.java and run

##### Execution from Command line

- ##### Execute all tests :  
mvn test -Dtest=UsersRunner -Dkarate.options="--tags ~@ignore"

- ##### Execute specific scenario:  
mvn test -Dtest=UsersRunner -Dkarate.options="--tags @createNewEmployeeUsingFakerData" 

- ##### Execute scenarios on particular environment:
mvn test -Dtest=UsersRunner -Dkarate.options="--tags ~@ignore" -DargLine="-Dkarate.env=<env>" 

### Test Reports

Test reports are saved in location:
target/cucumber-html-reports
