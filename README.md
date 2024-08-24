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



Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

## Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
