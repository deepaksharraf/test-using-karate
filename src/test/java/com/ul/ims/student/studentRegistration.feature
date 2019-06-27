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

Feature: Student Registration API Testing

Background:
		* def studentRegReq = read('post-request.json')
		* def result = call studentRegReq

  Scenario: Student Registration
 
  * def responsePattern = 
  """
  {
  	name: '#string',
  	age: '#number',
  	registrationNumber: '#number',
  	registrationStatus: '##string'
  }
  """ 

 Given url 'http://10.205.7.11:8083/student/allstudent'
    When method get
    Then status 200
    * def res = response
   	* match each res == '#[] responsePattern'
 