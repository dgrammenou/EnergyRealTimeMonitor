FROM python:3.8 

WORKDIR /app 

COPY . .

RUN pip install -r requirements.txt

RUN ls 

ENTRYPOINT [ "python" ]
CMD ["scheduler.py"]

