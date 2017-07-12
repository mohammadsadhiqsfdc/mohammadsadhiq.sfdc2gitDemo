public class contactTriggHelper {

    public static void locHelper(set<id> accIds){
        
        List<Account> lstA = [SELECT id,name,List_of_Contacts__c,(select id,Lastname from contacts) from Account where id in :accIds];
        
        for(Account a: lstA){
            a.List_of_Contacts__c = '';
            for(Contact c: a.contacts){
                if(a.List_of_Contacts__c == '')
                	a.List_of_Contacts__c = c.LastName;
                else
                    a.List_of_Contacts__c += ',' + c.LastName;
                

            }
        }
        
        if(lstA.size()>0)
            update lstA;
        
    }
}