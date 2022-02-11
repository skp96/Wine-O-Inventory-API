alias WineOInventoryApi.Users.Member
alias WineOInventoryApi.Repo

member_1 = %{
    name: "Sunny",
    inventory: %{}
}
Member.changeset(%Member{}, member_1)
|> Repo.insert!()

member_2 = %{
    name: "Jerome",
    inventory: %{}
}
Member.changeset(%Member{}, member_2)
|> Repo.insert!()

member_3 = %{
    name: "Craig",
    inventory: %{}
}
Member.changeset(%Member{}, member_3)
|> Repo.insert!()

member_4 = %{
    name: "Kentaro",
    inventory: %{}
}
Member.changeset(%Member{}, member_4)
|> Repo.insert!()
