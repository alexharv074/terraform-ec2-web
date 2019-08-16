require 'spec_helper'

describe command('terraform output') do
  its(:stdout) { should match /http/ }
end

hello_url = %x{terraform output}.split[2].chomp

describe command("curl #{hello_url}") do
  its(:stdout) { should match /hello world/ }
end
