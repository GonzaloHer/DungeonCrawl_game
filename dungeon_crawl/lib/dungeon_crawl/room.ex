defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers

  import DungeonCrawl.Room.Action

  defstruct description: nil, actions: [], trigger: nil, weight: 0

  def all_1,
    do: [
      %Room{
        description: "you found a quiet place. Looks safe for a little nap.",
        actions: [forward(), rest()],
        trigger: Triggers.Exit,
        weight: 6
      },
      %Room{
        description: "You can see an enemy blocking your path.",
        actions: [forward()],
        trigger: Triggers.Enemy,
        weight: 6
      },
      %Room{
        description: "You can see a huge cave.",
        actions: [forward()],
        trigger: Triggers.Enemy,
        weight: 6
      },
      %Room{
        description: "The path is taken by the enemy!",
        actions: [forward()],
        trigger: Triggers.Enemy,
        weight: 6
      },
      %Room{
        description: "You are by your own, be careful!",
        actions: [forward()],
        trigger: Triggers.Enemy,
        weight: 6
      }
    ]

    def all_2,
    do: [
      %Room{
        description: "you found a quiet place. Looks safe for a little nap.",
        actions: [forward(), rest()],
        trigger: Triggers.Exit,
        weight: 4
      },
      %Room{
        description: "You can see an enemy blocking your path.",
        actions: [forward(), search()],
        trigger: Triggers.Enemy,
        weight: 7
      },
      %Room{
        description: "You can see a huge cave.",
        actions: [forward()],
        trigger: Triggers.Enemy,
        weight: 7
      },
      %Room{
        description: "The path is taken by the enemy!",
        actions: [forward()],
        trigger: Triggers.Enemy,
        weight: 7
      },
      %Room{
        description: "You are by your own, be careful!",
        actions: [forward()],
        trigger: Triggers.Enemy,
        weight: 7
      }
    ]

    def all_3,
    do: [
      %Room{
        description: "you found a quiet place. Looks safe for a little nap.",
        actions: [forward(), rest()],
        trigger: Triggers.Exit,
        weight: 1
      },
      %Room{
        description: "You can see an enemy blocking your path.",
        actions: [forward()],
        trigger: Triggers.Enemy,
        weight: 8
      },
      %Room{
        description: "You can see a huge cave.",
        actions: [forward()],
        trigger: Triggers.Enemy,
        weight: 9
      },
      %Room{
        description: "The path is taken by the enemy!",
        actions: [forward()],
        trigger: Triggers.Enemy,
        weight: 8
      },
      %Room{
        description: "You are by your own, be careful!",
        actions: [forward()],
        trigger: Triggers.Enemy,
        weight: 7
      }
    ]

  def get_weight(%Room{weight: w}), do: w

end
