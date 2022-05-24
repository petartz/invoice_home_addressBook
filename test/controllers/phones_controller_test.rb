require 'test_helper'

class PhonesControllerTest < ActionController::TestCase
  setup do
    @person = people(:one)
    @phone = phones(:one)
  end

  test "should get index" do
    get :index, params: { person_id: @person }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { person_id: @person }
    assert_response :success
  end

  test "should create phone" do
    assert_difference('Phone.count') do
      post :create, params: { person_id: @person, phone: @phone.attributes }
    end

    assert_redirected_to person_phone_path(@person, Phone.last)
  end

  test "should show phone" do
    get :show, params: { person_id: @person, id: @phone }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { person_id: @person, id: @phone }
    assert_response :success
  end

  test "should update phone" do
    put :update, params: { person_id: @person, id: @phone, phone: @phone.attributes }
    assert_redirected_to person_phone_path(@person, Phone.last)
  end

  test "should destroy phone" do
    assert_difference('Phone.count', -1) do
      delete :destroy, params: { person_id: @person, id: @phone }
    end

    assert_redirected_to person_phones_path(@person)
  end
end
