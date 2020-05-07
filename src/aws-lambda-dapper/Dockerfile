# docker build -t build_linux_dotnetcore:3.1 .
# docker run --rm -v $(pwd):/app build_linux_dotnetcore:3.1

FROM amd64/buildpack-deps:bionic-scm

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libc6 \
        libgcc1 \
        libgssapi-krb5-2 \
        libicu60 \
        libssl1.1 \
        libstdc++6 \
        zlib1g \
        cmake \
        clang-3.9 \
        # libicu-dev \
        uuid-dev \
        libcurl4-openssl-dev \
        libkrb5-dev \
        # zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN dotnet_sdk_version=3.1.201 \
    && curl -SL --output dotnet.tar.gz https://dotnetcli.azureedge.net/dotnet/Sdk/$dotnet_sdk_version/dotnet-sdk-$dotnet_sdk_version-linux-x64.tar.gz \
    && dotnet_sha512='934bf29734776331691a4724f2174c4e9d2d1dde160f18397fd01abf0f96f2ec1bdd2874db9f0e25dce6993d527ea9c19031a0e67383fd813dcfcb9552ea0c70' \
    && echo "$dotnet_sha512 dotnet.tar.gz" | sha512sum -c - \
    && mkdir -p /usr/share/dotnet \
    && tar -ozxf dotnet.tar.gz -C /usr/share/dotnet \
    && rm dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
    # Trigger first run experience by running arbitrary cmd
    && dotnet help

# Enable detection of running in a container
ENV DOTNET_RUNNING_IN_CONTAINER=true \
    # Enable correct mode for dotnet watch (only mode supported in a container)
    DOTNET_USE_POLLING_FILE_WATCHER=true \
    # Skip extraction of XML docs - generally not useful within an image/container - helps performance
    NUGET_XMLDOC_MODE=skip

WORKDIR /app
#RUN apt-get update && apt-get install cmake clang-3.9 libicu-dev uuid-dev libcurl4-openssl-dev zlib1g-dev libkrb5-dev -y
ENTRYPOINT ["dotnet", "publish", "-c", "Release", "-r", "linux-x64"]