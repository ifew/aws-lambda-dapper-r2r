# Example AWS Lambda C# .NET Core 3.1 ReadyToRun with connect MySQL via Dapper

## For The First Time - Build Complier Container

**Build .NET Core 3.1 on linux container**
```
$ cd src/aws-lambda-db
$ docker build -t build_linux_dotnetcore:3.1 .
```

**Compile and Build package**
```
$ sh build_linux.sh
```

**Deploy**
```
$ dotnet lambda deploy-function {LAMBDA_FUNCTION_NAME} --package "deploy.zip" –-function-role {ROLE_NAME} --profile {PROFILE_NAME}
```

**Try to Run and Get result**
```
$ cd src/aws-lambda-db
$ aws lambda invoke --function-name {LAMBDA_FUNCTION_NAME} output.txt
```