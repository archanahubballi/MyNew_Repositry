# Use the Official python image from the Docker Hub
From  python:3.9-slim

# set the working directory in the container
WORKDIR /app

# Copy the application code ito the container
COPY app.py .

# Expose the port the app run on
EXPOSE 8000

# Command to run the application
CMD ["python","app.py"]