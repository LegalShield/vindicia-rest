require 'spec_helper'

describe Vindicia::Model::ProductDescription do
  it { should be_a(Vindicia::Model::Base) }

  it { should have_property(:language) }
  it { should have_property(:description) }
end
