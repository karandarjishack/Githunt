#!/bin/bash
#Githunt written by hackergautam


#Dependecies Installation
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest #nuclei 
wget --no-check-certificate "https://raw.githubusercontent.com/ayadim/nuclei-templates/main/file/secrets-in-files.yaml" #matchers

echo "Enter Target:"
read target && mkdir -p $target && cd $target  && curl -sk --insecure --path-as-is "https://api.github.com/orgs/$target/repos" | grep '"url":'|grep 'repos' | sed 's/"url": "//;s/repos//;s/api.//; s/",//' | while read host do;do git clone $host;done && nuclei -target ./ -t secrets-in-file.yaml

