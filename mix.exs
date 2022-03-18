defmodule EctoInterval.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ecto_interval,
      version: "0.2.4",
      elixir: "~> 1.6",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Interval Type for Ecto",
      package: package()
    ]
  end

  def package do
    [
      licenses: ["MIT"],
      name: :ecto_interval,
      maintainers: ["OvermindDL1"],
      links: %{"Github" => "https://github.com/OvermindDL1/ecto_interval"}
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:postgrex, "~> 0.14.0 or ~> 0.15.0 or ~> 0.16.0", optional: true},
      {:ecto, "~> 3.0", optional: true},
      {:phoenix_html, "~> 3.0", optional: true}
    ]
  end
end
