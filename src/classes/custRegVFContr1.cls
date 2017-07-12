public class custRegVFContr1 {

    public PageReference doSave() {
    
        con = new Contact();
        
        con.LastName = cName;
        con.email = cEmail;
        insert con;
        return (new pagereference('/apex/CustRegVF1').setredirect(true));
    }


    public String cEmail { get; set; }
    public String cName { get; set; }
    public Contact con;
    public custRegVFContr1(){
    
    
    } 
}