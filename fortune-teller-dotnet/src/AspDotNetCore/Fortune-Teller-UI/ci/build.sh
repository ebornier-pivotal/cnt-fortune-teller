#!/bin/bash 
pwd
cd cloud-native-tour-repo
cd fortune-teller-dotnet/src/AspDotNetCore/Fortune-Teller-UI/ 
dotnet restore --configfile ../../../nuget.config
dotnet publish -o publish  -f netcoreapp1.1 -r ubuntu.14.04-x64

mv publish ../../build/
