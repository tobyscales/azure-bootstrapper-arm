# ARM Template Bootstrapper
Sometimes you need to run some extra commands as part of your [ARM template deployment](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authoring-templates). It might be creating a user, storing a secret, or any other random little "sidecar" action that, sure, you *could* do in a CI pipeline but wouldn't it be nicer to do it all within ARM?

Enter the ARM Template Bootstrapper. Use this code as a template, or just fork the repo and update the defaults in azuredeploy.json with your GitHub username and repo. The template automatically spins up an Azure Container Instance, pulls down your GitHub repo and runs the commands in bootstrap.sh.

Optionally assign appropriate rights to the Container Instance prior to executing your script: currently supported roles are Owner, Contributor, Reader and Storage Data Owner, Storage Data Contributor and Storage Data Reader. 

Hopefully this makes your life easier!

Try it out in your subscription here:
[![Deploy to Azure](http://azuredeploy.net/deploybutton.svg)](https://deploy.azure.com/?repository=https://github.com/tescales/azure-bootstrapper-arm)
