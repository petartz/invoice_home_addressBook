require 'test_helper'

class AddressesControllerTest < ActionController::TestCase
  setup do
    @person = people(:one)
    @address = addresses(:one)
  end

  test "should get index" do
    get :index, params: { person_id: @person }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { person_id: @person }
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      post :create, params: { person_id: @person, address: @address.attributes }
    end

    assert_redirected_to person_address_path(@person, Address.last)
  end

  test "should show address" do
    get :show, params: { person_id: @person, id: @address }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { person_id: @person, id: @address }
    assert_response :success
  end

  test "should update address" do
    put :update, params: { person_id: @person, id: @address, address: @address.attributes }
    assert_redirected_to person_address_path(@person, Address.last)
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete :destroy, params: { person_id: @person, id: @address }
    end

    assert_redirected_to person_addresses_path(@person)
  end
end
