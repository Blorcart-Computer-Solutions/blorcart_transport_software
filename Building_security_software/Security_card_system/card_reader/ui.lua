term = require("term");

local function card_creator_ui()
    user = {}
    term.clear()
    term.setCursor(1,1)
    print("Creador de usuario")
    term.setCursor(4,3)
    io.write("Nombre: ")
    table.insert(user, term.read())
    term.setCursor(4,4) 
    io.write("Apellido: ")   
    table.insert(user, term.read())
    term.setCursor(4,5)
    io.write("DNI: ")
    table.insert(user, term.read())
    term.setCursor(4,6)
    io.write("---Previsualización---")
    term.setCursor(4,7)
    io.write("Nombre    :" .. user[1])
    term.setCursor(4,8)
    io.write("Apellido  :" .. user[2])
    term.setCursor(4,9)
    io.write("DNI       :" .. user[3])
    term.setCursor(4,10)
    local tries = 0
    while true do
        tries = tries + 1
        term.setCursor(4,10)
        term.write("¿Son correctos estos datos?(s/N): ")
        local input = io.read()
        if input == "s" or input == "S" then
            term.setCursor(4,11)
            term.write("fin")
            break
        elseif input == "n" or input == "N" then
            card_creator_ui()
            return
        else
            term.setCursor(4,11)
            term.write("Pon solo 's' o 'n' sin comillas")
            term.read()
            term.setCursor(4,11)
            term.clearLine()
            if tries > 3 then
                term.clear()
                print("Te has equivocado mas de tres veces")
                os.exit(1)
            end
            term.clearLine()
            term.setCursor(4,10)
            term.clearLine()
        end
    end
end

function main_ui()
    print("Opciones:")
    print("1) Crear Tarjeta")
    print("2) Borrar tarjeta")
    io.write("Selecciona una opción: ")
    local userinput = term.read()
    if userinput == "1\n" then
        card_creator_ui()
        return true
    elseif userinput == "2\n" then
        return true
    else
        return false
    end
end