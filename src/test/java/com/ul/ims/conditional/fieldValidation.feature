Feature: Conditional Validation

  Scenario: Valuadtion
  
  * def married = read('req1.json')
  
  * print married.children
  
  * def scenario1 = 
  """
  function(condition) {
  	if((condition == true) && (married.children != "undefined")) 
  		{	
  			return "Passed";
  		} 
  	else 
  		{
  			return "Failed";
  		}
  	}
  """
  
  * def resp = married.child == true ? true : false
  
  #* print resp

	* def temp = scenario1(resp)
	
	* print temp

  #* def resp = married.child == true ? karate.call('file1.feature') : karate.call('file2.feature')
  
  