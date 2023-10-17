defmodule DungeonCrawl.CLI.DificultyChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start do
    # me limpia la terminal
    Shell.cmd("clear")
    Shell.info("Choose game mode")
    modes = ["easy mode", "medium mode", "dificult mode"]
    find_mode_by_index = &Enum.at(modes, &1)

    modes
    |> display_options
    |> generate_question
    |> Shell.prompt
    |> parse_answer
    |> find_mode_by_index.()
    |> confirm_mode()
  end

    def confirm_mode(index) do
      case index do
        "easy mode" -> DungeonCrawl.Room.all_1
        "medium mode" -> DungeonCrawl.Room.all_2
        "dificult mode" -> DungeonCrawl.Room.all_3
      end
    end

end
