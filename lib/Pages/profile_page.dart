import 'package:flutter/material.dart';
import 'package:flutter_todolist/Components/custom_color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 367,
         height: 580,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Color(0xFFEDF6FF),
          ),
          child: Stack(
            children: [
              // Background lingkaran
             // Background
          Container(
            width: 367,
            height: 800,
            decoration: const BoxDecoration(color: CustomColor.Circle),
          ),

          // Shape decorations
          Positioned(
            left: -301,
            top: 367,
            child: Container(
              width: 635,
              height: 635,
              decoration: const ShapeDecoration(
                color: CustomColor.Circle2,
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 230,
            top: -253,
            child: Container(
              width: 635,
              height: 635,
              decoration: const ShapeDecoration(
                color:CustomColor.Circle2,
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 367,
              height: 78,
              decoration: const ShapeDecoration(
                color: CustomColor.bluePrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(21),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 235,
            top: -231,
            child: Container(
              width: 635,
              height: 384,
              decoration: const ShapeDecoration(
                color: Color(0x19F7F9FF),
                shape: OvalBorder(),
              ),
            ),
          ),
          const Positioned(
            left: 17,
            top: 21,
            child: Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Bebas Neue',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

              // Profile Agustinus
              const ProfileCard(
                left: 12,
                top: 120,
                imageUrl: "", // kosong → tampil CircleAvatar default
                name: "Agustinus Galih Gumilang",
                kelas: "10 PPLG 02",
                absen: "03",
                email: "agustinus9141@gmail.com",
              ),

              // Profile Faiz
              const ProfileCard(
                left: 12,
                top: 323,
                imageUrl: "", // kosong → tampil CircleAvatar default
                name: "Muhammad Al Faiz",
                kelas: "11 PPLG 02",
                absen: "22",
                email: "faizgamer@gmail.com",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _circleBackground(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: ShapeDecoration(
        color: color,
        shape: const OvalBorder(),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final double left;
  final double top;
  final String imageUrl;
  final String name;
  final String kelas;
  final String absen;
  final String email;

  const ProfileCard({
    super.key,
    required this.left,
    required this.top,
    required this.imageUrl,
    required this.name,
    required this.kelas,
    required this.absen,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Foto profile pakai CircleAvatar
          CircleAvatar(
            radius: 54,
            backgroundColor: Colors.blueGrey.shade200,
            backgroundImage:
                imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
            child: imageUrl.isEmpty
                ? const Icon(
                    Icons.person_outline,
                    size: 50,
                    color: Colors.white,
                  )
                : null,
          ),
          const SizedBox(width: 15),
          // Info profile
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600)),
              Text(kelas,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500)),
              Text(absen,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500)),
              Text(email,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ),
    );
  }
}
