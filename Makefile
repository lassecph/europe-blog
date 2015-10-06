.PHONY: docs test

env:
	virtualenv -p /usr/local/bin/python3 venv && \
	. venv/bin/activate && \
	make deps

deps:
	pip install -r app/requirements.txt

server:
	source venv/bin/activate && \
	./app/manage.py runserver

dev:
	source venv/bin/activate && \
	uwsgi --ini app/app/uwsgi.ini

prod:
	source venv/bin/activate && \
	uwsgi --ini uwsgi.prod.ini
