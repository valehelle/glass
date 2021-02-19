defmodule GlassWeb.ResumeController do
  use GlassWeb, :controller
  alias Glass.Profile
  alias Glass.Accounts
  
  def json_resp(conn, _params) do
    user = conn.assigns.current_user
    projects = Enum.map(user.projects, fn project -> %{"name" => project.name, "keywords" => get_keywords(project.keywords), "description" => project.description} end)
    skills = Enum.map(user.skills, fn skill -> %{"name" => skill.name, "level" => get_skill(skill.level) } end)
    educations = Enum.map(user.educations, fn education -> %{"institution" => education.institution, "start_date" => education.start_date, "end_date" => education.end_date} end)
    works = Enum.map(user.works, fn work -> %{"name" => work.name, "description" => work.description, "start_date" => work.start_date, "end_date" => work.end_date, "position" => work.position} end)
    languages = Enum.map(user.languages, fn language -> %{"name" => language.name, "fluency" => get_language(language.fluency)} end)

    resume = %{
      basic: %{
        email: user.email,
        name: user.basic.name,
        image: user.basic.image,
        phone: user.basic.phone,
        summary: user.basic.summary,
        location: %{
          address: user.basic.loc_address,
          postalCode: user.basic.loc_postal_code,
          city: user.basic.loc_city,
          countryCode: user.basic.loc_country_code,
          region: user.basic.loc_region
        }
      },
      projects: projects,
      skills: skills,
      works: works,
      education: educations,
      languages: languages,

    }
     json conn, resume
  end

  defp get_keywords(keywords) do
    Enum.map(keywords, fn keyword ->  keyword.description end)
  end

  defp get_skill(skill) do
    profiencies = [
      "Daily experience",
      "Experienced",
      "Used in the past",
      "Interests and Curiosity"
    ]
    {skill, _} = List.pop_at(profiencies, skill - 1)
    skill
  end

  defp get_language(language) do
    profiencies = [
      "Beginner",
      "Intermediate",
      "Professional",
      "Native",
    ]
    {language, _} = List.pop_at(profiencies, language - 1)
    language
  end

  def index(conn, _) do
    user = conn.assigns.current_user
    render(conn, "index.html", user: user)
  end


end
