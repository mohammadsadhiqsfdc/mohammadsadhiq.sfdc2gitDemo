Public class MyController {
Public string MyString_From_Methode{get;set;}

    public MyController(ApexPages.StandardController controller) {

    }

    public string ActionFunMethode(){
     MyString_From_Methode = 'Method called from js using Action function';
     return null;
    }
}