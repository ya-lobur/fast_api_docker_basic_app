FROM python:3.10.2-alpine

WORKDIR /app

RUN  \
    apk update && \
    apk upgrade && \
    apk add build-base && \
    apk add bash && \
    pip install --upgrade pip

COPY ./requirements.txt .

RUN  python3 -m pip install -r /app/requirements.txt --no-cache-dir

COPY ./app /app

CMD gunicorn main:app  --bind 0.0.0.0:8000 --worker-class uvicorn.workers.UvicornWorker