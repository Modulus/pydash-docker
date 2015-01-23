FROM ubuntu:14.04

RUN apt-get update && apt-get -y install python python-pip apache2

ADD ./pydash /var/www/apps/pydash

CP .pydash.conf /etc/apache2/sites-enabled

WORKDIR /var/www/apps/pydash

RUN pip install -r requirements.txt

RUN python manage.py syncdb --noinput

#CMD ["python", "manage.py", "runserver"]

CMD ["service apache2 start"]


