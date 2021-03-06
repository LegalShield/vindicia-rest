require 'spec_helper'

describe Cashbox::Address do
  it { is_expected.to be_a(Cashbox::Model) }
  it { is_expected.to be_a(Cashbox::Concern::Objectable) }

  it { is_expected.to have_property(:vid) }
  it { is_expected.to have_property(:name) }
  it { is_expected.to have_property(:line1) }
  it { is_expected.to have_property(:city) }
  it { is_expected.to have_property(:district) }
  it { is_expected.to have_property(:postal_code) }
  it { is_expected.to have_property(:country) }
  it { is_expected.to have_property(:phone) }
  it { is_expected.to have_property(:fax) }

  its(:object) { is_expected.to eql('Address') }
end
