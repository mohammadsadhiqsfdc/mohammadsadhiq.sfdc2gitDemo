@isTest
public class restAPI1Utility {

    public static RestRequest setRestRequest(String uri1, String meth1, String paramName, String paramValue, Boolean isParam){
        
        RestRequest req = new RestRequest();
        if(isParam){
            
            req.requestURI = uri1;
            req.addParameter(paramName, paramValue);
            
        }else{
            
            req.requestURI = uri1 + '/' + paramValue;
            
        }            
            
        req.httpMethod = meth1;
       
        return req;
    }
    
    public static RestRequest setRestRequestPOST(String uri1, String meth1, String nameValue, String phoneValue, String bilingCityValue){
        
        RestRequest req = new RestRequest();
        String jsonStr;
        req.requestURI = uri1;
        jsonStr = '{\"name\":\"'+nameValue+'\",\"phone\":\"'+phoneValue+'\",\"BillingCity\":\"'+bilingCityValue+'\"}';
        System.debug('jsonStr --> ' + jsonStr);
        req.requestBody = Blob.valueOf(jsonStr);
        req.httpMethod = meth1;
        
        return req;
    }
}