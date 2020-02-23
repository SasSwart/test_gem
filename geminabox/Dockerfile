FROM ruby:2.5-stretch

ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

RUN apt-get update
RUN apt-get install -y apt-utils

RUN apt-get install -y openssh-server openssh-client

RUN mkdir -p /var/run/sshd
COPY ./sshd_config /etc/ssh/sshd_config
COPY ./ssh_config /etc/ssh/ssh_config
COPY ./id_rsa.pub /root/.ssh/authorized_keys
COPY ./id_rsa /root/.ssh/id_rsa
COPY ./ssh_host_rsa_key /etc/ssh/ssh_host_rsa_key
COPY ./ssh_host_rsa_key /etc/ssh/ssh_host_rsa_key.pub
COPY ./ssh_host_rsa_key.pub /root/.ssh/known_hosts

COPY ./.bashrc /root/.bashrc

RUN mkdir /app
COPY ./config.ru /app/config.ru
COPY ./start.sh /app/start.sh
COPY ./Gemfile /app/Gemfile
RUN cd /app && bundle install

RUN chmod -R 755 /app
RUN mkdir -p /var/geminabox-data/gems

CMD cd /app && bundle exec ./start.sh