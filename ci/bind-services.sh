#!/bin/bash 
export
cf login -u $CF_USERNAME -p $CF_PASSWORD -a $CF_API -o $CF_ORGANIZATION -s $CF_SPACE --skip-ssl-validation
cf bind-service cnt-fortune-teller-fortune-service cnt-service-registry
cf bind-service cnt-fortune-teller-ui cnt-service-registry
