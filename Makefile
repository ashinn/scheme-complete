
.PHONY: test dist

test:
	./run-tests.sh

dist:
	gzip -c scheme-complete.el > scheme-complete-$$(perl -ne 's/^;*\s*Version:\s*//&&print' scheme-complete.el).el.gz
	scp scheme-complete-$$(perl -ne 's/^;*\s*Version:\s*//&&print' scheme-complete.el).el.gz synthcode.com:www/chibi-scheme/examples/synthcode/emacs/
	echo "uploaded scheme-complete-$$(perl -ne 's/^;*\s*Version:\s*//&&print' scheme-complete.el).el.gz, don't forget to update the news"
