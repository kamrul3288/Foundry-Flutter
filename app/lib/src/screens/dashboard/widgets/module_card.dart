import 'package:flutter/material.dart';
import '../foundry_module.dart';
import 'category_badge.dart';

/// Grid card for a single [FoundryModule].
class ModuleCard extends StatelessWidget {
  const ModuleCard({super.key, required this.module});

  final FoundryModule module;

  @override
  Widget build(BuildContext context) {
    final hasDestination = module.destination != null;
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      elevation: 1,
      shadowColor: Colors.black12,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: hasDestination
            ? () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => module.destination!),
                )
            : null,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryBadge(category: module.category),
              const Spacer(),
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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
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
                    hasDestination ? 'Open' : 'In Library',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: hasDestination ? module.color : Colors.grey,
                    ),
                  ),
                  if (hasDestination) ...[
                    const SizedBox(width: 2),
                    Icon(Icons.arrow_forward_ios_rounded, size: 9, color: module.color),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
