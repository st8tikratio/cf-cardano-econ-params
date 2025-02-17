pandoc ../latex/whitepaper.tex -s -f latex -t gfm \
    --wrap=none \
    --mathjax \
    --lua-filter=replace-eps-with-png.lua \
    --template=template.md \
    --citeproc \
    --bibliography=../latex/cardano_bibliography.bib \
    -o ../whitepaper.md