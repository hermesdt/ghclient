describe GHClient::Connection do
  it "should have https://api.github.com as BASE_TOKEN constant" do
    expect(GHClient::Connection::BASE_URL).to eq("https://api.github.com")
  end

  it "should raise an error becuase no access token is present" do
    connection = GHClient::Connection::new

    expect{
      connection.check_options!({})
    }.to raise_error(GHClient::NoAccessToken)
  end

  it "should save latest response" do
    connection = GHClient::Connection::new
    
    response = double(:response, body: {k: :v}.to_json)
    connection.check_and_parse_response!(response)

    expect(connection.last_response).to eq(response)
  end
end