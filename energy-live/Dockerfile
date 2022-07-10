# syntax=docker/dockerfile:1

FROM python:3.8

WORKDIR /app
COPY . .

RUN pip install -r requirements.txt

ENTRYPOINT [ "gunicorn" ]
CMD ["--bind", "0.0.0.0:6543", "--workers=2", "--access-logfile", "-", "app:app"]

# Run as 
# docker run -p 8080:8080 --name test --rm -v /mnt/AEBA35E3BA35A8AB/Super-Market-App/backend/databases2:/app/databases/ -d supermarket
# docker run -p 8080:8080 -v /mnt/AEBA35E3BA35A8AB/Super-Market-App/backend/:/app --rm -d --name supermarket_image supermarket