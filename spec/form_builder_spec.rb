# frozen_string_literal: true

User = Struct.new(:name, :job, :gender, keyword_init: true)

RSpec.describe HexletCode do
  context "form_for" do
    it "create empty form" do
      user = User.new(name: "rob")
      form = HexletCode.form_for user

      expect(form).to eq("<form action=\"#\" method=\"post\"></form>")
    end

    it "create form with url" do
      user = User.new(name: "rob")
      form = HexletCode.form_for user, { url: "/users" }

      expect(form).to eq("<form action=\"/users\" method=\"post\"></form>")
    end
  end
end
