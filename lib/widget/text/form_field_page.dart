import 'package:flutter/material.dart';

/// @Author: zhouzhenhua
/// @Version: 1.0.0
/// @Description:
class FormFieldPage extends StatefulWidget {
  const FormFieldPage({Key? key}) : super(key: key);

  @override
  _FormFieldState createState() => _FormFieldState();
}

class _FormFieldState extends State<FormFieldPage> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FormFieldPage")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
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
                controller: _userNameController,
                validator: (v) {
                  return v!.trim().isNotEmpty
                      ? null
                      : "user name cannot be empty";
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "password",
                  hintText: "your login password",
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                controller: _passwordController,
                validator: (v) {
                  return v!.trim().length > 5
                      ? null
                      : "password cannot be less than 6 characters";
                },
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.red, Colors.orange.shade700]),
                  borderRadius: BorderRadius.circular(3.0),
                  boxShadow: [BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0,
                  )],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 2.0),
                  child: TextButton(
                    onPressed: () {
                      if ((_formKey.currentState as FormState).validate()) {
                        //
                      }
                    },
                    child: Text("Login"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
