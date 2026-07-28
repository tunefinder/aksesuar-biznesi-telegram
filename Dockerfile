FROM python:3.12-slim

WORKDIR /app
COPY source.zip /tmp/source.zip
RUN apt-get update && apt-get install -y --no-install-recommends unzip
# Windows Compress-Archive ZIP faylini chiqaradi, ammo unzip ba'zan warning bilan 1 qaytaradi.
RUN unzip /tmp/source.zip -d /app || [ $? -eq 1 ]
RUN rm -rf /var/lib/apt/lists/* /tmp/source.zip

RUN pip install --no-cache-dir -r requirements.txt
CMD ["python", "main.py"]
