defmodule ExVideo.Video do
  use ExVideo.Web, :model

  schema "videos" do
    field :url, :string
    field :title, :string
    field :description, :string
    belongs_to :category, ExVideo.Category

    timestamps
  end

  @required_fields ~w(url title)
  @optional_fields ~w(description category_id)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    # |> assoc_constraint(:category)
  end
end
