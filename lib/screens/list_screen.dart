import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late List<String> _filteredList;
  String _keywords = '';
  final List<String> _originList = [
    'Apple',
    'Orange',
    'Banana',
    'Grapes',
    'Pineapple',
    'Watermelon',
    'Mango',
    'Strawberry',
    'Pear',
    'Cherry',
    'Lemon',
    'Peach',
    'Plum',
    'Kiwi',
    'Raspberry',
    'Blueberry',
    'Cantaloupe',
    'Avocado',
    'Coconut',
    'Papaya',
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _filteredList = _originList;
    _originList.sort();
    _searchController.addListener(_search);
    super.initState();
  }

  void _search() {
    setState(() {
      _keywords = _searchController.text;
      _filteredList = _originList
          .where(
              (fruit) => fruit.toLowerCase().contains(_keywords.toLowerCase()))
          .toList();
    });
  }

  Widget _buildList({required List<String> list}) => Expanded(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: ListTile(
                title: Text(
                  list[index],
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                ),
                onTap: () {
                  // Tambahkan aksi ketika item dipilih (opsional)
                },
              ),
            );
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 18),
              prefixIcon: const Icon(Icons.search, color: Colors.blueGrey),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(height: 20),
          _buildList(list: _keywords.isEmpty ? _originList : _filteredList),
        ],
      ),
    );
  }
}
