import 'package:flutter/material.dart';
import 'package:task_9/welcome_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentindex = 0;
  final pagecontroller = PageController();
  List title_1 = [
    "Запишитесь на приём \n      врача онлайн",
    "Следите за своими \n посещениями",
    "Легко получайте \n результаты анализов"
  ];
  List title_2 = [
    "Выберите один из многих направлений \n клиники Medion и запишитесь на приёмы \n самых опытных врачей",
    "Записывайтесь на приёмы врачей \n и не забывайте о них с помощью \n функции отслеживания приёмов",
    "Ваши анализы и заключения врачей на одном \n  месте. Получите их легко сидя дома или вернитесь \n на любую дату чтоб найти результаты"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Visibility(
            visible: currentindex != 2,
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => WelcomePage()));
              },
              child: const Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Пропустить",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            SizedBox(
              height: 310,
              child: PageView.builder(
                controller: pagecontroller,
                onPageChanged: (index) {
                  setState(() {
                    currentindex = index ;
                  });
                },
                itemCount: 3,
                itemBuilder: (_, index) {

                  return Column(
                    children: [
                      Image.asset("assets/${(index + 1)}.png"),
                      SizedBox(height: 30,),
                      Text("${(title_1[index])}"),
                      SizedBox(height: 30,),
                      Text("${(title_2[index])}"),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 10,
              child: Center(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return AnimatedContainer(
                      height: 6,
                      width: 6,
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: index == currentindex ? Colors.red : Colors.grey,
                      ),
                    );
                  },
                  separatorBuilder: (_, __) {
                    return SizedBox(
                      height: 4,
                    );
                  },
                  itemCount: 3,
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            nextPage();
          },
          child: Text(
            currentindex == 2 ? "Давайте начнём" : "Следующий",
          ),
        ),
      ),
    );
  }

  void nextPage() {
    if (currentindex == 2) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomePage()));
    }
    pagecontroller.animateToPage(currentindex,
        duration: const Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}
