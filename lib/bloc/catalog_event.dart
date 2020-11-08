part of 'catalog_bloc.dart';

abstract class CatalogEvent extends Equatable {
  const CatalogEvent();
}

class GetProducts extends CatalogEvent {
  final int catalogId;

  const GetProducts(this.catalogId);

  @override
  List<Object> get props => [catalogId];

  @override
  String toString() => 'GetProducts { catalogId: $catalogId }';
}
