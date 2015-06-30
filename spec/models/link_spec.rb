require "rails_helper"

describe Link do
  it { should validate_presence_of :name }
  it { should validate_presence_of :url }
end
