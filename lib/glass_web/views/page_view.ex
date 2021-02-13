defmodule GlassWeb.PageView do
  use GlassWeb, :view

  def country_name(country_code) do
    case Countriex.get_by(:alpha2, country_code) do
      %Countriex.Country{name: name} -> name
      nil -> ""
    end
  end
  
  def get_date(date) do
    months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ]
    {month, _} = List.pop_at(months, date.month - 1)
    "#{month} #{date.year}"
  end

  def get_language(language) do
    profiencies = [
      "Beginner",
      "Intermediate",
      "Proficient",
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

end
