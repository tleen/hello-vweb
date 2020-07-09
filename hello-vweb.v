module main

import os
import vweb

const (
	port = 8080
)

// This is necessary to contain all the structure of the web application.
// vweb reqires some struct with the vweb vweb.Context to be passed to vweb.run.
struct App {
pub mut:
	vweb vweb.Context
}

// V is going to look to run this main function in the "main" module.
fn main() {
	// If you want to use a hard-coded port, this part is unnecessary.
	// However it is common for PORT to be set as an env var in deployments.
	mut p := port
	env_port := os.getenv('PORT')
	if env_port != '' {
		p = env_port.int()
	}
	vweb.run<App>(p)
}

// Even if we don't use the init methods, we still need to have them exist.
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
