import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_flutter/admin_pesanan.dart';
import 'package:hotel_flutter/settings/sql_helper.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  // All Kamars
  List<Map<String, dynamic>> _kamardata = [];

  bool _isLoading = true;
  // This function is used to fetch all data from the database
  void _refreshKamars() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _kamardata = data;
      _isLoading = false;
    });
  }

  Color mainColor = Color.fromRGBO(35, 33, 83, 1);
  Color secColor = Color.fromRGBO(250, 235, 239, 1);

  @override
  void initState() {
    super.initState();
    _refreshKamars(); // Loading the diary when the app starts
  }

  final TextEditingController _kamarnameController = TextEditingController();
  final TextEditingController _kamarimageController = TextEditingController();
  final TextEditingController _kamarhargaController = TextEditingController();
  final TextEditingController _kamartypeController = TextEditingController();
  // final TextEditingController _titleController = TextEditingController();
  final TextEditingController _kamardeskripsiController =
      TextEditingController();

  // This function will be triggered when the floating button is pressed
  // It will also be triggered when you want to update an item
  void _showForm(int? id) async {
    if (id != null) {
      // id == null -> create new item
      // id != null -> update an existing item
      final existingKamar =
          _kamardata.firstWhere((element) => element['id'] == id);
      _kamarnameController.text = existingKamar['kamarName'];
      _kamarimageController.text = existingKamar['kamarImg'];
      _kamarhargaController.text = existingKamar['kamarHarga'];
      _kamartypeController.text = existingKamar['kamarType'];
      _kamardeskripsiController.text = existingKamar['kamarDeskripsi'];
    }
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 4 / 5,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _kamarnameController,
                decoration: const InputDecoration(hintText: 'Kamar Name'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _kamarimageController,
                decoration:
                    const InputDecoration(hintText: 'Kamar Image (URL)'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _kamarhargaController,
                decoration: const InputDecoration(hintText: 'Kamar Harga'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _kamartypeController,
                decoration: const InputDecoration(hintText: 'Kamar Tipe'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _kamardeskripsiController,
                decoration: const InputDecoration(hintText: 'Kamar Deskripsi'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  // Save new Kamar
                  if (id == null) {
                    await _addItem();
                  }

                  if (id != null) {
                    await _updateItem(id);
                  }

                  // Clear the text fields
                  _kamarnameController.text = '';
                  _kamarimageController.text = '';
                  _kamarhargaController.text = '';
                  _kamartypeController.text = '';
                  _kamardeskripsiController.text = '';

                  // Close the bottom sheet
                  Navigator.of(context).pop();
                },
                child: Text(id == null ? 'Create New' : 'Update'),
              )
            ],
          ),
        );
      },
    );
  }

// Insert a new Kamar to the database
  Future<void> _addItem() async {
    await SQLHelper.createItem(
        _kamarnameController.text,
        _kamarimageController.text,
        _kamarhargaController.text,
        _kamartypeController.text,
        _kamardeskripsiController.text);
    _refreshKamars();
  }

  // Update an existing Kamar
  Future<void> _updateItem(int id) async {
    await SQLHelper.updateItem(
        id,
        _kamarnameController.text,
        _kamarimageController.text,
        _kamarhargaController.text,
        _kamartypeController.text,
        _kamardeskripsiController.text);
    _refreshKamars();
  }

  // Delete an item
  void _deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Successfully deleted a Kamar!'),
    ));
    _refreshKamars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          "Edit Room",
          style: GoogleFonts.openSans(
            fontSize: 24,
            color: secColor,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add your logic here
            },
          ),
          IconButton(
            icon: Icon(Icons.file_copy_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminPesananPage()),
              );
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: ListView.builder(
                    itemCount: _kamardata.length,
                    itemBuilder: (context, index) => Card(
                      color: Colors.orange[200],
                      margin: const EdgeInsets.all(15),
                      child: ListTile(
                          title: Text(_kamardata[index]['kamarName']),
                          subtitle: Text(_kamardata[index]['kamarHarga']),
                          trailing: SizedBox(
                            width: 100,
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () =>
                                      _showForm(_kamardata[index]['id']),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () =>
                                      _deleteItem(_kamardata[index]['id']),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red.shade500,
                    ),
                    onPressed: () {
                      _showForm(null);
                    },
                    child: Text('Add Kamar'),
                  ),
                ),
              ],
            ),
    );
  }
}
