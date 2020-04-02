import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waverley_tools/models/contact.dart';
import 'package:waverley_tools/screens/contacts/profile_page.dart';
import 'package:waverley_tools/shared/expanded_section.dart';

class ContactItem extends StatefulWidget {
  final Contact contact;
  final Function onTap;
  final bool selected;
  ContactItem({this.contact, this.onTap, this.selected});

  @override
  _ContactItemState createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsetsDirectional.only(top: 0),
          child: buildItem(context)),
    );
  }

  Widget buildItem(BuildContext context) {
    return ExpandedSection(
        expand: widget.selected,
        duration: 300,
        child: buildExpandItem(context, widget.contact),
        header: buildHeader(context, widget.contact));
  }

  buildHeader(BuildContext context, Contact contact) {
    return ListTile(
      onTap: widget.onTap,
      title: Text('${widget.contact.name} (${widget.contact.jobType})'),
      subtitle: Text(widget.contact.phoneNumber),
      isThreeLine: false,
      leading: CircleAvatar(
          radius: 25.0,
          child: ClipOval(
              child: Image(
                  image: CachedNetworkImageProvider(widget.contact.avatar))
              // CachedNetworkImage(
              //   imageUrl: widget.contact.avatar,
              //   placeholder: (context, url) => CircularProgressIndicator(),
              //   errorWidget: (context, url, error) => Icon(Icons.error),
              // ),
              )),
    );
  }

  buildExpandItem(BuildContext context, Contact contact) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
                onPressed: () => expandItemonPressed('call'),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.phone,
                        color: Theme.of(context).textTheme.title.color),
                    SizedBox(height: 10),
                    Text('Call')
                  ],
                )),
            FlatButton(
                onPressed: () => expandItemonPressed('sms'),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.sms,
                        color: Theme.of(context).textTheme.title.color),
                    SizedBox(height: 10),
                    Text('Message')
                  ],
                )),
            FlatButton(
                onPressed: () => expandItemonPressed('skype'),
                child: Column(
                  children: <Widget>[
                    FaIcon(FontAwesomeIcons.skype,
                        color: Theme.of(context).textTheme.title.color),
                    SizedBox(height: 10),
                    Text('Skype')
                  ],
                )),
            FlatButton(
                onPressed: () => expandItemonPressed('info'),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.info,
                        color: Theme.of(context).textTheme.title.color),
                    SizedBox(height: 10),
                    Text('Details')
                  ],
                )),
          ],
        ),
      ),
    );
  }

  expandItemonPressed(String action) {
    switch (action) {
      case 'info':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ProfilePage(
            contact: widget.contact,
          ),
        ));
        break;
      default:
    }
  }
}
