defmodule Glass.ProfileTest do
  use Glass.DataCase

  alias Glass.Profile

  describe "basics" do
    alias Glass.Profile.Basic

    @valid_attrs %{dev_username: "some dev_username", email: "some email", github_usename: "some github_usename", image: "some image", label: "some label", loc_address: "some loc_address", loc_city: "some loc_city", loc_country_code: "some loc_country_code", loc_postal_code: "some loc_postal_code", loc_region: "some loc_region", name: "some name", phone: "some phone", summary: "some summary", twitter_username: "some twitter_username", url: "some url"}
    @update_attrs %{dev_username: "some updated dev_username", email: "some updated email", github_usename: "some updated github_usename", image: "some updated image", label: "some updated label", loc_address: "some updated loc_address", loc_city: "some updated loc_city", loc_country_code: "some updated loc_country_code", loc_postal_code: "some updated loc_postal_code", loc_region: "some updated loc_region", name: "some updated name", phone: "some updated phone", summary: "some updated summary", twitter_username: "some updated twitter_username", url: "some updated url"}
    @invalid_attrs %{dev_username: nil, email: nil, github_usename: nil, image: nil, label: nil, loc_address: nil, loc_city: nil, loc_country_code: nil, loc_postal_code: nil, loc_region: nil, name: nil, phone: nil, summary: nil, twitter_username: nil, url: nil}

    def basic_fixture(attrs \\ %{}) do
      {:ok, basic} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Profile.create_basic()

      basic
    end

    test "list_basics/0 returns all basics" do
      basic = basic_fixture()
      assert Profile.list_basics() == [basic]
    end

    test "get_basic!/1 returns the basic with given id" do
      basic = basic_fixture()
      assert Profile.get_basic!(basic.id) == basic
    end

    test "create_basic/1 with valid data creates a basic" do
      assert {:ok, %Basic{} = basic} = Profile.create_basic(@valid_attrs)
      assert basic.dev_username == "some dev_username"
      assert basic.email == "some email"
      assert basic.github_usename == "some github_usename"
      assert basic.image == "some image"
      assert basic.label == "some label"
      assert basic.loc_address == "some loc_address"
      assert basic.loc_city == "some loc_city"
      assert basic.loc_country_code == "some loc_country_code"
      assert basic.loc_postal_code == "some loc_postal_code"
      assert basic.loc_region == "some loc_region"
      assert basic.name == "some name"
      assert basic.phone == "some phone"
      assert basic.summary == "some summary"
      assert basic.twitter_username == "some twitter_username"
      assert basic.url == "some url"
    end

    test "create_basic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_basic(@invalid_attrs)
    end

    test "update_basic/2 with valid data updates the basic" do
      basic = basic_fixture()
      assert {:ok, %Basic{} = basic} = Profile.update_basic(basic, @update_attrs)
      assert basic.dev_username == "some updated dev_username"
      assert basic.email == "some updated email"
      assert basic.github_usename == "some updated github_usename"
      assert basic.image == "some updated image"
      assert basic.label == "some updated label"
      assert basic.loc_address == "some updated loc_address"
      assert basic.loc_city == "some updated loc_city"
      assert basic.loc_country_code == "some updated loc_country_code"
      assert basic.loc_postal_code == "some updated loc_postal_code"
      assert basic.loc_region == "some updated loc_region"
      assert basic.name == "some updated name"
      assert basic.phone == "some updated phone"
      assert basic.summary == "some updated summary"
      assert basic.twitter_username == "some updated twitter_username"
      assert basic.url == "some updated url"
    end

    test "update_basic/2 with invalid data returns error changeset" do
      basic = basic_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_basic(basic, @invalid_attrs)
      assert basic == Profile.get_basic!(basic.id)
    end

    test "delete_basic/1 deletes the basic" do
      basic = basic_fixture()
      assert {:ok, %Basic{}} = Profile.delete_basic(basic)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_basic!(basic.id) end
    end

    test "change_basic/1 returns a basic changeset" do
      basic = basic_fixture()
      assert %Ecto.Changeset{} = Profile.change_basic(basic)
    end
  end

  describe "works" do
    alias Glass.Profile.Work

    @valid_attrs %{description: "some description", end_date: "2010-04-17T14:00:00Z", location: "some location", name: "some name", position: "some position", start_date: "2010-04-17T14:00:00Z", summary: "some summary", url: "some url"}
    @update_attrs %{description: "some updated description", end_date: "2011-05-18T15:01:01Z", location: "some updated location", name: "some updated name", position: "some updated position", start_date: "2011-05-18T15:01:01Z", summary: "some updated summary", url: "some updated url"}
    @invalid_attrs %{description: nil, end_date: nil, location: nil, name: nil, position: nil, start_date: nil, summary: nil, url: nil}

    def work_fixture(attrs \\ %{}) do
      {:ok, work} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Profile.create_work()

      work
    end

    test "list_works/0 returns all works" do
      work = work_fixture()
      assert Profile.list_works() == [work]
    end

    test "get_work!/1 returns the work with given id" do
      work = work_fixture()
      assert Profile.get_work!(work.id) == work
    end

    test "create_work/1 with valid data creates a work" do
      assert {:ok, %Work{} = work} = Profile.create_work(@valid_attrs)
      assert work.description == "some description"
      assert work.end_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert work.location == "some location"
      assert work.name == "some name"
      assert work.position == "some position"
      assert work.start_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert work.summary == "some summary"
      assert work.url == "some url"
    end

    test "create_work/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_work(@invalid_attrs)
    end

    test "update_work/2 with valid data updates the work" do
      work = work_fixture()
      assert {:ok, %Work{} = work} = Profile.update_work(work, @update_attrs)
      assert work.description == "some updated description"
      assert work.end_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert work.location == "some updated location"
      assert work.name == "some updated name"
      assert work.position == "some updated position"
      assert work.start_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert work.summary == "some updated summary"
      assert work.url == "some updated url"
    end

    test "update_work/2 with invalid data returns error changeset" do
      work = work_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_work(work, @invalid_attrs)
      assert work == Profile.get_work!(work.id)
    end

    test "delete_work/1 deletes the work" do
      work = work_fixture()
      assert {:ok, %Work{}} = Profile.delete_work(work)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_work!(work.id) end
    end

    test "change_work/1 returns a work changeset" do
      work = work_fixture()
      assert %Ecto.Changeset{} = Profile.change_work(work)
    end
  end

  describe "educations" do
    alias Glass.Profile.Education

    @valid_attrs %{area: "some area", courses: "some courses", end_date: "2010-04-17T14:00:00Z", institution: "some institution", score: "some score", start_date: "2010-04-17T14:00:00Z", study_type: "some study_type", url: "some url"}
    @update_attrs %{area: "some updated area", courses: "some updated courses", end_date: "2011-05-18T15:01:01Z", institution: "some updated institution", score: "some updated score", start_date: "2011-05-18T15:01:01Z", study_type: "some updated study_type", url: "some updated url"}
    @invalid_attrs %{area: nil, courses: nil, end_date: nil, institution: nil, score: nil, start_date: nil, study_type: nil, url: nil}

    def education_fixture(attrs \\ %{}) do
      {:ok, education} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Profile.create_education()

      education
    end

    test "list_educations/0 returns all educations" do
      education = education_fixture()
      assert Profile.list_educations() == [education]
    end

    test "get_education!/1 returns the education with given id" do
      education = education_fixture()
      assert Profile.get_education!(education.id) == education
    end

    test "create_education/1 with valid data creates a education" do
      assert {:ok, %Education{} = education} = Profile.create_education(@valid_attrs)
      assert education.area == "some area"
      assert education.courses == "some courses"
      assert education.end_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert education.institution == "some institution"
      assert education.score == "some score"
      assert education.start_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert education.study_type == "some study_type"
      assert education.url == "some url"
    end

    test "create_education/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_education(@invalid_attrs)
    end

    test "update_education/2 with valid data updates the education" do
      education = education_fixture()
      assert {:ok, %Education{} = education} = Profile.update_education(education, @update_attrs)
      assert education.area == "some updated area"
      assert education.courses == "some updated courses"
      assert education.end_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert education.institution == "some updated institution"
      assert education.score == "some updated score"
      assert education.start_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert education.study_type == "some updated study_type"
      assert education.url == "some updated url"
    end

    test "update_education/2 with invalid data returns error changeset" do
      education = education_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_education(education, @invalid_attrs)
      assert education == Profile.get_education!(education.id)
    end

    test "delete_education/1 deletes the education" do
      education = education_fixture()
      assert {:ok, %Education{}} = Profile.delete_education(education)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_education!(education.id) end
    end

    test "change_education/1 returns a education changeset" do
      education = education_fixture()
      assert %Ecto.Changeset{} = Profile.change_education(education)
    end
  end

  describe "skills" do
    alias Glass.Profile.Skill

    @valid_attrs %{level: "some level", name: "some name"}
    @update_attrs %{level: "some updated level", name: "some updated name"}
    @invalid_attrs %{level: nil, name: nil}

    def skill_fixture(attrs \\ %{}) do
      {:ok, skill} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Profile.create_skill()

      skill
    end

    test "list_skills/0 returns all skills" do
      skill = skill_fixture()
      assert Profile.list_skills() == [skill]
    end

    test "get_skill!/1 returns the skill with given id" do
      skill = skill_fixture()
      assert Profile.get_skill!(skill.id) == skill
    end

    test "create_skill/1 with valid data creates a skill" do
      assert {:ok, %Skill{} = skill} = Profile.create_skill(@valid_attrs)
      assert skill.level == "some level"
      assert skill.name == "some name"
    end

    test "create_skill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_skill(@invalid_attrs)
    end

    test "update_skill/2 with valid data updates the skill" do
      skill = skill_fixture()
      assert {:ok, %Skill{} = skill} = Profile.update_skill(skill, @update_attrs)
      assert skill.level == "some updated level"
      assert skill.name == "some updated name"
    end

    test "update_skill/2 with invalid data returns error changeset" do
      skill = skill_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_skill(skill, @invalid_attrs)
      assert skill == Profile.get_skill!(skill.id)
    end

    test "delete_skill/1 deletes the skill" do
      skill = skill_fixture()
      assert {:ok, %Skill{}} = Profile.delete_skill(skill)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_skill!(skill.id) end
    end

    test "change_skill/1 returns a skill changeset" do
      skill = skill_fixture()
      assert %Ecto.Changeset{} = Profile.change_skill(skill)
    end
  end

  describe "languages" do
    alias Glass.Profile.Language

    @valid_attrs %{fluency: "some fluency", name: "some name"}
    @update_attrs %{fluency: "some updated fluency", name: "some updated name"}
    @invalid_attrs %{fluency: nil, name: nil}

    def language_fixture(attrs \\ %{}) do
      {:ok, language} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Profile.create_language()

      language
    end

    test "list_languages/0 returns all languages" do
      language = language_fixture()
      assert Profile.list_languages() == [language]
    end

    test "get_language!/1 returns the language with given id" do
      language = language_fixture()
      assert Profile.get_language!(language.id) == language
    end

    test "create_language/1 with valid data creates a language" do
      assert {:ok, %Language{} = language} = Profile.create_language(@valid_attrs)
      assert language.fluency == "some fluency"
      assert language.name == "some name"
    end

    test "create_language/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_language(@invalid_attrs)
    end

    test "update_language/2 with valid data updates the language" do
      language = language_fixture()
      assert {:ok, %Language{} = language} = Profile.update_language(language, @update_attrs)
      assert language.fluency == "some updated fluency"
      assert language.name == "some updated name"
    end

    test "update_language/2 with invalid data returns error changeset" do
      language = language_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_language(language, @invalid_attrs)
      assert language == Profile.get_language!(language.id)
    end

    test "delete_language/1 deletes the language" do
      language = language_fixture()
      assert {:ok, %Language{}} = Profile.delete_language(language)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_language!(language.id) end
    end

    test "change_language/1 returns a language changeset" do
      language = language_fixture()
      assert %Ecto.Changeset{} = Profile.change_language(language)
    end
  end

  describe "projects" do
    alias Glass.Profile.Project

    @valid_attrs %{description: "some description", end_date: "2010-04-17T14:00:00Z", entity: "some entity", highlights: "some highlights", name: "some name", roles: "some roles", start_date: "2010-04-17T14:00:00Z", type: "some type", url: "some url"}
    @update_attrs %{description: "some updated description", end_date: "2011-05-18T15:01:01Z", entity: "some updated entity", highlights: "some updated highlights", name: "some updated name", roles: "some updated roles", start_date: "2011-05-18T15:01:01Z", type: "some updated type", url: "some updated url"}
    @invalid_attrs %{description: nil, end_date: nil, entity: nil, highlights: nil, name: nil, roles: nil, start_date: nil, type: nil, url: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Profile.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Profile.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Profile.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Profile.create_project(@valid_attrs)
      assert project.description == "some description"
      assert project.end_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert project.entity == "some entity"
      assert project.highlights == "some highlights"
      assert project.name == "some name"
      assert project.roles == "some roles"
      assert project.start_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert project.type == "some type"
      assert project.url == "some url"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, %Project{} = project} = Profile.update_project(project, @update_attrs)
      assert project.description == "some updated description"
      assert project.end_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert project.entity == "some updated entity"
      assert project.highlights == "some updated highlights"
      assert project.name == "some updated name"
      assert project.roles == "some updated roles"
      assert project.start_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert project.type == "some updated type"
      assert project.url == "some updated url"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_project(project, @invalid_attrs)
      assert project == Profile.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Profile.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Profile.change_project(project)
    end
  end

  describe "highlights" do
    alias Glass.Profile.Highlight

    @valid_attrs %{description: "some description"}
    @update_attrs %{description: "some updated description"}
    @invalid_attrs %{description: nil}

    def highlight_fixture(attrs \\ %{}) do
      {:ok, highlight} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Profile.create_highlight()

      highlight
    end

    test "list_highlights/0 returns all highlights" do
      highlight = highlight_fixture()
      assert Profile.list_highlights() == [highlight]
    end

    test "get_highlight!/1 returns the highlight with given id" do
      highlight = highlight_fixture()
      assert Profile.get_highlight!(highlight.id) == highlight
    end

    test "create_highlight/1 with valid data creates a highlight" do
      assert {:ok, %Highlight{} = highlight} = Profile.create_highlight(@valid_attrs)
      assert highlight.description == "some description"
    end

    test "create_highlight/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_highlight(@invalid_attrs)
    end

    test "update_highlight/2 with valid data updates the highlight" do
      highlight = highlight_fixture()
      assert {:ok, %Highlight{} = highlight} = Profile.update_highlight(highlight, @update_attrs)
      assert highlight.description == "some updated description"
    end

    test "update_highlight/2 with invalid data returns error changeset" do
      highlight = highlight_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_highlight(highlight, @invalid_attrs)
      assert highlight == Profile.get_highlight!(highlight.id)
    end

    test "delete_highlight/1 deletes the highlight" do
      highlight = highlight_fixture()
      assert {:ok, %Highlight{}} = Profile.delete_highlight(highlight)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_highlight!(highlight.id) end
    end

    test "change_highlight/1 returns a highlight changeset" do
      highlight = highlight_fixture()
      assert %Ecto.Changeset{} = Profile.change_highlight(highlight)
    end
  end

  describe "keywords" do
    alias Glass.Profile.Keyword

    @valid_attrs %{description: "some description"}
    @update_attrs %{description: "some updated description"}
    @invalid_attrs %{description: nil}

    def keyword_fixture(attrs \\ %{}) do
      {:ok, keyword} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Profile.create_keyword()

      keyword
    end

    test "list_keywords/0 returns all keywords" do
      keyword = keyword_fixture()
      assert Profile.list_keywords() == [keyword]
    end

    test "get_keyword!/1 returns the keyword with given id" do
      keyword = keyword_fixture()
      assert Profile.get_keyword!(keyword.id) == keyword
    end

    test "create_keyword/1 with valid data creates a keyword" do
      assert {:ok, %Keyword{} = keyword} = Profile.create_keyword(@valid_attrs)
      assert keyword.description == "some description"
    end

    test "create_keyword/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_keyword(@invalid_attrs)
    end

    test "update_keyword/2 with valid data updates the keyword" do
      keyword = keyword_fixture()
      assert {:ok, %Keyword{} = keyword} = Profile.update_keyword(keyword, @update_attrs)
      assert keyword.description == "some updated description"
    end

    test "update_keyword/2 with invalid data returns error changeset" do
      keyword = keyword_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_keyword(keyword, @invalid_attrs)
      assert keyword == Profile.get_keyword!(keyword.id)
    end

    test "delete_keyword/1 deletes the keyword" do
      keyword = keyword_fixture()
      assert {:ok, %Keyword{}} = Profile.delete_keyword(keyword)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_keyword!(keyword.id) end
    end

    test "change_keyword/1 returns a keyword changeset" do
      keyword = keyword_fixture()
      assert %Ecto.Changeset{} = Profile.change_keyword(keyword)
    end
  end

  describe "blogs" do
    alias Glass.Profile.Blog

    @valid_attrs %{description: "some description", public_reactions_count: 42, title: "some title", url: "some url"}
    @update_attrs %{description: "some updated description", public_reactions_count: 43, title: "some updated title", url: "some updated url"}
    @invalid_attrs %{description: nil, public_reactions_count: nil, title: nil, url: nil}

    def blog_fixture(attrs \\ %{}) do
      {:ok, blog} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Profile.create_blog()

      blog
    end

    test "list_blogs/0 returns all blogs" do
      blog = blog_fixture()
      assert Profile.list_blogs() == [blog]
    end

    test "get_blog!/1 returns the blog with given id" do
      blog = blog_fixture()
      assert Profile.get_blog!(blog.id) == blog
    end

    test "create_blog/1 with valid data creates a blog" do
      assert {:ok, %Blog{} = blog} = Profile.create_blog(@valid_attrs)
      assert blog.description == "some description"
      assert blog.public_reactions_count == 42
      assert blog.title == "some title"
      assert blog.url == "some url"
    end

    test "create_blog/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_blog(@invalid_attrs)
    end

    test "update_blog/2 with valid data updates the blog" do
      blog = blog_fixture()
      assert {:ok, %Blog{} = blog} = Profile.update_blog(blog, @update_attrs)
      assert blog.description == "some updated description"
      assert blog.public_reactions_count == 43
      assert blog.title == "some updated title"
      assert blog.url == "some updated url"
    end

    test "update_blog/2 with invalid data returns error changeset" do
      blog = blog_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_blog(blog, @invalid_attrs)
      assert blog == Profile.get_blog!(blog.id)
    end

    test "delete_blog/1 deletes the blog" do
      blog = blog_fixture()
      assert {:ok, %Blog{}} = Profile.delete_blog(blog)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_blog!(blog.id) end
    end

    test "change_blog/1 returns a blog changeset" do
      blog = blog_fixture()
      assert %Ecto.Changeset{} = Profile.change_blog(blog)
    end
  end

  describe "tags" do
    alias Glass.Profile.Tag

    @valid_attrs %{description: "some description"}
    @update_attrs %{description: "some updated description"}
    @invalid_attrs %{description: nil}

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Profile.create_tag()

      tag
    end

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Profile.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Profile.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      assert {:ok, %Tag{} = tag} = Profile.create_tag(@valid_attrs)
      assert tag.description == "some description"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{} = tag} = Profile.update_tag(tag, @update_attrs)
      assert tag.description == "some updated description"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_tag(tag, @invalid_attrs)
      assert tag == Profile.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Profile.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Profile.change_tag(tag)
    end
  end
end
