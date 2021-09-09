FROM pandoc/latex:2.14

RUN apk --no-cache add aspell aspell-de
RUN tlmgr install adjustbox babel-german background bidi collectbox csquotes everypage filehook footmisc footnotebackref framed fvextra letltxmacro ly1 mdframed mweights needspace pagecolor selnolig sourcecodepro sourcesanspro titling ucharcat ulem unicode-math upquote xecjk xurl zref
RUN mkdir -p /var/lib/pandoc/templates && \
    wget -O /tmp/eisvogel.tar.gz "https://github.com/Wandmalfarbe/pandoc-latex-template/releases/download/v2.0.0/Eisvogel-2.0.0.tar.gz" && \
    tar -xzvf /tmp/eisvogel.tar.gz -C /var/lib/pandoc/templates && \
    rm /tmp/eisvogel.tar.gz && \
    rm -rf /var/lib/pandoc/templates/examples/
ADD docker-entrypoint.sh /usr/bin/

ENTRYPOINT ["/bin/sh", "/usr/bin/docker-entrypoint.sh"]
