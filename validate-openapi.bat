@echo off
setlocal

echo Validating OpenAPI specification...
openapi-generator-cli validate -i openapi\v1\spec.yaml
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Validation failed. Fix errors before proceeding.
    exit /b 1
)
echo [SUCCESS] Validation successful.

echo ----------------------------------------
echo Running dry-run for code generation...
echo ----------------------------------------

:: Dry-run Go server generation
echo [INFO] Dry-running Go server generation...
openapi-generator-cli generate -g go-gin-server -i openapi\v1\spec.yaml --dry-run
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Go server dry-run failed.
    exit /b 1
)
echo [SUCCESS] Go server dry-run passed.

:: Dry-run TypeScript client generation
echo [INFO] Dry-running TypeScript client generation...
openapi-generator-cli generate -g typescript-axios -i openapi\v1\spec.yaml --dry-run
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] TypeScript client dry-run failed.
    exit /b 1
)
echo [SUCCESS] TypeScript client dry-run passed.

:: Dry-run Kotlin client generation
echo [INFO] Dry-running Kotlin client generation...
openapi-generator-cli generate -g kotlin -i openapi\v1\spec.yaml --dry-run
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Kotlin client dry-run failed.
    exit /b 1
)
echo [SUCCESS] Kotlin client dry-run passed.

echo ----------------------------------------
echo [SUCCESS] Dry-run complete. No files were generated.
exit /b 0
