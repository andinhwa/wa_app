import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waverley_tools/models/contact.dart';

class ProfilePage extends StatefulWidget {
  final Contact contact;

  const ProfilePage({Key key, this.contact}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: buildAppBar(),
        body: Stack(
          children: <Widget>[
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    buildCoverImage(screenSize),
                    SizedBox(
                      height: 15,
                    ),
                    buildFullName(),
                    buildPhoneNumber(context),
                    buildStatus(context),
                    SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.group),
                      title: Text('Group name'),
                    ),
                    Divider(
                      color: Colors.white24,
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.call),
                      title: Text('Start Call'),
                    ),
                    Divider(
                      color: Colors.white24,
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.sms),
                      title: Text('Send message'),
                    ),
                    Divider(
                      color: Colors.white24,
                    ),
                    ListTile(
                      onTap: () {},
                      leading: FaIcon(FontAwesomeIcons.skype),
                      title: Text('Open skype'),
                    ),
                    Divider(
                      color: Colors.white24,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget buildAppBar() {
    return AppBar(
      backgroundColor: Colors.red[300],
      elevation: 0.0,
    );
  }

  Widget buildCoverImage(Size screenSize) {
    return SizedBox(
      height: screenSize.height / 6,
      child: Container(
        alignment: Alignment.center,
        child: buildProfileImage(),
        color: Colors.red[300],
      ),
    );
  }

  Widget buildProfileImage() {
    return Container(
      child: CircleAvatar(
          radius: 140.0,
          backgroundColor: Colors.transparent,
          child: ClipOval(
              child: CachedNetworkImage(
            imageUrl: widget.contact.avatar,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ))),
    );
  }

  Widget buildFullName() {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );

    return Text(
      widget.contact.name,
      style: _nameTextStyle,
    );
  }

  Widget buildStatus(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      child: Text(
        widget.contact.jobType,
        style: TextStyle(
          fontFamily: 'Spectral',
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget buildPhoneNumber(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
      child: Text(
        widget.contact.phoneNumber,
        style: TextStyle(
          fontFamily: 'Spectral',
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
