FROM ubuntu:22.04

ENV POD_STATUS $pod_status

RUN apt-get update && apt-get install -y \
    python3.9 \
    python3-pip

COPY ./src ./src
COPY ./requirements.txt .

RUN pip install -r requirements.txt

CMD [ "python3", "./src/list_pods.py" ]


