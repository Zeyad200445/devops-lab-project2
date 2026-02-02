# Base Image: Lightweight Python
FROM python:3.9-slim

# Set working directory inside container
WORKDIR /app

# Copy dependencies first (Caching layer)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app
COPY . .

# Expose the port
EXPOSE 5000

# Command to run the app
CMD ["python", "main.py"]