local term = require("term")
local ui = require("ui")
local utils = require("utils")

local function main()
    local tries = 0;
    while (tries <= 3) do
        local user_i = main_ui();
        if user_i == false then
            print("Pon solo '1' o '2' sin comillas, Intentos: " .. tries);
            tries = tries + 1;
        else
            break;
        end
    end
end

main();