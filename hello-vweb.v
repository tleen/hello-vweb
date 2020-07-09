module main

import os
import vweb
import json

const (
	port = 8080
)

struct App {
pub mut:
	vweb vweb.Context
}

fn main() {
	mut p := port
	env_port := os.getenv('PORT')
	if env_port != '' {
		p = env_port.int()
	}
	vweb.run<App>(p)
}

// Even if we don't use the init methods, we need to have them.
pub fn (mut app App) init_once() {
	// This will be called on server initialization, once.
}

pub fn (mut app App) init() {
	// This will be called on every request.
}

// This will serve up the default route [/]
// vweb will look in the templates for a file that matches the method name and
// use that if present.
pub fn (app &App) index() vweb.Result {
	return $vweb.html()
}

// V web also allows for route parameters using a V attribute.
// The attributs(s) will be arguments for the method.
// Likewise vweb will resolve this method using a template.
['/:name']
pub fn (app &App) name(name string) vweb.Result {
	return $vweb.html()
}
