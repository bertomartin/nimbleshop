# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'minitest', :verbose => true do
  # with Minitest::Unit
  #watch(%r|^test/test_(.*)\.rb|)
  #watch(%r|^lib/(.*)([^/]+)\.rb|)     { |m| "test/#{m[1]}test_#{m[2]}.rb" }
  #watch(%r|^test/test_helper\.rb|)    { "test" }


  watch(%r{^app/(.+)\.rb})             { |m| "spec/#{m[1]}_spec.rb" }

  # with Minitest::Spec
   watch(%r|^spec/(.*)_spec\.rb|)
   watch(%r|^lib/(.*)\.rb|)            { |m| "spec/#{m[1]}_spec.rb" }
   watch(%r|^spec/spec_helper\.rb|)    { "spec" }
end
