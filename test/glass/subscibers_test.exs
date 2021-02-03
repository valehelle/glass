defmodule Glass.SubscibersTest do
  use Glass.DataCase

  alias Glass.Subscibers

  describe "accounts" do
    alias Glass.Subscibers.Account

    @valid_attrs %{email: "some email", uniquename: "some uniquename"}
    @update_attrs %{email: "some updated email", uniquename: "some updated uniquename"}
    @invalid_attrs %{email: nil, uniquename: nil}

    def account_fixture(attrs \\ %{}) do
      {:ok, account} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Subscibers.create_account()

      account
    end

    test "list_accounts/0 returns all accounts" do
      account = account_fixture()
      assert Subscibers.list_accounts() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert Subscibers.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      assert {:ok, %Account{} = account} = Subscibers.create_account(@valid_attrs)
      assert account.email == "some email"
      assert account.uniquename == "some uniquename"
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Subscibers.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      assert {:ok, %Account{} = account} = Subscibers.update_account(account, @update_attrs)
      assert account.email == "some updated email"
      assert account.uniquename == "some updated uniquename"
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = Subscibers.update_account(account, @invalid_attrs)
      assert account == Subscibers.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = Subscibers.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> Subscibers.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = Subscibers.change_account(account)
    end
  end
end
