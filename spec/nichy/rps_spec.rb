RSpec.describe Nichy::Rps do
  it "has a version number" do
    expect(Nichy::Rps::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(Nichy::Rps::Rps.hello).to eq(true)
  end
end
