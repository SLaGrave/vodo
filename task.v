// Defines the task structure
module main

struct Task {
pub mut:
	text string
}

pub fn (task &Task) as_string() string {
	return task.text
}
