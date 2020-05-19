FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/America/Chicago /etc/localtime && \
apt-get update -y && apt-get install -y --no-install-recommends wget=1.20.3-1ubuntu1 gnupg2=2.2.19-3ubuntu2 tzdata=2019c-3ubuntu1 ca-certificates=20190110ubuntu1 && \
dpkg-reconfigure --frontend noninteractive tzdata && \
apt-key adv --fetch-keys https://keybase.io/crystal/pgp_keys.asc && \
echo "deb https://dist.crystal-lang.org/apt crystal main" > /etc/apt/sources.list.d/crystal.list && \
apt-get update -y && \
apt-get install -y --no-install-recommends crystal=0.34.0-1 \
git=1:2.25.1-1ubuntu3 && \
apt-get -qq clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
mkdir /crystal-app
WORKDIR /crystal-app
