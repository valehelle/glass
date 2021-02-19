defmodule GlassWeb.EducationView do
  use GlassWeb, :view

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

  
end
