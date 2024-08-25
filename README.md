# Salesforce DX Upskilling by solving scenario based challanges

Now that we are started with challanges following will be list of challanges and their solution mentioned along with the file names to verify the code

## Scenario: you are working with a Salesforce organization where every Account has related Contact records. When an Account is updated, you need to automatically update a custom field on the related Contact records.

Requirements:
Trigger Name: AccountUpdateTrigger
Object: Account
Trigger Events: before update
Custom Field on Contact: Account_type__c (Type: Text)


If the Account's Account_Type__c field is updated, set the Custom_Field__c on all related Contact records to the new Account_Type__c value.

Ensure that the trigger handles bulk updates efficiently.


## Solutions:
AccountUpdateTrigger
AccountUpdateTriggerHandler
AccountUpdateTriggerHandlerTest


