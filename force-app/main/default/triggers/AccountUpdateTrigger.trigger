trigger AccountUpdateTrigger on Account (before update) {
//Check for before and uodate condition
    if(trigger.isBefore && trigger.isUpdate){
        //call the trigger Handler
        AccountUpdateTriggerHandler.contactTypeUpdate(trigger.new,trigger.newMap,trigger.oldMap);
    }

}