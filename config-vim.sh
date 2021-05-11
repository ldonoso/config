# for `--with-x`
# sudo apt install libx11-dev libxtst-dev libxt-dev libsm-dev libxpm-dev

cd ~/src/vim

./configure \
    --enable-multibyte \
    --enable-python3interp=yes \
    --with-features=huge \
    --enable-largefile \
    --disable-netbeans \
    --with-compiledby="ldonoso" \
    --with-x \
    --enable-fail-if-missing

# make -j16 && sudo make install
