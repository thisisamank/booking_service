import 'package:booking_service/constants/colors.dart';
import 'package:flutter/material.dart';

class Feature {
  final String title;
  final Color color;
  Feature({
    this.title,
    this.color,
  });
}

class Bookings {
  final String title;
  final String checkInDate;
  final String checkOutDate;
  final int offers;
  final List<Feature> features;
  Bookings({
    this.title,
    this.checkInDate,
    this.checkOutDate,
    this.offers,
    this.features,
  });

  Bookings copyWith({
    String title,
    String checkInDate,
    String checkOutDate,
    int offers,
    List<Feature> features,
  }) {
    return Bookings(
      title: title ?? this.title,
      checkInDate: checkInDate ?? this.checkInDate,
      checkOutDate: checkOutDate ?? this.checkOutDate,
      offers: offers ?? this.offers,
      features: features ?? this.features,
    );
  }

  static Bookings _sampleBooking = Bookings(
      title: 'Ad fugiat quis officia do.',
      checkInDate: 'Nov 20,2020',
      checkOutDate: 'Nov 23,2020',
      offers: 3,
      features: [
        Feature(title: '16 Guests', color: BrandColors.teal),
        Feature(title: '5 Bedrooms', color: BrandColors.purple),
        Feature(title: '1400\$-1800\$', color: BrandColors.lightGreen),
        Feature(title: 'Open pool', color: BrandColors.lightBlue),
        Feature(title: 'Kitchen', color: BrandColors.orange),
        Feature(title: 'Wi-Fi', color: BrandColors.pink),
      ]);
  static List<Bookings> bookingsList = [
    _sampleBooking,
    _sampleBooking.copyWith(
      title: 'Qui ipsum in aliqua labore ea.',
      checkInDate: 'Nov 21, 2020',
    ),
    _sampleBooking.copyWith(
      title: 'Velit dolor sint adipisicing.',
      checkInDate: 'Nov 25, 2020',
      checkOutDate: 'Nov 28, 2020',
    )
  ];
}
