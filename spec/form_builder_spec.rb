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

    it "create form with input" do
      user = User.new(name: "rob")
      form = HexletCode.form_for(user, { url: "/users" }) { |f| f.input :name }

      expect(form).to eq("<form action=\"/users\" method=\"post\"><input name=\"name\"></form>")
    end

    it "create form with input classes" do
      user = User.new(name: "rob")
      form = HexletCode.form_for(user, { url: "/users" }) { |f| f.input :name, class: "user-input" }

      expect(form).to eq("<form action=\"/users\" method=\"post\"><input class=\"user-input\" name=\"name\"></form>")
    end

    it "create form with textarea" do
      user = User.new(name: "rob")
      form = HexletCode.form_for(user, { url: "/users" }) { |f| f.input :job, as: :text }

      expect(form).to eq("<form action=\"/users\" method=\"post\"><textarea name=\"job\">hexlet</textarea></form>")
    end

    it "create form for undefined field with exception" do
      user = User.new(name: "rob")
      HexletCode.form_for(user, { url: "/users" }) { |f| f.input :age, as: :text }

      expect raise_exception
    end
  end
end
