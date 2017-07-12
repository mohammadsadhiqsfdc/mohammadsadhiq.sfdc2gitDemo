public class userVFContr {

    public String imgUrl { get; set; }

    public Boolean pb1Sw { get; set; }

    public PageReference displayPic() {
    
        pb1Sw = true;
        imgURL = 'https://c.na35.content.force.com/profilephoto/72941000000gCMg/T';
        
       	User sUser = [Select id,FirstName, LastName, SmallPhotoUrl from User where id = :selectedUser];
        imgURL = sUser.SmallPhotoUrl;
        return null;
    }


    public List<SelectOption> listUsers { get; set; }

    public Id selectedUser { get; set; }
    

    public userVFContr (){
        
        pb1Sw = false;
        listUsers =  new List<SelectOption>();
        listUsers.add(new SelectOption('','--Select--'));   
        

        for(User u1: [Select id,FirstName, LastName, SmallPhotoUrl from User]){
            
            String name1 = u1.FirstName + '' + u1.LastName;

            listUsers.add(new SelectOption(u1.id , name1));   

        }
    }
}