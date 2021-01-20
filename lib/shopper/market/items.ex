defmodule Shopper.Market.Items do
  use Agent

  @items ~w(bread eggs cream coffee apples)

  def start_link(_args) do
    Agent.start_link(fn -> @items end, name: __MODULE__)
  end

  def all do
    Agent.get(__MODULE__, fn(list) -> list end)
  end

  def available?(item) do
    Agent.get(__MODULE__, fn(list) -> Enum.member?(list, item) end)
  end

end
