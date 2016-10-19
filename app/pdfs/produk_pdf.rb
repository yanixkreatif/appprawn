require 'prawn/table'

class ProdukPdf < Prawn::Document
  def initialize(produks)
    super()
    @produks = produks

    header
    table_content
  end

  def header
    y_position = cursor - 50
    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], :width => 270, :height => 50) do
      text "Data Produk", size: 15, style: :bold
    end
  end

   def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table order_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [40,200,100,200]
    end
  end

  def order_rows

    [[ '#' ,'nama produk','jumlah stok','last update']] +
      @produks.map.with_index do |produk, i|
      [ (i+1), produk.nama, produk.stok, produk.updated_at.to_s]
      
    end
  end
end