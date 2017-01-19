def regnr(string)
  match = /[A-Z&&[^QIV]]{3}[0-9]{3}/.match(string)
  !match ? false : match[0]
end
