defmodule ExVideo.Repo do
  # use Ecto.Repo, otp_app: :ex_video

  def all(ExVideo.User) do
    [%ExVideo.User{id: "1", name: "Riza Fahmi", username: "riza", password: "elixir"},
      %ExVideo.User{id: "2", name: "Haaris Ramadhan", username: "haaris", password: "elixir"}
    ]
  end

  def all(_module) do
    []
  end

  def get(module, id) do
    IO.inspect module

    Enum.find all(module), fn map ->
      map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} ->
        Map.get(map, key) == val end)
    end
  end
end
