ActiveAdmin.register Product do
  permit_params :title, :description, :image, :price, :category_id

  index do
    column :id
    column 'image' do |product|
      image_tag product.image_url(:small) if product.image?
    end
    column 'Название', :title
    actions
  end

end
