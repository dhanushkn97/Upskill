trigger ContactSubscriptionTriogger on Contact (after insert, after update, before update, before insert) {
   try{
    if(trigger.isAfter && trigger.isUpdate){
        Set<Id> accId = new Set<Id>();
        for(Contact con: trigger.new){
        
            accId.add(con.AccountId);
        }
        list<Subscription__c> SubsList = [Select Id, Account__c,Number_of_Interactions__c,Number_of_subs__c From Subscription__c where Account__c IN: accId];
        list<Subscription__c> SubsListupdate = new List<Subscription__c>();
        List<Subscription__c> subsListInsert = new list<Subscription__c>();
        Map<Id,Subscription__c> accSubMap = new Map<Id,Subscription__c>();
        list<Account> AccountUpdate = new list<Account>();

        for(Subscription__c sub: SubsList){
            accSubMap.put(sub.Account__c, sub);
        }

        map<Id,Integer> contactmap = new map<Id,Integer>();
        list<AggregateResult> aggrresult = [Select accountId ,Sub_Status__c, COUNT(Id)totalContact From Contact 
                        Where Sub_Status__c ='Subscribed' AND accountId IN: accId GROUP BY accountId,Sub_Status__c];

        for(AggregateResult aggr : aggrresult){
            contactmap.put((Id)aggr.get('accountId'), Integer.valueOf(aggr.get('totalContact')));

        
        }
 System.debug('Aggregate Result map----> '+ contactmap);
        for(Contact con: trigger.new){
            
        
                if(con.Sub_Status__c =='Subscribed'){
                    System.debug('Status Changed '+ con.Sub_Status__c);
                    if(accSubMap.containsKey(con.AccountId)){
                       Subscription__c subtoUp = accSubMap.get(con.AccountId);
                       subtoUp.Number_of_subs__c = contactmap.get(con.AccountId);
                       subtoUp.Number_of_Interactions__c = (Integer)(Math.random() * 6);
                       SubsListupdate.add(subtoUp);
                      System.debug('Status New '+ subtoUp);
                    }else{
                         Subscription__c sub = new Subscription__c();
                        sub.Account__c = con.AccountId;
                        sub.Number_of_subs__c = contactmap.get(con.AccountId);
                        sub.Number_of_Interactions__c = (Integer)(Math.random() * 6);
                        SubsListinsert.add(sub);
                         System.debug('Status New insert '+ sub);
                    }
                   Account accupdate = new Account(Id = con.AccountId, Last_subscribe_Date__c = System.today());
                   AccountUpdate.add(accupdate);
                }
            
        }

        
        if(SubsListinsert.size() > 0){
            insert SubsListinsert;
        }
        if(AccountUpdate.size() > 0){
            update AccountUpdate;
        }

        if(SubsListupdate.size() > 0){
            update SubsListupdate;
        }
    }
   }catch(exception e){
    system.debug('exception e '+e.getMessage());
    system.debug('exception e '+e.getLineNumber());
   
   }
}