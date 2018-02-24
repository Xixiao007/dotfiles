#!/bin/bash

# ensure system is updated and has basic build tools
sudo apt-get update
sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install tmux build-essential gcc g++ make binutils unzip
sudo apt-get --assume-yes install software-properties-common

# install anaconda and create a 2.7 virtualenv
cd ~/Download
# wget "https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh"
# bash "Anaconda3-5.0.1-Linux-x86_64.sh" -b
# conda create -n py27 python=2.7 anaconda -y
# activate py27

# download and install GPU drivers
wget "https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb"

sudo dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get -y install cuda=8.0.61-1
sudo apt-mark hold cuda
sudo modprobe nvidia
nvidia-smi

# install tensorflow
conda install tensorflow-gpu -y

# install and configure keras
pip install git+git://github.com/fchollet/keras.git
mkdir ~/.keras
echo '{
    "image_dim_ordering": "tf",
    "epsilon": 1e-07,
    "floatx": "float32",
    "backend": "tensorflow"
}' > ~/.keras/keras.json

# Install pytorch
conda install -y pytorch torchvision cuda80 -c soumith
conda upgrade -y --all
pip install torchtext

# Install python dependencies for fastai
sudo apt-get install graphviz -y
conda install -y opencv tqdm bcolz
conda install -y feather-format -c conda-forge
pip install isoweek pandas_summary graphviz sklearn-pandas

# configure jupyter
jupyter notebook --generate-config

# Leaving the next line uncommented will prompt you to provide a password to
# use with your jupyter notebok.
jupass=`python -c "from notebook.auth import passwd; print(passwd())"`
# To hardcode the password to 'jupyter' comment line above and uncomment the line below.
#jupass=sha1:85ff16c0f1a9:c296112bf7b82121f5ec73ef4c1b9305b9e538af

echo "c.NotebookApp.password = u'"$jupass"'" >> $HOME/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False" >> $HOME/.jupyter/jupyter_notebook_config.py

# create ssl cert for jupyter notebook
openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout $HOME/mykey.key -out $HOME/mycert.pem -subj "/C=IE"
# save notebook startup command
echo jupyter notebook --certfile=$HOME/mycert.pem --keyfile $HOME/mykey.key > $HOME/start-jupyter-notebook
chmod +x $HOME/start-jupyter-notebook

# Install Jupyter Nbextensions
conda install -y -c conda-forge jupyter_contrib_nbextensions jupyter_nbextensions_configurator

# Uncomment the 3 lines below ONLY if you are following the guide for setting
# up persistent AWS spot instances as outlined here:
#    https://medium.com/@radekosmulski/automated-aws-spot-instance-provisioning-with-persisting-of-data-ce2b32bdc102
#mkdir workspace
#echo sudo mount /dev/xvdf1 $HOME/workspace > $HOME/mount-workspace
#chmod +x $HOME/mount-workspace

# Delete installation files
rm -rf install-gpu-part1-v2-cuda8.sh Anaconda3-5.0.1-Linux-x86_64.sh cuda-repo-ubuntu1604_8.0.61-1_amd64.deb

# Start new shell for updates to PATH to take effect
exec bash

# download and install GPU drivers
wget "https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb"

sudo dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get -y install cuda=8.0.61-1
sudo apt-mark hold cuda
sudo modprobe nvidia
nvidia-smi

# install Anaconda for current user
wget "https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh"
bash "Anaconda3-5.0.1-Linux-x86_64.sh" -b

echo "export PATH=\"$HOME/anaconda3/bin:\$PATH\"" >> ~/.bashrc
export PATH="$HOME/anaconda3/bin:$PATH"

# install tensorflow
conda install tensorflow-gpu

# install and configure keras
pip install git+git://github.com/fchollet/keras.git
mkdir ~/.keras
echo '{
    "image_dim_ordering": "tf",
    "epsilon": 1e-07,
    "floatx": "float32",
    "backend": "tensorflow"
}' > ~/.keras/keras.json

# Install pytorch
conda install -y pytorch torchvision cuda80 -c soumith
conda upgrade -y --all
pip install torchtext

# Install python dependencies for fastai
sudo apt-get install graphviz
conda install -y opencv tqdm bcolz
conda install -y feather-format -c conda-forge
pip install isoweek pandas_summary graphviz sklearn-pandas

# theano
conda install -c mila-udem -c mila-udem/label/pre theano pygpu -y

# configure jupyter
jupyter notebook --generate-config

# Leaving the next line uncommented will prompt you to provide a password to
# use with your jupyter notebok.
jupass=`python -c "from notebook.auth import passwd; print(passwd())"`
# To hardcode the password to 'jupyter' comment line above and uncomment the line below.
#jupass=sha1:85ff16c0f1a9:c296112bf7b82121f5ec73ef4c1b9305b9e538af

echo "c.NotebookApp.password = u'"$jupass"'" >> $HOME/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.ip = '*'
c.NotebookApp.open_browser = False" >> $HOME/.jupyter/jupyter_notebook_config.py

# create ssl cert for jupyter notebook
openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout $HOME/mykey.key -out $HOME/mycert.pem -subj "/C=IE"
# save notebook startup command
echo jupyter notebook --certfile=$HOME/mycert.pem --keyfile $HOME/mykey.key > $HOME/start-jupyter-notebook
chmod +x $HOME/start-jupyter-notebook

# Install Jupyter Nbextensions
conda install -y -c conda-forge jupyter_contrib_nbextensions jupyter_nbextensions_configurator

# Uncomment the 3 lines below ONLY if you are following the guide for setting
# up persistent AWS spot instances as outlined here:
#    https://medium.com/@radekosmulski/automated-aws-spot-instance-provisioning-with-persisting-of-data-ce2b32bdc102
#mkdir workspace
#echo sudo mount /dev/xvdf1 $HOME/workspace > $HOME/mount-workspace
#chmod +x $HOME/mount-workspace

# Delete installation files
rm -rf install-gpu-part1-v2-cuda8.sh Anaconda3-5.0.1-Linux-x86_64.sh cuda-repo-ubuntu1604_8.0.61-1_amd64.deb

# Start new shell for updates to PATH to take effect
exec bash