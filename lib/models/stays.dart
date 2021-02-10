import 'package:booking_service/constants/image_path.dart';

class Stays {
  final String title;
  final double ratings;
  final String imageSrc;
  final String price;
  Stays({
    this.title,
    this.ratings,
    this.imageSrc,
    this.price,
  });

  static final List<Stays> staysList = [
    Stays(
      title: 'ad consectetur.',
      ratings: 4.5,
      imageSrc: BrandImages.firstImage,
      price: '42\$',
    ),
    Stays(
      title: 'aliquip eu.',
      ratings: 4.8,
      imageSrc: BrandImages.secondImage,
      price: '48\$',
    ),
    Stays(
      title: 'nostrud minim.',
      ratings: 4.9,
      imageSrc: BrandImages.thirdImage,
      price: '79\$',
    ),
    Stays(
      title: 'Ipsum voluptate.',
      ratings: 4.9,
      imageSrc: BrandImages.fourthImage,
      price: '79\$',
    ),
    Stays(
      title: 'nostrud minim.',
      ratings: 4.9,
      imageSrc: BrandImages.thirdImage,
      price: '79\$',
    ),
    Stays(
      title: 'ad eiusmod.',
      ratings: 4.5,
      imageSrc: BrandImages.firstImage,
      price: '42\$',
    ),
  ];
}
