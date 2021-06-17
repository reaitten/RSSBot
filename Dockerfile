FROM ubuntu:latest
WORKDIR /app
RUN chmod +x /app

RUN apt-get -qq -y update && apt-get -qq -y install python3 python3-pip locales

COPY . /app

RUN pip3 install --no-cache-dir -r requirements.txt

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \ 
locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

CMD ["python3","rss.py"]
