import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class stack extends StatefulWidget {
  const stack({super.key});

  @override
  State<stack> createState() => _StackPageState();
}

class _StackPageState extends State<stack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Widget"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                  'https://pbs.twimg.com/media/EpZX4jZWwAQk47P.jpg:large'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Stack(
              children: [
                Positioned(
                  left: 40,
                  top: 0,
                  child: Container(
                    height: 300,
                    width: 200,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://pbs.twimg.com/media/EpZX4jZWwAQk47P.jpg:large',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  child: Container(
                    height: 250,
                    width: 150,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/7a655f8a-7c47-4e77-985b-311d8f07ef23/ddwj14s-33241d8e-54af-48b1-afe6-e6bdf30cc865.png/v1/fill/w_1280,h_766,q_80,strp/ben_10_artwork_marvel_and_dc_aliens_by_pizzaronny_ddwj14s-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzY2IiwicGF0aCI6IlwvZlwvN2E2NTVmOGEtN2M0Ny00ZTc3LTk4NWItMzExZDhmMDdlZjIzXC9kZHdqMTRzLTMzMjQxZDhlLTU0YWYtNDhiMS1hZmU2LWU2YmRmMzBjYzg2NS5wbmciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.X6lAFmkWi2E4CD9db2apO6TNmjvWbYjf5D8GLOsgAP4',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  left: 40,
                  top: 40,
                  child: Container(
                    height: 200,
                    width: 100,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQH5kIO-AGeAPkRzor79MMv4gd6QPeE2FpLNHo8D9p4Fc8DxwDoe6ON7rXpT_abVmGAeRE&usqp=CAU',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  left: 60,
                  top: 60,
                  child: Container(
                    height: 150,
                    width: 75,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMCCZiR7i4_OwrGY3XKolOplNFyHEntNvfwjdJiB01RHlgojEFPlwFsOtuUL7o7jsP6h0&usqp=CAU',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  left: 80,
                  top: 80,
                  child: Container(
                    height: 100,
                    width: 50,
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRprlHUdUEVA_KnYSIVpzMDaS2KkmZBEkRjvO_oEX9RU5T8MeLlnvkERUiBpUJllcmrIOM&usqp=CAU',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: stack()));
