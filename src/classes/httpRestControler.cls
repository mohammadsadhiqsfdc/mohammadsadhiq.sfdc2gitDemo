public class httpRestControler {
	
    public httpRestControler(){
        
		String endPoint = Label.contactsEndPointURL;
    	HttpRequest httpReq = new HttpRequest();
    	httpReq.setEndpoint(endPoint);
        httpReq.setMethod('GET');
        
        Http http = new Http();
        HttpResponse httpResp = http.send(httpReq);
        
        String str = httpResp.getBody();
        
        System.debug(' JSonresp --> ' + str);
    
    
    }
    
}