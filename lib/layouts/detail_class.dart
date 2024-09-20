import 'package:Elibrary/layouts/table.dart';
import 'package:flutter/material.dart';

class MyItemDetail extends StatefulWidget {
  final String title;
  final String descript;
  final dynamic length;
  final String range_id;
  final String closet_id;
  final String floor_id;
  final String img;

  const MyItemDetail({
    Key? key,
    required this.title,
    required this.descript,
    required this.length,
    required this.range_id,
    required this.closet_id,
    required this.floor_id,
    required this.img,
  }) : super(key: key);

  @override
  State<MyItemDetail> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyItemDetail> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                minHeight: 250.0,
                maxHeight: 350,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black26,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        widget.img,
                        height: double.maxFinite,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(16, 22, 29, 1),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [
                            0.0,
                            3.0,
                          ], // Adjust stops for more control over gradient appearance
                        ),
                      ),
                      child: const Text(""),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    bottom: 5,
                    left: 5,
                    child: UnconstrainedBox(
                      alignment: Alignment.center,
                      child: Container(
                        height: 300,
                        constraints: const BoxConstraints(maxWidth: 300),
                        margin: const EdgeInsets.only(left: 15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(
                            widget.img,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Table(
                    border: TableBorder.all(color: Colors.transparent),
                    children: [
                      TableRow(children: [
                        TableCell(
                          child: Table_DataCallMain('ចំណងជើង'),
                        ),
                        TableCell(
                          child: Table_DataCellsun(widget.title),
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Table_DataCallMain('ការពិពណ៌នា'),
                        ),
                        TableCell(
                          child: Table_DataCellsun(widget.descript),
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Table_DataCallMain('ចំនួន'),
                        ),
                        TableCell(
                          child: Table_DataCellsun(widget.length.toString()),
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Table_DataCallMain('ជួទូរ'),
                        ),
                        TableCell(
                          child: Table_DataCellsun(widget.range_id),
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Table_DataCallMain('លេខទូរ'),
                        ),
                        TableCell(
                          child: Table_DataCellsun(widget.closet_id),
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Table_DataCallMain('ជាន់ទូរ'),
                        ),
                        TableCell(
                          child: Table_DataCellsun(widget.floor_id),
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyItemDetailContainer extends StatefulWidget {
  final String title;
  final String descript;
  final dynamic length;
  final String range_id;
  final String closet_id;
  final String floor_id;
  final String img;

  const MyItemDetailContainer({
    Key? key,
    required this.title,
    required this.descript,
    required this.length,
    required this.range_id,
    required this.closet_id,
    required this.floor_id,
    required this.img,
  }) : super(key: key);

  @override
  State<MyItemDetailContainer> createState() => _MyItemDetailContainerState();
}

class _MyItemDetailContainerState extends State<MyItemDetailContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          )),
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            width: double.infinity,
            constraints: const BoxConstraints(
              minHeight: 250.0,
              maxHeight: 350,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromRGBO(15, 15, 15, 1),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Image.network(
                      widget.img,
                      height: double.maxFinite,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(121, 101, 56, 1),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [
                          0.0,
                          3.0,
                        ], // Adjust stops for more control over gradient appearance
                      ),
                    ),
                    child: const Text(""),
                  ),
                ),
                Positioned(
                  top: 5,
                  bottom: 5,
                  left: 5,
                  child: UnconstrainedBox(
                    alignment: Alignment.center,
                    child: Container(
                      height: 300,
                      constraints: const BoxConstraints(maxWidth: 300),
                      margin: const EdgeInsets.only(left: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          widget.img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              children: [
                ListTile(
                  title: Table_DataCallMain('ចំណងជើង'),
                  subtitle: Table_DataCellsun(widget.title),
                ),
                ListTile(
                  title: Table_DataCallMain('ការពិពណ៍នា'),
                  subtitle: Table_DataCellsun(widget.descript),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Table(
                    border: TableBorder.all(color: Colors.transparent),
                    children: [
                      TableRow(children: [
                        TableCell(
                          child: Table_DataCallMain('ចំនួន'),
                        ),
                        TableCell(
                          child: Table_DataCellsun(widget.length.toString()),
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Table_DataCallMain('ជួទូរ'),
                        ),
                        TableCell(
                          child: Table_DataCellsun(widget.range_id),
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Table_DataCallMain('លេខទូរ'),
                        ),
                        TableCell(
                          child: Table_DataCellsun(widget.closet_id),
                        ),
                      ]),
                      TableRow(children: [
                        TableCell(
                          child: Table_DataCallMain('ជាន់ទូរ'),
                        ),
                        TableCell(
                          child: Table_DataCellsun(widget.floor_id),
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
