class Membership < ApplicationRecord
    belongs_to :gym
    belongs_to :client

    validates :gym_id, presence: true
    validates :client_id, presence: true, uniqueness: { scope: :gym_id, message: "can have one membership in a gym"}
    validates :charge, presence: true
end
