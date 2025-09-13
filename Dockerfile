FROM python:3.12

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000
EXPOSE 5001

CMD ["python3", "app.py"]  # Default app command, overridden in docker-compose if needed
