require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'
require 'shoulda/matchers'

Capybara.register_driver :selenium_firefox do |app|
  Capybara::Selenium::Driver.new(app, browser: :firefox)
end

Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium_firefox

RSpec.configure do |config|
  config.include(Shoulda::Matchers::ActiveModel, type: :model)
  config.include(Shoulda::Matchers::ActiveRecord, type: :model)
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  Capybara.server_host = '127.0.0.1'
  Capybara.server_port = 35_015

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
