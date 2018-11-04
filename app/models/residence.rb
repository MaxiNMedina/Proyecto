class Residence < ApplicationRecord
    default_scope -> { order :name }
end
