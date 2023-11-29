lib.registerContext({
	id = 'crafting',
	title = 'Stůl na výrobu',
	options = {

	  {
		title = '',
		description = '',
		icon = 'hand',
	
	  },
	
	}
  })

AddEventHandler('nightvision',function ()
	if GetUsingnightvision() then
		SetNightvision(
	false --[[ boolean ]]
)
else
	SetNightvision(true)
	end
end)
