# Pgpass

If you prefer not to hardcode passwords directly in your configuration files,
even for development environments, and want to reuse credentials from the
standard PostgreSQL file `~/.pgpass`, this simple library makes it possible.


[PostgreSQL doc about pgpass](https://www.postgresql.org/docs/current/libpq-pgpass.html)


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `pgpass` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:pgpass, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/pgpass>.

