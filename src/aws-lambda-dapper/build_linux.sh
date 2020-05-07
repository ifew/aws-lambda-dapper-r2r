#!/bin/bash

#
# SHOULD BUILD IMAGE BEFORE
# docker build -t build_linux_dotnetcore:3.1 .
#

rm -f $(pwd)/deploy.zip
rm -rf $(pwd)/bin
rm -rf $(pwd)/obj
docker run -it --rm -v $(pwd):/app build_linux_dotnetcore:3.1
chmod 777 bin/Release/netcoreapp3.1/linux-x64/publish/*
zip -j deploy.zip bin/Release/netcoreapp3.1/linux-x64/publish/*