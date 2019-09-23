class Province < ActiveRecord::Base
  include Featurable

  featurable :geom, [:name]

end