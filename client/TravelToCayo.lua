local pedCoords = vec4(-1042.2990, -2735.7808, 12.80, 329.3394)
local pedCoords2 = vec4(1743.8929, 3295.2991, 40.1070, 196.2403)
local pedCoords3 = vec4(4456.9937, -4478.7715, 4.2438, 218.8695)
lib.requestModel('s_m_m_dockwork_01')
 TravelPed =CreatePed(
		1 --[[ integer ]], 
		GetHashKey('s_m_m_dockwork_01') --[[ Hash ]], 
		pedCoords.x,pedCoords.y,pedCoords.z, pedCoords.w, 
		true --[[ boolean ]], 
		true --[[ boolean ]]
	)
    SetEntityInvincible(
	TravelPed --[[ Entity ]], 
	true --[[ boolean ]]
)
FreezeEntityPosition(TravelPed --[[ Entity ]], true --[[ boolean ]])
SetBlockingOfNonTemporaryEvents(
	TravelPed --[[ Ped ]], 
	true --[[ boolean ]]
)
TravelPed2 =CreatePed(
		1 --[[ integer ]], 
		GetHashKey('s_m_m_dockwork_01') --[[ Hash ]], 
		pedCoords2.x,pedCoords2.y,pedCoords2.z, pedCoords2.w, 
		true --[[ boolean ]], 
		true --[[ boolean ]]
	)
    SetEntityInvincible(
	TravelPed2 --[[ Entity ]], 
	true --[[ boolean ]]
)
FreezeEntityPosition(TravelPed2 --[[ Entity ]], true --[[ boolean ]])
SetBlockingOfNonTemporaryEvents(
	TravelPed2 --[[ Ped ]], 
	true --[[ boolean ]]
)
TravelPed3 =CreatePed(
		1 --[[ integer ]], 
		GetHashKey('s_m_m_dockwork_01') --[[ Hash ]], 
		pedCoords2.x,pedCoords2.y,pedCoords2.z, pedCoords2.w, 
		true --[[ boolean ]], 
		true --[[ boolean ]]
	)
    SetEntityInvincible(
	TravelPed3 --[[ Entity ]], 
	true --[[ boolean ]]
)
FreezeEntityPosition(TravelPed3 --[[ Entity ]], true --[[ boolean ]])
SetBlockingOfNonTemporaryEvents(
	TravelPed3 --[[ Ped ]], 
	true --[[ boolean ]]
)
AddEventHandler('onResourceStop', function(resourceName)
    DeletePed(TravelPed)
    DeletePed(TravelPed2)
    DeletePed(TravelPed3)
end)
lib.registerContext({
    id = 'travelmenu',
    title = 'LSIA Airpot',
    options = {
  
      {
        title = 'Cayo Perico',
        description = 'Tropický ostrov v Karibiku.',
        icon = 'fa-solid fa-plane-departure',
        onSelect = function ()
            TriggerEvent('planespawn',4,'h', vec4(-1712.7495, -2926.7922, 13.9445, 244.1271))
        end
      },
      
      {
        title = 'Sandy Shores Airfield',
       description = 'Malé letiště v Sandy Shores.',
        icon = 'fa-solid fa-plane-departure',
        onSelect = function ()
            TriggerEvent('planespawn',5,'h', vec4(-1712.7495, -2926.7922, 13.9445, 244.1271))
        end
      },
     
    }
  })
  lib.registerContext({
    id = 'travelmenusandy',
    title = 'Sandy Shores Airfield',
    options = {
  
      {
        title = 'Cayo Perico',
        description = 'Tropický ostrov v Karibiku.',
        icon = 'fa-solid fa-plane-departure',
        onSelect = function ()
            TriggerEvent('planespawn',9,'h',vec4(1749.6271, 3283.0188, 41.0770, 136.3190))
        end
      },
      {
        title = 'LSIA Airport',
        description = 'Hlavní letiště.',
        icon = 'fa-solid fa-plane-departure',
        onSelect = function ()
            TriggerEvent('planespawn',8,'h',vec4(1749.6271, 3283.0188, 41.0770, 136.3190))
        end
      },
      
      
      
     
     
    }
  })
  lib.registerContext({
    id = 'travelmenucayo',
    title = 'Cayo Perico Airfield',
    options = {
  
    
      {
        title = 'LSIA Airport',
        description = 'Hlavní letiště.',
        icon = 'fa-solid fa-plane-departure',
        onSelect = function ()
            TriggerEvent('planespawn',8,'h',vec4(4475.4834, -4479.6870, 4.2176, 152.3799))
        end
      },
      {
        title = 'Sandy Shores Airfield',
       description = 'Malé letiště v Sandy Shores.',
        icon = 'fa-solid fa-plane-departure',
        onSelect = function ()
            TriggerEvent('planespawn',8,'h', vec4(4475.4834, -4479.6870, 4.2176, 152.3799))
        end
    },}
  })
local options = {
    label='Cestovat',
    name ='travel',
    icon ='fa-solid fa-plane',
    onSelect= function ()
        lib.showContext('travelmenu')
    end
}
local options2 = {
    label='Cestovat',
    name ='travel',
    icon ='fa-solid fa-plane',
    onSelect= function ()
        lib.showContext('travelmenusandy')
    end
}
local options3 = {
    label='Cestovat',
    name ='travel',
    icon ='fa-solid fa-plane',
    onSelect= function ()
        lib.showContext('travelmenucayo')
    end
}
exports.ox_target:addLocalEntity(TravelPed,options)
exports.ox_target:addLocalEntity(TravelPed2,options2)
exports.ox_target:addLocalEntity(TravelPed3,options3)
AddEventHandler('planespawn',function (routeId,routeName,coords)
    local planeModel='velum'
    local ped = PlayerPedId()
    local pedModel = 's_m_m_pilot_01'
    lib.requestModel(planeModel)
    lib.requestModel(pedModel)
    
        DoScreenFadeOut(500)
        
   
    local pilot = CreatePed(1,GetHashKey(pedModel),coords.x,coords.y,coords.z,coords.w,true,true)
    local plane =CreateVehicle(GetHashKey(planeModel),coords.x,coords.y,coords.z,coords.w,true,true)


    SetPedIntoVehicle(
        pilot --[[ Ped ]], 
         plane--[[ Vehicle ]], 
        -1 --[[ integer ]]
    )
    SetPedIntoVehicle(
        ped --[[ Ped ]], 
         plane--[[ Vehicle ]], 
        1 --[[ integer ]]
    )
    DoScreenFadeIn(2000) 
  
  TriggerEvent('flyplane',plane,routeId,routeName)
end)

AddEventHandler('flyplane',function (plane,routeId,routeName)
    Citizen.Wait(2000)

    
   
    RequestVehicleRecording(routeId,routeName)
	--print("Loading record on "..vehicle.." ...",routeId,routeName)
	while not HasVehicleRecordingBeenLoaded(routeId,routeName) do 
		Wait(1000)
	end 
    StartPlaybackRecordedVehicle(
	plane --[[ Vehicle ]], 
	 routeId --[[ integer ]], 
	routeName --[[ string ]], 
	false
)
SetPlaybackSpeed(plane,1.0)
SetVehicleActiveDuringPlayback(plane, true);

while true do
    Citizen.Wait(1000)
    local height = GetEntityCoords(plane)
    local height = height.z
    if height >  70 then

        ControlLandingGear(
	plane --[[ Vehicle ]], 
	3 --[[ integer ]]
)

else

    ControlLandingGear(
        plane --[[ Vehicle ]], 
        0 --[[ integer ]]
    )
    end

end
end)