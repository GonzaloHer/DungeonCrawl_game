defmodule DungeonCrawl.CLI.DificultyChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start do
    Shell.cmd("clear") #me limpia la terminal
    Shell.info("Choose game mode")
    mode = DungeonCrawl.Heroes.all()
    find_hero_by_index = &Enum.at(heroes, &1)



  end

end
