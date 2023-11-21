local utils = require "utils"
local actions = {}

actions.list = {}

function actions.bulid ()

    actions.list = {}

    local punchAttack = {
        description = "Colossus ataca com um soco",
        requirement = nil,
        execute = function (colossus, player)
            local successRate = (colossus.attack + colossus.speed + 2) / (player.defense + 1.5 * player.speed)
            local attackTry = math.random() <= successRate
            
            if attackTry then
                local damage = colossus.attack - (math.random() * player.defense) + 1
                damage = (damage < 1) and 1 or math.ceil(damage)
                player.health = player.health - damage
                local healthProg = utils.getProgressBar(math.floor(((player.health / player.maxHealth) * 10)))
                print("Colossus inflingiu um dano de " .. damage)
                print(string.format("Saúde atual do %s: %s", player.name, healthProg))
            else
                print("Colossus erra, homenzinho venha aqui!")
            end
        end
    }

    local soproAttack = {
        description = "Colossus ataca com um sopro",
        requirement = nil,
        execute = function (colossus, player)
            local successRate = (colossus.attack + colossus.speed * 5) / (player.defense + 1.5 * player.speed)
            local attackTry = math.random() <= successRate
            
            if attackTry then
                local damageList =  {1, 2, 3}
                local damage = damageList[math.random(#damageList)]
                player.health = player.health - damage
                local healthProg = utils.getProgressBar(math.floor(((player.health / player.maxHealth) * 10)))
                print("Colossus inflingiu um dano de " .. damage)
                print(string.format("Saúde atual do %s: %s", player.name, healthProg))
            else
                print("Colossus erra, Colossus detesta errar!")
            end
        end
    }

    local sleep = {
        description = "Ahhhh, que sono",
        execute = function (_colossus, _player)
            print("Colossus acabou dormindo e perdeu a rodada...")
        end
    }

    actions.list[#actions.list+1] = punchAttack
    actions.list[#actions.list+1] = soproAttack
    actions.list[#actions.list+1] = sleep

end

function actions.getValidActions()
    local validActions = {}

    for i, colossusAttack in pairs(actions.list) do
        validActions[#validActions+1] = colossusAttack
    end

    return validActions
end

return actions