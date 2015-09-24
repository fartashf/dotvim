pip install --user flake8 pep8 autopep8 rope
sudo apt-get install ack ruby-dev
pushd bundle/ropevim
python setup.py install --user
export PATH="$PATH:~/.local/bin/" >> ~/.bashrc
