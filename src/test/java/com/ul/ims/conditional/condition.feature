Feature: Conditional Json Testing

  Scenario: Validation according to the condition
  
  * def jsonArray =
  """
  {
  	name: "Deepak",
  	age: 25,
  	department: "CSE",
  	rank: 3
  }
  """
  
  #* def function =
  #"""
  #fun(json)
  #{
  #	if(json.age > 18) {
  #		return {name: "abcd",age: 25,department: "CSE",rank: 3,category: "Adult"};
  #	}
  #}
  #"""
  
  
  
 # * match jsonArray.rank == 2
 # * eval if(jsonArray.rank == 2) jsonArray.name = "Other"
  * def output = (jsonArray.rank == 2) ? jsonArray.name = "Other" : jsonArray.name = "abcd"
 # * set jsonArray.name = "Other"
  * match jsonArray == {name: "abcd",age: 25,department: "CSE",rank: 3}
  
  #-------------------------------------------------------------------------------------
  
  * def married = read('req1.json')
  * def unmarried = read('req2.json')
  
  #* eval if(married.child == false) ? married.children == '#present' : married.children == '#notpresent'
  #
  #* def res = (married.child == false) ? (married.children) == '#present' : (married.children) == '#notpresent'
  
  #* def res = married.child == false
  #* eval if(unmarried.child == false);
  #Then match res == true
  #And match married.children == '#present'
 
  * def res = married.child == true ? true : false
  
  When match res == true
  Then match married.children == '#present'
  
  
  
  
  #----------------------------------------------------------------------------------
  When match married.child == true
  Then match married.children == '#present'
  
  
  
  #------------------------------------------------------------
  
  #* def field = {present: false, notPresent: false}
  #
  #* def res = married.child == true ? field.present = true : field.notPresent = true
  #
 #	When field.present = true
 #	Then match married.children == '#present'
 #	And field.present = false
 #	
 #	When field.notPresent = true
 #	Then match married.children == '#notpresent'
 #	And field.notPresent = false
  
  
  #------------------------------------------------------------------
  
  * def res = married.child == true ? true : false
  
  When assert res = true
  Then match married.children == '#present'
  
  When assert res = false
  Then match married.children == '#notpresent'
  
    
