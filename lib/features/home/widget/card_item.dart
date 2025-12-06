import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_color.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.image,
    required this.text,
    required this.desc,
    required this.rate,
  });

  final String image;
  final String text;
  final String desc;
  final String rate;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 200,
      height: 270,
      child: Card(
        color: Colors.white
        ,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة الوجبة
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(image, width: double.infinity, height: 140),
              ),
              const Gap(12),
              // العنوان
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // الوصف
              Text(
                desc,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const Gap(8),
              // التقييم
              Row(
                children: [
                   Icon(Icons.star, color: Colors.orange, size: 20),
                   Gap(6),
                  Text(
                    rate,
                    style:  TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),

                  ),
                  Spacer(),
                  Icon(CupertinoIcons.heart,color: AppColor.Primru,),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
