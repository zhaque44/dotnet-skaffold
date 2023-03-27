# dotnet-skaffold

This project can be used as a boilerplate for developing .net core applications locally on a k8s cluster.

The Docker images are available in two flavors: debug and release.
To build them:
```shell
docker buildx build . --target debug -t dotnet-skaffold-debug
# or ...
docker buildx build . --target release -t dotnet-skaffold-release
```

To start developing with fast rebuild:
```shell
skaffold dev --port-forward
```
And open a browser on [http://127.0.0.1:8080](http://127.0.0.1:8080).
