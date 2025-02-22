import 'package:flutter/material.dart';
import 'package:sopra_aqui/models/membro.dart';
import 'package:sopra_aqui/widgets/membro_item.dart';

class AboutBottomSheet extends StatelessWidget {
  AboutBottomSheet({super.key});

  final List<MembroModel> membros = [
    MembroModel(name: 'Osvaldo', image: 'assets/images/user.png'),
    MembroModel(name: 'Lucas', image: 'assets/images/user.png'),
    MembroModel(name: 'Rui', image: 'assets/images/user.png'),

  ];

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height:double.infinity,
      padding: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
        topRight: Radius.circular(30), ),
        color: Colors.white, 
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1), 
            blurRadius: 10, 
            spreadRadius: 3, 
            offset: Offset(0, -4)
          )
        ]
      ),
      child: SingleChildScrollView(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: [

          Padding(padding: EdgeInsets.symmetric(horizontal: 30), 
        child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start, children: [
    Center(child: Text('Sobre', style: TextStyle(
          fontWeight: FontWeight.bold, 
          fontSize: 20
        ),), 
), 
        SizedBox(height: 10,), 
        Text('O Sopra Aqui é um aplicativo inovador desenvolvido para auxiliar no monitoramento dos níveis de álcool no organismo de forma rápida e intuitiva. Através da conexão com um bafômetro, o aplicativo mede a taxa de álcool no sangue (BAC) e classifica os resultados em três níveis: Seguro, Alerta e Perigoso.', 
        textAlign: TextAlign.justify,
        style: TextStyle(
        
        ),),

        SizedBox(height: 20,), 

         Text('Desenvolvido por', style: TextStyle(
          fontWeight: FontWeight.bold, 
        ),), 
        SizedBox(height: 15,), 
        ],),),




                        SizedBox(
      width: double.infinity,
      child: 
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                       SizedBox(width: 30,), 

                    for(int x =0; x< membros.length; x++)
                    ...[ 
                      
                      MembroItem(membro: membros[x]), 
                      if (x < membros.length-1)
                       SizedBox(width: 15,), 
                    ]

                    ],),
                  ))
  
                 
                 
    ,
    SizedBox(height: 30,)



      ],),)
    );
  }
}