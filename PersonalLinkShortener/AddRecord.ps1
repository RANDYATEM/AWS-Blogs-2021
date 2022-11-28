. .\Settings.ps1

aws dynamodb put-item --table-name ocktalink --item file://record.txt --region $region_name --profile $profile_name
