public with sharing class AccountUpdateTriggerHandler {
    public static void contactTypeUpdate(list<Account>AccList, Map<id,Account>newMap, Map<Id,Account>oldMap) {
        try{
            set<Id> AccIdset = new set<Id>();
            for(Account acc:AccList){
                if(acc.Type != oldMap.get(acc.Id).Type){
                    AccIdset.add(acc.Id);
                }
            }
            list<Contact> conlist = new list<Contact>();
            if(AccIdset.size() > 0)
            conlist = [Select Id,Name, AccountId From Contact Where AccountId IN: AccIdset];// Now Extract all contacts with AccIds.

            list<Contact> contactUpdate = new list<Contact>();
            if(!conlist.isEmpty()){
               for(Contact con: conlist){
                    Account acct = newMap.get(con.AccountId);
                    if(acct.Type != oldMap.get(con.AccountId).Type){//check if the account type field is upodated only then update contactupdate List
                    con.Account_type__c = acct.Type;
                    contactUpdate.add(con);
                    }
               }
               if(!contactUpdate.isEmpty())
               Update contactUpdate; // check for contcatupdate list is empty then update the list
            }
        }catch(exception e){
            system.debug('Error Message--->'+e.getMessage()+e.getLineNumber());
        }
    }
}