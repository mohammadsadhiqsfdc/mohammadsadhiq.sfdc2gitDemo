@isTest
public class restAPI1Test {
	
    @testSetup
    static void myTestSetup(){
        
        List<Account> accList = new List<Account>();
     	Account acc1 = new Account();
        acc1.Name = 'restTest';
        acc1.phone = '1234567890';
        accList.add(acc1);
        
     	Account acc2 = new Account();
        acc2.Name = 'OppAccount';
        acc2.phone = '1234567891';
        accList.add(acc2);
        
        insert accList;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'closed WON opp';
        opp.AccountId = acc2.Id;
        opp.CloseDate = System.today();
        opp.StageName = 'Closed Won';
        
        insert opp;
        
    }
    
    @isTest
    static void getAccountServiceTest1(){
        
//        RestRequest req = new RestRequest();
//        RestResponse res = new RestResponse();
        
//        req.requestURI = 'https://na35.salesforce.com/services/apexrest/restAPI1Service/restT';
//        req.httpMethod = 'GET';
        
//        RestContext.request = req;
//        RestContext.response = res;
        
  		
        RestRequest req = restAPI1Utility.setRestRequest('https://na35.salesforce.com/services/apexrest/restAPI1Service', 'GET', 'accName', 'restT', false);
        RestResponse res = new RestResponse();

        RestContext.request = req;
        RestContext.response = res;
        
        Test.startTest();
        	restAPI1.getAccountService();
        Test.stopTest();
        
        System.assertEquals(200, res.statusCode);
        
        String jsonStr = res.responseBody.toString();
        System.debug('jsonStr  -->' + jsonStr);
        String accName;
        
//        Account accTest = (Account) JSON.deserializeStrict(jsonStr, Account.class);
  		
        JSONParser parser = JSON.createParser(jsonStr);
  		
        while(Parser.nextToken() != null){
            
            if(parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText() == 'name'){
                
                parser.nextToken();
                accName = parser.getText();
            }
        }
        
        System.debug('accName -->' + accName);
        System.assertEquals('restTest',accName);
        
        
    }
        
    @isTest
    static void getAccountServiceTest2(){
        
        RestRequest req = restAPI1Utility.setRestRequest('https://na35.salesforce.com/services/apexrest/restAPI1Service', 'GET', 'accName', 'restT', true);
        RestResponse res = new RestResponse();
        
        RestContext.request = req;
        RestContext.response = res;
        
        Test.startTest();
        	restAPI1.getAccountService();
        Test.stopTest();
        
        System.assertEquals(200, res.statusCode);
        
        String jsonStr = res.responseBody.toString();
        System.debug('jsonStr  -->' + jsonStr);
        String accName;
        
//        Account accTest = (Account) JSON.deserializeStrict(jsonStr, Account.class);
  		
        JSONParser parser = JSON.createParser(jsonStr);
  		
        while(Parser.nextToken() != null){
            
            if(parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText() == 'name'){
                
                parser.nextToken();
                accName = parser.getText();
            }
        }
        
        System.debug('accName -->' + accName);
        System.assertEquals('restTest',accName);
        
        
    }
    
    @isTest
    static void getAccountServiceTest3(){
        
        RestRequest req = restAPI1Utility.setRestRequest('https://na35.salesforce.com/services/apexrest/restAPI1Service', 'GET', 'accName', 'Sadhiq', true);
        RestResponse res = new RestResponse();
        
        RestContext.request = req;
        RestContext.response = res;
        
        Test.startTest();
        	restAPI1.getAccountService();
        Test.stopTest();
        
        System.assertEquals(202, res.statusCode);
        
        String Str = res.responseBody.toString();
        System.debug('Str  -->' + Str);
        
        System.assertEquals('No Accounts exist',str);
        
        
    }
    
    @isTest
    static void AccountDelServiceTest1(){
        
        RestRequest req = restAPI1Utility.setRestRequest('https://na35.salesforce.com/services/apexrest/restAPI1Service', 'GET', 'accName', 'restT', false);
        RestResponse res = new RestResponse();
        
        RestContext.request = req;
        RestContext.response = res;
        
        Test.startTest();
        	restAPI1.AccountDelService();
        Test.stopTest();
        
        System.assertEquals(200, res.statusCode);
        
        String Str = res.responseBody.toString();
        System.debug('Str  -->' + Str);
        
        System.assertEquals('Successfully deleted',str);
        
        
    }

    @isTest
    static void AccountDelServiceTest2(){
        
        RestRequest req = restAPI1Utility.setRestRequest('https://na35.salesforce.com/services/apexrest/restAPI1Service', 'GET', 'accName', 'Sadhiq', false);
        RestResponse res = new RestResponse();
        
        RestContext.request = req;
        RestContext.response = res;
        
        Test.startTest();
        	restAPI1.AccountDelService();
        Test.stopTest();
        
        System.assertEquals(202, res.statusCode);
        
        String Str = res.responseBody.toString();
        System.debug('Str  -->' + Str);
        
        System.assertEquals('No Accounts exist',str);
        
        
    }
    
    @isTest
    static void AccountDelServiceTest3(){
        
        RestRequest req = restAPI1Utility.setRestRequest('https://na35.salesforce.com/services/apexrest/restAPI1Service', 'GET', 'accName', 'Sadhiq', true);
        RestResponse res = new RestResponse();
        
        RestContext.request = req;
        RestContext.response = res;
        
        Test.startTest();
        	restAPI1.AccountDelService();
        Test.stopTest();
        
        System.assertEquals(202, res.statusCode);
        
        String Str = res.responseBody.toString();
        System.debug('Str  -->' + Str);
        
        System.assertEquals('No Accounts exist',str);
        
        
    }      
    
    @isTest
    static void AccountDelServiceTest4(){
        
        RestRequest req = restAPI1Utility.setRestRequest('https://na35.salesforce.com/services/apexrest/restAPI1Service', 'DEL', 'accName', 'OppAccount', true);
        RestResponse res = new RestResponse();
        
        RestContext.request = req;
        RestContext.response = res;
        
        Test.startTest();
        	restAPI1.AccountDelService();
        Test.stopTest();
        
        System.assertEquals(400, res.statusCode);
        
//        String Str = res.responseBody.toString();
//        System.debug('Str  -->' + Str);
        
//        System.assertEquals('No Accounts exist',str);
        
        
    }     
    
    @isTest
    static void createAccountServiceTest1(){
        
        RestRequest req = restAPI1Utility.setRestRequestPOST('https://na35.salesforce.com/services/apexrest/restAPI1Service', 'POST', 'restT100', '00121','Bangalore');
        RestResponse res = new RestResponse();
        
        RestContext.request = req;
        RestContext.response = res;
        
        Test.startTest();
        	restAPI1.createAccountService();
        Test.stopTest();
        
        System.assertEquals(200, res.statusCode);
        
        String Str = res.responseBody.toString();
        System.debug('Str  -->' + Str);
        
        System.assertEquals('Successfully Inserted',str);
        
        
    }

    @isTest
    static void createAccountServiceTest2(){
        
        RestRequest req = restAPI1Utility.setRestRequestPOST('https://na35.salesforce.com/services/apexrest/restAPI1Service', 'POST', 'restT100', '00121','Hyderabad');
        RestResponse res = new RestResponse();
        
        RestContext.request = req;
        RestContext.response = res;
        
        Test.startTest();
        	restAPI1.createAccountService();
        Test.stopTest();
        
        System.assertEquals(400, res.statusCode);
        
        
    }      
}