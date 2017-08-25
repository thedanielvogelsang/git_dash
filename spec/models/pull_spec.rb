require 'rails_helper'

RSpec.describe Pull, type: :model do
  context "validations" do
    it "can call title" do
      pull = Pull.new({:merge_sha => 12, :title => "bicycle-sales", :created_at => "January 10 2015", :html_url=>"pull.url", body: "katiekeel merged pull request"})
      expect(pull.title).to eq("bicycle-sales")
    end
    it "can call url" do
      pull = Pull.new({:merge_sha => 12, :title => "bicycle-sales", :created_at => "January 10 2015", :html_url=>"pull.url", body: "katiekeel merged pull request"})
      expect(pull.url).to eq("pull.url")
    end
    it "can call body" do
      pull = Pull.new({:merge_sha => 12, :title => "bicycle-sales", :created_at => "January 10 2015", :html_url=>"pull.url", body: "katiekeel merged pull request"})
      expect(pull.body).to eq("katiekeel merged pull request")
    end
    it "can call created_at date in proper format" do
      pull = Pull.new({:merge_sha => 12, :title => "bicycle-sales", :created_at => "January 10 2015", :html_url=>"pull.url", body: "katiekeel merged pull request"})
      expect(pull.created_at).to eq("10-January-2015")
    end
  end
end
