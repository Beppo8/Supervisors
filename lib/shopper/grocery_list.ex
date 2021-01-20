defmodule Shopper.GroceryList do
  use Agent, restart: :temporary

  def start_link(_args) do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def add(item) do
    Agent.update(__MODULE__, fn(list) -> [item|list] end)
  end

  def view do
    Agent.get(__MODULE__, fn(list) -> list end)
  end

  def boom do
    Agent.get(__MODULE__, fn(_list) -> 1 + "1" end)
  end

end
