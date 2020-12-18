# for `--with-x`
# sudo apt install libx11-dev libxtst-dev libxt-dev libsm-dev libxpm-dev

cd ~/src/vim

./configure \
    --enable-multibyte \
    --enable-python3interp \
    --with-python3-config-dir=/usr/lib/python3.8/config-3.8-x86_64-linux-gnu \
    --with-features=huge \
    --enable-largefile \
    --disable-netbeans \
    --with-compiledby="ldonoso" \
    --with-x \
    --enable-fail-if-missing

# make -j16 && sudo make install
