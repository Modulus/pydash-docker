FROM ubuntu:14.04

RUN apt-get update && apt-get -y install python python-pip

ADD ./pydash /var/www/apps/pydash

WORKDIR /var/www/apps/pydash

RUN pip install -r requirements.txt

RUN python manage.py syncdb --noinput

CMD ["python", "manage.py", "runserver"]
