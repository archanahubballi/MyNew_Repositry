# Use a specific version of Python as a base image
FROM python:3.9.16-slim  # Specify the patch version for consistency

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any dependencies specified in requirements.txt
# Ensure requirements.txt contains necessary packages
RUN pip install --no-cache-dir -r requirements.txt  # Remove this line if no dependencies are needed

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]  # Modify this if you need to pass arguments
