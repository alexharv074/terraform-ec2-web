require 'spec_helper'

describe command('/usr/local/bin/terraform0126 output') do
  its(:stdout) { should match /http/ }
end

hello_url = %x{/usr/local/bin/terraform0126 output}.split[2].chomp

describe command("curl #{hello_url}") do
  its(:stdout) { should match /hello world/ }
end
