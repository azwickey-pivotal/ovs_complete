# OVS1
#
# Version       latest
FROM library/python:2.7.9

# Adding all files.
ADD requirements.txt /home/python/
ADD app.py /home/python/
ADD templates/ /home/python/templates/

# Installing all requirements
RUN pip install -q --upgrade pip
RUN pip install -q -r /home/python/requirements.txt

# The web ports -- this will be overriden by PCF
ENV VCAP_APP_PORT 8080

# Exposing port 8888
EXPOSE 8080:8080

# Entry point
WORKDIR /home/python
CMD python -u app.py
