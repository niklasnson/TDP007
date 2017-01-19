def longest_string(items)
  items.max { |a,b| a.length <=> b.length }
end

longest_string ["apelsin", "banan", "citron"]
