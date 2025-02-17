local used_citations = {}
local citation_counter = 0
local footnotes = {}

function parse_bibtex(content)
    local bibliography = {}
    local current_entry = nil
    local current_key = nil

    for line in content:gmatch("[^\r\n]+") do
        local entry_type, entry_key = line:match("@(%w+)%s*{%s*([^,]+)")
        if entry_type and entry_key then
            current_key = entry_key
            bibliography[current_key] = {}
            current_entry = bibliography[current_key]
        end

        local field, value = line:match("%s*(%w+)%s*=%s*{(.+)}%s*,?")
        if field and value and current_entry then
            -- Handle special characters
            value = value:gsub("\\\"u", "ü")
            value = value:gsub("\\\"o", "ö")
            value = value:gsub("\\\"a", "ä")
            value = value:gsub("\\\"U", "Ü")
            value = value:gsub("\\\"O", "Ö")
            value = value:gsub("\\\"A", "Ä")
            
            -- Remove LaTeX commands
            value = value:gsub("\\url{(.-)}", "%1")
            value = value:gsub("\\href{.-}{(.-)}", "%1")
            
            -- Remove unnecessary braces
            value = value:gsub("^{(.-)}$", "%1")  -- Remove outer braces
            value = value:gsub("{(.-)}", "%1")    -- Remove other braces
            
            -- Clean up extra spaces
            value = value:gsub("%s+", " "):gsub("^%s*(.-)%s*$", "%1")
            
            current_entry[field] = value
        end
    end

    return bibliography
end

function Cite(el)
    local inlines = {}
    
    for _, citation in ipairs(el.citations) do
        local cite_id = citation.id
         -- Extract author and year from the citation key
        local author, year = cite_id:match("([A-Za-z]+)(%d%d%d%d)")
        local author_year = author and (author .. "(" .. year .. ")") or cite_id

        if not used_citations[cite_id] then
            citation_counter = citation_counter + 1
            used_citations[cite_id] = citation_counter
            
            -- Store footnote text
            footnotes[#footnotes + 1] = cite_id
        end
                
        -- Create the inline citation with footnote reference
        table.insert(inlines, pandoc.Str(author_year))
        table.insert(inlines, pandoc.Space())
        table.insert(inlines, pandoc.RawInline("markdown", 
            string.format("[^%s]", cite_id)))
    end
    
    return inlines
end

function Pandoc(doc)
    -- Add all footnotes at the end
    local processed_footnotes = {}
    local file = io.open(doc.meta.bibliography, "r")
    local content = file:read("*all")
    file:close()
    local bibliography = parse_bibtex(content)

    for _, footnote in ipairs(footnotes) do
        processed_footnotes[#processed_footnotes + 1] = string.format("[^%s]: %s %s %s", footnote, 
            bibliography[footnote]["author"], 
            bibliography[footnote]["title"],
            bibliography[footnote]["year"])
    end

    local footnote_block = pandoc.RawBlock("markdown", table.concat(processed_footnotes, "\n"))
    table.insert(doc.blocks, footnote_block)
    return doc
end

-- Helper function to print tables
function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end