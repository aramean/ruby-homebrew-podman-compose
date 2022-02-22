default: install

install:
	@brew install --build-from-source podman-compose

uninstall:
	@brew uninstall podman-compose

test:
	@brew test podman-compose

audit:
	@brew audit --strict podman-compose
