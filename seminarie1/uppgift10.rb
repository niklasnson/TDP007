def find_user(str)
  /.*USERNAME: *(.*)/.match(str)[1]
end
