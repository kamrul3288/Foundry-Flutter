import 'package:app/src/screens/dashboard/foundry_module.dart';
import 'package:app/src/screens/dashboard/modules_registry.dart';
import 'package:app/src/screens/dashboard/widgets/empty_state.dart';
import 'package:app/src/screens/dashboard/widgets/module_card.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _searchController = TextEditingController();
  var _activeCategory = ModuleCategory.all;
  var _query = '';

  List<FoundryModule> get _filtered => modules.where((m) {
    final matchesQuery = _query.isEmpty || m.title.toLowerCase().contains(_query) || m.description.toLowerCase().contains(_query);
    final matchesCategory = _activeCategory == ModuleCategory.all || m.category == _activeCategory;
    return matchesQuery && matchesCategory;
  }).toList();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = _filtered;
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          _buildFilterBar(),
          if (items.isEmpty) const SliverFillRemaining(child: EmptyState()) else _buildGrid(items),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }

  // ─── App Bar ─────────────────────────────────────────────────────────────

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 180,
      pinned: true,
      backgroundColor: const Color(0xFF1E293B),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        title: SizedBox(
          height: 40,
          child: TextField(
            controller: _searchController,
            onChanged: (v) => setState(() => _query = v.toLowerCase()),
            style: const TextStyle(color: Colors.white, fontSize: 14),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: 'Search modules…',
              hintStyle: const TextStyle(color: Colors.white54, fontSize: 13),
              prefixIcon: const Icon(Icons.search_rounded, color: Colors.white, size: 18),
              filled: true,
              fillColor: Colors.white12,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFF1E293B), Color(0xFF334155)],
                ),
              ),
            ),
            const Positioned(
              bottom: 80,
              left: 16,
              child: Text(
                'Foundry Hub',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const Positioned(
              top: -20,
              right: -20,
              child: Icon(Icons.hub_rounded, size: 140, color: Colors.white10),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Filter Bar ──────────────────────────────────────────────────────────

  SliverToBoxAdapter _buildFilterBar() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 56,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          children: ModuleCategory.values.map((cat) {
            final isSelected = _activeCategory == cat;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: Text(
                  cat.name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : const Color(0xFF475569),
                  ),
                ),
                selected: isSelected,
                onSelected: (_) => setState(() => _activeCategory = cat),
                selectedColor: const Color(0xFF1E293B),
                backgroundColor: Colors.white,
                shape: const StadiumBorder(),
                side: BorderSide.none,
                showCheckmark: false,
                padding: const EdgeInsets.symmetric(horizontal: 4),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // ─── Grid ────────────────────────────────────────────────────────────────

  SliverPadding _buildGrid(List<FoundryModule> items) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.9,
        ),
        delegate: SliverChildBuilderDelegate(
          (_, i) => ModuleCard(module: items[i]),
          childCount: items.length,
        ),
      ),
    );
  }
}
