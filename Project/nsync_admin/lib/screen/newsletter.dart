import 'package:flutter/material.dart';
import 'package:nsync_admin/components/insert_form.dart';
import 'package:nsync_admin/main.dart';

class NewsLetterScreen extends StatefulWidget {
  const NewsLetterScreen({super.key});

  @override
  State<NewsLetterScreen> createState() => _NewsLetterScreenState();
}

class _NewsLetterScreenState extends State<NewsLetterScreen>
    with SingleTickerProviderStateMixin {
  bool _isFormVisible = false;

  List<Map<String, dynamic>> newsList = [];

  //controller

  final TextEditingController _newsTitleController = TextEditingController();
  final TextEditingController _newsContentController = TextEditingController();
  final TextEditingController _newsAuthorController = TextEditingController();

  final Duration _animationDuration = const Duration(milliseconds: 300);

  // insertion

  Future<void> insertNews() async {
    try {
      String Title = _newsTitleController.text;
      String Author = _newsAuthorController.text;
      String Content = _newsContentController.text;

      await supabase.from('tbl_newsletter').insert({
        'newsletter_title': Title,
        'newsletter_author': Author,
        'newsletter_content': Content,
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "NewsLetter Inserted Sucessfully",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ));
      _newsAuthorController.clear();
      _newsContentController.clear();
      _newsTitleController.clear();
      fetchNews();
    } catch (e) {
      print("ERROR INSERTING DATA: $e");
    }
  }

  // select

  Future<void> fetchNews() async {
    try {
      final respone = await supabase.from('tbl_newsletter').select();
      setState(() {
        newsList = respone;
      });
    } catch (e) {
      print("ERROR FETCHING NEWSLETTER DATA: $e");
    }
  }

  //edit

  int eid = 0;

  Future<void> editNews() async {
    try {
      await supabase.from('tbl_newsletter').update({
        'newsletter_title': _newsTitleController.text,
        'newsletter_content': _newsContentController.text,
        'newsletter_author': _newsAuthorController.text
      }).eq('id', eid);
      fetchNews();
      _newsAuthorController.clear();
      _newsContentController.clear();
      _newsTitleController.clear();
    } catch (e) {
      print("ERROR EDITING NEWSLETTER: $e");
    }
  }

  // delete

  Future<void> delNews(String did) async {
    try {
      await supabase.from('tbl_newsletter').delete().eq('id', did);
      fetchNews();
    } catch (e) {
      print("ERROR DELETING NEWS: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Post Newsletter"),
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF161616),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 18)),
                  onPressed: () {
                    setState(() {
                      _isFormVisible = !_isFormVisible;
                    });
                  },
                  label: Text(
                    _isFormVisible ? "Cancel" : "New Newsletter",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    _isFormVisible ? Icons.cancel : Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          AnimatedSize(
            duration: _animationDuration,
            curve: Curves.easeInOut,
            child: _isFormVisible
                ? Form(
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFieldStyle(
                                    label: "Title",
                                    inputController: _newsTitleController),
                              )),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFieldStyle(
                                    label: "Author",
                                    inputController: _newsAuthorController),
                              ))
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        controller: _newsContentController,
                                        decoration: InputDecoration(
                                            hintText: "Content",
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey))),
                                        maxLines: 5,
                                      )))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 22, horizontal: 70),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  onPressed: () {
                                    if (eid == 0) {
                                      insertNews();
                                    } else {
                                      editNews();
                                    }
                                  },
                                  child: Text(
                                    "Insert",
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : Container(),
          ),
          Container(
            child: Center(
              child: Text(
                "Published Newsletters",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: DataTable(
                  columns: [
                    DataColumn(label: Text("Sl.No")),
                    DataColumn(label: Text("Title")),
                    DataColumn(label: Text("Content")),
                    DataColumn(label: Text("Author")),
/*                     DataColumn(label: Text("Status")),
 */
                    DataColumn(label: Text("Edit")),
                    DataColumn(label: Text("Delete"))
                  ],
                  rows: newsList.asMap().entries.map((entry) {
                    print(entry.value);
                    return DataRow(cells: [
                      DataCell(Text((entry.key).toString())),
                      DataCell(Text(entry.value['newsletter_title'])),
                      DataCell(Text(entry.value['newsletter_content'])),
                      DataCell(Text(entry.value['newsletter_author'])),
                      DataCell(IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          setState(() {
                            _newsAuthorController.text =
                                entry.value['newsletter_author'];
                            _newsContentController.text =
                                entry.value['newsletter_content'];
                            _newsTitleController.text =
                                entry.value['newsletter_title'];
                            eid = entry.value['id'];
                            _isFormVisible = !_isFormVisible;
                          });
                        },
                      )),
                      DataCell(IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          delNews(entry.value['id'].toString());
                        },
                      ))
                    ]);
                  }).toList()),
            ),
          )
        ],
      ),
    );
  }
}
