build:
	@v .
run:
	@./ldapqu
test:
	@export BASE=$$(pwd); v test tests
