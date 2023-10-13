defmodule DungeonCrawl.CLI.HeroChoice do
    alias Mix.Shell.IO, as: Shell
    import DungeonCrawl.CLI.BaseCommands

    def start do
      Shell.cmd("clear") #me limpia la terminal
      Shell.info("Start by choosing your hero:")
      heroes = DungeonCrawl.Heroes.all()
      find_hero_by_index = &Enum.at(heroes, &1)


      heroes
      |> Enum.map(&(&1.name)) #obtengo los nombres de todos los hero's apartir de la lista de characters "options"
      |> display_options
      |> generate_question
      |> Shell.prompt  #despliga un mensaje y espera un inpot del usuario
      |> parse_answer
      |> find_hero_by_index.()
      |> confirm_hero
    end

    defp confirm_hero(chosen_hero) do
      Shell.cmd("clear")
      Shell.info(chosen_hero.description)
      if Shell.yes?("confirm?"), do: chosen_hero, else: start()
    end
end
