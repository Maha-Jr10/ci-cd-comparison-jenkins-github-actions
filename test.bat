@echo off
echo Running tests...
echo Test 1: Checking Jenkinsfile exists...
if exist Jenkinsfile (
    echo ✅ Jenkinsfile found
) else (
    echo ❌ Jenkinsfile missing
    exit 1
)

echo Test 2: Checking README exists...
if exist README.md (
    echo ✅ README.md found
) else (
    echo ❌ README.md missing
    exit 1
)

echo Test 3: Directory structure...
dir /B

echo ✅ All tests passed!
