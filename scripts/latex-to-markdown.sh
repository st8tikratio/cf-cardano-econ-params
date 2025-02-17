pandoc ../latex/whitepaper.tex -s -f latex -t gfm \
    --wrap=none \
    --mathjax \
    --bibliography=../latex/cardano_bibliography.bib \
    --csl=https://www.zotero.org/styles/ieee \
    --lua-filter=citations-to-footnotes.lua \
    --lua-filter=replace-eps-with-png.lua \
    --template=template.md \
    -o ../whitepaper.md