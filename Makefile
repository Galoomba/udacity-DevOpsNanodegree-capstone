hadolint:
	hadolint dockerfile

tidy: 
	tidy -q -e *.html

lint: hadolint tidy