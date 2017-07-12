public with sharing class accPagination2Contr {

//    public String accRecords2 { get; set; }
    public List<Account> accRecords2{get; set;}
    public accPagination2Contr (){
        
        accRecords2 = [SELECT NAME,PHONE FROM ACCOUNT LIMIT 100];
    }
}