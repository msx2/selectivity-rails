module Selectivity
  module Rspec
    module FeatureHelpers

      def selectivity_select(value, *args)
        options = args.extract_options!

        fail('Selectivity input not set!') unless options.has_key?(:from)

        from  = options.delete(:from)
        input = find_selectivity_input(from, options)
        items = _selectivity_multiselect?(input) ? args.unshift(value).uniq : [value]

        items.each do |item|
          _selectivity_select!(input, item)
        end
      end

      def selectivity_unselect(value, *args)
        options = args.extract_options!

        fail('Selectivity input not set!') unless options.has_key?(:from)

        from  = options.delete(:from)
        input = find_selectivity_input(from, options)
        items = _selectivity_multiselect?(input) ? args.unshift(value).uniq : [value]

        items.each do |item|
          if _selectivity_multiselect?(input)
            _selectivity_unselect_multiple!(input, item)
          else
            _selectivity_unselect_single!(input)
          end
        end
      end

      private

      def find_selectivity_input(from, options)
        find(:div, from, options)
      rescue Capybara::ElementNotFound
        label = find('label', { text: from }.merge(options))

        find(:div, "##{label[:for]}", options)
      end

      def _selectivity_multiselect?(input)
        input.first('.selectivity-multiple-input-container').present?
      end

      def _selectivity_select!(input, item)
        input.click

        within 'div.selectivity-dropdown' do
          element = if page.driver.class.name =~ /poltergeist/i
                      find('div.selectivity-result-item', text: item)
                    else
                      find(:xpath, "//div[contains(@class,'selectivity-result-item')][text()='#{item}']")
                    end

          if element.visible?
            page.evaluate_script("$('div.selectivity-result-item:contains(#{item})').trigger('click')")
          end
        end
      end

      def _selectivity_unselect_single!(input)
        input.first('.selectivity-single-selected-item-remove').click
      end

      def _selectivity_unselect_multiple!(input, value)
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
