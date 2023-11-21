local utils = require "utils"
local actions = {}

actions.list = {}

function actions.build()  -- constroi a tabela interna de ações do jogador
    actions.list = {}

    local swordAttack = {
        description = "Atacar com a espada",
        requirement = nil,
        execute = function(player, monster)
            local successRate = (player.attack + 1.5 * player.speed) / (monster.defense + 1.5 * monster.speed)
            local attackTry = math.random() <= successRate
            if attackTry then
                local damage = player.attack - (math.random() * monster.defense) + 1
                damage = (damage < 1) and 1 or math.ceil(damage)
                monster.health = monster.health - damage
                local healthProg = utils.getProgressBar(math.floor(((monster.health / monster.maxHealth) * 10)))
                print(string.format("%s inflingiu um dano de %d", player.name, damage))
                print(string.format("Saúde atual do %s: %s", monster.name, healthProg))
            else
                print("Errou, mané!")
            end
        end
    }

    local regenPotion = { -- tomar poção de regeneração
        description = "Tomar uma poção de cura",
        requirement = function(player)
            if player.potions > 0 then
                return true
            else
                return false
            end
        end,
        execute = function(player, _monster)
            player.potions = player.potions - 1
            player.health = player.maxHealth
            print("Você está curado!")
        end
    }

    actions.list[#actions.list + 1] = swordAttack
    actions.list[#actions.list + 1] = regenPotion
end

---Retorna a lista de ações válidas para o player
---@param player table player
---@return table
function actions.getValidActions(player) 
    local validActions = {}

    for _, action in pairs(actions.list) do
        local isValid = action.requirement == nil or action.requirement(player)
        if isValid then
            validActions[#validActions+1] = action
        end
    end

    return validActions
end

return actions
