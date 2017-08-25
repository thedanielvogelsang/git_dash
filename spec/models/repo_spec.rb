require 'rails_helper'

RSpec.describe Repo, type: :model do
  context "validations" do
    it "can call name" do
      repo = Repo.new({:id => 12, :name => "bicycle-sales", :created_at => "January 10 2015", :html_url=>"repo.url", owner: {login: "katiekeel"} })
      expect(repo.name).to eq("bicycle-sales")
    end
    it "can call id" do
      repo = Repo.new({:id => 12, :name => "bicycle-sales", :created_at => "January 10 2015", :html_url=>"repo.url", owner: {login: "katiekeel"} })
      expect(repo.uid).to eq(12)
    end
    it "can call url" do
      repo = Repo.new({:id => 12, :name => "bicycle-sales", :created_at => "January 10 2015", :html_url=>"repo.url", owner: {login: "katiekeel"} })
      expect(repo.url).to eq("repo.url")
    end
    it "can call created_at date in proper format" do
      repo = Repo.new({:id => 12, :name => "bicycle-sales", :created_at => "January 10 2015", :html_url=>"repo.url", owner: {login: "katiekeel"} })
      expect(repo.created_at).to eq("10-January-2015")
    end
  end
end
