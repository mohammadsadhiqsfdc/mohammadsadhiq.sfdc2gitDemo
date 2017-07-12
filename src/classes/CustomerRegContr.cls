public class CustomerRegContr {

    public PageReference doSave() {
    
        insert objC;
        
        return (new pagereference('/apex/CustRegVF').setredirect(true));
    }

    
    public Contact objC{get;set;}
    
    public CustomerRegContr (){
    
        objC = new Contact();
    
    }
}