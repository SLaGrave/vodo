// Entry point of vodo
module main

import os

fn main() {
	// Open todo.txt
	if !os.exists('./todo.txt') {
		os.create('./todo.txt')
	}
	// Get the command line arguments
	args := os.args.clone()
	match args[1] {
		// Add a task
		'add' { add(args) }
		// List tasks
		// 'ls', 'list' { ls(args) }
		else { println('Unexpected arguments') }
	}
}

// Add a task
fn add(args []string) {
	// Open file as append
	mut f := os.open_append('./todo.txt') or { panic(err) }
	defer { // Will close at end of command
		f.close()
	}
	// Get the task string
	// The 0th arg is the filename
	// The 1st arg is the 'add' command
	// The task text is all other args
	mut s := ''
	for i in 2 .. args.len {
		s = s + args[i]
		if i != args.len - 1 {
			s = s + ' '
		}
	}
	f.writeln(s)
}
