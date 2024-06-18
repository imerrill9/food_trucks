defmodule FoodTrucksWeb.FoodTrucksLive do
  use Phoenix.LiveView
  alias FoodTrucks.FoodTruckAPI

  @impl true
  def mount(_params, _session, socket) do
    case FoodTruckAPI.fetch_data() do
      {:ok, food_trucks} ->
        socket = assign(socket, original_food_trucks: food_trucks, food_trucks: food_trucks, filter: "")
        socket = put_root_layout(socket, {FoodTrucksWeb.LayoutView, "app.html"})
        {:ok, socket}

      {:error, _reason} ->
        socket = assign(socket, original_food_trucks: [], food_trucks: [], filter: "")
        socket = put_root_layout(socket, {FoodTrucksWeb.LayoutView, "app.html"})
        {:ok, socket}
    end
  end

  @impl true
  def handle_event("filter", %{"value" => query}, socket) do
    filtered_trucks = apply_filter(socket.assigns.original_food_trucks, query)

    socket =
      socket
      |> assign(:food_trucks, filtered_trucks)
      |> assign(:filter, query)

    {:noreply, socket}
  end

  defp apply_filter(food_trucks, query) do
    if query == "" do
      food_trucks
    else
      Enum.filter(food_trucks, fn truck ->
        fooditems = Map.get(truck, "fooditems", "")
        String.contains?(String.downcase(fooditems), String.downcase(query))
      end)
    end
  end
end
