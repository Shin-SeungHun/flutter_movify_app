import 'package:flutter/material.dart';
import 'package:flutter_movify/data/model/cast_item.dart';

class CreditsProfileWidget extends StatelessWidget {
  const CreditsProfileWidget({
    Key? key,
    required this.castItem,
  }) : super(key: key);

  final CastItem castItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: _buildProfileImage(),
        ),
        const SizedBox(height: 5), // 이미지와 텍스트 간격 조절을 위한 SizedBox 추가
        Text(
          castItem.name,
          textAlign: TextAlign.left,
          maxLines: 2, // 최대 라인 수를 2로 설정
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          castItem.character,
          textAlign: TextAlign.left,
          maxLines: 2, // 최대 라인 수를 2로 설정
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage() {
    if (castItem.profilePath.isNotEmpty) {
      return Image.network(
        'https://image.tmdb.org/t/p/w500${castItem.profilePath}',
        fit: BoxFit.cover,
        width: 130,
        height: 180,
      );
    } else {
      // profilePath가 없을 때 대체할 이미지
      return Image.asset(
        'assets/images/no_image_person.jpg',
        fit: BoxFit.cover,
        width: 130,
        height: 180,
      );
    }
  }
}
