defmodule Evideo.Staffs.Staff do
  use Ecto.Schema
  import Ecto.Changeset
  alias Evideo.Staffs.LoginStaff

  schema "staff" do
    field :login_id, :integer
    field :phone, :string, size: 50
    field :email, :string, size: 50
    field :gender, :string, size: 8
    field :wage, :integer

    belongs_to :login_staff, LoginStaff, define_field: false
    timestamps()
  end

  @doc false
  def changeset(staff, attrs) do
    cast(staff, attrs, [:login_id, :phone, :email, :gender, :wage])
  end
end
