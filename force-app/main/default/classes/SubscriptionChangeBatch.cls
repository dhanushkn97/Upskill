public  class SubscriptionChangeBatch implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([Select Id, Account__c, Churn_Risk__c ,Churn_Score__c,Risk__c from Subscription__c]);

    }
    public void execute(Database.BatchableContext Bc, List<Subscription__c> scope){
        List<Subscription__c> subList = new List<Subscription__c>();
        System.debug('Batch execute--- > ');
        for(Subscription__c sub : scope){
            if(sub.Churn_Score__c <= 0.40)
            sub.Risk__c = 'Low Risk';
            else if(sub.Churn_Score__c > 0.40 && sub.Churn_Score__c <= 0.60)
            sub.Risk__c = 'Medium Risk';
            else
            sub.Risk__c='High Risk';

            subList.add(sub);
            System.debug('Batch subList--- > '+ subList);
        }
        if(!subList.isEmpty())
        Database.update(subList);
    }
     public void finish(Database.BatchableContext BC) {
      System.debug('BatchJob ran successfully--->');
    }
}