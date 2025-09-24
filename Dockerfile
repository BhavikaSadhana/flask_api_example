# Use Python image
FROM python:3.10-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose the port your Flask app runs on (adjust if different)
EXPOSE 5000

# Command to run the Flask app via WSGI or directly
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "wsgi:app"]
