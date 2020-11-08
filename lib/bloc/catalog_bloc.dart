import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'catalog_event.dart';
part 'catalog_state.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  CatalogBloc() : super(CatalogInitialState());

  @override
  Stream<CatalogState> mapEventToState(CatalogEvent event) async* {
    final currentState = state;

    if (event is GetProducts && currentState is CatalogInitialState) {
      final products = await getCatalog(event.catalogId);
      yield CatalogLoaded(products: products);
    }

    if (currentState is CatalogLoaded) {}
  }

  Future<List> getCatalog(int catalogId) async {
    // This GET just for example without using catalogId param
    final response = await http.get('https://jsonplaceholder.typicode.com/posts');

    return jsonDecode(response.body);
  }
}
