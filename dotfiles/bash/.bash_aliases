MARKDOWN_PARS='-t gfm --wrap=none --atx-headers'

alias to-md='pandoc $MARKDOWN_PARS'
alias html-to-md='pandoc -f html-native_divs-native_spans-header_attributes-link_attributes $MARKDOWN_PARS'

