#!/bin/bash 
pwd
cd cloud-native-tour-repo
cd fortune-teller-dotnet/src/AspDotNetCore/Fortune-Teller-UI/ 
dotnet restore --configfile ../../../nuget.config
dotnet publish -o publish  -f net462 -r win10-x64  

mv publish ../../../../../build/ 
