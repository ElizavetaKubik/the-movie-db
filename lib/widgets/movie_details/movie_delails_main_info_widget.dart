import 'package:flutter/material.dart';
import 'package:the_movie_db/resources/resources.dart';
import 'package:the_movie_db/widgets/elements/radial_percent_widget.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopPosterWidget(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: _MovieNameWidget(),
        ),
        _ScoreWidget(),
        _SummeryWidget(),
        _FooterWidget(),
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage(AppImages.back),
        ),
        Positioned(
          top: 20,
          left: 20,
          bottom: 20,
          child: Image(
            image: AssetImage(AppImages.front),
          ),
        ),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          maxLines: 3,
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(height: 1.5),
            children: [
              TextSpan(
                text: 'Ant-Man and the Wasp: Quantumania',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              TextSpan(text: '  '),
              TextSpan(
                text: '(2023)',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.7)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: RadialPercentWidget(
                      child: Center(
                        child: Text(
                          '72%',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      percent: 0.72,
                      fillColor: Color.fromARGB(255, 10, 23, 25),
                      lineColor: Color.fromARGB(255, 37, 203, 103),
                      freeColor: Color.fromARGB(255, 25, 54, 31),
                      lineWidth: 5),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'User Score',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            )),
        Container(
          color: Colors.grey,
          width: 1,
          height: 25,
        ),
        TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                ),
                Text('Play Trailer',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ],
            )),
      ],
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1),
      // color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
        child: Text(
          'PG-13 17/02/2023 (US) * 2h 5m Action, Adventure, Science Fiction',
          maxLines: 3,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _FooterWidget extends StatelessWidget {
  const _FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: _LabelWidget(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: _OwerviewWidget(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: _DescriptionWidget(),
        ),
        _StaffWidget(),
      ],
    );
  }
}

class _LabelWidget extends StatelessWidget {
  const _LabelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Witness the beginning of a new dynasty.',
      style: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontStyle: FontStyle.italic,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.left,
    );
  }
}

class _OwerviewWidget extends StatelessWidget {
  const _OwerviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Overview',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.left,
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope\'s parents Janet van Dyne and Hank Pym, and Scott\'s daughter Cassie Lang, find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that will push them beyond the limits of what they thought possible.',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _StaffWidget extends StatelessWidget {
  const _StaffWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const nameTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
    final jobTitleTextStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );

    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jack Kirby', style: nameTextStyle),
                Text('Characters', style: jobTitleTextStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Larry Lieber', style: nameTextStyle),
                Text('Characters', style: jobTitleTextStyle),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ernie Hart', style: nameTextStyle),
                Text('Characters', style: jobTitleTextStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stan Lee', style: nameTextStyle),
                Text('Characters', style: jobTitleTextStyle),
              ],
            ),
          ],
        ),
        SizedBox(height: 20)
      ],
    );
  }
}
