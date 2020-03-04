local rv = require("resty.validation")
local v = require("validation")

local function trim_and_upcase()
    return function(value, fieldname, container)
        local valid, RS = rv.string.upper.trim(value)
        if (true == valid) then
            return RS
        else
            return value
        end
    end
end

local CIN = {}
CIN.formatter = trim_and_upcase()
CIN.format_validator = function(value, fieldname, container)
    local pattern = "%a%d%d%d%d%d%a%a%d%d%d%d%a%a%a%d%d%d%d%d%d"
    local f = v.is_string()
    if (string.match(value, pattern) ~= nil) then
        print("This is matched CIN :")
        print(string.sub(value, string.find(value, pattern)))
    end
    local valid, e = f(value)
    if (true ~= valid) then
        return valid, e
    end

    local m = string.match(value, pattern)
    if (nil == m) then
        return false, "Invalid format of CIN number"
    end
    return true, nil
end
CIN.reference_validator = nil

local TAN = {}
TAN.formatter = trim_and_upcase()
TAN.format_validator = function(value, fieldname, container)
    local pattern = "%a%a%a%a%d%d%d%d%d%a"
    local f = v.is_string()

    if (string.match(value, pattern) ~= nil) then
        print("This is matched TAN :")
        print(string.sub(value, string.find(value, pattern)))
    end

    local valid, e = f(value)
    if (true ~= valid) then
        return valid, e
    end

    local m = string.match(value, pattern)
    if (nil == m) then
        return false, "Invalid format of PAN number"
    end
    return true, nil
end
TAN.reference_validator = nil

local PAN = {}
PAN.formatter = trim_and_upcase()
PAN.format_validator = function(value, fieldname, container)
    local pattern = "%a%a%a%a%a%d%d%d%d%a"
    local f = v.is_string()

    if (string.match(value, pattern) ~= nil) then
        print("This is matched PAN :")
        print(string.sub(value, string.find(value, pattern)))
    end
    local valid, e = f(value)
    if (true ~= valid) then
        return valid, e
    end

    local m, n = string.match(value, pattern)
    if (nil == m) then
        return false, "Invalid format of PAN number"
    end
    return true, nil
end
PAN.reference_validator = nil

local GSTIN = {}
GSTIN.formatter = trim_and_upcase()
GSTIN.format_validator = function(value, fieldname, container)
    local pattern = "%d%d%a%a%a%a%a%d%d%d%d%a%d%a%d"
    local f = v.is_string()

    if (string.match(value, pattern) ~= nil) then
        print("This is matched GSTIN :")
        print(string.sub(value, string.find(value, pattern)))
    end

    local valid, e = f(value)
    if (true ~= valid) then
        return valid, e
    end

    local m = string.match(value, pattern)
    if (nil == m) then
        return false, "Invalid format of PAN number"
    end
    return true, nil
end
GSTIN.reference_validator = nil

local IdentifierType = {}
IdentifierType.formatter = trim_and_upcase()
IdentifierType.format_validator = function(value, fieldname, container)
    local f = v.is_string()
    local valid, e = f(value)
    if (true ~= valid) then
        return valid, e
    end
    local rsd, s = rv.trim(value)
    local pattern = "[%a%d%g]+"
    local m = string.match(s, pattern)
    if (nil == m) then
        return false, "Invalid format of Identifier " 
    elseif (s ~= m) then
        return false, "Invalid format of Identifier "
    end
    return true, nil
end
IdentifierType.reference_validator = nil

local Name = {}
Name.formatter = trim_and_upcase()
Name.format_validator = function(value, fieldname, container)
    local f = v.is_string()
    local valid, e = f(value)
    if (true ~= valid) then
        return valid, e
    end
    local rsd, s = rv.trim(value)
    local pattern = "[%a%d%p ]+"

    local m = string.match(s, pattern)
    if (nil == m) then
        return false, "Invalid format of Name field: " .. fieldname
    elseif (s ~= m) then
        return false, "Invalid format of Name field: " .. fieldname
    end
    st = print("Accepted !!", s)
    return true, st
end
Name.reference_validator = nil

local URI = {}
URI.formatter = trim_and_upcase()
URI.format_validator = function(value, fieldname, container)
    local f = v.is_string()
    local valid, e = f(value)
    if (true ~= valid) then
        return valid, e
    end

    local um = require("uri")
    local u = assert(um:new(value))
    if (nil == u) then
        return false, "Invalid format of URI field: " .. fieldname
    elseif (u:is_relative()) then
        return false, "Invalid format of URI field: " .. fieldname
    end
    return true, nil
end
Name.reference_validator = nil

local basic_fields = {
    CIN = CIN,
    TAN = TAN,
    PAN = PAN,
    GSTIN = GSTIN,
    IdentifierType = IdentifierType,
    Name = Name,
    URI = URI
}

return basic_fields
