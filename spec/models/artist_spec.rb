require 'rails_helper'

RSpec.describe Artist, type: :model do
  it { is_expected.to(have_many(:songs)) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:signature) }
end
