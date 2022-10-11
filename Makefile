.PHONY: lint
lint:
	@ shellcheck ./**/*.sh ./bin/{compile,detect,start-cloud-sql-proxy} && echo "ShellCheck passed!"
