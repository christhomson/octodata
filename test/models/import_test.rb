require 'test_helper'

class ImportTest < ActiveSupport::TestCase
  setup do
    @import = imports(:joe_import)
  end

  test "requires a user id" do
    @import.user = nil

    refute @import.valid?, "Import should require a user id, but it didn't."
  end
end
