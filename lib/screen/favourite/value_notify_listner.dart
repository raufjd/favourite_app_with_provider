import 'package:flutter/material.dart';

class NotifyListnerScreen extends StatelessWidget {
   NotifyListnerScreen({super.key});

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toogle = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      appBar: AppBar(
        title: Text("R._.JD"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
              valueListenable: toogle,
              builder: (context , value , child){
                return           Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15
                  ),
                  child: TextFormField(
                    obscureText: toogle.value,
                    decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: InkWell(
                        onTap: (){
                          toogle.value = !toogle.value;
                        },
                        child: Icon(
                            toogle.value ?
                            Icons.visibility_off_outlined :
                            Icons.visibility
                        ),
                      ),
                    ),
                  ),
                );
              }),
          SizedBox(
            height: 20,
          ),
          Center(
              child: ValueListenableBuilder(
                  valueListenable: _counter,
                  builder: (context , value , child){
                    return Text(_counter.value.toString() ,
                      style:TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ) ,
                    );
                  })
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed:(){
            _counter.value++;
            print(_counter.value++);
          },
        child: Icon(Icons.add),
          ),
      );
  }
}
