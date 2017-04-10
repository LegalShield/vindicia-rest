require 'spec_helper'

describe Vindicia::Concern::Persistable do
  let!(:klass) do
    class PersistableTestClass
      include Vindicia::Concern::Persistable
    end
    PersistableTestClass
  end

  context '.criteria' do
    subject { klass.criteria }

    it 'returns an instance of a criteria' do
      expect(subject).to be_a(Vindicia::Criteria)
    end

    it 'inits with the criteria with an instance of the model' do
      allow(Vindicia::Repository).to receive(:new).with(kind_of(PersistableTestClass)).and_return(Vindicia::Repository.new(PersistableTestClass.new))
      allow(Vindicia::Criteria).to receive(:new).with(kind_of(Vindicia::Repository))
      subject
      expect(Vindicia::Criteria).to have_received(:new).with(kind_of(Vindicia::Repository))
      expect(Vindicia::Repository).to have_received(:new).with(kind_of(PersistableTestClass))
    end
  end

  context '#repository' do
    let(:instance) { klass.new }
    subject { instance.repository }

    it 'returns an instance of a criteria' do
      expect(subject).to be_a(Vindicia::Repository)
    end

    it 'inits with the criteria with an instance of the model' do
      allow(Vindicia::Repository).to receive(:new).with(kind_of(PersistableTestClass)).and_return(Vindicia::Repository.new(PersistableTestClass.new))
      subject
      expect(Vindicia::Repository).to have_received(:new).with(kind_of(PersistableTestClass))
    end

    it 'memoizes the criteria' do
      allow(Vindicia::Repository).to receive(:new).with(kind_of(PersistableTestClass)).and_return(double('repository'))
      instance.repository
      instance.repository
      expect(Vindicia::Repository).to have_received(:new).with(kind_of(PersistableTestClass)).once
    end
  end

  context 'forwardable' do
    subject { klass }

    it { is_expected.to be_kind_of(SingleForwardable) }
    it { is_expected.to be_kind_of(Forwardable) }

    context 'class methods' do
      subject { klass }

      it { is_expected.to delegate_method(:all).to(:criteria) }
      it { is_expected.to delegate_method(:where).to(:criteria) }
      it { is_expected.to delegate_method(:first).to(:criteria) }
      it { is_expected.to delegate_method(:find).to(:criteria) }
    end

    context 'instance methods' do
      subject { klass.new }

      it { is_expected.to delegate_method(:save).to(:repository) }
    end
  end
end
