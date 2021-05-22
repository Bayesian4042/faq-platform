FROM ubuntu:18.04


RUN apt-get update && apt-get install -y python3.6 && apt-get install -y python3-pip


RUN pip3 install --upgrade pip
RUN pip install bert-serving-server
RUN pip3 install tensorflow==1.15
RUN pip3 install -U bert-serving-server[http]

RUN mkdir /app


COPY ./entrypoint.sh /app
COPY ./model/uncased_L-2_H-128_A-2 /app

WORKDIR /app

RUN chmod 777 /app/entrypoint.sh

EXPOSE 8125 

ENTRYPOINT ["/app/entrypoint.sh"]
