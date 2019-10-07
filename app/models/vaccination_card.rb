class VaccinationCard < ApplicationRecord
belongs_to :user
belongs_to :vaccination
attr_writer :current_step

validates_presence_of :user_id, if: :confirmation_step?
validates_presence_of :vaccination_id, if: :tables_step?

ENTRY_TYPES = ['Seruminjection',
               'Immunization',
               'Results of antibody assays (Anti-HBs)',
               'Vaccination',
               'Revaccination',
               'Tuberculin-test',
               'Passive Immunization']

  def vaccination_type
    ENTRY_TYPES(self.injection_type)
  end

  def current_step
    @current_step || steps.first
  end

  def steps
    %w[type tables params confirmation]
  end

  def type_step?
    current_step == 'type'
  end

  def tables_step?
    current_step == 'tables'
  end

  def params_step?
    current_step == 'params'
  end

  def confirmation_step?
    current_step == 'confirmation'
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def first_step?
    self.current_step == steps.first
  end

  def last_step?
    self.current_step == steps.last
  end

  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end
end