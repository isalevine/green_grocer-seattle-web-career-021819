require "pry"



def consolidate_cart(cart)

  # initialize objects
  hash_output = {}
  final_cart_array = []

  # iterating over twice - once to create unique
  # final cart of items(array), and again to
  # count each item, after the [:counter] key is created
  # (?? is there a way to consolidate and only iterate ONCE ??)


  # create unique list of items, and
  # import all previous key/value pairs
  # from item's original hash(value), and
  # create a new key for counting each item

  # 1. iterate to create unique list of items,
  #    and set their [:counter] key equal to 0
  cart.each do |item_hash|
    item_name = item_hash.keys[0]
    final_cart_array << item_name
    final_cart_array = final_cart_array.uniq
    hash_output[item_name] = item_hash[item_name]
    hash_output[item_name][:count] = 0
  end

  # 2. iterate to count each item, and increase
  #    [:count] key by 1
  cart.each do |hash|
    item_called = hash.keys[0].to_s
    hash_output[item_called][:count] += 1
  end

  hash_output
end

def apply_coupons(cart, coupons)
  hash_output = cart
  cart_array = cart.keys
  coupons.each do |coupon_hash|
    coupon_name = coupon_hash[:item]

    if cart_array.include?(coupon_name)

      # check if enough items are in cart to apply coupon
      ##if hash_output[coupon_name][:count] >= coupon_hash[:num]

        # new coupon-ated item
        new_item_name = coupon_name + " W/COUPON"
        hash_output[new_item_name] = {}
        hash_output[new_item_name][:count] = 1
        hash_output[new_item_name][:price] = coupon_hash[:cost]

        if hash_output[coupon_name][:count] == 0
          hash_output[new_item_name][:clearance] = true
        elsif hash_output[coupon_name][:count] > 0
          hash_output[new_item_name][:clearance] = false
        
        # original item
        hash_output[coupon_name][:count] -= coupon_hash[:num]
        hash_output[new_item_name][:clearance] = true

      
        


      end
    end
  end
  hash_output
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
