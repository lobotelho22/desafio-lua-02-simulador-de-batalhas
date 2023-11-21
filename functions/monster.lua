local utils = require("utils")

local monster = {}

function monster.getCard (monster)

-- Perfil

local monsterName = monster.name
local monsterBio = monster.description

-- Atributos

local attackAttribute = monster.attack
local defenseAttribute = monster.defense
local lifeAttribute = math.floor(((monster.health / monster.maxHealth) * 10))
local speedAttribute = monster.speed

-- Card

print("=====================================================")
print("| "..monsterName)
print("|   "..monsterBio)
print("|----------------------------------------------------")
print("|  Atributos:")
print("|     - Ataque      "..utils.getProgressBar(attackAttribute))
print("|     - Defesa      " ..utils.getProgressBar(defenseAttribute))
print("|     - Vitalidade  " .. utils.getProgressBar(lifeAttribute))
print("|     - Velocidade  "..utils.getProgressBar(speedAttribute))
print("|")
print("=====================================================")
end

return monster
