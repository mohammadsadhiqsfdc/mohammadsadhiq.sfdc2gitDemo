/*** Controller ***/
public class exampleCon {

//    public String state2 { get; set; }
    String uname;

    public String getUsername() {
        return uname;
    }
            
    public PageReference sayHello() {
        uname = UserInfo.getName();
        return null;
    }
            
    public void setState(String n) {
        state = n;
    }
            
    public String getState() {
        return state;
    }

    public void setState2(String n) {
        state2 = n;
    }
            
    public String getState2() {
        return state2;
    }
                
    public PageReference methodOne() {
    
     String  firstparam = ApexPages.currentPage().getParameters().get('firstparam');
     String  secondparam = ApexPages.currentPage().getParameters().get('secondparam');
     
     state = firstparam;
     
     System.debug('firstparam ++' + firstparam );
     System.debug('secondparam ++' + secondparam );     
        return null;
    }
            
    private String state = 'no';
    private String state2 = 'no2';
}