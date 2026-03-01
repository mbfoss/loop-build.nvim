---@type loop.taskTemplate[]
return {
	--- empty generic task
	{
		name = "Build task",
		task = {
			name = "Build",
			type = "build",
			command = "",
			cwd = "${wsdir}",
			quickfix_matcher = "",
			save_buffers = true,
			if_running = "restart",
		},
	},
	----------------------------------------------------------------------------
	-- C / C++
	----------------------------------------------------------------------------
	{
		name = "C++: Build Project (Make)",
		task = {
			name = "Make",
			type = "build",
			command = "make",
			cwd = "${wsdir}",
			quickfix_matcher = "gcc",
			save_buffers = true,
			if_running = "restart",

		},
	},
	{
		name = "C++: Build Single File (G++)",
		task = {
			name = "Compile file",
			type = "build",
			command = "g++ -g -Wall -Wextra ${file} -o ${fileroot}.out",
			cwd = "${filedir}",
			quickfix_matcher = "gcc",
			save_buffers = true,
			if_running = "restart",
		},
	},

	----------------------------------------------------------------------------
	-- RUST
	----------------------------------------------------------------------------
	{
		name = "Rust: Cargo Build",
		task = {
			name = "Build",
			type = "build",
			command = "cargo build --message-format=short",
			cwd = "${wsdir}",
			quickfix_matcher = "cargo",
			save_buffers = true,
			if_running = "restart",
		},
	},
	{
		name = "Rust: Cargo Build (Release)",
		task = {
			name = "Build (Release)",
			type = "build",
			command = "cargo build --release --message-format=short",
			cwd = "${wsdir}",
			quickfix_matcher = "cargo",
			save_buffers = true,
			if_running = "restart",
		},
	},
	{
		name = "Rust: Cargo Check",
		task = {
			name = "Check",
			type = "build",
			command = "cargo check --message-format=short",
			cwd = "${wsdir}",
			quickfix_matcher = "cargo",
			save_buffers = true,
			if_running = "restart",
		},
	},

	----------------------------------------------------------------------------
	-- GO
	----------------------------------------------------------------------------
	{
		name = "Go: Build Project",
		task = {
			name = "Build",
			type = "build",
			command = "go build ./...",
			cwd = "${wsdir}",
			quickfix_matcher = "go",
			save_buffers = true,
			if_running = "restart",
		},
	},
	{
		name = "Go: Build Current File",
		task = {
			name = "Build File",
			type = "build",
			command = "go build ${file}",
			cwd = "${filedir}",
			quickfix_matcher = "go",
			save_buffers = true,
			if_running = "restart",
		},
	},

	----------------------------------------------------------------------------
	-- STATIC ANALYSIS / LINTING
	----------------------------------------------------------------------------
	{
		name = "Lua: Lint Current File",
		task = {
			name = "Luacheck",
			type = "build",
			command = "luacheck ${file} --formatter plain --codes",
			cwd = "${filedir}",
			quickfix_matcher = "linter",
			save_buffers = true,
			if_running = "restart",
		},
	},
	{
		name = "TS: Type Check Project",
		task = {
			name = "Check",
			type = "build",
			command = "tsc --noEmit --pretty false",
			cwd = "${wsdir}",
			quickfix_matcher = "tsc",
			save_buffers = true,
			if_running = "restart",
		},
	},
	{
		name = "Python: Lint Current File",
		task = {
			name = "Pylint",
			type = "build",
			command = "pylint --output-format=parseable ${file}",
			cwd = "${filedir}",
			quickfix_matcher = "linter",
			save_buffers = true,
			if_running = "restart",
		},
	},
}
