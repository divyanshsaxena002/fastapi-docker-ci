# Use Ubuntu as base image
FROM ubuntu:latest

# Install Python and dependencies
RUN apt update && apt install -y python3 python3-pip python3-venv

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Create a virtual environment
RUN python3 -m venv venv

# Activate virtual environment and install dependencies
RUN . venv/bin/activate && pip install -r requirements.txt

# Expose port 8000
EXPOSE 8000

# Run FastAPI app
CMD ["venv/bin/python", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
