class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:welcome_page, :agb_page]

def welcome_page

end

def agb_page

end

def test_page

end

def notes_page
  @notes=current_user.notes
  if @notes.last.nil?
    @delete_path = root_path
    @note=current_user.notes.build
  else
    @note=@notes.last
    @delete_path = note_path(@note)
  end
end

def change_note

end

def impfpass_page
  unless current_user.nil?
    @vaccinations=current_user.vaccination_cards
  end
end

def vaccination_information
  # just a mock method for the html page
end

def pdf
  pdf_filename = File.join(Rails.root, "app/assets/downloads/VeröffentlichungsAntrag.pdf")
  send_file(pdf_filename, :filename => "VeröffentlichungsAntrag.pdf", :disposition => 'inline', :type => "application/pdf")
end

end
