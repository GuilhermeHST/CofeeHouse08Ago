import 'package:flutter/material.dart';
import '/domain/cafes.dart';

class CardCafeRecomendado extends StatelessWidget {
  final Cafes cafeRecomendado;

  const CardCafeRecomendado({
    Key? key,
    required this.cafeRecomendado,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.4,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(70),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(cafeRecomendado.imagem),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Text(
                  cafeRecomendado.cafe,
                  style: TextStyle(
                    color: const Color(0XFF573629),
                    fontSize: 18,
                  ),
                ),
                Text(
                  '\nR\$ ${cafeRecomendado.preco},00',
                  style: TextStyle(
                    color: const Color(0xFFB7794B),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
