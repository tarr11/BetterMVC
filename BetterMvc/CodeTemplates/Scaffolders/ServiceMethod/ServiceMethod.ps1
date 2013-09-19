[T4Scaffolding.Scaffolder(Description = "Creates a new service method")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false,
	[string]$Method,
	[string]$Service

)

$outputPath = "Services\" + $Service + "\" + $Method  # The filename extension will be added based on the template's <#@ Output Extension="..." #> directive
$namespace = (Get-Project $Project).Properties.Item("DefaultNamespace").Value

if ($Method-Match "Get(.*)By(.*)")
{
	$modelName = $matches[1]
	$key = $matches[2]
}
elseif ($Method-Match "Get(.*)")
{
	$modelName = $matches[1]
	$key = ""
}
elseif ($Method-Match "Update(.*)")
{
	$modelName = $matches[1]
	$key =  ""
}
elseif ($Method-Match "Create(.*)")
{
	$modelName = $matches[1]
	$key =  ""
}
elseif ($Method-Match "Search(.*)")
{
	$modelName = $matches[1]
	$key =  ""
}
else
{
	$modelName = ""
	$key = ""
}

if ($modelName.EndsWith("s"))
{
	$modelName = "IEnumerable<" + $modelName.Substring(0, $modelName.Length - 1) + ">"
}


Add-ProjectItemViaTemplate $outputPath -Template ServiceMethodTemplate `
	-Model @{ Namespace = $namespace; Method = $Method; Service = $Service; ModelName = $modelName; Key = $key} `
	-SuccessMessage "Added ServiceFunction output at {0}" `
	-TemplateFolders $TemplateFolders -Project $Project -CodeLanguage $CodeLanguage -Force:$Force

$testPath = "Services\" + $Service + "\" + $Method + "Tests"  # The filename extension will be added based on the template's <#@ Output Extension="..." #> directive
$testProject = "SeedEquityWeb.Test"
Add-ProjectItemViaTemplate $testPath -Template ServiceMethodTestTemplate `
	-Model @{ Namespace = $namespace; Method = $Method; Service = $Service; ModelName = $modelName; Key = $key} `
	-SuccessMessage "Added ServiceMethodTest output at {0}" `
	-TemplateFolders $TemplateFolders -Project $testProject -CodeLanguage $CodeLanguage -Force:$Force