# Use a Python 3.10 slim base image
FROM python:3.10-slim

# Set the working directory inside the container
WORKDIR /app

# Copy only the requirements.txt first to leverage Docker cache
COPY requirements.txt /app/

# Install the required libraries from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code (including app.py) into the container
COPY . /app/

# Expose the port for Streamlit (default is 8501)
EXPOSE 8501

# Expose the port for Jupyter Notebook (default is 8888)
EXPOSE 8888

# Command to run Streamlit app (ensure app.py is in the current directory)
CMD ["streamlit", "run", "app.py"]
