-- Define a function to run ElmMake and open errors in a quickfix window
function ElmMake()
	-- Run Elm Make with JSON report
	local output = vim.fn.system("elm make ./src/Main.elm --report=json")

	-- Parse the JSON output

	-- Check if there are errors
	if (output ~= '') then
		local result = vim.fn.json_decode(output)
		local quickfix_list = {}

		for _, error in ipairs(result.errors) do
			-- Create a dictionary for the quickfix entry
			local filename = error.path

			for _, problem in ipairs(error.problems) do
				local entry = {
					filename = filename,
					lnum = problem.region.start.line,
					col = problem.region.start.column,
					text = problem.title
				}
				table.insert(quickfix_list, entry)
			end
		end

		vim.fn.setqflist(quickfix_list)
		vim.cmd("copen")
		vim.cmd("cc")
	else
		print("Elm Make completed without errors.")
	end
end

-- Define a Neovim command to trigger ElmMake
vim.cmd("command! -nargs=0 ElmMake lua ElmMake()")
