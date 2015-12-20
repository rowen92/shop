ActiveAdmin.register Category, as: 'Product Categories' do
  permit_params :title, :short_description, :description, :image

  config.sort_order = 'position_asc'

  index do
    column :id
    column :title
    column 'image' do |category|
      image_tag category.image_url(:small) if category.image?
    end
    column :short_description
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Category" do
      f.input :title
      f.input :short_description
      f.input :description
      f.file_field :image
    end
    f.actions
  end

end
