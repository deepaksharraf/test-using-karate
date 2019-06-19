#Author: your.email@your.domain.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios
#<> (placeholder)
#""
## (Comments)
#Sample Feature Definition Template
@tag
Feature: Student Registration API Testing

  @tag1
  Scenario: Student Registration
    Given url 'http://localhost:8083/register/student'
    And request { "name": "Deepak" ,"age": "24","registrationNumber": "12345"}
    When method post
    Then status 200
    And match response == { "name": "Deepak" ,"age": 24,"registrationNumber": "12345","registrationStatus": "Successful"}

  @tag2
  Scenario: Student Registration
    Given url 'http://localhost:8083/register/student'
    And request { "name": "Golden" ,"age": "12","registrationNumber": "34567"}
    When method post
    Then status 200
    And match response == { "name": "Golden" ,"age": 12,"registrationNumber": "34567","registrationStatus": "Successful"}
    
    @tag3
  Scenario: Student Registration
    Given url 'http://localhost:8083/register/student'
    And request { "name": "Abcdef" ,"age": "43","registrationNumber": "78909"}
    When method post
    Then status 200
    And match response == { "name": "Abcdef" ,"age": 43,"registrationNumber": "78909","registrationStatus": "Successful"}
    