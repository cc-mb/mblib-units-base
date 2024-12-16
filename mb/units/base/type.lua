local Quantity = require "mb.units.base.quantity"

--- Unit type.
---@class Type
---@field private _units Unit[] All units available for given type.
local Type = {}
Type.__index = Type

--- Constructor
---@return Type
function Type.new()
  local self = setmetatable({}, Type)

  self._units = {}

  return self
end

--- Register unit as a base unit.
---@param unit Unit
function Type:register_base(unit)
  if (unit:get_multiplier() ~= 1) then
    error("Base unit multiplier must be 1. Got: " .. unit:get_multiplier(), 2)
  elseif (unit:get_offset() ~= 0) then
    error("Base unit offset must be 0. Got: " .. unit:get_offset(), 2)
  elseif (self._units["base"] ~= nil) then
    error("Base unit already defined: " .. self._units["base"]:get_symbol(), 2)
  end

  self._units[unit:get_symbol()] = unit
  self._units["base"] = unit
end

--- Register new unit.
---@param unit Unit
function Type:register(unit)
  if (self._units["base"] == nil) then
    error("Base unit not defined yet.", 2)
  end

  self._units[unit:get_symbol()] = unit
end

--- Access unit.
---@param key string Unit name.
---@return Unit
function Type:__index(key)
  local unit = self._units[key]
  if unit == nil then
    error("Unknown unit.", 2)
  end

  return unit
end

--- Helper for time quantity creation.
---@param quantity number Quantity.
---@param unit string? Unit in which the quantity is. Defaults to base unit.
function Type:quantity(quantity, unit)
  return Quantity.new({ value = self[unit or "base"]:to_base(quantity), type = self })
end

--- Print type debug info.
function Type:__tostring()
  local info = "Type{\n"
  for k, v in pairs(self._units) do
    if k ~= "base" then
      local is_base = self._units["base"] == v
      info = info .. tostring(v) .. (is_base and "*" or "") .. "\n"
    end
  end

  info = info .. "}"
  return info
end

return Type
