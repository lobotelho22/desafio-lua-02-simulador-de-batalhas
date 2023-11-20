local utils = {}

function utils.enableUTF8 () -- Habilita UFT8 no terminal
    os.execute("chcp 65001")
end

function utils.printHeader() -- Gera o cabeçalho da aplicação
    print([[
=====================================================
                    /
            *//////{<>==================-
                    \
------------------------------------------------------                
                SIMULADOR DE BATALHA
------------------------------------------------------
*****    Pegue sua espada e encare o desafio    *****
=====================================================
]])
end

function utils.getProgressBar(attributeValue) -- Gera uma barra de progresso
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

return utils