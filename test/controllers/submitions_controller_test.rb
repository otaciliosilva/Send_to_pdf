require 'test_helper'

class SubmitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @submition = submitions(:one)
  end

  test "should get index" do
    get submitions_url
    assert_response :success
  end

  test "should get new" do
    get new_submition_url
    assert_response :success
  end

  test "should create submition" do
    assert_difference('Submition.count') do
      post submitions_url, params: { submition: { Arquivo: @submition.Arquivo, Atividade: @submition.Atividade } }
    end

    assert_redirected_to submition_url(Submition.last)
  end

  test "should show submition" do
    get submition_url(@submition)
    assert_response :success
  end

  test "should get edit" do
    get edit_submition_url(@submition)
    assert_response :success
  end

  test "should update submition" do
    patch submition_url(@submition), params: { submition: { Arquivo: @submition.Arquivo, Atividade: @submition.Atividade } }
    assert_redirected_to submition_url(@submition)
  end

  test "should destroy submition" do
    assert_difference('Submition.count', -1) do
      delete submition_url(@submition)
    end

    assert_redirected_to submitions_url
  end
end
