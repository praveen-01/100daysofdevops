FROM python:3.8-slim

COPY src/requirements.txt .

RUN pip install -r requirements.txt

COPY src/server.py .

EXPOSE 5003

CMD ["python3","server.py"]