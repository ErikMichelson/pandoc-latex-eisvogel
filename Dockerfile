FROM pandoc/latex:3.1

RUN apk --no-cache add aspell aspell-de
RUN tlmgr install koma-script adjustbox babel-german background bidi collectbox csquotes everypage filehook footmisc footnotebackref framed fvextra letltxmacro ly1 mdframed mweights needspace pagecolor selnolig sourcecodepro sourcesanspro titling ucharcat ulem unicode-math upquote xecjk xurl zref
RUN mkdir -p /root/.local/share/pandoc/templates && \
    mkdir -p /tmp/eisvogel && \
    wget -O /tmp/eisvogel/eisvogel.tar.gz "https://github.com/Wandmalfarbe/pandoc-latex-template/releases/download/v2.0.0/Eisvogel-2.0.0.tar.gz" && \
    tar -xzf /tmp/eisvogel/eisvogel.tar.gz -C /tmp/eisvogel && \
    mv /tmp/eisvogel/eisvogel.latex /root/.local/share/pandoc/templates/ && \
    rm -rf /tmp/eisvogel
ADD docker-entrypoint.sh /usr/bin/

ENTRYPOINT ["/bin/sh", "/usr/bin/docker-entrypoint.sh"]
