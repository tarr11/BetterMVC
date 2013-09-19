[T4Scaffolding.Scaffolder(Description = "Enter a description of Action here")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false,
	[string]$Action,
	[string]$Controller,
	[string]$Model,
	[string]$ServiceMethod
)

$outputPath = "Controllers\" + $Controller + "\" + $Action  # The filename extension will be added based on the template's <#@ Output Extension="..." #> directive
$namespace = (Get-Project $Project).Properties.Item("DefaultNamespace").Value

if ($Model)
{
	$datamodel = Get-ProjectType $Model
	$resultModelName = $namespace + "Services.Master" + $ServiceMethod + "Result"
	$resultModel = Get-ProjectType $resultModelName
	Add-ProjectItemViaTemplate $outputPath -Template ActionTemplate `
		-Model @{ Namespace = $namespace; Controller= $Controller; Action = $Action; DataModel = [MarshalByRefObject]$datamodel; resultModel=[MarshalByRefObject]$resultModel; } `
		-SuccessMessage "Added Action output at {0}" `
		-TemplateFolders $TemplateFolders -Project $Project -CodeLanguage $CodeLanguage -Force:$Force

	$testPath = "Controllers\" + $Controller + "\" + $Action + "Tests"  # The filename extension will be added based on the template's <#@ Output Extension="..." #> directive
	$testProject = $namespace + ".Test"
	Add-ProjectItemViaTemplate $testPath -Template ActionTestTemplate `
		-Model @{ Namespace = $namespace; Controller= $Controller; Action = $Action; DataModel = $datamodel; resultModel=$resultModel; } `
		-SuccessMessage "Added ActionTest output at {0}" `
		-TemplateFolders $TemplateFolders -Project $testProject -CodeLanguage $CodeLanguage -Force:$Force
}
else
{
	Add-ProjectItemViaTemplate $outputPath -Template ActionTemplate `
		-Model @{ Namespace = $namespace; Controller= $Controller; Action = $Action; } `
		-SuccessMessage "Added Action output at {0}" `
		-TemplateFolders $TemplateFolders -Project $Project -CodeLanguage $CodeLanguage -Force:$Force

	$testPath = "Controllers\" + $Controller + "\" + $Action + "Tests"  # The filename extension will be added based on the template's <#@ Output Extension="..." #> directive
	$testProject = $namespace + ".Test"
	Add-ProjectItemViaTemplate $testPath -Template ActionTestTemplate `
		-Model @{ Namespace = $namespace; Controller= $Controller; Action = $Action; } `
		-SuccessMessage "Added ActionTest output at {0}" `
		-TemplateFolders $TemplateFolders -Project $testProject -CodeLanguage $CodeLanguage -Force:$Force

}
