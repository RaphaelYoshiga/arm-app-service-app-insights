#
#  This PowerShell script shows how to create a sample traffic manager profile from the accompanying template.
#  As DNS names need to be unique, please edit azuredeploy.parameters.json and replace the values marked with '#####'
#

# parameters 
$resourceGroup = "test-group"

Import-Module AzureRM.Resources

#  login, you can comment so it stops asking for your credentials
#Login-AzureRmAccount

$scriptDir = Split-Path $MyInvocation.MyCommand.Path

#If you just want to ensure the syntax is correct you can
Test-AzureRmResourceGroupDeployment -Verbose -ResourceGroupName $resourceGroup -TemplateFile "$scriptDir\azuredeploy.json" -TemplateParameterFile "$scriptDir\azuredeploy.parameters.json"

# create the resource from the template - pass names as parameters
New-AzureRmResourceGroup -Location "northeurope" -Name $resourceGroup
New-AzureRmResourceGroupDeployment -Verbose -Force -ResourceGroupName $resourceGroup -TemplateFile "$scriptDir\azuredeploy.json" -TemplateParameterFile "$scriptDir\azuredeploy.parameters.json"


