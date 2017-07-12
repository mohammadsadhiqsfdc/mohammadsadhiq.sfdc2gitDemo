public class custRegVFContr1Ext {

    public List<Account> accList{get;set;}
    public custRegVFContr1Ext(custRegVFContr1 controller) {
    
        accList = [SELECT ID,NAME,PHONE FROM ACCOUNT LIMIT 10];

    }

}