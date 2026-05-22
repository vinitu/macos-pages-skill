.PHONY: dictionary dictionary-pages dictionary-standard compile check test test-dictionary test-smoke

dictionary:
	@printf '### Pages.app\n'
	@sdef /Applications/Pages.app
	@printf '\n### CocoaStandard.sdef\n'
	@cat /System/Library/ScriptingDefinitions/CocoaStandard.sdef

dictionary-pages:
	@sdef /Applications/Pages.app

dictionary-standard:
	@cat /System/Library/ScriptingDefinitions/CocoaStandard.sdef

compile:
	@set -euo pipefail; \
	find scripts/applescripts -name '*.applescript' -print | while IFS= read -r file; do \
		osacompile -o /tmp/$$(echo "$$file" | tr '/' '_' | sed 's/\.applescript$$/.scpt/') "$$file" || echo "warning: osacompile failed for $$file"; \
	done; \
	find scripts/tests scripts/commands -name '*.sh' -print | while IFS= read -r file; do \
		bash -n "$$file" || exit 1; \
	done

check:
	@osascript -e 'tell application "Pages" to get name' >/dev/null || { echo "check: Pages not available"; exit 1; }
	@echo "Pages is available"

test: test-dictionary test-smoke

test-dictionary:
	@bash scripts/tests/dictionary_contract.sh

test-smoke:
	@bash scripts/tests/smoke_pages.sh
