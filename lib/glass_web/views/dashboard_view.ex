defmodule GlassWeb.DashboardView do
  use GlassWeb, :view
  def country_name(country_code) do
    case Countriex.get_by(:alpha2, country_code) do
      %Countriex.Country{name: name} -> name
      nil -> ""
    end
  end
  
end
