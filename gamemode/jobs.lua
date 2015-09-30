JOBS = JOBS or {} -- Global jobs table so we can access it for salary etc.

local function CreateJob( name, args ) -- Function to create a new job.
	if( !name or !args or !args.Color or !args.Salary )then -- Checking we made everything while creating the job.
		MsgC( COL.IceBlue, "Failed to create job '" .. ( name and name or "N/A" ) .. "' - Log:\n" )

		MsgC( COL.IceBlue, "\tName: " )
		MsgC( color_white, ( name and "true" or "false" ) .. "\n" )

		MsgC( COL.IceBlue, "\tColor: " )
		MsgC( color_white, ( args.Color and "true" or "false" ) .. "\n" )

		MsgC( COL.IceBlue, "\tSalary: " )
		MsgC( color_white, ( args.Salary and "true" or "false" ) .. "\n" )
	end
	JOBS[name] = args -- Set the arguments accesible through the JOBS table.
	team.SetUp( #JOBS, name, args.Color ) -- Create the job using the team system.
end

function GM:CreateTeams() -- Create teams inside here.
	--[[
	CreateJob( "Example Job", {
		Color = Color( 0, 0, 0 ),
		Salary = 69,
	} )
	]]
	CreateJob( "This will error" )
end
