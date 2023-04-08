# frozen_string_literal: true

User = Struct.new(:name, :job, :gender, keyword_init: true)

RSpec.describe HexletCode do
  context 'generate form' do
    it 'empty' do
      form = HexletCode.form_for User.new

      expect(form).to eq(get_fixture('empty_form'))
    end

    it 'with default values' do
      form = HexletCode.form_for(User.new, { url: '/users' }) do |f|
        f.input :name, class: 'first'
        f.input :job, class: 'second'
        f.input :gender, as: :text
        f.submit
      end

      expect(form).to eq(get_fixture('form_with_default_values'))
    end

    it 'with override values' do
      user = User.new(name: 'rob')
      form = HexletCode.form_for(user, { url: '/users' }) do |f|
        f.input :name, class: 'first'
        f.input :job, class: 'second'
        f.input :gender, as: :text, value: 'm'
        f.submit :Wow
      end

      expect(form).to eq(get_fixture('form_with_override_values'))
    end
  end
end
