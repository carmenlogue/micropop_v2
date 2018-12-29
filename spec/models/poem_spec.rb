require 'rails_helper'

RSpec.describe Poem, type: :model do
  it { is_expected.to(have_and_belong_to_many(:tags)) }
  it { is_expected.to(have_and_belong_to_many(:categories)) }
  it { is_expected.to(belong_to(:song)) }

  it { is_expected.to validate_uniqueness_of(:reference) }
  it { is_expected.to validate_presence_of(:image) }
end
