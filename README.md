# DevOps Training Project Tobias

A Spring Boot application designed for DevOps training with linting, testing, and CI/CD pipeline examples.

## Project Structure

- **Spring Boot 3.2.0** with Java 17
- **REST API** with simple endpoints
- **Unit Tests** using Spring Boot Test
- **Linting** with Checkstyle and SpotBugs
- **Docker** containerization
- **GitHub Actions** CI pipeline

## Quick Start

### Local Development
```bash
./mvnw spring-boot:run
```

### Docker
```bash
# Build and run with Docker Compose
docker-compose up --build

# Or build and run manually
docker build -t devops-training .
docker run -p 8080:8080 devops-training
```

### Testing
```bash
./mvnw test
```

### Linting
```bash
./mvnw checkstyle:check
./mvnw spotbugs:check
```

## API Endpoints

- `GET /api/hello` - Returns a hello message
- `GET /api/hello/{name}` - Returns a personalized hello message
- `GET /api/health` - Health check endpoint

## Training Goals

This project serves as a starting point for DevOps training. Students should:

1. **Current State**: The project builds, tests pass, and basic CI runs
2. **Add More Pipeline Steps**: Extend the GitHub Actions workflow with:
   - Security scanning
   - Code coverage reporting
   - Docker image scanning
   - Deployment stages
   - Integration testing
   - Performance testing

## GitHub Actions Workflow

The current `.github/workflows/ci.yml` includes:
- Running tests
- Code linting (Checkstyle & SpotBugs)
- Building the application
- Docker image build and basic testing

### Training Exercises

Students can extend the pipeline by adding:
- Slack/email notifications
- Publish container to Github Registry
- Add secrets / environment variables to the application

## Known Issues

The current code has intentional Checkstyle violations to demonstrate linting in action. This is perfect for training scenarios where students learn to:
1. Identify code quality issues
2. Fix linting violations
3. Understand the importance of code standards
