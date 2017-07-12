public class accTriggHelper {
    
    public static void accTriggHelperMeth1(List<Account> lstA){
        System.debug('Trigger context trigger.isExecuting --> ' + trigger.isExecuting);
        
        If(trigger.isExecuting){
            List<Contact> lstC = new List<Contact>();        
            for(Account a: lstA){
                
                Contact c = new Contact();
                c.LastName = a.Name;
                c.Phone = a.Phone;
                c.AccountId = a.Id;
                lstC.add(c);
            }
            
            if(lstC.size()>0){
                
                contactStaticHelper.isflag = false;
                insert lstC;
                
            }   
            
        }

    }

}