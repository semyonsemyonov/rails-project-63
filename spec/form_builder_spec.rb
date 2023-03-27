# frozen_string_literal: true

User = Struct.new(:name, :job, :gender, keyword_init: true)

RSpec.describe HexletCode do
  context 'generate form' do
    it 'create empty form' do
      user = User.new
      form = HexletCode.form_for user

      expect(form).to eq(fixture('empty_form'))
    end

    it 'create form with url' do
      user = User.new
      form = HexletCode.form_for user, { url: '/users' }

      expect(form).to eq(fixture('empty_form_with_url'))
    end
  end
end

RSpec.describe HexletCode do
  context 'generate input' do
    it 'create form with input' do
      user = User.new
      form = HexletCode.form_for(user, { url: '/users' }) { |f| f.input :name }

      expect(form).to eq(fixture('form_with_input'))
    end

    it 'create form with input classes' do
      user = User.new
      form = HexletCode.form_for(user, { url: '/users' }) { |f| f.input :name, class: 'user-input' }

      expect(form).to eq(fixture('input_with_classes'))
    end

    it 'create form with 2 inputs' do
      user = User.new
      form = HexletCode.form_for(user, { url: '/users' }) do |f|
        f.input :name, class: '1'
        f.input :job, class: '2'
      end

      expect(form).to eq(fixture('form_with_2_inputs'))
    end
  end
end

RSpec.describe HexletCode do
  context 'generate textarea' do
    it 'create form with textarea' do
      user = User.new
      form = HexletCode.form_for(user, { url: '/users' }) { |f| f.input :job, as: :text }

      expect(form).to eq(fixture('form_with_textarea'))
    end
  end
end

RSpec.describe HexletCode do
  context 'generate input' do
    it 'with default value' do
      user = User.new(name: 'rob')
      form = HexletCode.form_for(user, { url: '/users' }) { |f| f.input :name }

      expect(form).to eq(fixture('input_with_default_value'))
    end

    it 'with override text' do
      user = User.new(name: 'rob', job: 'developer')
      form = HexletCode.form_for(user, { url: '/users' }) { |f| f.input :job, as: :text }

      expect(form).to eq(fixture('input_with_override_text'))
    end
  end
end

RSpec.describe HexletCode do
  context 'generate submit' do
    it 'with default value' do
      user = User.new(name: 'rob')
      form = HexletCode.form_for(user, { url: '/users' }) do |f|
        f.input :name
        f.submit
      end

      expect(form).to eq(fixture('with_submit_with_default'))
    end

    it 'with override parameters' do
      user = User.new(name: 'rob', job: 'developer')
      form = HexletCode.form_for(user, { url: '/users' }) do |f|
        f.input :name
        f.submit :Wow
      end
      expect(form).to eq(fixture('with_submit_with_override'))
    end
  end
end

RSpec.describe HexletCode do
  context 'generate label' do
    it 'with default name' do
      user = User.new(name: 'rob')
      form = HexletCode.form_for(user, { url: '/users' }) do |f|
        f.input :name
        f.submit
      end

      expect(form).to eq(fixture('input_with_label'))
    end
  end
end
