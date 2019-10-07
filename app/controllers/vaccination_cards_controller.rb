class VaccinationCardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vaccination_card, only: [:show, :edit, :update, :destroy]
  before_action :check_classification_admin, only:[:index]
  before_action :check_classification_doc, only:[:doc_index]


  # GET /vaccination_cards
  # GET /vaccination_cards.json
  def index
    @vaccination_cards = VaccinationCard.all
  end

  # later on for each doctor to see the vaccination cards of his patients
  # def doc_index
  #
  # end

  # GET /vaccination_cards/1
  # GET /vaccination_cards/1.json
  def show
  end

  # GET /vaccination_cards/new
  def new
    session[:vaccination_card_params] ||= {}
    @vaccination_card = VaccinationCard.new(session[:vaccination_card_params])
    @vaccination_card.current_step = session[:vaccination_card_step]
    @vaccination_card.user = current_user
  end

  # GET /vaccination_cards/1/edit
  def edit
  end

  # POST /vaccination_cards
  # POST /vaccination_cards.json
  def create
    session[:vaccination_card_params].deep_merge!(params[:vaccination_card]) if params[:vaccination_card]
    @vaccination_card = VaccinationCard.new(session[:vaccination_card_params])
    @vaccination_card.current_step = session[:vaccination_card_step]

    process_step

    if @vaccination_card.new_record?
      render 'new'
    else
      session[:vaccination_card_step] = session[:vaccination_card_params] = nil
      flash[:notice] = "Entry saved."
      redirect_to impfpass_path
    end
    #@vaccination_card = VaccinationCard.new(vaccination_card_params)
    #
    #respond_to do |format|
    #  if @vaccination_card.save
    #    format.html { redirect_to @vaccination_card, notice: 'Vaccination card was successfully created.' }
    #    format.json { render :show, status: :created, location: @vaccination_card }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @vaccination_card.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PATCH/PUT /vaccination_cards/1
  # PATCH/PUT /vaccination_cards/1.json
  def update
    respond_to do |format|
      if @vaccination_card.update(vaccination_card_params)
        format.html { redirect_to @vaccination_card, notice: 'Vaccination card was successfully updated.' }
        format.json { render :show, status: :ok, location: @vaccination_card }
      else
        format.html { render :edit }
        format.json { render json: @vaccination_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vaccination_cards/1
  # DELETE /vaccination_cards/1.json
  def destroy
    @vaccination_card.destroy
    respond_to do |format|
      format.html { redirect_to vaccination_cards_url, notice: 'Vaccination card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vaccination_card
      @vaccination_card = VaccinationCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vaccination_card_params
      params.require(:vaccination_card).permit(:vaccination_id, :user_id, :get_date, :injection_type, :dosis_e, :dosis_ml, :typ, :charge_number, :doctor, :test, :reaktion)
    end

    def vaccination_card_type_params
      params.require(:vaccination_card).permit(:typ);
    end

    def process_step
      #if @vaccination_card.valid?
        if params[:back_button]
          @vaccination_card.previous_step
        elsif @vaccination_card.last_step?
          @vaccination_card.save if @vaccination_card.all_valid?
        else
          @vaccination_card.next_step
        end
        session[:vaccination_card_step] = @vaccination_card.current_step
      #end
    end

end
