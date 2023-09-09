FROM ubuntu:latest
# update
RUN apt-get -y update && apt-get install -y \
graphviz \
libsm6 \
libxext6 \
libxrender-dev \
libglib2.0-0 \
sudo \
wget \
vim

#install anaconda3
WORKDIR /opt
# download anaconda package and install anaconda
# archive -> https://repo.anaconda.com/archive/
RUN wget https://repo.anaconda.com/archive/Anaconda3-2023.07-2-Linux-x86_64.sh && \
    sh Anaconda3-2023.07-2-Linux-x86_64.sh -b -p /opt/anaconda3 && \
    rm -f Anaconda3-2023.07-2-Linux-x86_64.sh
# set path
ENV PATH /opt/anaconda3/bin:$PATH

# update pip and install pxackages
RUN pip install --upgrade pip && \
    conda install -c conda-forge tesseract && \
    conda install -c conda-forge pyocr
# RUN pip install --upgrade scikit-learn
# RUN pip install opencv-python
# RUN pip install nibabel
# RUN pip install --upgrade plotly
# RUN pip install chart_studio
# RUN pip install jupyter-dash
# RUN pip install --upgrade "ipywidgets>=7.6"
# RUN pip install lightgbm
# RUN pip install xgboost
# RUN pip install graphviz
# RUN pip install catboost
# RUN pip install category_encoders
# RUN pip install hyperopt
# RUN pip install hpsklearn



WORKDIR /
RUN mkdir /work

# execute jupyterlab as a default command
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]
