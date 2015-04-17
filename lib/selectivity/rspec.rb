module Selectivity
  module Rspec
    module FeatureHelpers

      def selectivity_select(value, options = {})
        fail('Selectivity input not set!') unless options.has_key?(:from)

        from = options.delete(:from)

        find(:div, from, options).click

        within 'div.selectivity-dropdown' do
          first(:xpath, "//div[@class='selectivity-result-item'][contains(text(), '#{value}')]").click
        end
      end

      def selectivity_unselect(value, options = {})
        fail('Selectivity input not set!') unless options.has_key?(:from)

        from              = options.delete(:from)
        selectivity_input = find(:div, from, options)

        if selectivity_multiselect?(selectivity_input)
          unselect_multiple(selectivity_input, value)
        else
          unselect_single(selectivity_input)
        end
      end

      private

      def selectivity_multiselect?(input)
        input.first('.selectivity-multiple-input-container').present?
      end

      def unselect_single(input)
        input.first('.selectivity-single-selected-item-remove').click
      end

      def unselect_multiple(input, value)
        input.first('.selectivity-multiple-selected-item', text: value)
             .first('.selectivity-multiple-selected-item-remove')
             .click
      end

    end
  end
end

RSpec.configure do |config|
  config.include Selectivity::Rspec::FeatureHelpers, type: :feature, js: true
end
