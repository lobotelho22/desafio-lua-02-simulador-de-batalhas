-- [[ LOADING DEPENDENCIES ]] --

local player = require("player.player")
local playerActions = require("player.actions")
local colossus = require("monsters.colossus")
local colossusActions = require("monsters.colossus.actions")
local utils = require("utils")
local monster = require('functions.monster')
local settings = require("settings")
local globalConsts = require("globalConsts")

-- [[ STARTING GAME ]]

local userSettings = settings.build()

local userOS = settings.selectOS()

userSettings[1].name = userOS
userSettings[1].startApp()

-- HEADER

utils.printHeader()
utils.pressEnterToContinue("Pressione Enter para prosseguir...\n")
utils.clearScreen(userSettings[1].name)

-- Obter Definições do Jogador

local warrior = player
playerActions.build()

-- Obter definições do monstro

local boss = colossus
colossusActions.bulid()

-- Apresentar o Monstro

print(globalConsts.entranceMessage)
monster.getCard(boss)
utils.pressEnterToContinue("Pressione Enter, quando estiver pronto para encarar o monstro...\n")

-- Engine

-- io.read()

while true do

    print("---------------------------------------------------------")
    print("                    TURNO " .. userSettings[2].turn)
    print("---------------------------------------------------------\n")
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

    os.execute("sleep 2")

    if isActionValid then
        print(string.format("\nVocê decidiu %s", string.lower(validPlayerActions[chosenIndex].description)))
        chosenAction.execute(player, boss)
    else
        print("Sua ação é inválida. Você perdeu o turno!")
    end
    
    -- Turno criatura
    local colossusAttackOptions = colossusActions.getValidActions()
    local colossusChoose = math.random(#colossusAttackOptions)
    local colossusAttack = colossusAttackOptions[colossusChoose]

    print("\nAguarde o ataque de Colossus..")
    os.execute("sleep 3")
    print("\n")
    colossusAttack.execute(boss, player)
    print("\n")

    userSettings[2].turn = userSettings[2].turn + 1

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