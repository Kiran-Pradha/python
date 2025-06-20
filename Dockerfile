# Use official Python image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy all project files into container
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the Flask port
EXPOSE 5000

# Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Start the app using gunicorn (preferred for production)
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:5000"]
