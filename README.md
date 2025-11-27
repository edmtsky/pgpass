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

      {:pgpass, git: "https://github.com/edmtsky/pgpass.git", tag: "0.1.1"},
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


## Important. First fetch the dependency and only then add it to the config

You must first register and tighten the dependency via mix deps.get and only
then register the connection via:

```ex
Code.require_file("./deps/pgpass/lib/pgpass.ex")
```

otherwise, if you first "enable" the use of the file in the config via
require_file and only then try to do mix deps.get, you will get something like this error:

```sh
mix deps.get

** (Code.LoadError) could not load ~/youproject/deps/pgpass/lib/pgpass.ex. Reason: enoent
    (elixir 1.18.4) lib/code.ex:2219: Code.find_file!/2
    (elixir 1.18.4) lib/code.ex:1517: Code.require_file/2
    ...
```
