import 'dart:ui';
import 'package:coffeehouse/data/BD.dart';
import 'package:coffeehouse/domain/sessao_cafe.dart';
import 'package:coffeehouse/widget/card_cafe_recomendados.dart';
import 'package:flutter/material.dart';
import 'package:coffeehouse/widget/card_sessao_cafe.dart';
import 'package:coffeehouse/domain/cafes.dart';

class DuvidaPage extends StatefulWidget {
  const DuvidaPage({Key? key}) : super(key: key);

  @override
  State<DuvidaPage> createState() => _DuvidaPageState();
}

class _DuvidaPageState extends State<DuvidaPage> {
  List<Cafes> listaCafes = BD.lista;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        children: [
          buildContainerCafe('https://intokildare.ie/wp-content/uploads/2018/01/pablo-1.png'),
          buildSizedBox(),
          buildHeadCars(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                //buildSizedBox(),
                CardCafeRecomendado(cafeRecomendado: listaCafes[0]),
                CardCafeRecomendado(cafeRecomendado: listaCafes[1]),
                CardCafeRecomendado(cafeRecomendado: listaCafes[2]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildContainerCafe(imagem) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imagem),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      padding: EdgeInsets.all(80),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2b2117),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'COFFE HOUSE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildSizedBox() {
    return const SizedBox(height: 8);
  }

  buildHeadCars() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text(
            'Recomendados'.toUpperCase(),
            style: TextStyle(
              fontSize: 30,
              color: const Color(0XFF573629),
            ),
          ),
        ],
      ),
    );
  }
}
