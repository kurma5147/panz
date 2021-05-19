# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/dotnet/sdk:3.1.409-alpine3.13 AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY .  ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:3.1.15-alpine3.13
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "panz.dll"]
