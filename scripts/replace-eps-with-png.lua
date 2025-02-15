function Image(elem)
  -- Set a maximum width for all images
  elem.attributes["width"] = "200px"
  elem.src = elem.src:gsub("%.eps$", ".png")
  elem.src = elem.src:gsub("../figures/", "./figures/")
  return elem
end