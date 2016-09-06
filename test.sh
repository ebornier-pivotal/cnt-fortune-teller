while [[ $(cf service cnt-service-registry | grep Status)  == *"progress"* ]]
do
  echo "Registry creation in progress";
done
