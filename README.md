# DotNetConsoleProjectCreatorScript

## Overview
* * *
This is a PowerShell script that uses "dotnet" commands to create a console template project. MSTest can be built with it as well, but it's optional.

## Prerequisites
Make sure to have Powershell installed. For more information, start here: https://docs.microsoft.com/en-us/powershell/scripting/install/installing-windows-powershell?view=powershell-6
* * *

## Things You Should Know:
* * *

- There are three switches altogether for this script: ([string] SolutionName, [string] ProjectName, and [bool] CreateMsTestProject).
- The SolutionName is REQUIRED, but the ProjectName is optional. If you leave the ProjectName off then the solution and project will share the same name.
- CreateMsTestProject is optional. If you do end up using this switch, it will create a second project using the mstest template. It will use what ProjectName is set to with .Tests added to it. For example, "ProjectTest.Tests".
- The CreateMsTestProject switch is set to $False by default. You have to use the switch with $true for it to work properly.

## Deployment
* * * 

1. Open Powershell.
2. Change the Directory to point to the location of the script.
3. Run the script by typing in the name of the script and then the switches.
  For example, .\BuildExampleSolution.ps1 -SolutionName TestSolution -ProjectName TestProject -CreateMsTestProject $true
