@isTest
public class queueTest1 {
	
    @isTest
    static void queueTestMeth1(){
        
      
        Test.startTest();
        System.enqueueJob(new q1());
        Test.stopTest();
        
        Account a1 = [SELECT id,Name from Account where Name = 'Sample Queueable Batch Account'];

        	System.assertNotEquals(null, a1.Id);
            System.assertEquals('Sample Queueable Batch Account', a1.Name);
      
        
        
    }
}