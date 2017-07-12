@isTest
public class batchTest1 {
	
    @isTest
    static void batchTestMeth1(){
        
        List<Account> accList = new List<Account>();
        
        for(Integer i = 0; i<200; i++){
            
            Account a = new Account(Name='batchAcc'+i);
            accList.add(a);
        }
        insert accList;
        
        String q = 'SELECT Description from Account where Name Like \'batchAcc%\'';
        String s = 'Account';
		String f = 'Description';
		String v = 'EditedByBatch';
        
        Test.startTest();
        Database.executeBatch(new b1(q,s,f,v),200);
        Test.stopTest();
        
        List<Account> accList1 = [SELECT Description from Account where Id in :accList];
        for(Account a1: accList1){
            
            System.assertEquals('EditedByBatch', a1.Description);
        }
        
        
        
    }
}