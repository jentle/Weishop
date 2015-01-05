Spree::OrdersController.class_eval do
  respond_to :js, :only => [:populate, :empty]
  
  def empty
    if @order = current_order
            @order.empty!
    end
  end
  
  def update
    if @order.contents.update_cart(order_params)   
      respond_with(@order) do |format|
        format.js do
          if params.has_key?(:checkout)
            @order.next if @order.cart?
            render js: "window.location.replace('#{checkout_state_url(@order.checkout_steps.first)}');"
          end
        end
      end
    end
  end
  
  
        
end