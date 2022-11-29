# PersonalLinkShortener

#SERVERLESS URL-SHORTENER

Although several Url shortener such as tiny.cc, bit.ly etc already exist, having your own custom URL shortener is always handy when you want to share longer URLs(for example urls gotten from s3 buckets), and with Serverless, building and deploying applications has never been so easy, simple and quick.

See below image of the architecture designed for this project

<img width="885" alt="Screen Shot 2022-11-27 at 18 19 14" src="https://user-images.githubusercontent.com/100156088/204341459-ce12fd4c-7832-40b9-a159-30c14e88567b.png">

The application architecture uses AWS Lambda, Amazon API Gateway, Amazon DynamoDB, Route53, IAM,  and AWS ACM.


The following services will be used to create a URL Shortener:

* AWS API Gateway: ( /create: to create a shortened url and /t/{id} to redirect to long url)
* AWS IAM: (Role and Policy for Permissions to call DynamoDB from Lambda)
* AWS Lambda: (Application Logic)
* AWS DynamoDB: (Persistent Store to save our Data)
* AWS ACM: (Optional: Certificate for your Domain)
* AWS Route53: (Optional: DNS for the domain that you want to associate to your API)

The flow will be like the following:

POST Request gets made to the /create request path with the long_url data in the payload
This data is then used by the Lambda function to create a short url and create a entry in DynamoDB
In DynamoDB the entry is created with the short id as the hash key and the long url as one of the attributes
The response to the client will be the short url
When a GET method is performed on the id eg /t/{short_id}, a lookup gets done on the DynamoDB table, retrieves the long url from the table
A 301 redirect gets performed on API Gateway and the client gets redirected to the intended url
