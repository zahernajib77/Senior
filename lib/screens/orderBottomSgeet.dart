import 'package:flutter/cupertino.dart';

class OrderBottomSheet extends StatefulWidget {
  const OrderBottomSheet({ Key? key }) : super(key: key);

  @override
  _OrderBottomSheetState createState() => _OrderBottomSheetState();
}

class _OrderBottomSheetState extends State<OrderBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final WIDTH = MediaQuery.of(context).size.width;
    final HEIGHT = MediaQuery.of(context).size.height;
    return Container(
       width: WIDTH,
       child: 
       Column(
         children: [
           Column(
             children: [
               Text('Order Summary',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
               Container(
                 child: 
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text('Price',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                     Text('Price',style: TextStyle(fontSize: 16)),
                   ],
                 ),
               )
             ],
           ),
           Container(

           )
         ],
       ),
    );
  }
}