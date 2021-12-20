import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'About.dart';


class Detail extends StatefulWidget{
  @override
  _DetailState createState() => _DetailState();





}
class _DetailState extends State<Detail> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AboutPage()));},

          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,

          ),
        ),
      ),
        body: Stack(
          children: <Widget>[
            Container(

                foregroundDecoration: BoxDecoration(color: Colors.black26),
                height: 400,
                child: Image.asset('assets/one.jpg'
                    , fit: BoxFit.cover)),
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 250),

                  Row(
                    children: <Widget>[
                      const SizedBox(width: 16.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20.0)),

                      ),
                      Spacer(),
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(32.0),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[


                                ],
                              ),
                            ),

                          ],
                        ),


                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,


                              children: <Widget>[




                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Text(
                          "Description".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 25.0),
                        ),


                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(

                            '''
Nadhour, 31 juillet 2019 - Le GDA de «Nadhour» dans le gouvernorat de Zaghouan a été créé en juin 2017 et regroupe 96 femmes. Elles partagent un objectif commun qui consiste à gérer ensemble les ressources naturelles et les opportunités offertes et de valoriser leur savoir-faire en matière de production des produits du terroir.
Le GDA féminin de Nadhour a démarré la production au début de l'année 2019 en lançant son premier produit phare sur le marché qui est la harissa traditionnelle sous la marque commerciale «EL HORRA». D'autres produits se sont par la suite succédés sous cette même marque tels que labsissa,le couscous, les confitures et bien d'autres produits avec des recettes traditionnelles. L'idée étant toujours d'offrir un produit typique tout en respectant les standards de qualité et les normes d'hygiène.

Le GDA féminin de Nadhour bénéficie de l'appui du «Projet d'accès aux marchés des produits agroalimentaires et de terroir» (PAMPAT) pour les aspects relatifs à la production, au marketing ainsi qu' à la commercialisation. Le projet PAMPAT est mis en œuvre par l'Organisation des Nations Unies pour le Développement Industriel (ONUDI) en étroite collaboration avec le Ministère de l'Agriculture, des Ressources Hydrauliques et de la Pêche et du Ministère de l'Industrie et des petites et moyennes entreprises, avec un financement du Secrétariat d'Etat à l'Economie Suisse (SECO).

Aujourd'hui de plus en plus de groupements des femmes veulent s'inspirer de l'expérience du GDA Nadhour. Suite aux réussites réalisées, le GDA «Nadhour» est aujourd'hui un modèle des bonnes pratiques et une source d'inspiration pour le développement des communautés féminines.

Dans le cadre d'une visite d'étude organisée par la coopération allemande, une délégation de 20 femmes de l'Organisation des Femmes d'Affaires Libyennes a visité le 29 Juillet le GDA Nadhour en vue de s'inspirer de leur expérience. Les responsables du GDA Nadhour ont présenté le mode de fonctionnement de leur groupement féminin en mettant en exergue les avantages de la coopération entre femmes pour assurer la réussite du projet.

A la fin de la visite, les membres de la délégation libyenne ont bien apprécié les économies d'échelle qui peuvent être créés à travers les modèles collaboratives. D'ailleurs elles ont félicité les femmes du GDA Nadhour pour les innovations apportées aux produits traditionnels tant au niveau des techniques de production qu'au niveau du packaging et du marketing.'
                            ''',


                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25.0),
                          ),
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  "DETAIL",
                  style: TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ],
        )

    );
  }


}
