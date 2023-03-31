@echo off

echo -----------------------------

echo Test Running [AD OU Create] - Create
cd ad-ou-create
copy ..\credentials\terraform.tfvars /y > nul
terraform init -no-color > ..\ad-ou-create-result.txt
terraform apply -auto-approve -no-color >> ..\ad-ou-create-result.txt
echo Test Running [AD OU Create] - Destroy
terraform destroy -auto-approve -no-color >> ..\ad-ou-create-result.txt
cd ..

echo Test Running [AD OU List #1]
cd ad-ou-list-1
copy ..\credentials\terraform.tfvars /y > nul
terraform init -no-color > ..\ad-ou-list-1-result.txt
terraform apply -auto-approve -no-color >> ..\ad-ou-list-1-result.txt
cd ..

echo Test Running [AD OU List #2]
cd ad-ou-list-2
copy ..\credentials\terraform.tfvars /y > nul
terraform init -no-color > ..\ad-ou-list-2-result.txt
terraform apply -auto-approve -no-color >> ..\ad-ou-list-2-result.txt
terraform destroy -auto-approve -no-color >> ..\ad-ou-list-2-result.txt
cd ..

echo -----------------------------

pause
