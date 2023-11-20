-- Dependencies

local player = require("definitions.player")
local colossus = require("definitions.colossus")
local utils = require("utils")
local monster = require('functions.monster')

-- utils.enableUTF8() -- Caso os emojis não estejam aparecendo em sua tela, habilite essa opção

-- HEADER

utils.printHeader()

-- Obter Definições do Jogador



-- Obter definições do monstro

local boss = colossus

-- Apresentar o Monstro

monster.getCard(boss)

-- Apresentar o monstro