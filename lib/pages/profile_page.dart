import 'package:flutter/material.dart';
import 'package:optiparse/common/color_extension.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    // getting the size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    var bannerHeight = height / 4 - height / 20;

    return Scaffold(
      backgroundColor: TColor.gray,
      appBar: AppBar(
        title: const Text("PROFILE"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                TColor.gray60,
                TColor.gray50,
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          // alignment: Alignment.center,
          children: [
            ClipPath(
              clipper: BackgroundWaveClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      TColor.gray60,
                      TColor.gray50,
                    ],
                  ),
                ),
              ),
            ),

            // Positioned(
            //     top: 0,
            //     left: 10,
            //     child: CircleAvatar(
            //       radius: 21,
            //       backgroundColor: Colors.white,
            //       child: CircleAvatar(
            //         radius: 20,
            //         backgroundColor: Color(0xFF407BFE),
            //         child: IconButton(
            //             onPressed: () {
            //               Navigator.pop(context);
            //             },
            //             color: Colors.white,
            //             icon: Icon(LineAwesomeIcons.arrow_left_solid)),
            //       ),
            //     )),

            // Positioned(
            //     top: bannerHeight / 2.6,
            //     child: Text("Profile",
            //         style: GoogleFonts.lora(
            //             textStyle: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 26,
            //                 fontWeight: FontWeight.w700)))),

            // Container(
            //   width: double.infinity,
            //   height: bannerHeight,
            //   decoration: const BoxDecoration(
            //     color: Color.fromARGB(115, 0, 108, 255),
            //     // borderRadius: BorderRadius.only(
            //     //   bottomLeft: Radius.circular(100),
            //     //   bottomRight: Radius.circular(100),
            //     // ),
            //   ),
            //   // child: Image.asset(
            //   //   "assets/Police car-rafiki.png",
            //   //   fit: BoxFit.cover,
            //   // ),

            // ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: TColor.gray80,
                  border: Border.all(width: .1, color: TColor.gray),
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: [
                  //   // BoxShadow(
                  //   //     color: TColor.gray40, spreadRadius: 1, blurRadius: 15)
                  // ]
                ),
                child: Column(
                  children: [
                    SizedBox(height: bannerHeight / 2.5),
                    Positioned(
                      top: bannerHeight * 0.8,
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(255, 7, 114, 254),
                        radius: bannerHeight / 2.5 + 3,
                        child: CircleAvatar(
                          backgroundColor: TColor.gray40,
                          radius: bannerHeight / 2.5,
                          backgroundImage:
                              const AssetImage("assets/profileimg.png"),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 38),
                        // decoration: BoxDecoration(
                        //   color: Colors.white,
                        //   // border: Border.all(
                        //   //   width: .1,
                        //   //   color:Colors.grey
                        //   //   ),
                        //   borderRadius: BorderRadius.circular(10),
                        //   // boxShadow: [
                        //   //   BoxShadow(
                        //   //       color: const Color.fromARGB(68, 117, 117, 117),
                        //   //       spreadRadius: 1,
                        //   //       blurRadius: 15)
                        //   // ]
                        // ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align children to the start
                          children: [
                            Text("E-mail",
                                style: TextStyle(
                                    color: TColor.gray20,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                    letterSpacing: 1.5)),
                            // const SizedBox(
                            //   height: 3,
                            // ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                // border: Border.all(
                                //   color: Colors.black12,
                                // ),
                                color: TColor.border.withOpacity(0.1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'abcdefgh@iitx.ac.in',
                                    hintStyle: TextStyle(
                                      color: TColor.gray10,
                                      fontSize: 18.0,
                                      //fontWeight: FontWeight.w400,
                                    )
                                    // contentPadding: EdgeInsets.all(),
                                    ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Full Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0,
                                  color: TColor.gray20,
                                  letterSpacing: 1.5),
                            ),
                            // const SizedBox(
                            //   height: 6,
                            // ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                // border: Border.all(
                                //   color: Colors.black12,
                                // ),
                                color: TColor.border.withOpacity(0.1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'RAM KRISHNA',
                                    hintStyle: TextStyle(
                                      color: TColor.gray10,
                                      fontSize: 18.0,
                                      //fontWeight: FontWeight.w400,
                                    )
                                    // contentPadding: EdgeInsets.all(10),
                                    ),
                              ),
                            ),

                            const SizedBox(height: 10),
                            Text(
                              "Total Spends",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0,
                                  color: TColor.gray20,
                                  letterSpacing: 1.5),
                            ),
                            //const SizedBox(height: 10),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                // border: Border.all(
                                //   color: Colors.black12,
                                // ),
                                color: TColor.border.withOpacity(0.1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: TextField(
                                readOnly: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '1000000000000',
                                    hintStyle: TextStyle(
                                      color: TColor.gray10,
                                      fontSize: 18.0,
                                      //  fontWeight: FontWeight.w500,
                                    )
                                    // contentPadding: EdgeInsets.all(10),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // SizedBox(height: bannerHeight / 8),
      ),
    );
  }
}

class BackgroundWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    final p0 = size.height * 0.75;
    path.lineTo(0.0, p0);

    final controlPoint = Offset(size.width * 0.4, size.height);
    final endPoint = Offset(size.width, size.height / 2);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(BackgroundWaveClipper oldClipper) => oldClipper != this;
}
