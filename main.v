module main

import vweb
import os
import time

struct App {
    vweb.Context
    port    int
    timeout int
}



[post]
['/hello/:user']
fn (mut app App) hello_user(user string) vweb.Result {
    return app.text('Hello $user')
}

fn main() {
    if os.args.len != 2 {
        panic('Usage: `ldapqu PORT`')
    }
    http_port := os.args[1].int()
    mut app := App{
        port: http_port
        timeout: 10
    }
	vweb.run_app<App>(mut app, http_port)
}

pub fn (mut app App) init() {
}

pub fn (mut app App) init_once() {
	eprintln('>> webserver: started on http://127.0.0.1:$app.port/ , with maximum runtime of $app.timeout milliseconds.')
}

fn (mut app App) gracefull_exit() {
	eprintln('>> webserver: gracefull_exit')
	time.sleep(10)
	exit(0)
}
