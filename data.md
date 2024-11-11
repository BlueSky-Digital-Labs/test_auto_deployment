{
    "repository": {
        "repositoryArn": "arn:aws:ecr:ap-southeast-2:128363281216:repository/my-django-app",
        "registryId": "128363281216",
        "repositoryName": "my-django-app",
        "repositoryUri": "128363281216.dkr.ecr.ap-southeast-2.amazonaws.com/my-django-app",
        "createdAt": "2024-11-11T16:28:30.925000+05:00",
        "imageTagMutability": "MUTABLE",
        "imageScanningConfiguration": {
            "scanOnPush": false
        },
        "encryptionConfiguration": {
            "encryptionType": "AES256"
        }
    }
}

{
    "repository": {
        "repositoryArn": "arn:aws:ecr:ap-southeast-2:128363281216:repository/my-react-app",
        "registryId": "128363281216",
        "repositoryName": "my-react-app",
        "repositoryUri": "128363281216.dkr.ecr.ap-southeast-2.amazonaws.com/my-react-app",
        "createdAt": "2024-11-11T16:31:04.525000+05:00",
        "imageTagMutability": "MUTABLE",
        "imageScanningConfiguration": {
            "scanOnPush": false
        },
        "encryptionConfiguration": {
            "encryptionType": "AES256"


# Authenticate Docker to the ECR registry
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 128363281216.dkr.ecr.us-west-2.amazonaws.com

# Tag and push Django image
docker build -t my-django-app .
docker tag my-django-app:latest 128363281216.dkr.ecr.us-west-2.amazonaws.com/my-django-app:latest
docker push 128363281216.dkr.ecr.us-west-2.amazonaws.com/my-django-app:latest

# Tag and push React image
docker build -t my-react-app .
docker tag my-react-app:latest 128363281216.dkr.ecr.us-west-2.amazonaws.com/my-react-app:latest
docker push 128363281216.dkr.ecr.us-west-2.amazonaws.com/my-react-app:latest