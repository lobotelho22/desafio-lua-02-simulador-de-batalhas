-- Dependencies

local player = require("definitions.player")
local colossus = require("definitions.colossus")

os.execute("chcp 65001")

-- HEADER

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

-- Obter Definições do Jogador



-- Obter definições do monstro

local boss = colossus

-- Apresentar o Monstro

print (colossus.description)

-- Apresentar o monstro