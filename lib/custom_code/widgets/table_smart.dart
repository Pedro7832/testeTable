// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class TableSmart extends StatefulWidget {
  const TableSmart({
    super.key,
    this.width,
    this.height,
    this.dataJson,
  });

  final double? width;
  final double? height;
  final dynamic dataJson;

  @override
  State<TableSmart> createState() => _TableSmartState();
}

class _TableSmartState extends State<TableSmart> {
  @override
  Widget build(BuildContext context) {
    final List<dynamic> data = widget.dataJson ?? [];

    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          // Header Row
          Container(
            padding: EdgeInsets.all(8.0),
            color: FlutterFlowTheme.of(context).primaryBackground,
            child: Row(
              children: const [
                Expanded(
                    flex: 1,
                    child: Text("ID",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(
                    flex: 2,
                    child: Text("Image",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(
                    flex: 3,
                    child: Text("Product Name",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(
                    flex: 2,
                    child: Text("Price",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(
                    flex: 2,
                    child: Text("Quantity",
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
          ),
          // Data Rows
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Text(item['id'].toString())),
                      Expanded(
                        flex: 2,
                        child: Image.network(
                          item['image_url'],
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.image, color: Colors.grey);
                          },
                        ),
                      ),
                      Expanded(
                          flex: 3, child: Text(item['product_name'] ?? "")),
                      Expanded(
                          flex: 2,
                          child: Text(
                              "R\$${item['price']?.toStringAsFixed(2) ?? "0.00"}")),
                      Expanded(
                          flex: 2, child: Text(item['quantity'].toString())),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
