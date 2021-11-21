FROM python:3.9-alpine


ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . .

RUN pip install --no-cache-dir -r requirements.txt
EXPOSE $PORT

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 src/app:app
