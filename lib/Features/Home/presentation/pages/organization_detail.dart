import 'package:flutter/material.dart';

import '../../data/models/gsoc_organization.dart';

class OrganizationDetail extends StatefulWidget {
  final GsocOrganization gsocOrganization;
  const OrganizationDetail({Key? key, required this.gsocOrganization})
      : super(key: key);

  @override
  State<OrganizationDetail> createState() => _OrganizationDetialState();
}

class _OrganizationDetialState extends State<OrganizationDetail> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.gsocOrganization.name,
      child: Scaffold(
        body: Container(
            child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Container(
              height: 150,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                color: Color.fromRGBO(40, 107, 210, 1),
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.gsocOrganization.name,
                        style: const TextStyle(
                            fontFamily: "PFEefW01",
                            fontSize: 36,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          widget.gsocOrganization.description,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
