trigger subscriptionRiskTrigger on Subscription__c (after update) {

    if(trigger.isAfter && trigger.isUpdate){
        list<FeedItem> postList = new List<FeedItem>();
       for(Subscription__c sub: trigger.new){
        System.debug('Sub detail--- > '+ sub);
           if(sub.Risk__c != trigger.oldMap.get(sub.Id).Risk__c){
             System.debug('Sub Risk--- > '+ sub.Risk__c);
              Messaging.SingleEmailMessage  mail = new Messaging.SingleEmailMessage();
              String[] toAddresses = new String[] {'dhanushkn97@gmail.com'};
              mail.setToAddresses(toAddresses);
              mail.setReplyTo('dhanushbabu829@gmail.com');
              String risk;
              String body;
              if(sub.Risk__c == 'Medium Risk'){
                risk = sub.Risk__c;
                body ='Your account`s Subscription is about to end in 1 month please check back after one month and subsribe';
              }else if(sub.Risk__c == 'High Risk'){
                risk = sub.Risk__c;
                body ='Your account`s Subscription is about to end in some days please check and subsribe';
              }else{
                 risk = sub.Risk__c;
                body ='Thanks for susbscribing enjoy our service';
              
              }
              mail.setSubject('Subscription is at '+ risk + '  SubName: '+ sub.Name);
              mail.setPlainTextBody(sub.Account__r.Name + body);
             if(risk == 'High Risk' || risk == 'Medium Risk')
              Messaging.sendEmail(new Messaging.SingleEmailMessage[]{ mail});
 System.debug('After Messaging--- > ');
            
         FeedItem post = new FeedItem();
         post.ParentId =  sub.Account__c;
         post.Body = body;
         post.Title = 'Notification from sales representative';
        // post.Type = 'TrackedChange';
         postList.add(post);
           }
       }
       insert postList;
       System.debug('After postFeed--- > '+ postList);
            
    }

}