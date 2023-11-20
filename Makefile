install:
	raco pkg install sicp
	raco pkg install review

test-chap-1:
	raco test ./сhapter-1

lint:
	@echo "check codestyle"
	@(for f in $$(find ./сhapter-1 -name '*.rkt'); do raco review $$f; done)

.PHONY: test
