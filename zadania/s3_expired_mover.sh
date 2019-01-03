#!/bin/bash

if [[ -z "$1" ]] ; then
        echo "Nie podano nazwy aplikacji"
        exit 1;
else
        service="/$1"
fi

### Config (-ish)
BASEDIR="/tmp/s3-mover"
CREDENTIALS="nagios4dcos:Ooxahhei7xi7"
CURL_OPT="-s -S -k -u $CREDENTIALS -X GET"
DEPLOY_URL="https://deploy.dcos.aws.avantis.pl:8080/v2/apps"
DATE=$(date +%F)
GZIP="$1-"$(date -d today +%F)".tar.gz"
###

mkdir -p $BASEDIR
cd $BASEDIR

printf "### Downloading JSON"
if [ "$service" != "/marathon-lb" -a "$service" != "/marathon-slack" -a "$service" != "/logstash-front" ]; then
        curl $CURL_OPT "$DEPLOY_URL$service"  | jq ".app | del(.storedUrls,.backoffSeconds,.backoffFactor,.maxLaunchDelaySeconds,.readinessChecks,.dependencies,.ipAddress,.version,.residency,.secrets,.portDefinitions,.requirePorts,.versionInfo,.tasksStaged,.tasksRunning,.tasksHealthy,.tasksUnhealthy,.tasks,.deployments,.fetch,.user,.executor,.user,.disk,.gpus,.container.portMappings[].labels,.healthChecks[].ignoreHttp1xx) | .ports=[0] | .container.portMappings[].servicePort=0 | .instances=0 | if (.env.GFSVOL==\"/testVol1\") then del(.env.GFSVOL,.env.GFS_MOUNT_POINT,.env.GFSOPTS,.env.GFSSRV) else . end" > $BASEDIR/$service.json
        printf " ... downloaded\n"
else
        echo "Invalid app"
        exit 1;
fi

APP_URL=$(jq -r '.env.APP_URL' $BASEDIR/$service.json)
APP_TYPE=$(jq -r '.labels.APP_TYPE' $BASEDIR/$service.json)
ARTIFACTID=$(jq -r '.id' $BASEDIR/$service.json)

printf "### Downloading artifact from Nexus"
if [[ $APP_URL == *"redirect?r="* ]]; then
        REDIR=$(curl -sk -u "dv-artifact-repository-reader:4Qd%X8mcT5q4@5yE" -w '%{redirect_url}' -o /dev/null $APP_URL)
        curl -skLO "$REDIR"
else
        curl -skLO "$APP_URL"
fi
if [[ `echo $?` == 0 ]] ; then
        printf " ... downloaded\n"
else
        printf " ... FAILED!\n"
        exit 1
fi

URL_EXP=$(echo "s3://dv-is-expired/dcos/$APP_TYPE/$GZIP")
tar -cz --remove-files -f $GZIP *
aws s3 cp --sse aws:kms $GZIP $URL_EXP
if [[ `echo $?` == 0 ]] ; then
        echo -e "### Aplikacja zarchiwizowana w:\n$URL_EXP"
        rm $GZIP
        exit 0
else
        echo "!!! Błąd przy wysyłaniu paczki do S3  | Paczka znajduje się w $BASEDIR/$GZIP"
        exit 1
fi
