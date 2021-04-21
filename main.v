import vweb

struct App {
    vweb.Context
}



[post]
['/hello/:user']
fn (mut app App) hello_user(user string) vweb.Result {
    return app.text('Hello $user')
}

fn main() {
	vweb.run<App>(8080)
}
