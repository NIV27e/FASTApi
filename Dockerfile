# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Metadata indicating an image maintainer
LABEL authors="oni"

# Set the working directory to /app
WORKDIR /app

# Copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

# Copy the rest of the application
COPY . /app

# Run app.py when the container launches
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
