import 'package:flutter/material.dart';

abstract class Languages {

  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  String get appName;

  String get labelWelcome;

  String get labelInfo;

  String get labelSelectLanguage;

  String get start;

  String get home_p;

  String get agence_p;

  String get search_p;

  String get fav_p;

  String get param_p;

  String get map;

  String get list;

  String get vente;

  String get loc;

  String get maison;

  String get apart;

  String get garage;

  String get villa;

  String get other;

  String get doc;

  String get promo;

  String get act;

  String get livret;

  String get a_propos;

  String get pub_par;

  String get pub_le;

  String get vus;

  String get tel;

  String get email;

  String get liste_agc;

  String get liste_fav;

  String get langue;

  String get not;

  String get feedback;

  String get demande_cree_compte;

  String get inscription;

  String get vous_avez;

  String get se_connecter;

  String get cree_compte;

  String get client;

  String get agence;

  String get name;

  String get password;

  String get full_name;

  String get full_email;

  String get full_phone;

  String get full_password;

  String get name_company;

  String get full_name_company;

  String get adresse;

  String get full_adresse;

  String get  register;

  String get hello;

  String get sign_in;

  String get dont_have_accont;

  String get create;

  String get parametres_supp;

  String get info_gen;

  String get sidentifer;

  String get loading;

  String get log_out;

  String get paragraphe;

  String get elect;

  String get gaz;

  String get eau;

  String get meubles;

  String get cuisine;

  String get s_bain;

  String get chambres;

  String get superficie;

  String get parking;

  String get piscine;

  String get jardin;

  String get signin_into;

  String get offers;

  String get add_offer;

  String get oui;

  String get non;

  String get categories;

  String get list_of_cat;

  String get title_of_offer;

  String get  title;

  String get price;

  String get da;

  String get cuisune2;

  String get salle_de3;

  String get Superficie_add_offer;

  String get nbr_etages;

  String get num_etage;

  String get service_util;

  String get aucun;

  String get sans;

  String get avec ;

  String get description;

  String get enter_description;

  String get set_location;

  String get add_of_offer;

  String get add_images;

  String get submit;




  



  
  

}