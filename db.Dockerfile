FROM mysql:5.7

RUN apt-get update && apt-get install -y git python3 python3-pip && apt clean

RUN pip3 install --upgrade pip

ADD tools/requirements.txt ./requirements.txt

RUN pip3 install -r requirements.txt

# for doing updates
ADD sql ./sql

# tool to do the updates
ADD tools/dbtool.py ./dbtool.py

# the imports the dbtool needs for migrations
ADD tools/migrations ./migrations

# because... ugh, design choices?
ADD .git/ ./.git
