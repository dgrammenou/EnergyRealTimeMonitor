FROM python:3.8

WORKDIR /app 

COPY . .

RUN pip install -r requirements.txt

RUN ls 

ENTRYPOINT [ "gunicorn" ]
CMD ["--bind", "0.0.0.0:6543", "--workers=2", "--access-logfile", "-", "app:app"]
EXPOSE 6543

# Run as 
# docker run -p 6543:6543 --name frontend --rm -d frontend_image