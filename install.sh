pip install --user flake8 pep8 autopep8 rope
sudo apt-get install ack-grep ruby-dev exuberant-ctags
pushd bundle/ropevim
python setup.py install --user
echo 'export PATH="$PATH:~/.local/bin/"' >> ~/.bashrc
