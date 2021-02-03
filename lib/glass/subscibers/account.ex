defmodule Glass.Subscibers.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :email, :string
    field :uniquename, :string

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:email, :uniquename])
    |> validate_required([:email, :uniquename])
    |> validate_email()
    |> validate_username()
  end

  defp validate_email(changeset) do
    changeset
    |> validate_required([:email])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must have the @ sign and no spaces")
    |> validate_length(:email, max: 160)
    |> unsafe_validate_unique(:email, Glass.Repo)
    |> unique_constraint(:email)
  end
  defp validate_username(changeset) do
    changeset
    |> validate_required([:uniquename])
    |> validate_format(:uniquename, ~r/^[A-Z\-a-z]+$/, message: "must only contain alphabet or -")
    |> unsafe_validate_unique(:uniquename, Glass.Repo)
    |> unique_constraint(:email)
  end

end
