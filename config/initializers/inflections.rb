# config/initializers/inflections.rb
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'tutor', 'tutores'
  inflect.irregular 'pet', 'pets'
end
