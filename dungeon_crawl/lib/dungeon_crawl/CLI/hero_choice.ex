defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start do
    DungeonCrawl.Heroes.all()
    |> ask_for_option()
    |> confirm_hero()
  end

  defp confirm_hero(chosen) do
    Shell.cmd("clear")
    Shell.info("-------------------------------------------------------")
    Shell.info(chosen.description)
    Shell.info("-------------------------------------------------------")
    if Shell.yes?("Do you wanna be #{chosen.name }?"), do: chosen, else: ask_for_option(DungeonCrawl.Heroes.all())
  end
end
