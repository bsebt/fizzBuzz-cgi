note
	description: "[
			Specific application launcher

			DO NOT EDIT THIS CLASS

			you can customize APPLICATION_LAUNCHER
		]"
	date: "$Date: 2015-06-10 09:48:30 -0700 (Wed, 10 Jun 2015) $"
	revision: "$Revision: 97452 $"

deferred class
	APPLICATION_LAUNCHER_I [G -> WSF_EXECUTION create make end]

feature -- Execution

	launch (opts: detachable WSF_SERVICE_LAUNCHER_OPTIONS)
		local
			launcher: WSF_SERVICE_LAUNCHER [G]
		do
			create {WSF_DEFAULT_SERVICE_LAUNCHER [G]} launcher.make_and_launch (opts)
		end

end


