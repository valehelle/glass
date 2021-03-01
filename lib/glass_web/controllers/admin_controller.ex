defmodule GlassWeb.AdminController do
  use GlassWeb, :controller
  alias Glass.Profile
  alias Glass.Accounts
  
  def index(conn, _params) do
    user = conn.assigns.current_user
    
    if(String.equivalent?(user.email, "hazmiirfan92@gmail.com")) do
      users = Accounts.list_user()
      render(conn, "index.html", users: users)
    else
      redirect(conn, to: "/")
    end
  end

  def migrate(conn, _params) do
    user = conn.assigns.current_user
    if(String.equivalent?(user.email, "hazmiirfan92@gmail.com")) do
      Glass.Profile.Basic
      |> Glass.Repo.all()
      |> Enum.map(fn basic ->
        
        changeset = Ecto.Changeset.change(basic, %{
            encrypt_name: basic.name,
            encrypt_label: basic.label,
            encrypt_phone: basic.phone,
            encrypt_loc_address: basic.loc_address, 
            encrypt_loc_postal_code: basic.loc_postal_code, 
            encrypt_loc_city: basic.loc_city,
            encrypt_loc_country_code: basic.loc_country_code,
            encrypt_loc_region: basic.loc_region,
          })
          Glass.Repo.update!(changeset)

      end)
      users = Accounts.list_user()
      render(conn, "index.html", users: users)
    else
      redirect(conn, to: "/")
    end



  end


end
