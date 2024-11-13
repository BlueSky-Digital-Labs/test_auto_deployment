# Initialize Django project
# django-admin startproject backend
# cd backend
# python manage.py startapp api
# cd ..

# # Initialize React project
# npx create-react-app frontend

# # Start the Docker containers
# docker-compose up --build

# Authenticate Docker to the ECR registry
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 128363281216.dkr.ecr.us-west-2.amazonaws.com

# Tag and push Django image
# docker build -t my-django-app .
docker tag prototype-backend:latest 128363281216.dkr.ecr.ap-southeast-2.amazonaws.com/my-django-app:latest
docker push 128363281216.dkr.ecr.ap-southeast-2.amazonaws.com/my-django-app:latest

# Tag and push React image
# docker build -t my-react-app .
docker tag prototype-frontend:latest 128363281216.dkr.ecr.ap-southeast-2.amazonaws.com/my-react-app:latest
docker push 128363281216.dkr.ecr.ap-southeast-2.amazonaws.com/my-react-app:latest