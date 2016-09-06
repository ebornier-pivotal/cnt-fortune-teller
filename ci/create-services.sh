#!/bin/bash 
export
cf login -u $CF_USER -p $CF_PASSWORD -a $CF_API -org $CF_ORG -s $CF_SPACE --skip-ssl-validation
cf delete-service -f cnt-service-registry
cf create-service p-service-registry standard cnt-service-registry
