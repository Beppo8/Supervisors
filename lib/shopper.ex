defmodule Shopper do
  @moduledoc """
  Documentation for Shopper.
  """
  alias Shopper.GroceryList
  alias Shopper.Market.Items

  def add_item(item) do
    if Items.available?(item) do
      GroceryList.add(item)
      {:ok, "Item was added"}
    else
      {:error, "Item not available"}
    end
  end

  def view_list do
    GroceryList.view
  end

  def items_available do
    Items.all
  end

end
