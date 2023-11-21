local globalConsts = require("globalConsts")

local utils = {}

---Habilita o padrão UTF-8 no terminal
function utils.enableUTF8 ()
    os.execute("chcp 65001")
end

---Gera o cabeçalho da aplicação no terminal
function utils.printHeader()
    print([[
=========================================================
                    /
            *//////{<>==================-
                    \
---------------------------------------------------------                
                 SIMULADOR DE BATALHA
---------------------------------------------------------
*****      Pegue sua espada e encare o desafio      *****
=========================================================
]])
end

---Gera uma barra de progresso
---@param attributeValue number
---@return string progressbar: exibida como barra de progresso no terminal
function utils.getProgressBar(attributeValue)
    local progressBar = ""
    local progressCount = 0
    local squareProgress = "⬜"
    local emptyBlock = "⬛"
    for i = 1, attributeValue, 1 do
        progressBar = progressBar .. squareProgress
        progressCount = progressCount + 1
    end

    local emptyBlockNumber = 10 - progressCount

    for i = 1, emptyBlockNumber, 1 do
        progressBar = progressBar .. emptyBlock
    end

    return progressBar
end

---Pede ao usuário que defina uma opção de ação
---@return any
function utils.ask()
    io.write("> ")
    local answer = io.read("*n")
    return answer
end

---Executa a limpeza do terminal, de acordo com o Sistema Operacional do usuário
---@param osName string
function utils.clearScreen(osName)
    if osName == globalConsts.OPERATING_SYSTEMS[1] then
        os.execute("cls")
    else
        os.execute("clear")
    end
end

function utils.pressEnterToContinue(message)
    io.write(message)
    os.execute("read R")
end

return utils