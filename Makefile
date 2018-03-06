test_42:
	BUNDLE_GEMFILE=gemfiles/Gemfile-4-2 bundle
	BUNDLE_GEMFILE=gemfiles/Gemfile-4-2 rake test
test_50:
	BUNDLE_GEMFILE=gemfiles/Gemfile-5-0 bundle
	BUNDLE_GEMFILE=gemfiles/Gemfile-5-0 rake test
test_51:
	BUNDLE_GEMFILE=gemfiles/Gemfile-5-1 bundle
	BUNDLE_GEMFILE=gemfiles/Gemfile-5-1 rake test
test_master:
	bundle
	rake test
test: test_master test_42 test_50 test_51
