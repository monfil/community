defmodule CommunityWeb.NewsResolver do
  alias Community.News

  def all_links(_root, _args, _info) do
    links = News.list_links()
    {:ok, links}
  end

  def create_link(_root, args, _info) do
  	case News.create_link(args) do
  		{:ok, link} ->
  			{:ok, link}
  		_error ->
  			{:error, "Could not create link"}
  	end
  end

  def get_link(_root, %{id: id}, _info) do
  	case News.get_link!(id) do
  		nil ->
  			{:error, "Link ID #{id} not found"}
  		link ->
  			{:ok, link}
  	end
  end
end
