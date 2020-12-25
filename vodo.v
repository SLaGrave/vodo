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
		'ls', 'list' { ls(args) }
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

	task := Task{
		text: args[2]
	}
	f.writeln(task.as_string())
	println("TODO: '$task.as_string()' added on line [N]")
}

// List tasks
fn ls(args []string) {
	// Get the tasks
	tasks := os.read_lines('./todo.txt') or { panic(err) }
	for i, task in tasks {
		println('${i+1:02} $task')
	}
}
