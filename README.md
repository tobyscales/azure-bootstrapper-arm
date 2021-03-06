# ARM Template Bootstrapper
Sometimes you need to run some extra commands as part of your [ARM template deployment](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authoring-templates). It might be creating a user, storing a secret, or any other random little "sidecar" action that, sure, you *could* do in a CI pipeline but wouldn't it be nicer to do it all within ARM?

Enter the ARM Template Bootstrapper. Use this code as a template, or just fork the repo and update the defaults in azuredeploy.json with your GitHub username and repo. The template automatically spins up an Azure Container Instance, pulls down your GitHub repo and runs the commands in /bootstrap/bootstrap.sh.

Optionally assign appropriate rights to the Container Instance prior to executing your script, and/or create a KeyVault to permanently store secrets generated in your sidecar. Currently supported roles are Owner, Contributor, Reader and Storage Data Owner, Storage Data Contributor and Storage Data Reader. 

Connecting to a private Git repo is possible, but it requires a bit more [configuration](https://docs.microsoft.com/en-us/azure/container-instances/container-instances-volume-gitrepo#private-git-repo-authentication).

You can try it out in your subscription here:

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Ftescales%2Fazure-bootstrapper-arm%2Fmaster%2Fazuredeploy.json" target="_blank">
<img src="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.png"/></a>

Hopefully this makes your life a bit easier!

`Tags: Azure Container Instances, Bootstrap, ARM`

[azure-container-instances]: https://docs.microsoft.com/en-us/azure/container-instances/
[azure-resource-manager]: https://docs.microsoft.com/en-us/azure/azure-resource-manager/
[azure-bootstrapper-arm]: https://github.com/tobyscales/azure-bootstrapper-arm

TODO: 
* Add support for just running an ad-hoc script (no git-mount); figure it out based on parameter set/Uri
