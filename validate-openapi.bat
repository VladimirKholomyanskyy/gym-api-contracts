@echo off
echo Validating OpenAPI Specification...
openapi-generator-cli validate -i openapi\v1\spec.yaml
if %errorlevel% neq 0 (
    echo OpenAPI validation failed!
    exit /b %errorlevel%
)
echo OpenAPI validation passed!
