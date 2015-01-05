Spree.ready ($) ->
  if ($ 'form#update-cart').is('*')
    ($ document).on 'click', 'form#update-cart a.delete',->
      ($ this).parents('.line-item').first().find('input.line_item_quantity').val 0
      ($ this).parents('form').first().submit()
      false

  ($ 'form#update-cart').submit ->
    ($ 'form#update-cart #update-button').attr('disabled', true)