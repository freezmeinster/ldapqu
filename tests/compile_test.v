import os
import time

const (
	sport           = 12380
	exit_after_time = 12000 // milliseconds
	vexe            = os.getenv('VEXE')
	vweb_logfile    = os.getenv('VWEB_LOGFILE')
	vroot           = os.dir(vexe)
    base            = os.getenv("BASE")
	serverexe       = os.join_path(os.cache_dir(), 'ldapqu')
	tcp_r_timeout   = 30 * time.second
	tcp_w_timeout   = 30 * time.second
)

fn testsuite_begin() {
	os.chdir(vroot)
	if os.exists(serverexe) {
		os.rm(serverexe) or {}
	}
}

fn test_ldapqu_compiled() {
	did_server_compile := os.system('v -o $serverexe $base')
	assert did_server_compile == 0
	assert os.exists(serverexe)
}
