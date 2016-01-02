ActiveAdmin.register Product do
  permit_params :title, :description, :image, :price, :category_id

  config.sort_order = 'position_asc'

  index do
    column :id
    column :title
    column 'image' do |product|
      image_tag product.image_url(:very_small) if product.image?
    end
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Product' do
      f.input :category_id, as: :select,
                            collection: Category.all.map{|c| [c.title, c.id]},
                            include_blank: true
      f.input :title
      f.input :description
      f.input :price
      f.file_field :image
    end
    f.actions
  end

end
