# Use the official Python image from the Docker Hub
FROM python:3.12

# Set environment variables
# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# Set the working directory inside the container
WORKDIR /code

# Install system dependencies
RUN apt-get update \
  && apt-get -y install libpq-dev gcc \
  && apt-get clean

# Upgrade pip
RUN pip install --upgrade pip

# Copy the requirements.txt file into the container at /code
COPY requirements.txt /code/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Copy the current directory contents into the container at /code
COPY . /code/

# Run the application on port 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
