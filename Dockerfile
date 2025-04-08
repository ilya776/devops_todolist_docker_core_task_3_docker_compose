FROM python:3.10

WORKDIR /app

COPY . /app/

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

ENTRYPOINT ["sh", "-c", "python manage.py migrate && gunicorn --bind 0.0.0.0:8080 app.wsgi:application"]
