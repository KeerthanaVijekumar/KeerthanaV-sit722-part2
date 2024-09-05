# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /book_catalog

# Copy the requirements file into the container
COPY book_catalog/requirements.txt .

# Install any dependencies specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire current directory contents into the container at /book_catalog
COPY book_catalog /book_catalog

# Command to run the application, using the dynamically assigned port by Render or Kubernetes
CMD ["uvicorn", "main:app", "--host", "0.0.0.0","--port", "8000"]
