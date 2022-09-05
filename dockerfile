# syntax=docker/dockerfile:1
FROM scratch
ADD ubuntu-jammy-oci-amd64-root.tar.gz /

# install app dependencies
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip install flask==2.1.*

# install app
COPY app.py /

# final configuration
ENV FLASK_APP=hello
EXPOSE 8000
CMD flask run --host 0.0.0.0 --port 8000
