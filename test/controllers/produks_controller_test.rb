require 'test_helper'

class ProduksControllerTest < ActionController::TestCase
  setup do
    @produk = produks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:produks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create produk" do
    assert_difference('Produk.count') do
      post :create, produk: { nama: @produk.nama, stok: @produk.stok }
    end

    assert_redirected_to produk_path(assigns(:produk))
  end

  test "should show produk" do
    get :show, id: @produk
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @produk
    assert_response :success
  end

  test "should update produk" do
    patch :update, id: @produk, produk: { nama: @produk.nama, stok: @produk.stok }
    assert_redirected_to produk_path(assigns(:produk))
  end

  test "should destroy produk" do
    assert_difference('Produk.count', -1) do
      delete :destroy, id: @produk
    end

    assert_redirected_to produks_path
  end
end
