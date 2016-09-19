FROM microsoft/dotnet:1.0.0-preview2-sdk


RUN mkdir /app
WORKDIR /app
RUN dotnet new
RUN dotnet restore


CMD "bash"
