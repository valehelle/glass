defmodule GlassWeb.DashboardView do
  use GlassWeb, :view
  def country_name(country_code) do
    case Countriex.get_by(:alpha2, country_code) do
      %Countriex.Country{name: name} -> name
      nil -> ""
    end
  end

  def get_language(language) do
    profiencies = [
      "Beginner",
      "Intermediate",
      "Professional",
      "Native",
    ]
    {language, _} = List.pop_at(profiencies, language - 1)
    language
  end


  def get_skill(skill) do
    profiencies = [
      "Daily experience",
      "Experienced",
      "Used in the past",
      "Interests and Curiosity"
    ]
    {skill, _} = List.pop_at(profiencies, skill - 1)
    skill
  end

  def get_link_name(user) do
    if user.repository_token == "" do 
      "Connect" 
    else "Refresh"
    end
  end
  



  
end
