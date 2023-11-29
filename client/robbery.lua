


local resourceName = 	GetCurrentResourceName()

	local pedCoords = vec4(82.7039, -821.2324, 30.2597, 257.7284)
lib.requestModel('s_m_m_movprem_01')
 local RobberyPed =CreatePed(
		1 --[[ integer ]], 
		GetHashKey('s_m_m_movprem_01') --[[ Hash ]], 
		pedCoords.x,pedCoords.y,pedCoords.z, pedCoords.w, 
		true --[[ boolean ]], 
		true --[[ boolean ]]
	)
    SetEntityInvincible(
	RobberyPed --[[ Entity ]], 
	true --[[ boolean ]]
)

SetBlockingOfNonTemporaryEvents(
	RobberyPed --[[ Ped ]], 
	true --[[ boolean ]]
)
FreezeEntityPosition(RobberyPed,true)

AddEventHandler('onResourceStop', function(resourceName)

    DeletePed(RobberyPed)
end)
lib.registerContext({
    id="robberynpc",
    title = "Vykrádačky",
    canClose = true,
    options = {
        {
            title = "Loupež konvoje",
            icon = "fa-solid fa-truck-front",
            onSelect = function()
            TriggerEvent('robbery:start')
            end,
            
        },
    
        
        
    
    
            
            }
                    })
                    
exports.ox_target:addLocalEntity(RobberyPed,{
label = "Promluvit s pánem",
name = "robberynpc",
distance = 2,
icon ="fa-solid fa-money-bill",
onSelect = function ()
lib.showContext("robberynpc")
end
                    })
function CheckCoords(Coords,maxDistance)
PlayerCoords = GetEntityCoords(PlayerPedId())
ComparedCoords = PlayerCoords.xy - Coords.xy

if math.abs(ComparedCoords.x)  <= maxDistance and math.abs(ComparedCoords.y) <= maxDistance then
return true
else
return false
end
end
RegisterNetEvent('robbery:start')
AddEventHandler('robbery:start',function ()
 if CheckCoords(vec2(pedCoords.x,pedCoords.y),20) == true then
    local modelMain ='stockade'
    local modelEscort ='umkalamo'
    local pedModel ='ig_casey'
    local pedModel2 ='mp_s_m_armoured_01'
    local pedCoords = vec4(46.2357, -661.9264, 31.6291, 156.1457)
    local pedCoords2 = vec4(46.82357, -660.9264, 31.6291, 156.1457)
    local coords = vec4(46.0825, -627.2241, 31.6286, 162.6926)
    local coords2 =   vec4(50.5501, -612.9717, 31.6286, 162.8746)
    local coords3 =  vec4(41.7127, -640.8157, 31.6286, 163.4282)
    local drivingStyle = 786599
    local escortSpeed = 12.0
    local mode = -1
    lib.requestModel(modelMain)
    lib.requestModel(modelEscort)
    lib.requestModel(pedModel)
    lib.requestModel(pedModel2)
    MainVehicle =CreateVehicle(GetHashKey(modelMain),coords.x,coords.y,coords.z,coords.w,true,true)
    EscortVehicle =CreateVehicle(GetHashKey(modelEscort),coords2.x,coords2.y,coords2.z,coords2.w,true,true)
    EscortVehicle2 =CreateVehicle(GetHashKey(modelEscort),coords3.x,coords3.y,coords3.z,coords3.w,true,true)
 DriverPed=  CreatePed(1,GetHashKey(pedModel),pedCoords.x,pedCoords.y,pedCoords.z,pedCoords.w,true,true)
 CoDriverPed=  CreatePed(1,GetHashKey(pedModel2),pedCoords2.x,pedCoords2.y,pedCoords2.z,pedCoords2.w,true,true)
 EscortDriverPed=  CreatePed(1,GetHashKey(pedModel2),pedCoords2.x,pedCoords2.y,pedCoords2.z,pedCoords2.w,true,true)
 EscortCoDriverPed=  CreatePed(1,GetHashKey(pedModel2),pedCoords2.x,pedCoords2.y,pedCoords2.z,pedCoords2.w,true,true)
 EscortDriverPed2=  CreatePed(1,GetHashKey(pedModel2),pedCoords2.x,pedCoords2.y,pedCoords2.z,pedCoords2.w,true,true)
 EscortCoDriverPed2=  CreatePed(1,GetHashKey(pedModel2),pedCoords2.x,pedCoords2.y,pedCoords2.z,pedCoords2.w,true,true)
    Citizen.Wait(1000)
    TaskWarpPedIntoVehicle(
	DriverPed --[[ Ped ]], 
	MainVehicle --[[ Vehicle ]], 
	-1 --[[ integer ]]
)
TaskWarpPedIntoVehicle(CoDriverPed --[[ Ped ]], MainVehicle --[[ Vehicle ]], 0 --[[ integer ]])
TaskWarpPedIntoVehicle(EscortDriverPed --[[ Ped ]], EscortVehicle --[[ Vehicle ]], -1 --[[ integer ]])
TaskWarpPedIntoVehicle(EscortCoDriverPed --[[ Ped ]], EscortVehicle --[[ Vehicle ]], 0 --[[ integer ]])
TaskWarpPedIntoVehicle(
	EscortDriverPed2 --[[ Ped ]], 
	EscortVehicle2 --[[ Vehicle ]], 
	-1 --[[ integer ]])
TaskWarpPedIntoVehicle(EscortCoDriverPed2 --[[ Ped ]], EscortVehicle2 --[[ Vehicle ]], 0 --[[ integer ]])
AddBlipForEntity(
	MainVehicle --[[ Entity ]]
)
AddBlipForEntity(
	EscortVehicle --[[ Entity ]]
)
AddBlipForEntity(
	EscortVehicle2 --[[ Entity ]]
)

Citizen.Wait(100)

local vehicles = {EscortVehicle,EscortVehicle2,MainVehicle}
for _, vehicles in ipairs(vehicles) do
	SetVehicleDoorsLocked(
		vehicles --[[ Vehicle ]], 
		3 --[[ integer ]]
	)
end

local peds = {DriverPed,CoDriverPed,EscortCoDriverPed,EscortDriverPed,EscortCoDriverPed2,EscortDriverPed2}

for _,peds in ipairs(peds) do
	SetPedAccuracy(
	peds --[[ Ped ]], 
	50 --[[ integer ]]
)

end
local robberyPeds = {DriverPed,CoDriverPed}
for _,robberyPeds in ipairs(robberyPeds) do
	GiveWeaponToPed(
	robberyPeds --[[ Ped ]], 
	GetHashKey('WEAPON_PISTOL') --[[ Hash ]], 
	100 --[[ integer ]], 
	false --[[ boolean ]], 
	false --[[ boolean ]]
)
GiveWeaponToPed(
	robberyPeds --[[ Ped ]], 
	GetHashKey('WEAPON_CARBINERIFLE') --[[ Hash ]], 
	200 --[[ integer ]], 
	false --[[ boolean ]], 
	false --[[ boolean ]]
)
end


local robberyPeds2 ={EscortDriverPed2,EscortCoDriverPed2,EscortDriverPed,EscortCoDriverPed}
for _, robberyPeds2 in ipairs(robberyPeds2) do
	GiveWeaponToPed(
		robberyPeds2 --[[ Ped ]], 
		GetHashKey('WEAPON_PISTOL') --[[ Hash ]], 
		100 --[[ integer ]], 
		false --[[ boolean ]], 
		false --[[ boolean ]]
	)
	GiveWeaponToPed(
		robberyPeds2 --[[ Ped ]], 
		GetHashKey('WEAPON_SMG') --[[ Hash ]], 
		200 --[[ integer ]], 
		false --[[ boolean ]], 
		false --[[ boolean ]]
	)
end

TaskVehicleDriveWander(EscortDriverPed2,EscortVehicle2,escortSpeed-5,drivingStyle)

TaskVehicleEscort(
	DriverPed --[[ Ped ]], 
	MainVehicle--[[ Vehicle ]], 
	EscortVehicle2--[[ Vehicle ]], 
	mode --[[ integer ]], 
	escortSpeed + 7 --[[ number ]], 
	drivingStyle --[[ integer ]], 
	12 --[[ number ]], 
	4 --[[ integer ]], 
	7 --[[ number ]]
) 
TaskVehicleEscort(
	EscortDriverPed --[[ Ped ]], 
	EscortVehicle --[[ Vehicle ]], 
     MainVehicle--[[ Vehicle ]], 
	mode --[[ integer ]], 
	escortSpeed + 7 --[[ number ]], 
	drivingStyle --[[ integer ]], 
	12 --[[ number ]], 
	4 --[[ integer ]], 
	7 --[[ number ]]
) 




for _,peds in ipairs(peds) do
	SetPedAsCop(
	peds --[[ Ped ]], 
	true --[[ boolean ]]
)
end 
	
	local model2 ='ba_prop_battle_bag_01a'
	local boneId =GetEntityBoneIndexByName(MainVehicle,'seat_pside_r')
	local coords = GetEntityCoords(MainVehicle)

	Loot =CreateObject(GetHashKey(model2),coords.x,coords.y,coords.z,true,true,false)
	Loot2 =CreateObject(GetHashKey(model2),coords.x,coords.y,coords.z,true,true,false)
	

	
	
	local boneId2 =GetEntityBoneIndexByName(MainVehicle,'seat_dside_r')
	AttachEntityToEntity(Loot,MainVehicle,boneId,0,0,1,0,0,0,true,true,false,true,1,true)
	AttachEntityToEntity(Loot2,MainVehicle,boneId2,0,0,1,0,0,0,true,true,false,true,1,true)

local options = {
        label = "Vyvrtat dveře",
name = "breakdoor",
distance = 2,
bones = {'door_pside_r','door_dside_r'},
icon ="fa-solid fa-bore-hole",
items ='heist_drill',
onSelect = function ()
    local model ='hei_prop_heist_drill'

    lib.requestModel(model)
	
    lib.requestAnimDict('anim_heist@hs3f@ig9_vault_drill@drill@')
    local coords =GetEntityCoords(PlayerPedId())
	

TaskPlayAnim(PlayerPedId(),'anim_heist@hs3f@ig9_vault_drill@drill@','drill_straight_idle',8.0,8.0,-1,49,0,false,false,false)
Drill = CreateObject(GetHashKey(model),coords.x,coords.y,coords.z,true,true,false)
AttachEntityToEntity(Drill, PlayerPedId(), 73, 0.062884095248023, -0.069886733685599, -0.043362563083624, -12.914756793465, 31.583101427832, 60.1493118578, true, true, false, true,1,true)
TriggerServerEvent('truck:lootgive',GetVehicleNumberPlateText(MainVehicle)
)

TriggerEvent("Drilling:Start",function(success)
    if (success) then
        SetVehicleDoorsLocked(
            MainVehicle --[[ Vehicle ]], 
            0 --[[ integer ]]
        )
SetVehicleDoorOpen(
	MainVehicle --[[ Vehicle ]], 
	3--[[ integer ]], 
	false --[[ boolean ]], 
	false --[[ boolean ]]
)
SetVehicleDoorOpen(
	MainVehicle --[[ Vehicle ]], 
	2--[[ integer ]], 
	false --[[ boolean ]], 
	false --[[ boolean ]]
)

       
    
      DeleteEntity(Drill)
      ClearPedTasks(
	PlayerPedId() --[[ Ped ]]
)
exports.ox_target:removeLocalEntity(MainVehicle,'breakdoor')
    else
		
      DeleteEntity(Drill)
      ClearPedTasks(
	PlayerPedId() --[[ Ped ]]
)
    end
end)



end
    }
    exports.ox_target:addLocalEntity(MainVehicle,options)
else
TriggerServerEvent('kickplayercheater')
end
end)
RegisterCommand('truckrobbery',function ()
    TriggerEvent('robbery:start')
end,false)
RegisterNetEvent('loot:deposit')
AddEventHandler('loot:deposit',function ()
	if lib.progressBar({
		duration = 10000,
		label = 'Otevíráš deposit box',
		useWhileDead = false,
		canCancel = true,
		disable = {
			car = true,
		},
		
	}) then
	TriggerServerEvent('truck:lootbox')
	end
end)