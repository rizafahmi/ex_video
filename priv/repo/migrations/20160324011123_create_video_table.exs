defmodule ExVideo.Repo.Migrations.CreateVideoTable do
  use Ecto.Migration

  def change do
    create table(:videos) do
      add :url, :string
      add :title, :string
      add :description, :text

      timestamps
    end
  end
end
