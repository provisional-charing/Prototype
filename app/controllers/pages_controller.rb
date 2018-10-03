class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:welcome_page, :agb_page]

def welcome_page

end

def agb_page

end

def test_page

end

def notes_page
  if current_user.notes.first.nil? || !current_user.notes.last.id.nil?
    current_user.notes.build
  end

  if params[:id].nil? || current_user.id!=Note.find(params[:id]).user_id
    @note=current_user.notes.last
  else
    @note=Note.find(params[:id]);
  end
    @notes = current_user.notes
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
