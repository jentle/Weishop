Deface::Override.new(:virtual_path  => "spree/orders/edit",
                     :replace       => "erb[loud]:contains('form_for @order')",
                     :text          => "<%= form_for @order, :url => update_cart_path, :html => {:id => 'update-cart'} , :remote => true do |order_form| %>",
                     :name          => "update_cart_use_ajax")