class WithdrawTimesheetDto {
  final String week;
  final String weekId;
  final List<WithdrawShiftDto> shifts;

  WithdrawTimesheetDto({required this.week, required this.weekId, required this.shifts});

  factory WithdrawTimesheetDto.fromJson(Map<String, dynamic> json) {
    return WithdrawTimesheetDto(
      week: json['week'] ?? '',
      weekId: json['week_id'] ?? '',
      shifts: (json['shifts'] as List).map((e) => WithdrawShiftDto.fromJson(e)).toList(),
    );
  }
}

class WithdrawShiftDto {
  final String id;
  final String date;
  final String shiftCode;
  final WithdrawClientDto client;
  final double totalPayRate;
  final double totalWorkedHours;
  final String shiftTiming;
  final double hourlyRate;
  final int status;
  final String expectedDate;
  final int checkoutType;

  WithdrawShiftDto({
    required this.id,
    required this.date,
    required this.shiftCode,
    required this.client,
    required this.totalPayRate,
    required this.totalWorkedHours,
    required this.shiftTiming,
    required this.hourlyRate,
    required this.status,
    required this.expectedDate,
    required this.checkoutType,
  });

  factory WithdrawShiftDto.fromJson(Map<String, dynamic> json) {
    return WithdrawShiftDto(
      id: json['id'] ?? '',
      date: json['date'] ?? '',
      shiftCode: json['shift_code'] ?? '',
      client: WithdrawClientDto.fromJson(json['client'] ?? {}),
      totalPayRate: (json['total_pay_rate'] ?? 0).toDouble(),
      totalWorkedHours: (json['total_worked_hours'] ?? 0).toDouble(),
      shiftTiming: json['shift_timing'] ?? '',
      hourlyRate: (json['hourly_rate'] ?? 0).toDouble(),
      status: json['status'] ?? 0,
      expectedDate: json['expected_date'] ?? '',
      checkoutType: json['checkout_type'] ?? 0,
    );
  }
}

class WithdrawClientDto {
  final String id;
  final String name;
  final String? address;
  final int checkInDistance;
  final LocationDto location;
  final CountyDto county;
  final String photo;
  final List<dynamic> preference;
  final int type;
  final RegionalManagerDto regionalManager;
  final String sdrEmail;
  final int breakTimePayment;

  WithdrawClientDto({
    required this.id,
    required this.name,
    this.address,
    required this.checkInDistance,
    required this.location,
    required this.county,
    required this.photo,
    required this.preference,
    required this.type,
    required this.regionalManager,
    required this.sdrEmail,
    required this.breakTimePayment,
  });

  factory WithdrawClientDto.fromJson(Map<String, dynamic> json) {
    return WithdrawClientDto(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['address'],
      checkInDistance: json['check_in_distance'] ?? 0,
      location: LocationDto.fromJson(json['location'] ?? {}),
      county: CountyDto.fromJson(json['county'] ?? {}),
      photo: json['photo'] ?? '',
      preference: json['preference'] ?? [],
      type: json['type'] ?? 0,
      regionalManager: RegionalManagerDto.fromJson(json['regional_manager'] ?? {}),
      sdrEmail: json['sdr_email'] ?? '',
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
      coordinates: (json['coordinates'] as List).map((e) => (e as num).toDouble()).toList(),
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
