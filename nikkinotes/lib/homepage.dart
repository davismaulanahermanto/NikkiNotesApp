import 'package:flutter/material.dart';
import 'package:nikkinotes/addNote.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nikkinotes/editNote.dart';


class HomePage extends StatelessWidget {

  final ref = FirebaseFirestore.instance.collection('notes');

  final title;
  HomePage({this.title});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'NikkiNotes',
            style: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          child: Icon(
            Icons.add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>AddNote()));
          },  
        ),
        body: StreamBuilder(
          stream: ref.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: snapshot.hasData?snapshot.data.docs.length:0,
            itemBuilder: (_,index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>EditNote(docToEdit: snapshot.data.docs[index],)));
                },
                child: Container(   
                  padding: EdgeInsets.all(16.0),
                  margin: EdgeInsets.all(10),
                  height: 150,
                  color: Colors.redAccent,
                  child: Column(
                    children: [
                      Text(
                        snapshot.data.docs[index].data()['Title'],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(snapshot.data.docs[index].data()['Content'],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
          }
        ),
    );
  }
}


