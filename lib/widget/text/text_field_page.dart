import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class TextFieldPage extends StatefulWidget {
  const TextFieldPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFieldPage> {
  late TextEditingController _userNameController = TextEditingController();

  FocusNode _focusNode_1 = FocusNode();
  FocusNode _focusNode_2 = FocusNode();
  FocusNode _focusNode_3 = FocusNode();
  FocusScopeNode? _focusScopeNode;

  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _userNameController.addListener(() {
      print(_userNameController.text);
    });
    _focusNode_3.addListener(() {
      setState(() {
        print(_focusNode_3.hasFocus);
        _hasFocus = _focusNode_3.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TextFieldPage")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Theme(
          data: Theme.of(context).copyWith(
            hintColor: Colors.grey[200],
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: Colors.grey),
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: false,
                focusNode: _focusNode_1,
                decoration: InputDecoration(
                  labelText: "user name",
                  hintText: "user name or email",
                  prefixIcon: Icon(Icons.person),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                textInputAction: TextInputAction.done,
                controller: _userNameController,
              ),
              TextField(
                focusNode: _focusNode_2,
                decoration: InputDecoration(
                  labelText: "password",
                  hintText: "your login password",
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: _hasFocus ? Colors.green : Colors.blue,
                        width: 1.0),
                  ),
                ),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _focusNode_3,
                  decoration: InputDecoration(
                    labelText: "email",
                    hintText: "email address",
                    prefixIcon: Icon(Icons.email),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        _focusScopeNode ??= FocusScope.of(context);
                        _focusScopeNode?.requestFocus(_focusNode_2);
                      },
                      child: Text("Change Focus"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _focusNode_1.unfocus();
                        _focusNode_2.unfocus();
                      },
                      child: Text("Hide Focus"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
