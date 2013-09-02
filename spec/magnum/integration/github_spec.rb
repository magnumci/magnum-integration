require "spec_helper"

describe Magnum::Integration::Github do
  let(:github) { Magnum::Integration::Github.new("token") }

  describe "#initialize" do
    it "raises error if no token provided" do
      expect { Magnum::Integration::Github.new(nil) }.
        to raise_error ArgumentError, "Access token required"
    end
  end

  describe "#repositories" do
    let(:result) { github.repositories }

    it "returns repositories array" do
      pending
    end

    it "returns private and public repositories" do
      pending
    end
  end

  describe "#repository" do
    it "returns single repository details" do
      pending
    end
  end
end