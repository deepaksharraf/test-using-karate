Feature: Weather Api Testing

  Scenario: Complex Schema Testing
  
  #------------------------------Regular Expression ----------------------------------
  
  * def dateTimeRegex = '#regex ^(19|2[0-9])[0-9]{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01]) (0[0-9]|1[0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])'
 # * def decimalRegex = '#regex [0-9]+(\.[0-9][0-9]?)?'
  * def alphaNumericRegex = '^[0-9A-Za-z]*$'
  
  #-----------------------------Variable Declaration-----------------------------------
  
  		* def header = {cod: '#string',message: #regex [0-9]+(\.[0-9][0-9]?)?,cnt: '#number'}
  		* def weatherPattern = [{id: '#number',main: '#string',description: '#string',icon: '#regex ^[0-9A-Za-z]*$'}]
  		* def mainPattern = {temp: '#number',temp_min: '#number',temp_max: '#number',pressure: '#number',sea_level: '#number',grnd_level: '#number',humidity: '#number',temp_kf: '#number'}         
  	#	* def mainPattern = {temp: '#regex [0-9]+(\\.[0-9][0-9]?)?',temp_min: '#regex [0-9]+(\.[0-9][0-9]?)?',temp_max: '#regex [0-9]+(\.[0-9][0-9]?)?',pressure: '#regex [0-9]+(\.[0-9][0-9]?)?',sea_level: '#regex [0-9]+(\.[0-9][0-9]?)?',grnd_level: '#regex [0-9]+(\.[0-9][0-9]?)?',humidity: '#regex [0-9]+(\.[0-9][0-9]?)?',temp_kf: '#regex [0-9]+(\.[0-9][0-9]?)?'}   
      * def cordinatePattern = {lat: '#number',lon: '#number'}
        
  #----------------------------------Pattern-------------------------------
  
 		* def responsePattern = 
  		"""
  		{
  			cod: '#string',
    		message: '#number',
    		cnt: '#number',
    		list: [
        	{
            dt: '#number',
            main: '#(mainPattern)',
            weather: '#(weatherPattern)',
            clouds: {
                all: '#number'
            },
            wind: {
                speed: '#number',
                deg: '#number'
            },
            snow: {
            		3h: '##number'
            },
            sys: {
                pod: '#string'
            },
            dt_txt: '#(dateTimeRegex)'
        }
        ],
        city: {
        id: '#number',
        name: '#string',
        coord: '#(cordinatePattern)',
        country: '#string'
    }
  }
  """ 
    * def json = read('post-req.json')
    
    #--------------------Logic------------------------------
    
    #Given url 'https://samples.openweathermap.org/data/2.5/forecast?id=524901&appid=b1b15e88fa797225412429c1c50c122a1'
    #When method get
    #Then status 200
    #* def res = response
    #* def actualRes = res
   	* match json == '#[] responsePattern'
    
