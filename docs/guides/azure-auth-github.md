# GitHub Actions to Azure Deployment Guide

This document provides a step-by-step guide on how to configure GitHub Actions to deploy resources to Azure using Terraform. The focus is on configuring Azure App Registration, Federated Credentials, and Service Principal.

## Prerequisites

1. Azure CLI installed and configured on your local machine.
2. GitHub repository where you will store your Terraform code and GitHub Actions workflow.
3. Access to the Azure portal with permissions to create App Registrations and assign roles.

## Steps

### Step 1: Create an Azure AD App Registration

1. **Login to the Azure Portal**:
   - Go to the [Azure Portal](https://portal.azure.com/).

2. **Create an App Registration**:
   - Navigate to "Azure Active Directory" > "App registrations".
   - Click "New registration".
   - Enter a name (e.g., `GitHubActionsOIDC`).
   - Supported account types: Select "Accounts in this organizational directory only (Default Directory only - Single tenant)".
   - Redirect URI: Leave this empty for now.
   - Click "Register".

3. **Get the Application (client) ID and Directory (tenant) ID**:
   - Once registered, go to the "Overview" page of the new app registration.
   - Note down the "Application (client) ID" and "Directory (tenant) ID".

### Step 2: Configure Federated Credentials

1. **Navigate to the App Registration**:
   - Go to "Certificates & secrets" > "Federated credentials".
   - Click "Add a credential".

2. **Configure the Federated Credential**:
   - Select "GitHub Actions" as the credential type.
   - Configure the credential:
     - **Organization**: Your GitHub username or organization name.
     - **Repository**: Your repository name.
     - **Branch**: The branch you want to allow (e.g., `main`).
     - **Issuer**: `https://token.actions.githubusercontent.com`
     - **Subject identifier**: `repo:<your-github-username>/<your-repo-name>:ref:refs/heads/<branch-name>`
   - Click "Add".

### Step 3: Verify the Service Principal

1. **Check if the Service Principal Exists**:
   - Run the following command to check if the Service Principal exists:
     ```sh
     az ad sp show --id <Application (client) ID>
     ```

2. **Create the Service Principal (if it doesn't exist)**:
   - If the Service Principal does not exist, create it using the following command:
     ```sh
     az ad sp create --id <Application (client) ID>
     ```

### Step 4: Assign the Contributor Role

1. **Assign the Contributor Role**:
   - Run the following command to assign the Contributor role to the Service Principal:
     ```sh
     az role assignment create --assignee-object-id <Service Principal Object ID> --role Contributor --scope /subscriptions/<your-subscription-id> --assignee-principal-type ServicePrincipal
     ```

2. **Verify the Role Assignment**:
   - Run the following command to verify the role assignment:
     ```sh
     az role assignment list --assignee <Service Principal Object ID> --all
     ```

### Step 5: Configure GitHub Secrets

1. **Navigate to Repository Settings**:
   - Go to your GitHub repository.
   - Click on "Settings".
   - Go to "Secrets and variables" > "Actions".

2. **Add Secrets**:
   - **AZURE_CLIENT_ID**: The Application (client) ID from the Azure AD app registration.
   - **AZURE_TENANT_ID**: The Directory (tenant) ID from the Azure AD app registration.
   - **AZURE_SUBSCRIPTION_ID**: Your Azure subscription ID.
