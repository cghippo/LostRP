--[[ CLIENT ]]--
AddCSLuaFile( "cl_init.lua" )
--[[ CLIENT ]]--

--[[ SERVER ]]--
--[[ SERVER ]]--

--[[ SHARED ]]--
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "jobs.lua" )
AddCSLuaFile( "colors.lua" )
AddCSLuaFile( "knockout.lua" )
AddCSLuaFile( "cl_scoreboard.lua" )
--[[ SHARED ]]-- 

include( 'shared.lua' )

local models = {
    "models/player/group01/female_01.mdl",
    "models/player/group01/female_02.mdl",
    "models/player/group01/female_03.mdl",
    "models/player/group01/female_04.mdl",
    "models/player/group01/female_05.mdl",
    "models/player/group01/female_06.mdl",
    "models/player/group01/male_01.mdl",
    "models/player/group01/male_02.mdl",
    "models/player/group01/male_03.mdl",
    "models/player/group01/male_05.mdl",
    "models/player/group01/male_06.mdl",
    "models/player/group01/male_07.mdl"
}

function GM:PlayerSpawn( ply )
	ply:SetModel( models[math.random(#models)] )
    ply:Give( "weapon_fists" )
    ply:Give( "weapon_physcannon" )
    ply:SetupHands()
end

function GM:PlayerSetHandsModel( ply, ent )

    local simplemodel = player_manager.TranslateToPlayerModelName( ply:GetModel() )
    local info = player_manager.TranslatePlayerHands( simplemodel )
    if ( info ) then
        ent:SetModel( info.model )
        ent:SetSkin( info.skin )
        ent:SetBodyGroups( info.body )
    end

end

function GM:ScalePlayerDamage( ply, hitgroup, dmginfo )
        if( ply:IsPlayer() and dmginfo:GetAttacker():IsPlayer() and dmginfo:GetAttacker():GetActiveWeapon():GetClass("weapon_fists" ) ) then
                print("Code is working!")
        end
end