describe GHClient::Repository do

  it "should return /users/my_user/repos" do
    path = GHClient::Repository.languages_path("my_user/my_repo")
    expect(path).to eq("/repos/my_user/my_repo/languages")
  end
  
end