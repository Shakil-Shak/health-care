
import 'package:get/get.dart';

class AppointmentController extends GetxController {
  final String text =
      "Topu Roy is a dedicated and skilled software developer with a passion for crafting innovative and efficient solutions. He has a strong foundation in programming, problem-solving, and modern software development practices. Topu specializes in creating user-centric applications that meet the needs of clients and end-users alike. With a keen eye for detail and a commitment to quality, he consistently delivers high-performing and scalable software. His expertise spans across multiple platforms and tools, showcasing versatility in tackling diverse challenges. Topu values continuous learning and stays updated with emerging technologies to enhance his skills. He is a team player who thrives in collaborative environments while also excelling in independent projects. Driven by a love for technology, Topu strives to make a meaningful impact through his work.";
  RxBool isExpanded = false.obs;

  int get calculatedMaxLinesCollapsed => 3;
  var selectedTab = 0.obs;
}
