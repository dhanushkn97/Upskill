public class ScheduleSubscriptionChangeBatch implements Schedulable {
    public void execute(SchedulableContext SC) {
        // Schedule the batch job
        SubscriptionChangeBatch batchJob = new SubscriptionChangeBatch();
        Database.executeBatch(batchJob,200); // Adjust the batch size as needed
    }
}

