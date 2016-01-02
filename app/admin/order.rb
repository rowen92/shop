ActiveAdmin.register Order do
  permit_params :status

  index do
    id_column
    column :name
    column :phone
    column :status
    actions
  end

  show do |order|

    attributes_table do
      row :name
      row :phone
      row :status
    end

    panel('Line Items') do
      table_for(order.line_items) do
        column 'Title' do |i|
          i.product.title
        end
        column :quantity
        column 'Price' do |i|
          number_to_currency i.product.price
        end
      end
    end

    panel('Total order price') do
      number_to_currency order.line_items.to_a.sum{ |item| item.total_price }
    end

  end

  form do |f|
    f.inputs 'Order' do
      f.semantic_errors *f.object.errors.keys
      f.input :status, as: :select, collection: Order::STATUS, include_blank: false
    end
    f.actions
  end

end
