defmodule ExVideo.VideoController do
  use ExVideo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

end
