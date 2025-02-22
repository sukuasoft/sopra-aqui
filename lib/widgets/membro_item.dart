import 'package:flutter/material.dart';
import 'package:sopra_aqui/models/membro.dart';

class MembroItem extends StatelessWidget {
  const MembroItem({super.key, required this.membro});
  final MembroModel membro;

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
  
  Container(
    clipBehavior: Clip.hardEdge,
    decoration: BoxDecoration(

      borderRadius: BorderRadius.circular(30)
    )
    , child: 
   Image.asset(membro.image, width: 40, height: 40, fit: BoxFit.cover,),),
   
  SizedBox(height: 10,), 
  Text(membro.name, style: TextStyle(
fontSize: 12
  ),)
    ],);
  }
}