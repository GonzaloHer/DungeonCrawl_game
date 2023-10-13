# aca va vivir el codigo que voy a usar para ejeutar el juego desde la terminal, CLI = COMMAND LINE INTERFACE

defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell  # funcion nativa de elixir, trae funciones utiles para interactuar con la terminal.

  def start_game do
    welcome_message()
    Shell.prompt("Press Enter to continue")
    hero_choice()
    crawl(DungeonCrawl.Room.all())
  end

  defp crawl(rooms) do
    Shell.info("You keep moving forward to the next room.")
    Shell.prompt("Press enter to continue")
    Shell.cmd("clear")

    rooms
    |> Enum.random()
    |> DungeonCrawl.CLI.RoomActionsChoice.start
  end

  defp welcome_message do
    Shell.info("============== DUNGEON CRAWL ==============")
    Shell.info("")
    Shell.info("You awake in a dungeon full of monsters........")
    Shell.info("")
    Shell.info("You need to survive and find the exit!!!")
    Shell.info("")
  end

  defp hero_choice do
    DungeonCrawl.CLI.HeroChoice.start()
  end
end
