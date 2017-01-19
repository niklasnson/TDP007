def find_it(items, &block)
  items.inject() {|a,b| block.call(a,b) ? a : b}
end
