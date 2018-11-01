FROM kd6kxr/dl-docker

#   add the dependencies

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends build-essential locales cmake git curl libsigc++-2.0-dev libtiff5-dev zlib1g-dev ca-certificates ssl-cert -y

#   prepare the environment

RUN locale-gen C.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8:en
ENV LC_ALL C.UTF-8

#   clone source code, checkout dev branch

RUN git clone https://github.com/Benitoite/interactive-deep-colorization.git ~/ideepcolor && cd ~/ideepcolor && git checkout python3

#   something else

RUN echo
RUN echo

#   set the entrypoint command

LABEL maintainer="kd6kxr@gmail.com"
CMD echo "This is a test..." && python3 ~/ideepcolor/ideepcolor.py --cpu-mode && echo "THATS ALL FOLKS!!!"
