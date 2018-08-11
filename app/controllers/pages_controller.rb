class PagesController < ApplicationController

def welcome_page

end

def agb_page

end

def test_page

end

def login_page

end

def impfpass_page

end

def pdf
  pdf_filename = File.join(Rails.root, "app/assets/downloads/VeröffentlichungsAntrag.pdf")
  send_file(pdf_filename, :filename => "VeröffentlichungsAntrag.pdf", :disposition => 'inline', :type => "application/pdf")
end

end
