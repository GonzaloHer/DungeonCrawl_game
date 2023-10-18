defmodule DungeonCrawl.CLI.DificultyChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start do
    # me limpia la terminal
    Shell.cmd("clear")
    Shell.info("Choose game mode")
    modes = ["easy mode", "medium mode", "hard mode"]

    ask_for_option(modes)
    # modes
    # |> display_options
    # |> generate_question
    # |> Shell.prompt
    # |> parse_answer!
    Shell.cmd("clear")
  end

  def rooms(mode) do
    case mode do
        0 -> DungeonCrawl.Room.all_1
        1 -> DungeonCrawl.Room.all_2
        2 -> DungeonCrawl.Room.all_3
      end
    end
end
