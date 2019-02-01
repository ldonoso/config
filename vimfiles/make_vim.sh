cd ~/src/vim

./configure \
    --enable-multibyte \
    --enable-pythoninterp=dynamic \
    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
    --enable-python3interp \
    --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
    --with-features=huge \
    --enable-largefile \
    --disable-netbeans \
    --with-compiledby="luis donoso" \
    --enable-fail-if-missing

# make && sudo make install
