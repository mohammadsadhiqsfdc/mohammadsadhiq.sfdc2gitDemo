global class customerRegWS {

    webservice static String newCustomer(String name, String phone, String City){
        
        String resp;
        
        Account objA = new Account();
        objA.Name = name;
        objA.Phone = phone;
        objA.BillingCity = city;
        
        WSLog__c objL = new WSLog__c();
        objL.ServiceName__c = 'customerRegWS';
        objL.createTimeStamp__c = System.now();        
        try{
        	insert objA;
			            
            objL.Status__c = 'Success';
            objL.ErrorMsg__c = '';
            
            insert objL;
           
        }catch(Exception e){
            objL.Status__c = 'Failure';
            objL.ErrorMsg__c = e.getMessage();          
            
            insert objL;
        }
		
        resp = objL.Status__c;
        
        
        
        return resp;
    }
}