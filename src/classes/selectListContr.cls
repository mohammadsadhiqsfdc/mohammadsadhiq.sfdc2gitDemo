public class selectListContr {


    public PageReference assign() {
        this.selected1 = selected;
       
       system.debug('selected ++' + selected );
       system.debug('selected1 ++' + selected1 );
       
        return null;
    }


    public String selected { get; set; }
    public String selected1 { 
    
    get{
    
        if(selected1 == null ){ 
        return 'NONE'; 
        }else return selected1;
    
    } 
    
    set; 
    }
    public List<selectOption> mylist;

    public String selectedValue1 { 
    
     get{
    
        if(selectedValue1 == null ){ 
        return 'NONE'; 
        }else return selectedValue1 ;
        }
        set; 
    }



    public List<selectOption> getOptValues() {
    
        mylist = new List<selectOption>();
    
        mylist.add(new selectOption('abc','123'));
        mylist.add(new selectOption('def','456'));
        
        return mylist;
    }


   


}