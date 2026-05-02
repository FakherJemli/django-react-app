# Generated Dockerfile — Django (Python 3.11)
# ACTION REQUIRED: replace 'myproject' with your actual Django project name
FROM python:3.11-slim
WORKDIR /app
COPY requirements*.txt ./
RUN pip install --no-cache-dir -r requirements.txt gunicorn
COPY . .
EXPOSE 8000
CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "2"]
