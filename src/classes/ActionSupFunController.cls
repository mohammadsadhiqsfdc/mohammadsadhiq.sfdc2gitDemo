Public with sharing class ActionSupFunController {

    public String Display_This_Param2 { get; set; }

    public String Display_This_Param1 { get; set; }

    public String Display_This_Param { get; set; }
    
Public string Display_This_String{get;set;}

    Public ActionSupFunController (){
     Display_This_String = 'value set in constructor';
     Display_This_Param1 = 'param1 set in constructor';
     Display_This_Param2 = 'param2 set in constructor';
    }
    
    Public void actionFunMethod(){
    
        System.debug('Inside the actionFunMethod');
        
       
      Display_This_String = 'value set in action function method';
           String str2 = ApexPages.currentPage().getParameters().get('param2');
           
      System.debug('param2+++' + str2 );
      Display_This_Param2 = str2;
      Display_This_Param1 = 'param1 set in constructor';

    }
    
    Public void actionSupMethod(){
      Display_This_String = 'value set in action Support method';
      String str = ApexPages.currentPage().getParameters().get('param1');
      Display_This_Param1 = str;
//           Display_This_Param = 'param set in action Support method';
    Display_This_Param2 = 'param2 set in constructor';
    }
}