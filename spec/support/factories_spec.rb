# gem 'rspec-rails', '~> 2.14.2'
require 'spec_helper' 

describe 'Factory Girl' do
  FactoryGirl.factories.map(&:name).each do |factory_name|

    # Create a different spec for invalid
    # Need to turn factory name (symbol) into string
    if !factory_name.to_s.include?('invalid')

      describe "#{factory_name} factory" do

        # Test each factory
        it 'is valid' do
          factory = FactoryGirl.build(factory_name)
          if factory.respond_to?(:valid?)
            expect(factory).to be_valid, lambda { factory.errors.full_messages.join('\n') }
          end
        end

        # Test each trait
        FactoryGirl.factories[factory_name].definition.defined_traits.map(&:name).each do |trait_name|
          context "with trait #{trait_name}" do
            it 'is valid' do
              factory = FactoryGirl.build(factory_name, trait_name)
              if factory.respond_to?(:valid?)
                expect(factory).to be_valid, lambda { factory.errors.full_messages.join('\n') }
              end
            end
          end
        end
      end
    end
  end
end