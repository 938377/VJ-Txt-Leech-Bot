FROM python:3.10.8-slim-buster

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libffi-dev \
    musl-dev \
    ffmpeg \
    aria2 \
    python3-pip \
 && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /app/
WORKDIR /app/

# Install Python dependencies
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt

# Run both Gunicorn and Python script
CMD gunicorn app:app & python3 main.py
