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
                local damage = player.attack - (math.random() * monster.defense)
                damage = (damage > 0) and damage or damage + 1
                monster.health = monster.health - math.ceil(damage)
                print("você inflingiu um dano de " .. math.ceil(damage))
            else
                print("Errou, mané!")
            end
        end
    }

    local regenPotion = { -- tomar poção de regeneração
        description = "Tomar poção de cura",
        requirement = function(player)
            if player.potion > 0 then
                return true
            else
                return false
            end
        end,
        execute = function(player)
            player.potions = player.potions - 1
            player.health = player.maxHealth
            print("Você está curado!")
        end
    }

    actions.list[#actions.list + 1] = swordAttack
    actions.list[#actions.list + 1] = regenPotion
end

function actions.getValidActions()
    print("...waiting")
end

return actions
