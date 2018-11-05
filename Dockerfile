FROM kd6kxr/dl-opencv

#   add the dependencies

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends python-qt4 qt4-dev-tools build-essential locales cmake git curl libsigc++-2.0-dev libtiff5-dev zlib1g-dev ca-certificates ssl-cert -y
RUN python2 -m pip install torchvision qdarkstyle protobuf sklearn && python3 -m pip install torchvision qdarkstyle protobuf sklearn
RUN python2 -m pip install python-dateutil --upgrade && python3 -m pip install python-dateutil --upgrade

#   clone source code, checkout dev branch

RUN git clone https://github.com/Benitoite/interactive-deep-colorization.git ~/ideepcolor && cd ~/ideepcolor && git checkout python3
RUN git clone https://github.com/richzhang/colorization-pytorch.git ~/colorization-pytorch

#   get training data

RUN cd ~/ideepcolor && bash ./models/fetch_models.sh
RUN cd ~/colorization-pytorch && bash pretrained_models/download_siggraph_model.sh

#   set the entrypoint command

LABEL maintainer="kd6kxr@gmail.com"
CMD echo "This is a test..." && python ~/ideepcolor/ideepcolor.py --cpu-mode && echo "THATS ALL FOLKS!!!"
