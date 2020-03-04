local field = require "fields_schema"
print("You can try to pass the following value (except in name,uri,and Identifier)\n")
print('[{"data 1": "dela02603g", "data2": "u72200kl2002ptc123456", "data 3": "axhpv7605g", "data 4" : "06ddddd1111j9j9", "data 5": "c9876543", "data 6" : "https://www.w3schools.com/js/js_json_intro.asp"}]')


while (1) do
    io.write("What Data you have?\n1.CIN\n2.TAN\n3.PAN\n4.GSTIN\n5.IdentifierType\n6.Name\n7.URI\n8.Exit\n")
        local c = io.read()

    if (c == "1") then
        io.write("Enter the CIN number\n")
        cin = io.read()
        final = field.CIN.formatter(cin)
        print(field.CIN.format_validator(final))
    elseif (c == "2") then
        io.write("Enter the TAN number\n")
        tan = io.read()
        final = field.TAN.formatter(tan)
        print(field.TAN.format_validator(final))
    elseif (c == "3") then
        io.write("Enter the PAN number\n")
        Pan = io.read()
        final = field.PAN.formatter(Pan)
        print(field.PAN.format_validator(final))
    elseif (c == "4") then
        io.write("Enter the GSTIN number\n")
        gstin = io.read()
        final = field.GSTIN.formatter(gstin)
        print(field.GSTIN.format_validator(final))
    elseif (c == "5") then
        io.write("Enter the IdentifierType \n")
        idtz = io.read()
        fina = field.IdentifierType.formatter(idtz)
        print(field.IdentifierType.format_validator(fina))
    elseif (c == "6") then
        io.write("Enter the Name of organisation\n") 
        name = io.read()
        final = field.Name.formatter(name)
        print(field.Name.format_validator(final, "you can enter your own error message here"))
    elseif (c == "7") then
        io.write("Enter the URI of wesite\n")
        uri = io.read()
        final = field.URI.formatter(tan)
        print(field.URI.format_validator(uri, "INVALID"))
    elseif (c == "8") then
        break
    end
end
