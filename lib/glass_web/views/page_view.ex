defmodule GlassWeb.PageView do
  use GlassWeb, :view

  def country_name(country_code) do
    %Countriex.Country{name: name} = Countriex.get_by(:alpha2, country_code) 
    name 
  end
end
