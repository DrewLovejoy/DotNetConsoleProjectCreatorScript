[CmdletBinding(DefaultParametersetName='None')] 
param (
    [string] $SolutionName,
    [string] $ProjectName = $SolutionName,
    [bool] $CreateMsTestProject = $False
)

function flowerBoxText($textToInsert, $textColor="Yellow")
{
	Write-Host "*****************************************************************************" -ForegroundColor $textColor
	indentedText $textToInsert $textColor
	Write-Host "*****************************************************************************" -ForegroundColor $textColor
}

function indentedText($textToInsert, $textColor="Yellow")
{
	Write-Host "**** $textToInsert" -ForegroundColor $textColor
}

clear

flowerBoxText "Creating the solution folder."
New-Item -ItemType Directory -Name $SolutionName
flowerBoxText "Successfully created the solution folder."

flowerBoxText "Changing the current location to inside the solution folder. SolutionName=[$SolutionName]"
Set-Location -Path ".\$SolutionName"
flowerBoxText "Successfully changed the current location to inside the solution folder."

flowerBoxText "Creating the solution."
dotnet new sln
flowerBoxText "Successfully created the solution."

flowerBoxText "Creating the project folder."
New-Item -ItemType Directory -Name $ProjectName
flowerBoxText "Successfully created the project folder."

flowerBoxText "Changing the current location to inside the project folder."
Set-Location -Path ".\$ProjectName"
flowerBoxText "Successfully changed the current location to inside the project folder."

flowerBoxText "Creating the project."
dotnet new console
flowerBoxText "Successfully created the project."

flowerBoxText "Changing the current location to inside the solution folder."
Set-Location -Path '.\..'
flowerBoxText "Changing the current location to inside the solution folder."

flowerBoxText "Linking the project to the solution."
dotnet sln "$SolutionName.sln" add ".\$ProjectName"
flowerBoxText "Successfully linked the project to the solution."

if($CreateMsTestProject)
{    
    flowerBoxText "Creating the mstest project folder."
    New-Item -ItemType Directory -Name "$ProjectName.Tests"
    flowerBoxText "Successfully created the mstest project folder."

    flowerBoxText "Changing the current location to inside the mstest project folder."
    Set-Location -Path ".\$ProjectName.Tests"
    flowerBoxText "Successfully changed the current location to inside the mstest project folder."

    flowerBoxText "Creating the mstest project folder."
    dotnet new mstest
    flowerBoxText "Successfully created the mstest project folder."

    flowerBoxText "Changing the current location to inside the solution folder."
    Set-Location -Path '.\..'
    flowerBoxText "Successfully changed the current location to inside the solution folder."

    flowerBoxText "Linking the mstest project to the solution."
    dotnet sln "$SolutionName.sln" add ".\$ProjectName.Tests"
    flowerBoxText "Successfully linked the mstest project to the solution."
}

flowerBoxText "Starting up the solution."
start "$SolutionName.sln"
flowerBoxText "Successfully starting up the solution."

flowerBoxText "Resetting the current location back to the original location before running the script."
Set-Location -Path '.\..'
flowerBoxText "Successfully resetted the current location back to the original location before running the script."