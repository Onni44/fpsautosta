local shot = false
local shot2 = false
local check = false
local check2 = false
local check3 = false
local check4 = false
local count = 0
local count2 = 0

Citizen.CreateThread(function()
	while true do
		SetBlackout(false)
		Citizen.Wait( 1 )
		if IsPlayerFreeAiming(PlayerId()) then
		    if GetFollowPedCamViewMode() == 4 and check == false then
			    check = false
			else
			    SetFollowPedCamViewMode(4)
			    check = true
			end
		else
		    if check == true then
		        SetFollowPedCamViewMode(1)
				check = false
			end
		end
	end
end )



Citizen.CreateThread(function()
	while true do
		SetBlackout(false)
		Citizen.Wait( 1 )
		
		if IsPedShooting(GetPlayerPed(-1)) and shot == false and GetFollowPedCamViewMode() ~= 4 then
			check2 = true
			shot = true
			SetFollowPedCamViewMode(4)
		end
		
		if IsPedShooting(GetPlayerPed(-1)) and shot == true and GetFollowPedCamViewMode() == 4 then
			count = 0
		end
		
		if not IsPedShooting(GetPlayerPed(-1)) and shot == true then
		    count = count + 1
		end

        if not IsPedShooting(GetPlayerPed(-1)) and shot == true then
			if not IsPedShooting(GetPlayerPed(-1)) and shot == true and count > 20 then
		        if check2 == true then
				    check2 = false
					shot = false
					SetFollowPedCamViewMode(1)
				end
			end
		end	    
	end
end )

Citizen.CreateThread(function()
	while true do
		SetBlackout(false)
		Citizen.Wait( 1 )
		if IsPlayerFreeAiming(PlayerId()) then
			if GetFollowVehicleCamViewMode() == 4 and check3 == false then
			    check3 = false
			else
			    SetFollowVehicleCamViewMode(4)
			    check3 = true
			end
		else
		    if chec3k == true then
		        SetFollowVehicleCamViewMode(1)
				check3 = false
			end
		end
	end
end )

Citizen.CreateThread(function()
	while true do
		SetBlackout(false)
		Citizen.Wait( 1 )
		
		if IsPedShooting(GetPlayerPed(-1)) and shot2 == false and GetFollowPedCamViewMode() ~= 4 then
			check4 = true
			shot2 = true
			SetFollowVehicleCamViewMode(4)
		end
		
		if IsPedShooting(GetPlayerPed(-1)) and shot2 == true and GetFollowVehicleCamViewMode() == 4 then
			count2 = 0
		end
		
		if not IsPedShooting(GetPlayerPed(-1)) and shot2 == true then
		    count2 = count2 + 1
		end

        if not IsPedShooting(GetPlayerPed(-1)) and shot2 == true then
			if not IsPedShooting(GetPlayerPed(-1)) and shot2 == true and count2 > 20 then
		        if check4 == true then
				    check4 = false
					shot2 = false
					SetFollowVehicleCamViewMode(1)
				end
			end
		end	    
	end
end )

Citizen.CreateThread(function()
	while true do
		SetBlackout(false)
		Citizen.Wait ( 1 )
		if GetVehiclePedIsUsing(PlayerPedId()) ~= nil and not IsPedInAnyHeli(PlayerPedId()) and not IsPedOnFoot(PlayerPedId()) then
			local UseKMH = GetConvar("UseKMH", true)
			local vauhti2 = GetEntitySpeed(GetVehiclePedIsUsing(PlayerPedId()))
			local vauhti1 = UseKMH and math.ceil(vauhti2 * 3.6) or math.ceil(vauhti2 * 2.236936)
			if vauhti1 > 40 and IsPlayerFreeAiming(PlayerPedId()) or IsPedShooting(GetPlayerPed(-1)) then
				ShakeGameplayCam(ROAD_VIBRATION_SHAKE, 1)
			else
				StopGameplayCamShaking(true)
			end
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		SetBlackout(false)
		Citizen.Wait( 1 )
                if IsControlJustReleased(1, 25) then
                   SetFollowVehicleCamViewMode(1)
                   
                end
        end     
end )               
