describe GHClient::User do

  it "should return /users/my_user" do
    path = GHClient::User.path("my_user")
    expect(path).to eq("/users/my_user")
  end

end