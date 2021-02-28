defmodule Glass.Vault do
  use Cloak.Vault, otp_app: :glass
  @impl GenServer
  def init(config) do
    config =
      Keyword.put(config, :ciphers, [
        default: {Cloak.Ciphers.AES.GCM, tag: "AES.GCM.V1", key: decode_env!()}
      ])

    {:ok, config}
  end

  defp decode_env!() do
    Application.get_env(:glass, Glass.Repo)[:crypto]
    |> Base.decode64!()
  end
end