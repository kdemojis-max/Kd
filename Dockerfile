FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    BOT_DATA_DIR=/data

WORKDIR /app

COPY requirements.txt ./
RUN python -m pip install --no-cache-dir -r requirements.txt \
    && mkdir -p /data

COPY main.py ./

# Mount the existing folder containing bot.db, users.json and redeem.txt here.
VOLUME ["/data"]

# Optional HTTP health endpoint already provided by main.py.
EXPOSE 8080

CMD ["python", "main.py"]
