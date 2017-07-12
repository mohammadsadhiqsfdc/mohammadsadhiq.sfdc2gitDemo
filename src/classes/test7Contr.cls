public class test7Contr {

    public String out1 { get{
    
        String out1 = ApexPages.currentPage().getHeaders().get('True-Client-IP');
        
        if (out1 == null)
            out1 = ApexPages.currentPage().getHeaders().get('X-Salesforce-SIP');
            
        return out1 ;
    
    }
    
    set; }
    

    

}