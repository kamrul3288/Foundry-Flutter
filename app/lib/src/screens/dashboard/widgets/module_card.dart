import 'package:app/src/screens/dashboard/foundry_module.dart';
import 'package:app/src/screens/dashboard/widgets/category_badge.dart';
import 'package:flutter/material.dart';

class ModuleCard extends StatelessWidget {
  const ModuleCard({super.key, required this.module});

  final FoundryModule module;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      elevation: 1,
      shadowColor: Colors.black12,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => module.destination),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryBadge(category: module.category),
              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: module.color.withAlpha(25),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(module.icon, color: module.color, size: 24),
              ),
              const SizedBox(height: 10),
              Text(
                module.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                module.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600, height: 1.3),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Open',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: module.color,
                    ),
                  ),
                  const SizedBox(width: 2),
                  Icon(Icons.arrow_forward_ios_rounded, size: 9, color: module.color),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
