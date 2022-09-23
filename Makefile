.PHONY: lint
lint:
	@ shellcheck ./**/*.sh ./bin/{compile,detect} && echo "ShellCheck passed!"
