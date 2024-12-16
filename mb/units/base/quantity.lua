--- Physical quantity.
---@class Quantity
---@field private _value number Quantity.
---@field private _type Type Unit type.
local Quantity = {}
Quantity.__index = Quantity

--- Physical quantity creation params.
---@class QuantityCreationParameters
---@field value number Quantity.
---@field type Type Unit type.

--- Constructor
---@param params QuantityCreationParameters
---@return Quantity
function Quantity.new(params)
  local self = setmetatable({}, Quantity)

  self._value = params.value
  self._type = params.type

  return self
end

--- Quantity value params.
---@class QuantityValueParams
---@field unit string? In which unit should the quantity be. Defaults to base unit.
---@field precision number? Decimal places to round to. Defaults to no rounding.

--- Get quantity.
---@param params QuantityValueParams?
---@return number
function Quantity:get_value(params)
  params = params or {}
  local value = self._type[params.unit or "base"]:from_base(self._value)
  if params.precision then
    local factor = 10 ^ params.precision
    value = math.floor(value * factor + 0.5) / factor
  end

  return value
end

--- Get unit type.
---@return Type
function Quantity:get_type()
  return self._type
end


--- Conversion to string.
---@param params QuantityValueParams?
---@return string
function Quantity:to_string(params)
  params = params or {}
  return string.format("%f %s", self:get_value(params), self._type[params.unit or "base"]:get_symbol())
end

--- Print quantity debug info.
function Quantity:__tostring()
  return string.format("Quantity(%f, %s)", self._value, tostring(self._type))
end

return Quantity
