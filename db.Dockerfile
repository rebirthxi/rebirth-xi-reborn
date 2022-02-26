FROM mysql:5.7

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    python3 \
    python3-pip \
    && apt-get clean

RUN pip3 install --upgrade pip

ADD tools/requirements-rebirth-xi.txt ./requirements.txt

RUN pip3 install -r requirements.txt

# tool to do the updates
ADD tools/migrate.py ./migrate.py

# the imports the dbtool needs for migrations
ADD tools/migrations ./migrations
