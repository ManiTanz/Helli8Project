import 'package:first_app/product.dart';
import 'package:flutter/material.dart';

typedef OnRemovePressed = Function(int index);

class ShoppingBasketItem extends StatefulWidget {
  Product product;
  int _count = 0;
  final int _index;
  final OnRemovePressed _onRemovePressed;
  ShoppingBasketItem(this.product, this._onRemovePressed, this._index, {Key? key}) : super(key: key);

  @override
  _ShoppingBasketItemState createState() => _ShoppingBasketItemState();
}

class _ShoppingBasketItemState extends State<ShoppingBasketItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        height: 200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 40, left: 20),
              child: Image.network(
                widget.product.img,
                width: 100,
                height: 100,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 20),
                  child: Text(
                    widget.product.name,
                    style: const TextStyle(fontFamily: "Vazirmatn", fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      GestureDetector(
                        child: const Icon(
                          Icons.chevron_right,
                          size: 35,
                        ),
                        onTap: () {
                          Decrement();
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget._count.toString(),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                          onTap: () {
                            Increment();
                          },
                          child: const Icon(
                            Icons.chevron_left,
                            size: 35,
                          )),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 20, left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          widget._onRemovePressed(widget._index);
                        },
                        child: const Icon(Icons.delete_outline),
                      ),
                      Text(
                        widget.product.desc,
                        style: const TextStyle(fontFamily: "Vazirmatn", fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void Increment() {
    setState(() {
      widget._count++;
    });
  }

  void Decrement() {
    setState(() {
      if (widget._count == 0){
        return;
      }
      else {
        widget._count--;
      }
    });
  }
}
