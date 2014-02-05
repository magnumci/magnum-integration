require "spec_helper"

describe Magnum::Integration::Repository do
  let(:repo) { Magnum::Integration::Repository.new }

  it { should respond_to :id }
  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :private }

  describe "#initialize" do
    it "has blank attributes" do
      repo = Magnum::Integration::Repository.new
    end

    it "assigns attributes" do
      repo = Magnum::Integration::Repository.new(
        id: "12345", 
        name: "foo/bar",
        description: "Foobar",
        url: "git@github.com:/user/repo.git",
        scm: "git"
      )

      expect(repo.id).to eq "12345"
      expect(repo.name).to eq "foo/bar"
      expect(repo.description).to eq "Foobar"
      expect(repo.url).to eq "git@github.com:/user/repo.git"
      expect(repo.scm).to eq "git"
    end

    it "is not private by default" do
      repo = Magnum::Integration::Repository.new
      expect(repo.private).to eq false
    end
  end

  describe "#private?" do
    it "return false if public" do
      repo.stub(:private) { false }
      expect(repo.private?).to eq false
    end

    it "returns true if private" do
      repo.stub(:private) { true }
      expect(repo.private?).to eq true
    end
  end

  describe "#git?" do
    it "returns false if not git" do
      repo.stub(:scm) { "mercurial" }
      expect(repo.git?).to eq false
    end

    it "returns true if source type is git" do
      repo.stub(:scm) { "git" }
      expect(repo.git?).to eq true
    end
  end
end