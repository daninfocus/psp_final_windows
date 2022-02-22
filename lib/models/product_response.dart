// To parse this JSON data, do
//
//     final productResponse = productResponseFromMap(jsonString);

import 'dart:convert';

class ProductResponse {
  ProductResponse({
    required this.products,
    required this.pageable,
    required this.last,
    required this.totalPages,
    required this.totalElements,
    required this.size,
    required this.number,
    required this.sort,
    required this.first,
    required this.numberOfElements,
    required this.empty,
  });

  List<Product> products;
  Pageable pageable;
  bool last;
  int totalPages;
  int totalElements;
  int size;
  int number;
  Sort sort;
  bool first;
  int numberOfElements;
  bool empty;

  factory ProductResponse.fromJson(String str) =>
      ProductResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductResponse.fromMap(Map<String, dynamic> json) => ProductResponse(
        products:
            List<Product>.from(json["content"].map((x) => Product.fromMap(x))),
        pageable: Pageable.fromMap(json["pageable"]),
        last: json["last"],
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        size: json["size"],
        number: json["number"],
        sort: Sort.fromMap(json["sort"]),
        first: json["first"],
        numberOfElements: json["numberOfElements"],
        empty: json["empty"],
      );

  Map<String, dynamic> toMap() => {
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
        "pageable": pageable.toMap(),
        "last": last,
        "totalPages": totalPages,
        "totalElements": totalElements,
        "size": size,
        "number": number,
        "sort": sort.toMap(),
        "first": first,
        "numberOfElements": numberOfElements,
        "empty": empty,
      };
}

class Product {
  Product({
    this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  int? id;
  String name;
  String price;
  String image;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "price": price,
        "image": image,
      };
}

class Pageable {
  Pageable({
    required this.sort,
    required this.offset,
    required this.pageNumber,
    required this.pageSize,
    required this.paged,
    required this.unpaged,
  });

  Sort sort;
  int offset;
  int pageNumber;
  int pageSize;
  bool paged;
  bool unpaged;

  factory Pageable.fromJson(String str) => Pageable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pageable.fromMap(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromMap(json["sort"]),
        offset: json["offset"],
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        paged: json["paged"],
        unpaged: json["unpaged"],
      );

  Map<String, dynamic> toMap() => {
        "sort": sort.toMap(),
        "offset": offset,
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "paged": paged,
        "unpaged": unpaged,
      };
}

class Sort {
  Sort({
    required this.empty,
    required this.sorted,
    required this.unsorted,
  });

  bool empty;
  bool sorted;
  bool unsorted;

  factory Sort.fromJson(String str) => Sort.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sort.fromMap(Map<String, dynamic> json) => Sort(
        empty: json["empty"],
        sorted: json["sorted"],
        unsorted: json["unsorted"],
      );

  Map<String, dynamic> toMap() => {
        "empty": empty,
        "sorted": sorted,
        "unsorted": unsorted,
      };
}
