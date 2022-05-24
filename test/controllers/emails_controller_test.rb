require 'test_helper'

class EmailsControllerTest < ActionController::TestCase
  setup do
    @person = people(:one)
    @email = emails(:one)
  end

  test "should get index" do
    get :index, params: { person_id: @person }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { person_id: @person }
    assert_response :success
  end

  test "should create email" do
    assert_difference('Email.count') do
      post :create, params: { person_id: @person, email: @email.attributes }
    end

    assert_redirected_to person_email_path(@person, Email.last)
  end

  test "should show email" do
    get :show, params: { person_id: @person, id: @email }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { person_id: @person, id: @email }
    assert_response :success
  end

  test "should update email" do
    put :update, params: { person_id: @person, id: @email, email: @email.attributes }
    assert_redirected_to person_email_path(@person, Email.last)
  end

  test "should destroy email" do
    assert_difference('Email.count', -1) do
      delete :destroy, params: { person_id: @person, id: @email }
    end

    assert_redirected_to person_emails_path(@person)
  end
end
