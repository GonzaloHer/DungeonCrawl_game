defmodule DungeonCrawl.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} -> Shell.info("#{index} - #{option}") end)

    options
  end

  def generate_question(options) do
    # para cada uno de la lista hace: item1 , item2 ,.... (agrega comas entre medio)
    options = Enum.join(1..Enum.count(options), ",")
    # si hago interpolacion con una lista, esta se muestra entera, interpolada.
    "CHOSE wisely...! [#{options}]\n"
  end

  def parse_answer(answer) do
    {option, _} = Integer.parse(answer)
    # hace que el index quede como que se incia desde el 0, para poder llamar luego a la funcion find_hero_by_index
    option - 1
  end
end
