public class acccontr {

    public PageReference AccSave1() {
    
        update acc;
        
        return null;
    }

    
    public Account acc;
 
    public acccontr (){
    
        acc = [select id,name,phone from Account where id =: apexpages.currentpage().getparameters().get('id')];
    
    } 

    
        public Account getAcc1() {
    
        return acc;
    }
    
}

/// Updated in Force.com IDE

/// Updated in mohammadsadhiq.sfdc org

/// Updated in mohammadsadhiq.sfdc org for server synch