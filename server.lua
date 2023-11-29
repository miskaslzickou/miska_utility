RegisterNetEvent('kickplayercheater')
AddEventHandler('kickplayercheater',function ()
    DropPlayer(source,'Skill issue:Používáš event menu')
   
end)

RegisterNetEvent('truck:lootgive')
AddEventHandler('truck:lootgive',function (id)
    local randomValue = math.random()
    if randomValue <= 0.4 then
      
        Count =  15 
    elseif randomValue <= 0.6 then
     
        Count = 10
    elseif randomValue <= 0.7 then
    
        Count = 12
    elseif randomValue <= 0.9 then
       
        Count = 8
    else
     
        Count = 20
        return Count
    end
    
 
    exports.ox_inventory:GetInventory('trunk'..id)
 exports.ox_inventory:AddItem('trunk'..id,'depositbox',Count)
 
end)



RegisterNetEvent('truck:lootbox')
AddEventHandler('truck:lootbox',function ()
   
local heist_drill = exports.ox_inventory:Search(source,'count','heist_drill')
local depositBox = exports.ox_inventory:Search(source,'count','depositbox')
if depositBox >= 1 and heist_drill >=1 then
    local randomValue = math.random()

    if randomValue <= 0.4 then
        LootItem = 'money'
        Count = 10000
    elseif randomValue <= 0.6 then
        LootItem = 'money'
        Count = 5000
    elseif randomValue <= 0.7 then
        LootItem = 'truck_jewels'
        Count = 10
    elseif randomValue <= 0.9 then
        LootItem = 'truck_gold'
        Count = 5
    else
        LootItem = 'money'
        Count = 2000
        return LootItem, Count
    end
    
 

   exports.ox_inventory:AddItem(source,LootItem,Count)

end
end)
RegisterNetEvent('interactions:bag')
AddEventHandler('interactions:bag',function (target)
TriggerClientEvent('bagUse',target)
end)

lib.addCommand('routebucket', {
    help = 'Přesměruje hráče(defaultní bucket je 0!)',
    params = {
        {
            name = 'target',
            type = 'playerId',
            help = 'Id hráče',
        },
        {
            name = 'bucket',
            type = 'number',
            help = 'Číslo bucketu',
        },
      
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    local bucket = (args.bucket)
 
    if bucket then
        SetPlayerRoutingBucket(tostring(args.target),args.bucket)
    end
end)
lib.addCommand('checkplayerinv', {
    help = 'Zkontroluje inv hráče',
    params = {
      
      
        {
            name = 'inventory_number',
            type = 'number',
            help = 'Id hráče',
        },
        
        
    },
    restricted = 'group.admin'
}, function(source, args, raw)
    local inventory = (args.inventory_number)
   if inventory then
    
       
        exports.ox_inventory:forceOpenInventory(source,'player',tonumber(args.inventory_number))
       
   end
end)



