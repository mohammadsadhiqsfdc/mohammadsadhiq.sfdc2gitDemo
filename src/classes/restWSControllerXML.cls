public class restWSControllerXML {

    public restWSControllerXML(){
    
        // Build Response 
        
        HttpRequest httpReq = new HttpRequest();
        httpReq.setEndpoint(Label.contactsXMLEndPointURL);
        httpReq.setMethod('GET');
        
        Http http = new Http();
        HttpResponse resp = http.send(httpReq);
        String strResp = resp.getBody();
        
        System.debug('Rest XML Respone --> ' + strResp);

        Dom.Document doc = new dom.Document();
        doc.load(strResp);
        
        Dom.XmlNode rootNode = doc.getRootElement();
        
        System.debug('rootNode  -->' + rootNode);
        System.debug('rootNode.getText()  -->' + rootNode.getText());
        
        pizzaWrap obj;
        listWrap = new List<pizzaWrap>();
        
//         List<Dom.XmlNode> childNodes = rootNode.getChildElements();
        for(Dom.XmlNode childNodes : rootNode.getChildElements()){
            
        	System.debug('childNodes -->' + childNodes);
			System.debug('childNodes.getText() --> ' + childNodes.getText());    
            
            obj = new pizzaWrap();
            for(Dom.XmlNode childNodes1 : childNodes.getChildElements()){
                System.debug('childNodes1 -->' + childNodes1);
                System.debug('childNodes1.getName() --> ' + childNodes1.getName());                    
                System.debug('childNodes1.getText() --> ' + childNodes1.getText());    
                
                if(childNodes1.getName() == 'id'){
                    obj.pizzaId = childNodes1.getText();
                }
                
                if(childNodes1.getName() == 'name'){
                    obj.pizzaName = childNodes1.getText();
                }
                
                if(childNodes1.getName() == 'cost'){
                    obj.pizzaCost = childNodes1.getText();
                }
                
                if(childNodes1.getName() == 'description'){
                    obj.pizzaDesc = childNodes1.getText();
                }
                

            }
            
            listWrap.add(obj);
        }

        
        
/*        
        // Json Parsing
        
        JSONParser parser;
        
// get the list of cont ID's
		parser = JSON.createParser(strResp);
        List<String> contIdList = new List<String>();
        while (parser.nextToken() != null) {
//        	System.debug('contIdList while loop --> parser.getCurrentToken()' + parser.getCurrentToken());
//        	System.debug('contIdList while loop --> parser.getCurrentName()' + parser.getCurrentName());
//        	System.debug('contIdList while loop --> parser.getText()' + parser.getText());
            
              if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText() == 'Id'){ 
//                  	System.debug('Inside the contId Loop -->');
//                  	System.debug('current Token Value is -->' + parser.getText());
                  	parser.nextToken();
//                    System.debug('current Next Token Value is -->' + parser.getText());
                    // Get the value
                	contIdList.add(parser.getText());
            	}
        }
//        System.debug('contIdList -->' + contIdList);
        Set<String> contIdset = new Set<String> ();
        for(Contact c:[select id,Name,contId__c from contact where contId__c IN :contIdList]){
            
            contIdset.add(c.ContId__c);
        }
        
        
// get the list of contName
		parser = JSON.createParser(strResp);
        List<String> contNameList = new List<String>();
        while (parser.nextToken() != null) {
              if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText() == 'name'){ 
                    // Get the value
                    parser.nextToken();
                	contNameList.add(parser.getText());
            	}
        }

// get the list of contName
		parser = JSON.createParser(strResp);
        List<String> contEmailList = new List<String>();
        while (parser.nextToken() != null) {
              if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText() == 'email'){ 
                    // Get the value
                    parser.nextToken();
                	contEmailList.add(parser.getText());
            	}
        }        
// get the list of contAddress
		parser = JSON.createParser(strResp);
        List<String> contAddressList = new List<String>();
        while (parser.nextToken() != null) {
              if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText() == 'address'){ 
                    // Get the value
                    parser.nextToken();
                	contAddressList.add(parser.getText());
            	}
        }

// get the list of contGender
		parser = JSON.createParser(strResp);
        List<String> contGenderList = new List<String>();
        while (parser.nextToken() != null) {
              if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText() == 'gender'){ 
                    // Get the value
                    parser.nextToken();
                	contGenderList.add(parser.getText());
            	}
        }        
        
// get the list of contGender
		parser = JSON.createParser(strResp);
        List<String> contMobileList = new List<String>();
        while (parser.nextToken() != null) {
              if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText() == 'mobile'){ 
                    // Get the value
                    parser.nextToken();
                	contMobileList.add(parser.getText());
            	}
        }        

        contactsWrap obj;
        listWrap = new List<contactsWrap>();
        Integer i;
        
        System.debug('contIdset -->' + contIdset);
            
        for(i=0;i<contIdList.size();i++){
            if(!contIdset.contains(contIdList[i])){
                obj = new contactsWrap();
                obj.contId = contIdList[i];
                obj.contName = contNameList[i];
                obj.contEmail = contEmailList[i];
                obj.contAddress = contAddressList[i];
                obj.contGender = contGenderList[i];
                obj.contMobile = contMobileList[i];                
				listWrap.add(obj);                            
            }
        }
*/        

    }

    public PageReference doSave(){
 
/*        
        List<Contact> contactList = new List<Contact>();
        Contact c;
        System.debug('listWrap --> ' + listWrap);
        for(contactsWrap obj: listWrap){

            if (obj.isSelected){
            	c = new Contact();                
                c.ContId__c = obj.contId;
                c.LastName = obj.contName;
                c.Email = obj.contEmail;
                c.MailingStreet = obj.contAddress;
                c.Gender__c = obj.contGender;
                c.Phone = obj.contGender;
                contactList.add(c);
            }
            
        }
        
        WSLog__c wsl = new WSLog__c();
        
        if(contactList.size()> 0){
            try{
            	insert contactList; 
        		
                wsl.ServiceName__c = 'restWSController';
                wsl.Status__c = 'Success';
                wsl.ErrorMsg__c = 'Success in inserting Contacts';
                wsl.createTimeStamp__c = System.now();
                
                insert wsl;
        		return (new PageReference('/apex/restWSControllerVF').setRedirect(true));
            }catch(Exception e){
                wsl.ServiceName__c = 'restWSController';
                wsl.Status__c = 'Failure';
                wsl.ErrorMsg__c = e.getMessage();
                wsl.createTimeStamp__c = System.now();
                
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.FATAL,wsl.ErrorMsg__c,'details can be found'));
                
                insert wsl;
                
                return null;
            }

        }
*/
		return null;
    }
    
    public List<pizzaWrap> listWrap{set;get;}
    public class pizzaWrap{

        public Boolean isSelected {set;get;}
        public String pizzaId {set;get;}
        public String pizzaName {set;get;}
        public String pizzaCost {set;get;}
        public String pizzaDesc {set;get;}
   
    }
}