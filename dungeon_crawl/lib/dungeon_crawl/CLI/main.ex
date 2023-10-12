# aca va vivir el codigo que voy a usar para ejeutar el juego desde la terminal, CLI = COMMAND LINE INTERFACE

defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell  # funcion nativa de elixir, trae funciones utiles para interactuar con la terminal.

  def start_game do
    welcome_message()
  end

  defp welcome_message do
    Shell.info("============== DUNGEON CRAWL ==============")
    Shell.info("")
    Shell.info("You awake in a dungeon full of monsters........")
    Shell.info("")
    Shell.info("You need to survive and find the exit!!!")
    Shell.info("")
  end
end
