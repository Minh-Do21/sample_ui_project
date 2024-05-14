class SpaParams {
  final int? page;
  final int? pageSize;
  final int? orderBy;
  final double? latitude;
  final double? longitude;
  final List<int>? genderAssignment;
  final List<int>? districts;
  final List<int>? serviceTypes;
  final int? categoryService;
  final String? search;

  SpaParams({
    this.page,
    this.pageSize,
    this.orderBy,
    this.latitude,
    this.longitude,
    this.genderAssignment,
    this.districts,
    this.serviceTypes,
    this.categoryService,
    this.search,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (page != null) data['page'] = page;
    if (pageSize != null) data['page_size'] = pageSize;
    if (orderBy != null) data['order_by'] = orderBy.toString();
    if (latitude != null) data['latitude'] = latitude.toString();
    if (longitude != null) data['longitude'] = longitude.toString();
    if (genderAssignment != null && genderAssignment!.isNotEmpty) {
      data['gender_assignment'] = genderAssignment!.join(',');
    }
    if (districts != null && districts!.isNotEmpty) {
      data['districts'] = districts!.join(',');
    }
    if (serviceTypes != null && serviceTypes!.isNotEmpty) {
      data['service_types'] = serviceTypes!.join(',');
    }
    if (categoryService != null) data['category_service'] = categoryService;
    if (search != null) data['search'] = search;
    return data;
  }
}
