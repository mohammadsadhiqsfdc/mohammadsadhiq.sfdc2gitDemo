global class customerSearchWS {
    
    webservice static List<wrapInner1> searchCustomer(String sCity){
        
        wrapInner1 objW1;
        List<wrapInner1> lstW1 = new List<wrapInner1>();
        
        WSLog__c objL = new WSLog__c();
        objL.createTimeStamp__c = System.now();
        objL.ServiceName__c = 'customerSearchWS';
        
        for(Account a:[SELECT id,name,phone,billingcity from Account WHERE billingcity = :sCity]){
            objW1 = new wrapInner1();
        	objW1.name1 = a.name;
            objW1.phone1 = a.phone;
            objW1.city1 = a.BillingCity;
            lstW1.add(objW1);
        }
        
        if(lstW1.size() > 0){
        	objL.ErrorMsg__c = 'Records Found for ' + sCity;
            objL.Status__c = 'Success';
            insert objL;
            System.debug('Afte insert in size>0 -->' + objL );
            return lstW1;   
            
        }else{
            
            objL.ErrorMsg__c = 'Records NOT Found for ' + sCity;
            objL.Status__c = 'Failure';
        	insert objL;
            System.debug('Afte insert in size<=0 -->' + objL );
            return NULL;
        }
            
        
            
     	
    }

    global class wrapInner1{
        
        webservice String name1;
        webservice String phone1;
        webservice String city1;
    }
    
}