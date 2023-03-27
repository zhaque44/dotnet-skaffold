# Build stage
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app
COPY dotnet-skaffold.csproj .
RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o out

# Final stage for running the app
FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS final
WORKDIR /app
COPY --from=build /app/out .
ENV ASPNETCORE_URLS=http://0.0.0.0:80
ENTRYPOINT ["dotnet", "dotnet-skaffold.dll"]