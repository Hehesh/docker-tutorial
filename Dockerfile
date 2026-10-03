FROM ubuntu:16.04

LABEL maintainer="Brayden Chien"

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        python2.7 \
        python2.7-dev \
        python-pip \
        python-setuptools && \
    rm -rf /var/lib/apt/lists/*


COPY requirements.txt /app/requirements.txt

WORKDIR /app

RUN python2.7 -m pip install -r requirements.txt

COPY . /app

ENTRYPOINT ["python2.7"]

CMD ["app.py"]
