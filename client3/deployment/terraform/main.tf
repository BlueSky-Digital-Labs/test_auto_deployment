# Create an ECS cluster
resource "aws_ecs_cluster" "app_cluster" {
  name = var.ecs_cluster_name
}

# Create an ECS task definition
resource "aws_ecs_task_definition" "django_task" {
  family                = "django-task"
  container_definitions = <<DEFINITION
[
  {
    "name": "django-container",
    "image": "your-django-image-url",
    "memory": 512,
    "cpu": 256,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 8000,
        "hostPort": 8000
      }
    ]
  }
]
DEFINITION
  network_mode = "bridge"
}

resource "aws_ecs_service" "django_service" {
  name            = "django-service"
  cluster         = aws_ecs_cluster.app_cluster.id
  task_definition = aws_ecs_task_definition.django_task.arn
  desired_count   = 1
  launch_type     = "EC2"
}