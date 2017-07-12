public class ContactSearch {

    public static List<Contact> searchForContacts(String lName,String zipcode){
        
        List<Contact> conLst = [SELECT ID,NAME, MailingPostalCode FROM CONTACT WHERE LASTNAME = :lName and MailingPostalCode = :zipcode];
        
        return conLst;
        
    } 
}