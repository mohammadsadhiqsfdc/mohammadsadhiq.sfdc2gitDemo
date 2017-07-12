trigger accTrigg on Account (After insert, After Update, After delete) {

    if(trigger.isAfter && trigger.isInsert){

        accTriggHelper.accTriggHelperMeth1(trigger.new);
    }
    
    if(trigger.isAfter && trigger.isUpdate){
		
        Set<id> accIds= new Set<id>();
        for(Account a: trigger.new){
            if(a.Name != trigger.oldmap.get(a.Id).Name || a.phone != trigger.oldmap.get(a.Id).phone){
               accIds.add(a.id); 
            }
        }
        
        List<Account> lstA = [select id,Name,phone,(select id,LastName,phone from contacts) from account where id in :accIds];
        List<Contact> lstC = new List<Contact>();   
        for(Account a: lstA){
            for(Contact c:a.contacts){
                if(c.LastName == trigger.oldmap.get(a.id).Name){
                    c.LastName = a.Name;
                }   
                
                if(c.phone == trigger.oldmap.get(a.id).phone){
                    c.phone = a.phone;
                }  
                
                lstC.add(c);
            }
        }
        
        if(lstC.size()>0){
            
            contactStaticHelper.isflag = false;
            update lstC;
            
        }
            
    }
}