return {
	"echasnovski/mini.jump",

	opts = {
		-- Use `''` (empty string) to disable mappings.
		mappings = {
			forward = "f",
			backward = "F",
			forward_till = "t",
			backward_till = "T",
			repeat_jump = ";",
		},

		delay = {
			-- Delay between jump and highlighting all possible jumps
			highlight = 250,

			-- Delay between jump and automatic stop if idle (no jump is done)
			idle_stop = 10000000,
		},
	},
}
