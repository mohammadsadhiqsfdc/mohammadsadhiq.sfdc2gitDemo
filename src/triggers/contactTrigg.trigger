trigger contactTrigg on Contact (before insert,after insert,before update, after Update,after delete,before delete) {

    Set<Id> accIds = new Set<id>();
    
    if(trigger.isAfter && trigger.isInsert){
        
        System.debug('contactTrigg --> After Insert Trigger');
        
        for(Contact con: trigger.new){
            if(con.AccountId != NULL){
                accIds.add(con.AccountId);                
            }
        }
        
        contactTriggHelper.locHelper(accIds);

    }
    
    if(trigger.isAfter && trigger.isUpdate){
        
        System.debug('contactTrigg --> After Update Trigger');
        for(Contact con: trigger.new){
            if(con.AccountId != NULL && con.LastName != trigger.oldMap.get(con.Id).LastName){
                accIds.add(con.AccountId);                
            }
        }
        
        contactTriggHelper.locHelper(accIds);
        
    }
    
    if(trigger.isAfter && trigger.isDelete){
        
        System.debug('contactTrigg --> After Delete Trigger');
        for(Contact con: trigger.old){
            if(con.AccountId != NULL){
                accIds.add(con.AccountId);                
            }
        }
        
        contactTriggHelper.locHelper(accIds);
        
    }
    
    if(trigger.isBefore && trigger.isDelete){
        
        System.debug('contactTrigg --> Before Delete Trigger');
        for(Contact con: trigger.old){
            con.addError('Cant delete Contact Directly');
        }
    }
    
    if(trigger.isBefore  && trigger.isUpdate && contactStaticHelper.isflag){
        
        System.debug('contactTrigg --> Before Update Trigger');
        for(Contact con: trigger.new){
            con.LastName.addError('cant Update');
        }
    }
    
    if(trigger.isBefore  && trigger.isInsert && contactStaticHelper.isflag){
        
        System.debug('contactTrigg --> Before Insert Trigger');
        for(Contact con: trigger.new){
            if(con.Phone == NULL)
                con.phone.addError('Phone required');
        }
    }
}