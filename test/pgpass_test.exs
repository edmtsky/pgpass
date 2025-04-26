defmodule PgpassTest do
  use ExUnit.Case
  doctest Pgpass
  @sample_pgpass "./test/samples/pgpass"

  test "fetch_password success" do
    assert Pgpass.find_password("user1", @sample_pgpass) == "password_1"
  end

  test "fetch_password fail" do
    assert Pgpass.find_password("non-exists-user", @sample_pgpass) == nil
  end
end
