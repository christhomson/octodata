require 'test_helper'

class ActivityHelperTest < ActionView::TestCase
  test "#short_sha should be shorter than a full sha" do
    sha = commits(:rails).sha
    assert_operator short_sha(sha), :<, sha
  end
end
