-- Dependencies

local player = require("player.player")
local colossus = require("monsters.colossus")
local utils = require("utils")
local monster = require('functions.monster')

-- utils.enableUTF8() -- Caso os emojis não estejam aparecendo em sua tela, habilite essa opção

-- HEADER

utils.printHeader()

-- Obter Definições do Jogador

local warrior = player

-- Obter definições do monstro

local boss = colossus

-- Apresentar o Monstro

monster.getCard(boss)

-- Engine

while true do

    for i = 1, 10, 1 do
        player.health = player.health - 2
        print("porrada")
    end

    -- Turno Jogador

    -- Turno criatura

    if boss.health <= 0 then
        break
    end
    if warrior.health <= 0 then
        break
    end
end