FROM python:3.11-slim
WORKDIR /app
COPY requirements*.txt ./
RUN pip install --no-cache-dir -r requirements.txt gunicorn
COPY . .
ENV SECRET_KEY
ENV DEBUG
ENV DJANGO_ALLOWED_HOSTS
EXPOSE 8080
HEALTHCHECK CMD curl -f http://localhost:8080/health || exit 1
CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8080", "--workers", "2"]