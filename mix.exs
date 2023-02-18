defmodule ExClsx.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_clsx,
      version: "1.0.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      source_url: "https://github.com/simonedavico/ex_clsx"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    An utility module to concatenate strings fragments, filtering falsey values. Inspired to https://github.com/lukeed/clsx, it is useful to produce class names for components that depend on component attributes.
    """
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/simonedavico/ex_clsx"
      }
    ]
  end
end
