class VaccinationCard < ApplicationRecord
belongs_to :user
belongs_to :vaccination
end