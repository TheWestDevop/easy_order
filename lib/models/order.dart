
 import 'dart:convert';
import 'dart:io';

class Order {
   
   String user_id;
   String delivery_state;
   String delivery_lga;
   String delivery_address;
   String delivery_at;
   String total_cost;
   String coupon;
   List<dynamic> order;
   int  order_type;


   

  Order(
    { 
      this.user_id,
      this.delivery_state,
      this.delivery_lga,
      this.delivery_address,
      this.delivery_at,
      this.total_cost,
      this.coupon,
      this.order,
      this.order_type
      });

 Map<String,dynamic> toMap(){
   var map =  new Map<String,dynamic>();
   map['user_id']= user_id;
   map['delivery_state']= delivery_state;
   map['delivery_lga']= delivery_lga;
   map['delivery_address']= delivery_address;
   map['delivery_at']= delivery_at;
   map['total_cost']= total_cost;
   map['coupon']= coupon;
   map['product_ordered']= json.encode(order);
   map['order_type']=order_type;
      return map;
 }

 }