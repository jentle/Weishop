Deface::Override.new(:virtual_path  => "spree/orders/edit",
                     :replace       => "erb[loud]:contains('form_tag empty_cart_path')",      
                     :text          => "<%= form_tag empty_cart_path, :method => :put, :remote => true do %>",
                     :name          => "empty_cart_use_ajax")