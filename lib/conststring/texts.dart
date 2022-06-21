class texts {
  static const notupdated = 'item cant be updated';
  static const nodataleft = 'no data left';
  static const nodata = 'No Data';
  static const itemdeleted = 'An item has been deleted';
  static const kanal = "Kanal";
  static const marla = "Marla";
  static const sqfoot = "Sq/Foot";

  static const lblm = "M";
  static const lblk = "K";
  static const lblsqf = "Sq/F";
  static const hintm = "Marla";
  static const hintk = "Kanal";
  static const hinksqfoot = "Squre Foot";
  static const btnadd = "Add";
  static const btnupdate = "Update";
  static const btndelete = "Delete";

  static const btnreset = "Rest";
  static const btnperson = "Person";
}


/*
show form

  void _showModel(BuildContext ctx) async {
    TextEditingController P1 = TextEditingController(text: '');
    TextEditingController P2 = TextEditingController(text: '');
    TextEditingController P3 = TextEditingController(text: '');
    showModalBottomSheet(
        context: ctx,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(ctx).viewInsets.bottom,
                  top: 15,
                  left: 15,
                  right: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: P1,
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: P2,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Quantity'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Clear the text fields
                      P1.text = '';
                      P2.text = '';

                      Navigator.of(ctx).pop(); // Close the bottom sheet
                    },
                    child: Text('Update'),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ));
  }

*/