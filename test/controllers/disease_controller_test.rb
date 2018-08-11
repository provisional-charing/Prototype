require 'test_helper'

class DiseasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get diseases_url
    assert_response :success
  end

  test "should get new" do
    get new_disease_url
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post disease_url, params: { project: { name: @disease.name, what: @disease.what, infection: @disease.infection, symptom: @disease.symptom, counteraction: @disease.counteraction } }
    end

    assert_redirected_to disease_url(Disease.last)
  end

  test "should show project" do
    get disease_url(@disease)
    assert_response :success
  end

  test "should get edit" do
    get edit_disease_url(@disease)
    assert_response :success
  end

  test "should update project" do
    patch disease_url, params: { project: { name: @disease.name, what: @disease.what, infection: @disease.infection, symptom: @disease.symptom, counteraction: @disease.counteraction } }
    assert_redirected_to disease_url(@disease)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete disease_url(@disease)
    end

    assert_redirected_to diseases_url
  end
end
