defmodule Glass.Profile do
  @moduledoc """
  The Profile context.
  """

  import Ecto.Query, warn: false
  alias Glass.Repo

  alias Glass.Profile.Basic

  @doc """
  Returns the list of basics.

  ## Examples

      iex> list_basics()
      [%Basic{}, ...]

  """
  def list_basics do
    Repo.all(Basic)
  end

  @doc """
  Gets a single basic.

  Raises `Ecto.NoResultsError` if the Basic does not exist.

  ## Examples

      iex> get_basic!(123)
      %Basic{}

      iex> get_basic!(456)
      ** (Ecto.NoResultsError)

  """
  def get_basic!(id), do: Repo.get!(Basic, id)

  @doc """
  Creates a basic.

  ## Examples

      iex> create_basic(%{field: value})
      {:ok, %Basic{}}

      iex> create_basic(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_basic(attrs \\ %{}) do
    %Basic{}
    |> Basic.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a basic.

  ## Examples

      iex> update_basic(basic, %{field: new_value})
      {:ok, %Basic{}}

      iex> update_basic(basic, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_basic(%Basic{} = basic, attrs) do
    basic
    |> Basic.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a basic.

  ## Examples

      iex> delete_basic(basic)
      {:ok, %Basic{}}

      iex> delete_basic(basic)
      {:error, %Ecto.Changeset{}}

  """
  def delete_basic(%Basic{} = basic) do
    Repo.delete(basic)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking basic changes.

  ## Examples

      iex> change_basic(basic)
      %Ecto.Changeset{data: %Basic{}}

  """
  def change_basic(%Basic{} = basic, attrs \\ %{}) do
    Basic.changeset(basic, attrs)
  end

  alias Glass.Profile.Work

  @doc """
  Returns the list of works.

  ## Examples

      iex> list_works()
      [%Work{}, ...]

  """
  def list_works do
    Repo.all(Work)
  end

  @doc """
  Gets a single work.

  Raises `Ecto.NoResultsError` if the Work does not exist.

  ## Examples

      iex> get_work!(123)
      %Work{}

      iex> get_work!(456)
      ** (Ecto.NoResultsError)

  """
  def get_work!(id), do: Repo.get!(Work, id)

  @doc """
  Creates a work.

  ## Examples

      iex> create_work(%{field: value})
      {:ok, %Work{}}

      iex> create_work(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_work(attrs \\ %{}) do
    %Work{}
    |> Work.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a work.

  ## Examples

      iex> update_work(work, %{field: new_value})
      {:ok, %Work{}}

      iex> update_work(work, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_work(%Work{} = work, attrs) do
    work
    |> Work.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a work.

  ## Examples

      iex> delete_work(work)
      {:ok, %Work{}}

      iex> delete_work(work)
      {:error, %Ecto.Changeset{}}

  """
  def delete_work(%Work{} = work) do
    Repo.delete(work)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking work changes.

  ## Examples

      iex> change_work(work)
      %Ecto.Changeset{data: %Work{}}

  """
  def change_work(%Work{} = work, attrs \\ %{}) do
    Work.changeset(work, attrs)
  end

  alias Glass.Profile.Education

  @doc """
  Returns the list of educations.

  ## Examples

      iex> list_educations()
      [%Education{}, ...]

  """
  def list_educations do
    Repo.all(Education)
  end

  @doc """
  Gets a single education.

  Raises `Ecto.NoResultsError` if the Education does not exist.

  ## Examples

      iex> get_education!(123)
      %Education{}

      iex> get_education!(456)
      ** (Ecto.NoResultsError)

  """
  def get_education!(id), do: Repo.get!(Education, id) |> Repo.preload(:user)

  @doc """
  Creates a education.

  ## Examples

      iex> create_education(%{field: value})
      {:ok, %Education{}}

      iex> create_education(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_education(attrs \\ %{}, user) do
    %Education{}
    |> Education.changeset(attrs, user)
    |> Repo.insert()
  end

  @doc """
  Updates a education.

  ## Examples

      iex> update_education(education, %{field: new_value})
      {:ok, %Education{}}

      iex> update_education(education, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_education(%Education{} = education, attrs, user) do
    education
    |> Education.changeset(attrs, user)
    |> Repo.update()
  end

  @doc """
  Deletes a education.

  ## Examples

      iex> delete_education(education)
      {:ok, %Education{}}

      iex> delete_education(education)
      {:error, %Ecto.Changeset{}}

  """
  def delete_education(%Education{} = education) do
    Repo.delete(education)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking education changes.

  ## Examples

      iex> change_education(education)
      %Ecto.Changeset{data: %Education{}}

  """
  def change_education(%Education{} = education, attrs \\ %{}) do
    Education.changeset(education, attrs)
  end

  alias Glass.Profile.Skill

  @doc """
  Returns the list of skills.

  ## Examples

      iex> list_skills()
      [%Skill{}, ...]

  """
  def list_skills do
    Repo.all(Skill)
  end

  @doc """
  Gets a single skill.

  Raises `Ecto.NoResultsError` if the Skill does not exist.

  ## Examples

      iex> get_skill!(123)
      %Skill{}

      iex> get_skill!(456)
      ** (Ecto.NoResultsError)

  """
  def get_skill!(id), do: Repo.get!(Skill, id)

  @doc """
  Creates a skill.

  ## Examples

      iex> create_skill(%{field: value})
      {:ok, %Skill{}}

      iex> create_skill(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_skill(attrs \\ %{}) do
    %Skill{}
    |> Skill.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a skill.

  ## Examples

      iex> update_skill(skill, %{field: new_value})
      {:ok, %Skill{}}

      iex> update_skill(skill, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_skill(%Skill{} = skill, attrs) do
    skill
    |> Skill.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a skill.

  ## Examples

      iex> delete_skill(skill)
      {:ok, %Skill{}}

      iex> delete_skill(skill)
      {:error, %Ecto.Changeset{}}

  """
  def delete_skill(%Skill{} = skill) do
    Repo.delete(skill)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking skill changes.

  ## Examples

      iex> change_skill(skill)
      %Ecto.Changeset{data: %Skill{}}

  """
  def change_skill(%Skill{} = skill, attrs \\ %{}) do
    Skill.changeset(skill, attrs)
  end

  alias Glass.Profile.Language

  @doc """
  Returns the list of languages.

  ## Examples

      iex> list_languages()
      [%Language{}, ...]

  """
  def list_languages do
    Repo.all(Language)
  end

  @doc """
  Gets a single language.

  Raises `Ecto.NoResultsError` if the Language does not exist.

  ## Examples

      iex> get_language!(123)
      %Language{}

      iex> get_language!(456)
      ** (Ecto.NoResultsError)

  """
  def get_language!(id), do: Repo.get!(Language, id) |> Repo.preload(:user)

  @doc """
  Creates a language.

  ## Examples

      iex> create_language(%{field: value})
      {:ok, %Language{}}

      iex> create_language(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_language(attrs \\ %{}, user) do
    %Language{}
    |> Language.changeset(attrs, user)
    |> Repo.insert()
  end

  @doc """
  Updates a language.

  ## Examples

      iex> update_language(language, %{field: new_value})
      {:ok, %Language{}}

      iex> update_language(language, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_language(%Language{} = language, attrs, user) do
    language
    |> Language.changeset(attrs, user)
    |> Repo.update()
  end

  @doc """
  Deletes a language.

  ## Examples

      iex> delete_language(language)
      {:ok, %Language{}}

      iex> delete_language(language)
      {:error, %Ecto.Changeset{}}

  """
  def delete_language(%Language{} = language) do
    Repo.delete(language)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking language changes.

  ## Examples

      iex> change_language(language)
      %Ecto.Changeset{data: %Language{}}

  """
  def change_language(%Language{} = language, attrs \\ %{}) do
    Language.changeset(language, attrs)
  end

  alias Glass.Profile.Project

  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Project{}, ...]

  """
  def list_projects do
    Repo.all(Project)
  end

  @doc """
  Gets a single project.

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project!(123)
      %Project{}

      iex> get_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project!(id), do: Repo.get!(Project, id)

  @doc """
  Creates a project.

  ## Examples

      iex> create_project(%{field: value})
      {:ok, %Project{}}

      iex> create_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  def add_projects(user, attrs \\ %{}) do
    attrs = Enum.map(attrs, fn project -> 
    %{"description" => description,  "name" => name, "url" => url} = project
    %{"repositoryTopics" => %{"nodes" => nodes}} = project
    topics = Enum.map(nodes, fn node -> 
      %{"topic" => %{"name" => name}} = node
      %{"description" => name}
    end)
    
    %{"description" => description, "name" => name, "url" => url, "keywords" => topics, "user_id" => user.id}
    
    end)

    from(p in Project, where: p.user_id == ^user.id) |> Repo.delete_all


    Repo.transaction(fn ->
      Enum.each(attrs, fn project_attr -> 
        create_project(project_attr)
      end)
      
    end)
  end

  @doc """
  Updates a project.

  ## Examples

      iex> update_project(project, %{field: new_value})
      {:ok, %Project{}}

      iex> update_project(project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project.

  ## Examples

      iex> delete_project(project)
      {:ok, %Project{}}

      iex> delete_project(project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project(%Project{} = project) do
    Repo.delete(project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project changes.

  ## Examples

      iex> change_project(project)
      %Ecto.Changeset{data: %Project{}}

  """
  def change_project(%Project{} = project, attrs \\ %{}) do
    Project.changeset(project, attrs)
  end

  alias Glass.Profile.Highlight

  @doc """
  Returns the list of highlights.

  ## Examples

      iex> list_highlights()
      [%Highlight{}, ...]

  """
  def list_highlights do
    Repo.all(Highlight)
  end

  @doc """
  Gets a single highlight.

  Raises `Ecto.NoResultsError` if the Highlight does not exist.

  ## Examples

      iex> get_highlight!(123)
      %Highlight{}

      iex> get_highlight!(456)
      ** (Ecto.NoResultsError)

  """
  def get_highlight!(id), do: Repo.get!(Highlight, id)

  @doc """
  Creates a highlight.

  ## Examples

      iex> create_highlight(%{field: value})
      {:ok, %Highlight{}}

      iex> create_highlight(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_highlight(attrs \\ %{}) do
    %Highlight{}
    |> Highlight.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a highlight.

  ## Examples

      iex> update_highlight(highlight, %{field: new_value})
      {:ok, %Highlight{}}

      iex> update_highlight(highlight, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_highlight(%Highlight{} = highlight, attrs) do
    highlight
    |> Highlight.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a highlight.

  ## Examples

      iex> delete_highlight(highlight)
      {:ok, %Highlight{}}

      iex> delete_highlight(highlight)
      {:error, %Ecto.Changeset{}}

  """
  def delete_highlight(%Highlight{} = highlight) do
    Repo.delete(highlight)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking highlight changes.

  ## Examples

      iex> change_highlight(highlight)
      %Ecto.Changeset{data: %Highlight{}}

  """
  def change_highlight(%Highlight{} = highlight, attrs \\ %{}) do
    Highlight.changeset(highlight, attrs)
  end

  alias Glass.Profile.Keyword

  @doc """
  Returns the list of keywords.

  ## Examples

      iex> list_keywords()
      [%Keyword{}, ...]

  """
  def list_keywords do
    Repo.all(Keyword)
  end

  @doc """
  Gets a single keyword.

  Raises `Ecto.NoResultsError` if the Keyword does not exist.

  ## Examples

      iex> get_keyword!(123)
      %Keyword{}

      iex> get_keyword!(456)
      ** (Ecto.NoResultsError)

  """
  def get_keyword!(id), do: Repo.get!(Keyword, id)

  @doc """
  Creates a keyword.

  ## Examples

      iex> create_keyword(%{field: value})
      {:ok, %Keyword{}}

      iex> create_keyword(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_keyword(attrs \\ %{}) do
    %Keyword{}
    |> Keyword.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a keyword.

  ## Examples

      iex> update_keyword(keyword, %{field: new_value})
      {:ok, %Keyword{}}

      iex> update_keyword(keyword, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_keyword(%Keyword{} = keyword, attrs) do
    keyword
    |> Keyword.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a keyword.

  ## Examples

      iex> delete_keyword(keyword)
      {:ok, %Keyword{}}

      iex> delete_keyword(keyword)
      {:error, %Ecto.Changeset{}}

  """
  def delete_keyword(%Keyword{} = keyword) do
    Repo.delete(keyword)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking keyword changes.

  ## Examples

      iex> change_keyword(keyword)
      %Ecto.Changeset{data: %Keyword{}}

  """
  def change_keyword(%Keyword{} = keyword, attrs \\ %{}) do
    Keyword.changeset(keyword, attrs)
  end

  alias Glass.Profile.Blog

  @doc """
  Returns the list of blogs.

  ## Examples

      iex> list_blogs()
      [%Blog{}, ...]

  """
  def list_blogs do
    Repo.all(Blog)
  end

  @doc """
  Gets a single blog.

  Raises `Ecto.NoResultsError` if the Blog does not exist.

  ## Examples

      iex> get_blog!(123)
      %Blog{}

      iex> get_blog!(456)
      ** (Ecto.NoResultsError)

  """
  def get_blog!(id), do: Repo.get!(Blog, id)

  @doc """
  Creates a blog.

  ## Examples

      iex> create_blog(%{field: value})
      {:ok, %Blog{}}

      iex> create_blog(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_blog(attrs \\ %{}) do
    %Blog{}
    |> Blog.changeset(attrs)
    |> Repo.insert()
  end

   def add_blogs(user, attrs \\ %{}) do

    from(b in Blog, where: b.user_id == ^user.id) |> Repo.delete_all

    Repo.transaction(fn ->
      Enum.each(attrs, fn blog_attr -> 
        blog_attr = Map.merge(blog_attr, %{"user_id" => user.id})
        create_blog(blog_attr) 
      end)
      
    end)
  end

  @doc """
  Updates a blog.

  ## Examples

      iex> update_blog(blog, %{field: new_value})
      {:ok, %Blog{}}

      iex> update_blog(blog, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_blog(%Blog{} = blog, attrs) do
    blog
    |> Blog.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a blog.

  ## Examples

      iex> delete_blog(blog)
      {:ok, %Blog{}}

      iex> delete_blog(blog)
      {:error, %Ecto.Changeset{}}

  """
  def delete_blog(%Blog{} = blog) do
    Repo.delete(blog)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking blog changes.

  ## Examples

      iex> change_blog(blog)
      %Ecto.Changeset{data: %Blog{}}

  """
  def change_blog(%Blog{} = blog, attrs \\ %{}) do
    Blog.changeset(blog, attrs)
  end
end
