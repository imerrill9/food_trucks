defmodule FoodTrucksWeb.FoodTrucksLive do
  use Phoenix.LiveView

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :food_trucks, load_food_trucks(""), :filter, "")}
  end

  @impl true
  def handle_event("filter", %{"query" => query}, socket) do
    {:noreply, assign(socket, :food_trucks, load_food_trucks(query), :filter, query)}
  end

  defp load_food_trucks(query) do
    FoodTrucks.FoodTruckAPI.fetch_data()
    |> case do
      {:ok, food_trucks} ->
        filter_food_trucks(food_trucks, query)

      {:error, _} ->
        []
    end
  end

  defp filter_food_trucks(food_trucks, query) do
    Enum.filter(food_trucks, fn truck ->
      String.contains?(truck["fooditems"], query)
    end)
  end
end
