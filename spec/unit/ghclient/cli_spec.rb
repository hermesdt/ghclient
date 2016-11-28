describe GHClient::Cli do

  context "with fake api" do
    let(:cli) do
      api = instance_double("GHClient::Api")
      device = StringIO.new
      GHClient::Cli.new(api: api, device: device)
    end

    it "should print_repo_info" do
      cli.print_repo_info(
        {"full_name" => "my_user/my_repo"},
        {"Java" => 100, "Ruby" => 598} )

      expected_text = read_fixture("cli.yml")

      expect(cli.device.string).to eq( expected_text["repo_info"] )
    end

    it "should print_progress correctly for prolog" do
      cli.print_progress(568, "Prolog", 311)

      expected_text = read_fixture("cli.yml")

      expect(cli.device.string).to eq( expected_text["print_progress"] )
    end
  end

  it "should print correctly for user hermesdt" do
    api = GHClient::Api.new
    device = StringIO.new
    cli = GHClient::Cli.new(api: api, device: device)

    expected_text = read_fixture("cli.yml")

    VCR.use_cassette("synopsis") do
      cli.print_for_user("hermesdt")
      expect(cli.device.string).to eq( expected_text["print_for_user"] )
    end
  end

end