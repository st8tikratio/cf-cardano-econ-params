pandoc ../latex/whitepaper.tex -s -f latex -t gfm \
    --wrap=none \
    --mathjax \
    --lua-filter=replace-eps-with-png.lua \
    --template=template.md \
    -o ../whitepaper.md