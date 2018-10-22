require 'rails_helper'

RSpec.describe Song, type: :model do
  it { is_expected.to(have_many(:poems)) }
  it { is_expected.to(belong_to(:artist)) }
end
