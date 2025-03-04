import 'package:flutter/material.dart';
import '../../../../core/utils/functins/launch_url.dart';
import '../../../../core/utils/app_color.dart';
import '../data/model/pharmacy_model.dart';
import 'pharmacy_details_page.dart';

class PharmacyListViewItem extends StatelessWidget {
  const PharmacyListViewItem({
    super.key,
    required this.pharmacy,
    required this.index,
  });
  final int index;

  final PharmacyModel pharmacy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PharmacyDetailsPage(index: index, pharmacy: pharmacy),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                pharmacy.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pharmacy.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${pharmacy.city} - ${pharmacy.area}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    pharmacy.service,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.phone, color: AppColors.primary, size: 30),
              onPressed: () {
                launchDialer(pharmacy.phone);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class PharmacyListViewItem extends StatelessWidget {
//   const PharmacyListViewItem({
//     super.key,
//     required this.pharmacy, required this.index,
//   });
//   final int index;
//   final PharmacyModel pharmacy;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: Image.network(pharmacy.image,
//           width: 50, height: 50, fit: BoxFit.cover),
//       title: Text(pharmacy.title),
//       subtitle: Text("${pharmacy.city} - ${pharmacy.area}"),
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) =>
//                 PharmacyDetailsPage(index: index, pharmacy: pharmacy),
//           ),
//         );
//       },
//     );
//   }
// }
