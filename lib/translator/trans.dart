import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:matlab/translator/data.dart';
import 'package:matlab/translator/provider/trans_provider.dart';

class trans extends StatelessWidget {
  final textController = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.translate),
          title: Text("Matlab"),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final langs = ref.watch(transProvider).translated;
            final bha = ref.watch(transProvider).bhase;
            return Form(
              key: _form,
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: 223,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Card(
                      elevation: 10,
                      child: ListView(
                        padding: EdgeInsets.all(20),
                        children: [
                          Text("English (US)"),
                          SizedBox(
                            height: 6,
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'text is reqired';
                              }
                              return null;
                            },
                            controller: textController,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(hintText: "Enter Text"),
                          ),
                          Divider(
                            height: 32,
                          ),
                          Text(
                            bha,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            langs.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          IconButton(
                            color: Colors.black,
                            icon: Icon(Icons.copy),
                            tooltip: 'Copy',
                            onPressed: () {
                              FlutterClipboard.copy(langs.toString()).then(
                                  (value) => SnackBar(content: Text('Copied')));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 159, 179, 189),
                          borderRadius: BorderRadius.circular(
                            20,
                          )),
                      width: 80,
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: ListView.builder(
                            itemCount: language.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Column(
                                  children: [
                                    InkWell(
                                        onTap: () async {
                                          ref.read(transProvider).change(
                                              text: textController.text.trim(),
                                              language: language[index]
                                                  ['language'],
                                              lang: language[index]['key']);
                                        },
                                        child: Text(
                                          language[index]['language'],
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    Divider(
                                      color: Colors.black,
                                      thickness: .5,
                                    ),
                                  ],
                                ),
                              ));
                            }),
                      ),
                    ),
                  )
                ],
              )),
            );
          },
        ),
      ),
    );
  }
}
