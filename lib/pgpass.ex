defmodule Pgpass do
  @moduledoc """
  This module contains functions for access to credential
  stored in the ~/.pgpass file
  """
  @def_pgpass_path Path.join(System.get_env("HOME"), ".pgpass")

  @doc """
  Find a password for a given username from the given filename or from ~/.pgpass
  If the specified user does not exists in the pgfile file, it will return nil

  Official documentation on this file
  https://www.postgresql.org/docs/current/libpq-pgpass.html

  ## Examples

      iex> Pgpass.find_password("user1", "./test/samples/pgpass")
      "password_1"

  """
  @spec find_password(String.t(), String.t()) :: String.t()
  def find_password(username, filename \\ @def_pgpass_path) do
    filename
    |> File.read!()
    |> String.split("\n")
    |> Enum.find_value(nil, fn line ->
      case line do
        # ignore comments
        "#" <> _rest ->
          nil

        line ->
          case String.split(line, ":") do
            # Return password if matched
            [_,_,_, ^username, password] -> password
            _ -> nil
          end
      end
    end)
  end
end

