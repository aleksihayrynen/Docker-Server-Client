FROM python:3.11-slim

WORKDIR /app
COPY server.py .

RUN mkdir /serverdata
VOLUME ["/serverdata"]

EXPOSE 5000
CMD ["python"  ,"server.py"]

