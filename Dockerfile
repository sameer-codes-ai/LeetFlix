# Use a base image that includes a package manager like apt
FROM python:3.12-slim

# Install necessary build dependencies
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    build-essential \
    pkg-config

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000
EXPOSE 5001

CMD ["./start.sh"]