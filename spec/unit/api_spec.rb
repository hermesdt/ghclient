describe GHClient::Api do

  it "should call get method with value /users/my_user" do
    connection = instance_double("GHClient::Connection")
    expect(connection).to receive(:get).with("/users/my_user")

    api = GHClient::Api.new(connection)
    api.get_user("my_user")
  end

  it "should call get method with value /users/my_user/repos" do
    connection = instance_double("GHClient::Connection")
    expect(connection).to receive(:get).with("/users/my_user/repos")

    api = GHClient::Api.new(connection)
    api.get_repositories("my_user")
  end

  it "should call get method with value /repos/my_user/my_repo/languages" do
    connection = instance_double("GHClient::Connection")
    expect(connection).to receive(:get).with("/repos/my_user/my_repo/languages")

    api = GHClient::Api.new(connection)
    api.get_languages_for_repository("my_user/my_repo")
  end
end