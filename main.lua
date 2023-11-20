-- Dependencies

local player = require("player.player")
local playerActions = require("player.actions")
local colossus = require("monsters.colossus")
local colossusActions = require("monsters.colossus.actions")
local utils = require("utils")
local monster = require('functions.monster')

-- utils.enableUTF8() -- Caso os emojis não estejam aparecendo em sua tela, habilite essa opção

-- HEADER

utils.printHeader()

-- Obter Definições do Jogador

local warrior = player
playerActions.build()

-- Obter definições do monstro

local boss = colossus
colossusActions.bulid()

-- Apresentar o Monstro

monster.getCard(boss)

-- Engine

while true do

    print("\nO que você deseja fazer?")

    -- Turno Jogador
    local validPlayerActions = playerActions.getValidActions(player)

    for i, action in pairs(validPlayerActions) do
        print(string.format(
            "%d. %s", i, action.description
        ))
    end
    local chosenIndex = utils.ask()
    local chosenAction = validPlayerActions[chosenIndex]
    local isActionValid = chosenAction ~= nil

    if isActionValid then
        print(string.format("Você decidiu %s", string.lower(validPlayerActions[chosenIndex].description)))
        chosenAction.execute(player, boss)
    else
        print("Sua ação é inválida. Você perdeu o turno!")
    end
    
    -- Turno criatura
    local colossusAttackOptions = colossusActions.getValidActions()
    local colossusChoose = math.random(#colossusAttackOptions)
    local colossusAttack = colossusAttackOptions[colossusChoose]

    colossusAttack.execute(boss, player)

    if boss.health <= 0 then
        print("Parabéns, você derrotou o " .. boss.name)
        break
    end
    if warrior.health <= 0 then
        print(string.format("Xiii, as coisas não andaram muito bem para nosso amigo %s", player.name))
        print("Agora ele vai ver o capim crescer pela raiz.")
        break
    end
end