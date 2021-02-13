defmodule GlassWeb.BasicView do
  use GlassWeb, :view

  def list_country() do
    Enum.map(Countriex.all, fn country -> {country.name, country.alpha2} end)
  end
end
