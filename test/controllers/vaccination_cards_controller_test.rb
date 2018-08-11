require 'test_helper'

class VaccinationCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vaccination_card = vaccination_cards(:one)
  end

  test "should get index" do
    get vaccination_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_vaccination_card_url
    assert_response :success
  end

  test "should create vaccination_card" do
    assert_difference('VaccinationCard.count') do
      post vaccination_cards_url, params: { vaccination_card: { charge_number: @vaccination_card.charge_number, doctor: @vaccination_card.doctor, dosis_e: @vaccination_card.dosis_e, dosis_ml: @vaccination_card.dosis_ml, get_date: @vaccination_card.get_date, injection_type: @vaccination_card.injection_type, reaktion: @vaccination_card.reaktion, test: @vaccination_card.test, typ: @vaccination_card.typ, user_id: @vaccination_card.user_id, vaccination_id: @vaccination_card.vaccination_id } }
    end

    assert_redirected_to vaccination_card_url(VaccinationCard.last)
  end

  test "should show vaccination_card" do
    get vaccination_card_url(@vaccination_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_vaccination_card_url(@vaccination_card)
    assert_response :success
  end

  test "should update vaccination_card" do
    patch vaccination_card_url(@vaccination_card), params: { vaccination_card: { charge_number: @vaccination_card.charge_number, doctor: @vaccination_card.doctor, dosis_e: @vaccination_card.dosis_e, dosis_ml: @vaccination_card.dosis_ml, get_date: @vaccination_card.get_date, injection_type: @vaccination_card.injection_type, reaktion: @vaccination_card.reaktion, test: @vaccination_card.test, typ: @vaccination_card.typ, user_id: @vaccination_card.user_id, vaccination_id: @vaccination_card.vaccination_id } }
    assert_redirected_to vaccination_card_url(@vaccination_card)
  end

  test "should destroy vaccination_card" do
    assert_difference('VaccinationCard.count', -1) do
      delete vaccination_card_url(@vaccination_card)
    end

    assert_redirected_to vaccination_cards_url
  end
end
