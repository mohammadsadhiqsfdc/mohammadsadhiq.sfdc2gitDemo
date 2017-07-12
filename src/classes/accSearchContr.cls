public class accSearchContr {

    public boolean pb1Sw { get; set; }
    public List<Account> lstA { get; set; }
    public String eCity { get; set; }
    public List<SelectOption> lstC {get;set;}    
    

    public accSearchContr (){

        pb1Sw = false;
        Integer i = 0;
        Set<String> setCities = new Set<String>();
        lstC = new List<SelectOption>();
        lstC.add(new SelectOption('--None--','--None--'));
        
        List<Account> lstA = [select billingcity from account WHERE BillingCity != NULL];
        lstA.sort();
        
        for(Account a: lstA){

            if(!setCities.contains(a.billingcity)){
                i++;
                System.debug('billingcity -->' + a.billingcity);
    //          lstC.add(new SelectOption('--None--','--None--'));
                lstC.add(new SelectOption(a.BillingCity,a.BillingCity));                
                setCities.add(a.billingcity);
            }

        }
        
		
        
        System.debug('Account Size --> ' + i);
        System.debug('lstC Size --> ' + lstC.size());
    }
    
    public PageReference doSearch() {

        lstA = new List<Account> ();
        String qStr = '';
        qStr += 'SELECT id,name,phone,billingcity from Account WHERE billingcity = ';
        qStr += '\''+ eCity + '\'';
        System.debug('qStr ---> ' + qStr);
        lstA = Database.query(qStr);
        
        if(lstA.size()>0){
        
            System.debug('inside the size if');
            pb1Sw = true;
        }
        
//      return (new PageReference('/apex/accSearchVF').setredirect(true));
//          eCity = '';
          return null;
    }

}