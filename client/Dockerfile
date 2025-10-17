FROM python:3.11-slim

WORKDIR /app
COPY client.py .

RUN mkdir /clientdata
VOLUME ["/clientdata"]

CMD ["python", "client.py"]
