import 'package:flutter/material.dart';

Container appBarMethod() {
  return Container(
    height: 70,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white10,
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("assets/image/profile.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        "Deep Patel",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: .2,
          fontSize: 18,
        ),
      ),
      subtitle: Text(
        "Space Scientist",
        style: TextStyle(color: Colors.white70, fontSize: 12),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(Icons.edit, color: Colors.white70),
      ),
    ),
  );
}
