app:
	hugo server --disableFastRender

dev_app:
	hugo server -D --disableFastRender

gitmodules:
	git submodule update --init