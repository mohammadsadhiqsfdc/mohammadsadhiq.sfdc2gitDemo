global class accCreationWS {

    webservice static String createAccountWS(String name1, String city1, String country1, String phone1){
        
 //       String resp = createaccCreationWS(name1,city1,country1,phone1);
        
 //   }
    
 //   public String createaccCreationWS(String name2, String city2, String country2, String phone2){
        
        String resp1;
        
        WSLog__c wsl = new WSLog__c();
        Account acc = new Account();
        
        acc.Name = name1;
        acc.Phone = phone1;
        acc.BillingCity = city1;
        acc.BillingCountry = country1;
        
        
        try{
            
            insert acc;
            
            wsl.ServiceName__c = 'accCreationWS';
            wsl.ErrorMsg__c = '';
            wsl.Status__c = 'Success';
            wsl.createTimeStamp__c = System.now();
            
            insert wsl;
            
        }catch(Exception e){
            
            wsl.ServiceName__c = 'accCreationWS';
            wsl.ErrorMsg__c = e.getMessage();
            wsl.Status__c = 'Failure';
            wsl.createTimeStamp__c = System.now();
            
            insert wsl;
            
        }
        
        resp1 = wsl.Status__c + '-->' + wsl.ErrorMsg__c;
        
        return resp1;
    }
}