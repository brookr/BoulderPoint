RSpec.configure do |config|
  # Only run tests that have this filter, if it exists
  # config.filter_run :debug => true

  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  # config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include Devise::TestHelpers, :type => :controller

  # TO DO: Reevaluate need for this after upcoming rspec/rails releases
  # https://github.com/rspec/rspec-rails/issues/485
  config.include RenderOverrides, :type => :view

  def valid_address(attributes = {})
    {
      :first_name => 'John',
      :last_name => 'Doe',
      :address1 => '2010 Cherry Ct.',
      :city => 'Mobile',
      :state => 'AL',
      :zip => '36608',
      :country => 'US'
    }.merge(attributes)
  end

  def valid_card(attributes = {})
    { :first_name => 'Joe',
      :last_name => 'Doe',
      :month => 2,
      :year => Time.now.year + 1,
      :number => '1',
      :type => 'bogus',
      :verification_value => '123'
    }.merge(attributes)
  end

  def valid_user(attributes = {})
    { :name => 'Bubba',
      :password => 'foobar',
      :password_confirmation => 'foobar',
      :email => "bubba@email.com"
    }.merge(attributes)
  end

  def valid_subscription(attributes = {})
    { :plan => subscription_plans(:basic),
      :subscriber => accounts(:localhost)
    }.merge(attributes)
  end

end
