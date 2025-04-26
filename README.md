# Pgpass

If you prefer not to hardcode passwords directly in your configuration files,
even for development environments, and want to reuse credentials from the
standard PostgreSQL file `~/.pgpass`, this simple library makes it possible.


[PostgreSQL doc about pgpass](https://www.postgresql.org/docs/current/libpq-pgpass.html)


## Usage Example

add as dependency to the project

mix.exs
```elixir
defmodule YourApp.MixProject do
  use Mix.Project
  # ...
  defp deps do
    [
      # ...

      {:pgpass, git: "https://github.com/edmtsky/pgpass.git", tag: "0.1.0"},
    ]
  end
  # ...
end
```

how to use in config files

config/dev.exs
```elixir
import Config

# workaround to provite access to Pgpass module in config
Code.require_file("./deps/pgpass/lib/pgpass.ex")

# Configure your database
config :sample_app, SampleApp.Repo,
  username: "dbuser",
  password: Pgpass.find_password("dbuser"),
  # ...
```

