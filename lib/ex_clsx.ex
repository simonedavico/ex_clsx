defmodule ExClsx do
  @moduledoc """
  An utility module to concatenate strings fragments, filtering falsey values.
  Inspired to https://github.com/lukeed/clsx, it is useful to produce class names for components that depend on component attributes.
  """

  defguard is_falsey(term) when term in [false, nil, 0, ""]

  defp clsx_item(item) when is_falsey(item), do: []

  defp clsx_item(item) when is_map(item) do
    item
    |> Map.reject(fn {_key, value} -> is_falsey(value) end)
    |> Map.keys()
    |> Enum.map(fn
      class when is_atom(class) -> Atom.to_string(class)
      class -> class
    end)
  end

  defp clsx_item(item) when is_list(item), do: Enum.filter(item, &is_falsey/1)

  defp clsx_item(item), do: ["#{item}"]

  @doc """
  Resolves a class names from a list of fragments. Supports string, maps and boolean values. Falsey values are automatically discarded.

  ## Examples

    iex> ExClsx.clsx(["hello", "world"])
    "hello world"

    iex> ExClsx.clsx(["hello", false, 0, nil, "world"])
    "hello world"

    iex> ExClsx.clsx(["please", %{ keep: true, discard: false }])
    "please keep"

    iex> ExClsx.clsx(["please", %{ "keep" => true, "discard" => false }])
    "please keep"
  """
  def clsx(items) do
    items
    |> Enum.map(&clsx_item/1)
    |> List.flatten()
    |> Enum.join(" ")
  end
end
