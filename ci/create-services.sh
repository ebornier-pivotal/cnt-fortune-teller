#!/bin/bash 
export
cf delete-service -f cnt-service-registry
cf create-service p-service-registry standard cnt-service-registry
