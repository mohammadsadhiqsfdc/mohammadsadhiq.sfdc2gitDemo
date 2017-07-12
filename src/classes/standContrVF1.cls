public class standContrVF1 {

    public Apexpages.StandardSetController con;
    
    public standContrVF1(ApexPages.StandardSetController controller) {
    
        con = controller;
        con.setPageSize(5);

    }
    
    public pagereference dofirst(){
    
        return null;
    }
}