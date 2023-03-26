# frozen_string_literal: true

User = Struct.new(:name, :job, :gender, keyword_init: true)

RSpec.describe HexletCode do
  context "generate form" do
    it "create empty form" do
      user = User.new
      form = HexletCode.form_for user

      expect(form).to eq("<form action=\"#\" method=\"post\"></form>")
    end

    it "create form with url" do
      user = User.new
      form = HexletCode.form_for user, { url: "/users" }

      expect(form).to eq("<form action=\"/users\" method=\"post\"></form>")
    end
  end
end

RSpec.describe HexletCode do
  context "generate input" do
    it "create form with input" do
      user = User.new
      form = HexletCode.form_for(user, { url: "/users" }) { |f| f.input :name }

      expect(form).to eq("<form action=\"/users\" method=\"post\"><input name=\"name\"></form>")
    end

    it "create form with input classes" do
      user = User.new
      form = HexletCode.form_for(user, { url: "/users" }) { |f| f.input :name, class: "user-input" }

      expect(form).to eq("<form action=\"/users\" method=\"post\"><input class=\"user-input\" name=\"name\"></form>")
    end

    it "create form with 2 inputs" do
      user = User.new
      form = HexletCode.form_for(user, { url: "/users" }) do |f|
        f.input :name, class: "1"
        f.input :job, class: "2"
      end

      expect(form).to include("<input class=\"1\" name=\"name\"><input class=\"2\" name=\"job\">")
    end
  end
end

RSpec.describe HexletCode do
  context "generate textarea" do
    it "create form with textarea" do
      user = User.new
      form = HexletCode.form_for(user, { url: "/users" }) { |f| f.input :job, as: :text }

      expect(form).to eq("<form action=\"/users\" method=\"post\"><textarea name=\"job\">hexlet</textarea></form>")
    end
  end
end

RSpec.describe HexletCode do
  context "generate input" do
    it "with default value" do
      user = User.new(name: "rob")
      form = HexletCode.form_for(user, { url: "/users" }) { |f| f.input :name }

      expect(form).to eq("<form action=\"/users\" method=\"post\"><input name=\"name\" value=\"rob\"></form>")
    end

    it "with override text" do
      user = User.new(name: "rob", job: "developer")
      form = HexletCode.form_for(user, { url: "/users" }) { |f| f.input :job, as: :text }

      expect(form).to eq("<form action=\"/users\" method=\"post\"><textarea name=\"job\">developer</textarea></form>"
                      )
    end
  end
end
