import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

final List imageList = [
  'https://www.themoviedb.org/t/p/w220_and_h330_face/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/vNVFt6dtcqnI7hqa6LFBUibuFiw.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/34m2tygAYBGqA9MXKhRDtzYd4MR.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/AcrDB32TqpAGwvQFbICALGxSzn3.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/peNC0eyc3TQJa6x4TdKcBPNP4t0.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/gmTOhwzcSbEGG3xKRfQwwS2BTXD.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/jKonm6Q3vw51Ytd4y7bJ70xJT7l.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/dBxxtfhC4vYrxB2fLsSxOTY2dQc.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg',
  'https://www.themoviedb.org/t/p/w220_and_h330_face/liLN69YgoovHVgmlHJ876PKi5Yi.jpg',
];

class WidgetVideoList extends StatefulWidget {
  const WidgetVideoList({super.key, required this.index});
  final int index;

  @override
  State<WidgetVideoList> createState() => _WidgetVideoListState();
}

class _WidgetVideoListState extends State<WidgetVideoList> {
  List<String> video = [
    'assets/videos/video_2.mp4',
    'assets/videos/video_3.mp4',
    'assets/videos/video_4.mp4',
    'assets/videos/video_1.mp4',
    'assets/videos/video_5.mp4',
    'assets/videos/video_6.mp4',
    'assets/videos/video_7.mp4',
    'assets/videos/video_8.mp4',
    'assets/videos/video_9.mp4',
    'assets/videos/video_10.mp4',
  ];

  late VideoPlayerController _videoController;
  bool _isVideoPlaying = true;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(video[widget.index])
      ..initialize().then((_) {
        setState(() {});
      });
    _videoController.play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        VideoPlayer(_videoController),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.volume_off,
                        color: Colors.white,
                        size: 28,
                      ),
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          imageList[widget.index],    
                        ),
                      ),
                    ),
                    const VideoActionsWidget(
                        icon: Icons.emoji_emotions, title: 'LOL'),
                    const VideoActionsWidget(icon: Icons.add, title: 'My List'),
                    const VideoActionsWidget(icon: Icons.share, title: 'Share'),
                    CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.transparent,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (_isVideoPlaying) {
                                _videoController.pause();
                                _isVideoPlaying = false;
                              } else {
                                _videoController.play();
                                _isVideoPlaying = true;
                              }
                            });
                          },
                          icon: Icon(
                            _isVideoPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 28,
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  const VideoActionsWidget(
      {super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
