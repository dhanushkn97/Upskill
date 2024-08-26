Salesforce Churn Risk Prediction Challenge

This branch contains code examples and resources related to a challenge focused on predicting customer churn risk within Salesforce.

Scenario:

A company selling software subscriptions wants to proactively identify and address customers at risk of churning.

Challenge:

Implement a solution to track customer churn, calculate a churn risk score based on various factors, and automatically send alerts to sales representatives when a customer's risk level reaches a certain threshold.

Key Technologies:

Salesforce Apex: For building custom logic and triggers.

Salesforce Formulas: For calculating fields and scores.

Salesforce Objects: For storing and managing data related to subscriptions, accounts, and customer engagement.

Batch Apex: For efficiently processing large volumes of subscription data.

Code Examples:

ContactSubscriptionTrigger.apex: A trigger that creates or updates Subscription records based on changes to Contact records.

SubscriptionChangeBatch.apex: A Batch Apex class that calculates the churn risk score for Subscription records.

subscriptionRiskTrigger.apex: A trigger that sends email alerts and updates Account feeds when the churn risk level changes.

Learning Objectives:

Gain experience using Salesforce Apex triggers to manage data and automate processes.

Understand how to leverage formulas for calculating custom fields and scores.

Learn about batch processing techniques using Batch Apex to handle large datasets.

Explore methods for sending email alerts and updating Account feeds.

Instructions:

Clone the Repository: Clone this repository to your local machine using Git.

Review the Code: Examine the code examples and understand how they contribute to the churn prediction solution.

Experiment: Modify the code and experiment with different approaches to enhance the functionality.

Share Your Solution: Feel free to share your solution and learnings in the community.

Note: This challenge focuses on demonstrating key concepts and techniques related to Salesforce development. It is not intended to be a complete production-ready solution.

