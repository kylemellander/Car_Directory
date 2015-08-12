require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('shows home page', {:type => :feature}) do
  it('takes user to index page') do
    visit('/')
    expect(page).to have_content("Car Dealership Network")
  end
end
