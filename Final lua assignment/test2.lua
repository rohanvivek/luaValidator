local field = require "fields_schema"
local cjson = require "cjson"

local json_text =
    '[{"data 1": "dela02603g", "data2": "u72200kl2002ptc123456", "data 3": "axhpv7605g", "data 4" : "06ddddd1111j9j9", "data 5": "c9876543", "data 6" : "https://www.w3schools.com/js/js_json_intro.asp"}]'

local uri = "https://tekenlight.com/"
local idde = "c9876543"
local uname = "Tekenlight Solutions Pvt Ltd 2019."

fina = field.IdentifierType.formatter(idde)
print(field.IdentifierType.format_validator(fina)) -- takes all character and throws error on space

final = field.Name.formatter(uname)
print(field.Name.format_validator(final, "you can enter your own error message here"))

final = field.GSTIN.formatter(json_text)
print(field.GSTIN.format_validator(final))

final = field.URI.formatter(uri)
print(final)
print("This is for URI :", field.URI.format_validator(uri, "it's Invalid"))

print(type(cjson.decode(json_text)))
final = field.CIN.formatter(json_text)
print(field.CIN.format_validator(final))

final = field.TAN.formatter(json_text)
print(field.TAN.format_validator(final))

final = field.PAN.formatter(json_text)
print(field.PAN.format_validator(final))
