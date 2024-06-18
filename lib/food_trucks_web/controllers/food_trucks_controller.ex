defmodule FoodTrucksWeb.FoodTrucksController do
  use FoodTrucksWeb, :controller

  def index(conn, _params) do
    case FoodTrucks.FoodTruckAPI.fetch_data() do
      {:ok, food_trucks} ->
        render(conn, :index, food_trucks: food_trucks)

      {:error, reason} ->
        conn
        |> put_status(:bad_gateway)
        |> json(%{error: reason})
    end
  end
end
