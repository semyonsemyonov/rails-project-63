[![Ruby](https://github.com/semyonsemyonov/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/semyonsemyonov/rails-project-63/actions/workflows/main.yml)
# HexletCode

HexletCode is a Ruby gem that generates HTML forms based on Ruby code. It simplifies the process of creating forms by allowing developers to write Ruby code to define the form fields and their attributes. The generated HTML is customizable and can be easily integrated into any web application.

# How to use

Just call the code block with any parameters

```ruby
User = Struct.new(:name, :job, keyword_init: true)
user = User.new job: 'hexlet'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job
  f.submit
end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text">
#   <label for="job">Job</label>
#   <input name="job" type="text" value="hexlet">
#   <input type="submit" value="Save">
# </form>
```

# How to run

``` bash
make install  #install dependencies
make lint     #run rubocop
make test     #run rspec
```
