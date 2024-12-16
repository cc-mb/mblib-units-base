local Unit = require "mb.units.base.unit"
local Type = require "mb.units.base.type"

--- Metric prefixes.
local Prefix = Type.new()

Prefix:register_base(Unit.BASE) -- Define no prefix as a base.

Prefix:register(Prefix[""] * 1e1 .. "da") -- deca = 1e1
Prefix:register(Prefix[""] * 1e2 .. "h") -- hecto = 1e2
Prefix:register(Prefix[""] * 1e3 .. "k") -- kilo = 1e3
Prefix:register(Prefix["k"] * 1e3 .. "M") -- mega = 1e6
Prefix:register(Prefix["M"] * 1e3 .. "G") -- giga = 1e9
Prefix:register(Prefix["G"] * 1e3 .. "T") -- tera = 1e12
Prefix:register(Prefix["T"] * 1e3 .. "P") -- peta = 1e15
Prefix:register(Prefix["P"] * 1e3 .. "E") -- exa = 1e18
Prefix:register(Prefix["E"] * 1e3 .. "Z") -- zetta = 1e21
Prefix:register(Prefix["Z"] * 1e3 .. "Y") -- yotta = 1e24
Prefix:register(Prefix["Y"] * 1e3 .. "R") -- ronna = 1e27
Prefix:register(Prefix["R"] * 1e3 .. "Q") -- quetta = 1e30

Prefix:register(Prefix[""] / 1e1 .. "d") -- deci = 1e-1
Prefix:register(Prefix[""] / 1e2 .. "c") -- centi = 1e-2
Prefix:register(Prefix[""] / 1e3 .. "m") -- milli = 1e-3
Prefix:register(Prefix["m"] / 1e3 .. "u") -- micro = 1e-6
Prefix:register(Prefix["u"] / 1e3 .. "n") -- nano = 1e-9
Prefix:register(Prefix["n"] / 1e3 .. "p") -- pico = 1e-12
Prefix:register(Prefix["p"] / 1e3 .. "f") -- femto = 1e-15
Prefix:register(Prefix["f"] / 1e3 .. "a") -- atto = 1e-18
Prefix:register(Prefix["a"] / 1e3 .. "z") -- zepto = 1e-21
Prefix:register(Prefix["z"] / 1e3 .. "y") -- yocto = 1e-24
Prefix:register(Prefix["y"] / 1e3 .. "r") -- ronto = 1e-27
Prefix:register(Prefix["r"] / 1e3 .. "q") -- quecto = 1e-30

Prefix:register(Prefix[""] * 2 ^ 10 .. "Ki") -- kibi = 2 ^ 10
Prefix:register(Prefix["Ki"] * 2 ^ 10 .. "Mi") -- mebi = 2 ^ 20
Prefix:register(Prefix["Mi"] * 2 ^ 10 .. "Gi") -- gibi = 2 ^ 30
Prefix:register(Prefix["Gi"] * 2 ^ 10 .. "Ti") -- tebi = 2 ^ 40
Prefix:register(Prefix["Ti"] * 2 ^ 10 .. "Pi") -- pebi = 2 ^ 50
Prefix:register(Prefix["Pi"] * 2 ^ 10 .. "Ei") -- exbi = 2 ^ 60
Prefix:register(Prefix["Ei"] * 2 ^ 10 .. "Zi") -- zebi = 2 ^ 70
Prefix:register(Prefix["Zi"] * 2 ^ 10 .. "Yi") -- yobi = 2 ^ 80
Prefix:register(Prefix["Yi"] * 2 ^ 10 .. "Ri") -- robi = 2 ^ 90
Prefix:register(Prefix["Ri"] * 2 ^ 10 .. "Qi") -- qubi = 2 ^ 100

return Prefix
