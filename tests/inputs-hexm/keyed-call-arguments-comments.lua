local a = dict(
  first = 1, -- trailing comment
  -- leading comment
  second = 2,
  [third] = 3 -- last comment
)

local b = dict( -- after paren
  x = 1
)

local c = dict(
  x = 1
  -- before closing paren
)

local d = dict(x = 1, y = --[[ value ]] 2)

local f = dict([k] --[[ after key ]] = --[[ before value ]] 1)

local e = dict(
  -- stylua: ignore
  matrix   =   { 1,0,
                 0,1 },
  other   =   2
)
