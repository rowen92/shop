ActiveAdmin.register Category, as: 'Product Categories' do
  permit_params :title, :short_description, :description,
                :position, :meta_title, :meta_description,
                :meta_keywords, :image
end
