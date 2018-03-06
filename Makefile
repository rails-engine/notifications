test_50:
	BUNDLE_GEMFILE=gemfiles/Gemfile-5-0 bundle
	BUNDLE_GEMFILE=gemfiles/Gemfile-5-0 rake test
test_51:
	BUNDLE_GEMFILE=gemfiles/Gemfile-5-1 bundle
	BUNDLE_GEMFILE=gemfiles/Gemfile-5-1 rake test
test_52:
	BUNDLE_GEMFILE=gemfiles/Gemfile-5-2 bundle
	BUNDLE_GEMFILE=gemfiles/Gemfile-5-2 rake test
test: test_52 test_50 test_51
