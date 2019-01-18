# This test is for example purposes. You may remove it once it has served its purpose.
# More on the TestBench test framework for Ruby: https://github.com/ntl/test-bench/blob/master/README.adoc

require_relative './automated_init'

context "Database Connection" do
  session = MessageStore::Postgres::Session.build

  refute(session.connected?)

  test "Connects on first use" do
    refute proc { session.execute('SELECT 1;') } do
      raises_error?
    end
  end

  comment "This test is for example purposes. You may remove it once it has served its purpose."
end
