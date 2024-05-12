import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './cart_controller.dart';

class CartPage extends GetView<CartController> {
    
    const CartPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('CartPage'),),
            body: Container(),
        );
    }
}