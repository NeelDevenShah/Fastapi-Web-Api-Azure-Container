# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY app/requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

# Copy the current directory contents into the container
COPY app /app

# Expose port 80
EXPOSE 80

# Run app with Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
