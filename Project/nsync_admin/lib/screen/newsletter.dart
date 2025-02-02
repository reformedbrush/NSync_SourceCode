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
        'news_title': Title,
        'news_author': Author,
        'news_content': Content,
      });
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Faculty Data Inserted Sucessfully",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ));
      _newsAuthorController.clear();
      _newsContentController.clear();
      _newsTitleController.clear();
    } catch (e) {
      print("ERROR INSERTING DATA: $e");
    }
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
                                child: TextFieldStyle(
                                    label: "Content",
                                    inputController: _newsContentController),
                              ))
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
                                    insertNews();
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
          )
        ],
      ),
    );
  }
}
