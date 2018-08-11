class Project < ApplicationRecord
  def link_is_accessable?
    if link.nil? || !url_exist?(link)
        return false
    end
    true
  end
end
