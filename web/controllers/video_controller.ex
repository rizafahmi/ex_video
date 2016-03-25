defmodule ExVideo.VideoController do
  use ExVideo.Web, :controller
  alias ExVideo.Video
  alias ExVideo.Category

  plug :scrub_params, "video" when action in [:create, :update]

  def index(conn, _params) do
    videos = Repo.all from v in Video,
      join: c in assoc(v, :category),
      preload: [:category]
    render(conn, "index.html", videos: videos)
  end

  def new(conn, _params) do
    changeset = Video.changeset(%Video{})
    query = from c in Category, order_by: c.name
    query = from c in query, select: {c.name, c.id}
    categories = Repo.all query
    render(conn, "new.html", changeset: changeset, categories: categories)
  end

  def create(conn, %{"video" => video_params}) do
    changeset = Video.changeset(%Video{}, video_params)

    case Repo.insert(changeset) do
      {:ok, _video} ->
        conn
        |> put_flash(:info, "Video created successfully.")
        |> redirect(to: video_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    video = Repo.get!(Video, id)

    Repo.delete!(video)

    conn
    |> put_flash(:info, "Video has been removed")
    |> redirect(to: video_path(conn, :index))

  end

  def show(conn, %{"id" => id}) do
    video = Repo.get!(Video, id)

    render(conn, "show.html", video: video)
  end

end
