global class b1 implements Database.Batchable<sobject>{

    public final String q1;
    public final String s1;
    public final String f1;
    public final String fv1;
    
    public b1(String q, String s, String f, String fv){
    
        q1=q;
        s1=s;
        f1=f;
        fv1=fv;
    }
            
    public Database.QueryLocator start(Database.BatchableContext BC){
    
        return Database.getQueryLocator(q1);
    
    }            
            
    public void execute(Database.BatchableContext BC, List<sObject> bl){
    
        for(sObject so:bl){
            so.put(f1,fv1);
        }
        
        update bl;
    
    }
    
    public void finish(Database.BatchableContext BC){
    
    
    
    }        

}