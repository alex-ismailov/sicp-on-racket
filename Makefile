install:
	raco pkg install sicp
	raco pkg install review

test-chap-1:
	raco test ./chapter-1

test-examples:
	raco test ./examples

lint:
	@echo "check codestyle"
	@(for f in $$(find ./chapter-1 -name '*.rkt'); do raco review $$f; done)

.PHONY: test
