# ExClsx

An utility module to concatenate strings fragments, filtering falsey values.
Inspired to [clsx](https://github.com/lukeed/clsx), it is useful to produce class names for components that depend on component attributes.

Built with :heart: in Milan during [![Open Source Saturday](https://img.shields.io/badge/%E2%9D%A4%EF%B8%8F-open%20source%20saturday-F64060.svg)](https://www.meetup.com/it-IT/Open-Source-Saturday-Milano/)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_clsx` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_clsx, "~> 0.1.0"}
  ]
end
```

## Usage

```elixir
iex> ExClsx.clsx(["hello", "world"])
"hello world"

iex> ExClsx.clsx(["hello", false, 0, nil, "world"])
"hello world"

iex> ExClsx.clsx(["please", %{ keep: true, discard: false }])
"please keep"

iex> ExClsx.clsx(["please", %{ "keep" => true, "discard" => false }])
"please keep"
```

# Use cases

TODO

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/ex_clsx>.
