ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ExVideo.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ExVideo.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ExVideo.Repo)

