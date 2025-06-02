class FlaggedTimeSheetDto {
  final String week;
  final String weekId;
  final List<FlaggedShiftDto> shifts;

  FlaggedTimeSheetDto({
    required this.week,
    required this.weekId,
    required this.shifts,
  });

  factory FlaggedTimeSheetDto.fromJson(Map<String, dynamic> json) {
    return FlaggedTimeSheetDto(
      week: json['week'] ?? '',
      weekId: json['week_id'] ?? '',
      shifts:
          (json['shifts'] as List)
              .map((e) => FlaggedShiftDto.fromJson(e))
              .toList(),
    );
  }
}

class FlaggedShiftDto {
  final String id;
  final String date;
  final String shiftCode;
  final FlaggedClientDto client;
  final double totalPayRate;
  final double totalWorkedHours;
  final String shiftTiming;
  final double hourlyRate;
  final int status;
  final String? expectedDate;
  final int? checkoutType;
  final bool getApproval;
  final String? disputeReason;

  FlaggedShiftDto({
    required this.id,
    required this.date,
    required this.shiftCode,
    required this.client,
    required this.totalPayRate,
    required this.totalWorkedHours,
    required this.shiftTiming,
    required this.hourlyRate,
    required this.status,
    this.expectedDate,
    this.checkoutType,
    required this.getApproval,
    this.disputeReason,
  });

  factory FlaggedShiftDto.fromJson(Map<String, dynamic> json) {
    return FlaggedShiftDto(
      id: json['id'] ?? '',
      date: json['date'] ?? '',
      shiftCode: json['shift_code'] ?? '',
      client: FlaggedClientDto.fromJson(json['client'] ?? {}),
      totalPayRate: (json['total_pay_rate'] ?? 0).toDouble(),
      totalWorkedHours: (json['total_worked_hours'] ?? 0).toDouble(),
      shiftTiming: json['shift_timing'] ?? '',
      hourlyRate: (json['hourly_rate'] ?? 0).toDouble(),
      status: json['status'] ?? 0,
      expectedDate: json['expected_date'],
      checkoutType: json['checkout_type'],
      getApproval: json['get_approval'] ?? false,
      disputeReason: json['dispute_reason'],
    );
  }
}

class FlaggedClientDto {
  final String id;
  final String name;
  final String? address;
  final int checkInDistance;
  final LocationDto location;
  final CountyDto county;
  final String? photo;
  final List<dynamic> preference;
  final int type;
  final RegionalManagerDto? regionalManager;
  final String? sdrEmail;
  final int breakTimePayment;

  FlaggedClientDto({
    required this.id,
    required this.name,
    this.address,
    required this.checkInDistance,
    required this.location,
    required this.county,
    this.photo,
    required this.preference,
    required this.type,
    this.regionalManager,
    this.sdrEmail,
    required this.breakTimePayment,
  });

  factory FlaggedClientDto.fromJson(Map<String, dynamic> json) {
    return FlaggedClientDto(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['address'],
      checkInDistance: json['check_in_distance'] ?? 0,
      location: LocationDto.fromJson(json['location'] ?? {}),
      county: CountyDto.fromJson(json['county'] ?? {}),
      photo: json['photo'],
      preference: json['preference'] ?? [],
      type: json['type'] ?? 0,
      regionalManager:
          json['regional_manager'] != null
              ? RegionalManagerDto.fromJson(json['regional_manager'])
              : null,
      sdrEmail: json['sdr_email'],
      breakTimePayment: json['break_time_payment'] ?? 0,
    );
  }
}

class LocationDto {
  final String type;
  final List<double> coordinates;

  LocationDto({required this.type, required this.coordinates});

  factory LocationDto.fromJson(Map<String, dynamic> json) {
    return LocationDto(
      type: json['type'] ?? '',
      coordinates:
          (json['coordinates'] as List)
              .map((e) => (e as num).toDouble())
              .toList(),
    );
  }
}

class CountyDto {
  final String id;
  final String name;

  CountyDto({required this.id, required this.name});

  factory CountyDto.fromJson(Map<String, dynamic> json) {
    return CountyDto(id: json['id'] ?? '', name: json['name'] ?? '');
  }
}

class RegionalManagerDto {
  final String id;
  final String name;

  RegionalManagerDto({required this.id, required this.name});

  factory RegionalManagerDto.fromJson(Map<String, dynamic> json) {
    return RegionalManagerDto(id: json['id'] ?? '', name: json['name'] ?? '');
  }
}
