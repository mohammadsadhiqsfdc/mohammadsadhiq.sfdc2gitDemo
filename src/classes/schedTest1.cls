@isTest
public class schedTest1 {

    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
    public testMethod static void schedTestMeth1(){
        
        Test.startTest();
        
        String jobId = System.schedule('schedTest1jobName', CRON_EXP, new s1());
        
        CronTrigger ct = [SELECT id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId ];
        
        System.assertEquals(0, ct.TimesTriggered);
        System.assertEquals(CRON_EXP, ct.CronExpression);
        System.assertEquals('2022-03-15 00:00:00',String.valueOf(ct.NextFireTime));
        
        List<Account> accList = [SELECT id FROM Account WHERE Name = 'Sample Schedulable Batch Account'];
        System.assertEquals(0,accList.size());
        
        Test.stopTest();
        
        List<Account> accList1 = [SELECT id FROM Account WHERE Name = 'Sample Schedulable Batch Account'];
        System.assertEquals(1,accList1.size());
    }
}