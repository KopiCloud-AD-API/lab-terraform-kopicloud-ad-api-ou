@echo off
cls
echo Clean Up Logs
del /q ad*.txt

echo -----------------------------

echo AD Computer Create
del /q "ad-ou-create\.terraform.lock.hcl"
del /q "ad-ou-create\terraform.tfstate.*"
rmdir /s /q "ad-ou-create\.terraform"

echo AD Computer List #1
del /q "ad-ou-list-1\.terraform.lock.hcl"
del /q "ad-ou-list-1\terraform.tfstate.*"
rmdir /s /q "ad-ou-list-1\.terraform"

echo AD Computer List #2
del /q "ad-ou-list-2\.terraform.lock.hcl"
del /q "ad-ou-list-2\terraform.tfstate.*"
rmdir /s /q "ad-ou-list-2\.terraform"

echo -----------------------------

pause
