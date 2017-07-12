@RestResource(urlMapping='/restAPI1Service/*')
global with sharing class restAPI1 {

    @HttpGET
    global static void getAccountService(){
        
        List<Account> accts;
		RestRequest req = RestContext.request;
        RestResponse resp = RestContext.response;
        
//		System.debug('RestContext -->' + RestContext);
        System.debug('RestRequest -->' + req);
        System.debug('RestResponse -->' + resp);
        
        System.debug('RestRequest Headers-->' + req.headers);
        System.debug('RestRequest params-->' + req.params);
        
        String name;
        String reqURI;
            
        if(req.params.isEmpty()){
            reqURI = req.requestURI;
            System.debug('requestURI-->' + req.requestURI);
            name = reqURI.substring(reqURI.lastIndexOf('/')+1);
			name.trim();                                    
            System.debug('name1 --> ' + name);
        }else{
            name = req.params.get('accName');
            System.debug('name2 --> ' + name);
        }
        
        System.debug('name3 --> ' + name);
        name += '%';
        name = name.reverse();
        name += '%';
        name = name.reverse();
        
        System.debug('name4 --> ' + name);
        
        accts = [select Id,Name from Account where Name like :name];
        
        System.debug('accts -->' + accts);
        
        
        if(accts.size() > 0){
            String jsonresp = JSON.serialize(accts);
            RestContext.response.statusCode = 200;
            RestContext.response.responseBody = Blob.valueOf(jsonresp);
        }else{
            RestContext.response.statusCode = 202;
            RestContext.response.responseBody = Blob.valueOf('No Accounts exist');
        }
//        return accts;
    }
    
    @HttpDELETE
    global static void AccountDelService(){
        
        List<Account> accts;
		RestRequest req = RestContext.request;
        RestResponse resp = RestContext.response;
        
        String name;
        String reqURI;
            
        if(req.params.isEmpty()){
            reqURI = req.requestURI;
            System.debug('requestURI-->' + req.requestURI);
            name = reqURI.substring(reqURI.lastIndexOf('/')+1);
			name.trim();                                    
            System.debug('name1 --> ' + name);
        }else{
            name = req.params.get('accName');
            System.debug('name2 --> ' + name);
        }
        
        System.debug('name3 --> ' + name);
        name += '%';
        name = name.reverse();
        name += '%';
        name = name.reverse();
        
        System.debug('name4 --> ' + name);
        
        accts = [select Id,Name from Account where Name like :name];
        
        System.debug('accts -->' + accts);
        
        String strResp;
        Integer status1;
        
        if(accts.size() > 0){
            try{
                delete accts;
                
                status1 = 200;
                strResp = 'Successfully deleted';
            }catch(Exception e){
                status1 = 400;
                strResp = e.getMessage();
            }

        }else{
            status1 = 202;
            strResp = 'No Accounts exist';
        }
        
        RestContext.response.statusCode = status1;
        RestContext.response.responseBody = Blob.valueOf(strResp);
    }

    @HttpPOST
    global static void createAccountService(){
        
		RestRequest req = RestContext.request;
        RestResponse resp = RestContext.response;
        
        String reqStr = req.requestBody.toString();
        
        System.debug('RestRequest -->' + req);
        System.debug('RestResponse -->' + resp);
        
        System.debug('RestRequest Headers-->' + req.headers);
        System.debug('RestRequest params-->' + req.params);
	    System.debug('req.requestBody-->' + req.requestBody);
        System.debug('reqStr-->' + reqStr);
//       	System.debug('reqBlobtoString-->' + reqBlob.toString());

        
//        String name;
//        String reqURI;
/*            
        if(req.params.isEmpty()){
            reqURI = req.requestURI;
            System.debug('requestURI-->' + req.requestURI);
            name = reqURI.substring(reqURI.lastIndexOf('/')+1);
			name.trim();                                    
            System.debug('name1 --> ' + name);
        }else{
            name = req.params.get('accName');
            System.debug('name2 --> ' + name);
        }
        
        System.debug('name3 --> ' + name);
        name += '%';
        name = name.reverse();
        name += '%';
        name = name.reverse();
        
        System.debug('name4 --> ' + name);
        
        accts = [select Id,Name from Account where Name like :name];
        
        System.debug('accts -->' + accts);
  */
        
        Account acc = (Account)JSON.deserializeStrict(reqStr, Account.class);
//        acc.Name = name1;
//        acc.Phone = phone1;
        
        String strResp;
        Integer status1;
        
        try{
            Insert acc;
            
            status1 = 200;
            strResp = 'Successfully Inserted';
        }catch(Exception e){
            status1 = 400;
            strResp = e.getMessage();
        }

       
        RestContext.response.statusCode = status1;
        RestContext.response.responseBody = Blob.valueOf(strResp);
    }    
}