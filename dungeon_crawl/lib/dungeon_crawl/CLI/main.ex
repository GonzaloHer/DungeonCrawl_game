# aca va vivir el codigo que voy a usar para ejeutar el juego desde la terminal, CLI = COMMAND LINE INTERFACE

defmodule DungeonCrawl.CLI.Main do
  # funcion nativa de elixir, trae funciones utiles para interactuar con la terminal.
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()
    Shell.prompt("Press Enter to continue")
    hero_choice()

    crawl(hero_choice(), DungeonCrawl.Room.all())
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
    hero = DungeonCrawl.CLI.HeroChoice.start()
    %{hero | name: "You"}
  end

  defp crawl(%{hit_points: 0}, _) do
    Shell.prompt("")
    Shell.cmd("clear")
    Shell.info("Unfortunately your wounds are too many to keep walking.")
    Shell.info("You fall onto the floor without strength to carry on.")
    Shell.info("Game over!")
    Shell.prompt("")
  end

  defp crawl(character, rooms) do
    Shell.info("You keep moving forward to the next room.")
    Shell.prompt("Press enter to continue")
    Shell.cmd("clear")
    Shell.info(DungeonCrawl.Character.current_stats(character))

    rooms
    |> weighted_random_room()
    |> DungeonCrawl.CLI.RoomActionsChoice.start
    |> trigger_action(character)
    |> handle_action_result
  end

  defp trigger_action({room, action}, character) do
    Shell.cmd("clear")
    room.trigger.run(character, action)
  end

  defp handle_action_result({_, :exit}) do
    Shell.info("You found the exit. You won the game. Congratulations!")
  end

  defp handle_action_result({character, _}) do
    crawl(character, DungeonCrawl.Room.all())
  end

  defp weighted_random_room(rooms) do
    total_weights = Enum.reduce(rooms, 0, fn room, acc -> acc + DungeonCrawl.Room.get_weight(room) end)
    random_number = Enum.random(1..total_weights)
    weighted_random_room(rooms, random_number)
  end

  defp weighted_random_room([room | rest], random_number) do
    if random_number <= DungeonCrawl.Room.get_weight(room) do
      room
    else
      weighted_random_room(rest, random_number - DungeonCrawl.Room.get_weight(room))
    end
  end

  defp weighted_random_room([_room | rest], random_number) do
    weighted_random_room(rest, random_number - DungeonCrawl.Room.get_weight(_room))
  end
end
