cd ~/src/vim

./configure \
    --enable-multibyte \
    --enable-python3interp=yes \
    --with-features=huge \
    --enable-largefile \
    --disable-netbeans \
    --with-compiledby="luis donoso" \
    --enable-fail-if-missing

# make && sudo make install
