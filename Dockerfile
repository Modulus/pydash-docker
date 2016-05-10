FROM ubuntu:14.04

RUN apt-get update && apt-get -y install git python python-pip apache2 libapache2-mod-wsgi

RUN mkdir -p ./code/pydash
RUN git clone https://github.com/k3oni/pydash.git /var/www/apps/pydash 

ADD pydash.conf /etc/apache2/sites-enabled/pydash.conf

WORKDIR /var/www/apps/pydash/

RUN pip install -r requirements.txt

RUN python manage.py syncdb --noinput

RUN echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'admin@example.com', 'admin')" | python manage.py shell

CMD ["python", "manage.py", "runserver","0.0.0.0:80"]

#CMD service apache2 start;/usr/bin/tail -f /dev/null

