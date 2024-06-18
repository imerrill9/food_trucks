defmodule FoodTrucks.FoodTruckAPI do
  def fetch_data do
    case HTTPoison.get("https://data.sfgov.org/resource/rqzj-sfat.json") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        Jason.decode(body)

      {:ok, %HTTPoison.Response{status_code: code}} ->
        {:error, "Failed to fetch data. Status code: #{code}"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, "Failed to fetch data. Error: #{inspect(reason)}"}
    end
  end
end
