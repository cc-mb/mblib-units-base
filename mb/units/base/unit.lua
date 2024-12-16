--- Physical unit.
---@class Unit
---@field private _symbol string Unit symbol.
---@field private _multiplier number unit = base * multiplier + offset.
---@field private _offset number unit = base * multiplier + offset.
local Unit = {}
Unit.__index = Unit

Unit.BASE = Unit.new({symbol = ""})

--- Physical unit creation params.
---@class UnitCreationParameters
---@field symbol string Unit symbol.
---@field multiplier number? `unit = base * multiplier + offset`. Defaults to 1.
---@field offset number? `unit = base * multiplier + offset`. Defaults to 0.

--- Constructor
---@param params UnitCreationParameters
---@return Unit
function Unit.new(params)
  local self = setmetatable({}, Unit)

  self._symbol = params.symbol
  self._multiplier = params.multiplier or 1
  self._offset = params.offset or 0

  return self
end

--- Get unit symbol.
---@return string
function Unit:get_symbol()
  return self._symbol
end

--- Get multiplier from `unit = base * multiplier + offset`.
---@return number
function Unit:get_multiplier()
  return self._multiplier
end

--- Get offset from `unit = base * multiplier + offset`.
---@return number
function Unit:get_offset()
  return self._offset
end

--- Get value in this unit from value in the base unit.
---@param value number Value in the base unit.
---@return number
function Unit:from_base(value)
  return value * self._multiplier + self._offset
end

--- Get value in the base unit from value in this unit.
---@param value number Value in this unit.
---@return number
function Unit:to_base(value)
  return (value - self._offset) / self._multiplier
end

--- Add offset.
---@param offset number Offset to add.
---@return Unit
function Unit:__add(offset)
  return Unit.new({
    symbol = self._symbol,
    multiplier = self._multiplier,
    offset =  self._offset + offset
  })
end

--- Substract offset.
---@param offset number Offset to substract.
---@return Unit
function Unit:__sub(offset)
  return Unit.new({
    symbol = self._symbol,
    multiplier = self._multiplier,
    offset = self._offset - offset
  })
end

--- Combine units using multiplication.
---@param other Unit|number Unit or number to multiply with.
---@return Unit
function Unit:__mul(other)
  if type(other) == "number" then
    return Unit.new({
      symbol = self._symbol,
      multiplier = self._multiplier * other,
      offset = self._offset * other
    })
  else
    return Unit.new({
      symbol = self._symbol .. other.symbol,
      multiplier = self._multiplier * other._multiplier
    })
  end
end

--- Combine units using division.
---@param other Unit|number Unit or number to divide by.
---@return Unit
function Unit:__div(other)
  if type(other) == "number" then
    return Unit.new({
      symbol = self._symbol,
      multiplier = self._multiplier / other
    })
  else
    return Unit.new({
      symbol = self._symbol .. "/" .. other._symbol,
      multiplier = self._multiplier / other._multiplier
    })
  end
end

--- Combine unit with itself.
---@param exp number Exponent.
---@return Unit
function Unit:__pow(exp)
  return Unit.new({
    symbol = self._symbol .. "^" .. tostring(exp),
    multiplier = self._multiplier ^ exp
  })
end

--- Change unit symbol.
---@param symbol string New symbol.
---@return Unit
function Unit:__concat(symbol)
  return Unit.new({
    symbol = symbol,
    multiplier = self._multiplier,
    offset = self._offset
  })
end

--- Print unit debug info.
function Unit:__tostring()
  return string.format("Unit(%s, m = %f, o = %f)", self._symbol, self._multiplier, self._offset)
end

return Unit
