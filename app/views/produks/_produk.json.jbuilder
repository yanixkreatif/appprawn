json.extract! produk, :id, :nama, :stok, :created_at, :updated_at
json.url produk_url(produk, format: :json)