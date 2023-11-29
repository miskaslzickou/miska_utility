RegisterNetEvent('car:tow')
AddEventHandler('car:tow',function (data)

    if lib.progressBar({
        duration = 5000,
        label = 'Otahuješ vozidlo',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
        },
        anim = {
            dict = 'amb@code_human_wander_texting@female@base',
            clip = 'static'
        },
        prop = {
            model = `prop_phone_ing`,
            pos = vec3( 0.067453752788424, 0.028999952123146, 0.065614427002248),
            rot = vec3(-5.5070212096783, 29.499344765584, -143.88614529407)
        },
    }) then
        DeleteEntity(data.entity) 
    end
   
end)

RegisterNetEvent('car:flip')
AddEventHandler('car:flip',function (data)
    if lib.progressBar({
        duration = 5000,
        label = 'Převracíš vozidlo',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
        },
        anim = {
            dict = 'missfinale_c2ig_11',
            clip = 'pushcar_offcliff_m'
        },
  
    }) then
  
        local heading =GetEntityHeading(data.entity)

        SetEntityRotation(data.entity,0,0,0,5,true)
        SetEntityHeading(data.entity,heading)
    
        
    end
   
end)


local isBagged = false
RegisterNetEvent('putBag')
AddEventHandler('putBag',function (data)
    
	if not isBagged then
        ExecuteCommand('me Dává/Sundává pytel osobě  ')
		TriggerServerEvent('interactions:bag', GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity)))
    end

end)

  
RegisterNetEvent('bagUse')
AddEventHandler('bagUse',function ()
    isBagged = not isBagged
    if isBagged then
     
        DoScreenFadeOut(500)
        local coords = GetEntityCoords(PlayerPedId())
        lib.requestModel('p_cs_sack_01_s')
        Bag =CreateObject(GetHashKey('p_cs_sack_01_s'),coords.x,coords.y,coords.z,true,true,false)
        exports.ox_target:disableTargeting(true)
        AttachEntityToEntity(Bag, PlayerPedId(), 98, 0.00035131030097091, 0.032419185451904, 0.0021022402059869, -9.0950035241495, -85.84226596542, 37.658108047527, true, true, false, true,1,true)
    else
        exports.ox_target:disableTargeting(false)
        DoScreenFadeIn(500)
        DeleteEntity(Bag)
    end
end)

local vehicleOptions = {
    {
        label='Odtáhnout vozidlo',
        icon ='fa-solid fa-car',
        distance = 3,
        groups ={["police"] =0} ,
        event='car:tow',
     

    },
    {
        label='Obrátit vozidlo',
        icon ='fa-solid fa-car',
        distance = 3,
        event='car:flip',
     

    },

} 

local PersonOptions = {
    {
        label='Dát/Sundat pytel',
        icon ='fa-solid fa-sack-xmark',
        distance = 1,
        event='putBag'
       

    }
}
exports.ox_target:addGlobalPlayer(PersonOptions)
exports.ox_target:addGlobalVehicle(vehicleOptions)

