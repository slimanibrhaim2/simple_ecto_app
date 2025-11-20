defmodule SimpleEctoAppTest do
  use ExUnit.Case
  doctest SimpleEctoApp

  test "greets the world" do
    assert SimpleEctoApp.hello() == :world
  end
end
