defmodule CashierAppTest do
  use ExUnit.Case
  doctest CashierApp

  test "basket GR1,SR1,GR1,GR1,CF1" do
    items = ["GR1", "SR1", "GR1", "GR1", "CF1"]

    assert CashierApp.total(items) == 22.45
  end

  test "basket GR1,GR1" do
    items = ["GR1", "GR1"]
    assert CashierApp.total(items) == 3.11
  end

  test "basket SR1,SR1,GR1,SR1" do
    items = ["SR1", "SR1", "GR1", "SR1"]

    assert CashierApp.total(items) == 16.61
  end

  test "basket GR1,CF1,SR1,CF1,CF1" do
    items = ["GR1", "CF1", "SR1", "CF1", "CF1"]

    assert CashierApp.total(items) == 30.57
  end
end
