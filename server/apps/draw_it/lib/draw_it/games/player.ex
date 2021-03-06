defmodule DrawIt.Games.Player do
  @moduledoc """
  This module holds the schema, changeset, and any query helpers for game players.
  """

  use DrawIt.Schema

  import Ecto.Changeset

  alias DrawIt.Games.Game

  schema "game_players" do
    field :nickname, :string
    field :score, :integer, default: 0
    field :token, :string

    belongs_to :game, Game, foreign_key: :id_game

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:id_game, :nickname, :score, :token])
    |> validate_required([:id_game, :nickname, :token])
  end
end
