public class accPageContr {

    public List<Account> lstA { get; set; }
    
    public accPageContr (){
    
        lstA = [select id,Name,phone from Account ];
    
    }
}