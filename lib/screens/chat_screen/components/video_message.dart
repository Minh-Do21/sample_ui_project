import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:sample_ui_project/data/model/message_model.dart';
import 'package:sample_ui_project/screens/chat_screen/bloc/chat_bloc.dart';
import 'package:sample_ui_project/screens/register_bloc.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../resources/barrel_const.dart';
import '../chat_screen.dart';

class VideoMessage extends StatefulWidget {
  const VideoMessage({
    super.key,
    required this.messageModel,
  });

  final MessageModel messageModel;

  @override
  State<VideoMessage> createState() => _VideoMessageState();
}

class _VideoMessageState extends State<VideoMessage> {

  late ChewieController chewieController;
  bool isInitedVideo = false;
  late VideoPlayerController videoPlayerController;

  final ValueNotifier<bool> isInputbarcode = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    initVideo();
  
  }

  Future<void> initVideo()async{

    videoPlayerController = widget.messageModel.urlFile.isNotEmpty 
      ? VideoPlayerController.networkUrl(Uri.parse(widget.messageModel.urlFile))
      : VideoPlayerController.file(widget.messageModel.file!);

    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      customControls: Container()
    );

    setState(() {
      isInitedVideo = true;
    });

    // ignore: use_build_context_synchronously
    context.chatBloc.stream.listen((event) async{
        // print("Minh Do ----- ${event.playMediaId} --- ${widget.messageModel.id}");
        if(event.playMediaId == widget.messageModel.id){
          await chewieController.videoPlayerController.pause();
          await chewieController.videoPlayerController.seekTo(const Duration(seconds: 0));
          
          setState(() {
            
          });
        }
      }
    );

    chewieController.videoPlayerController.addListener(() async{
      isInputbarcode.value = !isInputbarcode.value;
    });
  }

  Future<void> previewVideo()async{
    
    chewieController.videoPlayerController.pause();
    context.chatBloc.add(
      PlayMediaEvent(keyId: widget.messageModel.id)
    );

    ChewieController chewieControllerCopy = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
    )..seekTo(chewieController.videoPlayerController.value.position);

    await showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: COLOR_CONST.white,
      builder: (mContext) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: Center(
            child: AspectRatio(
                aspectRatio: chewieControllerCopy.videoPlayerController.value.aspectRatio,        
                child: Chewie(
                controller: chewieControllerCopy,
              ),
            ),
          ),
        );
      } 
    );

    chewieControllerCopy.dispose();
    chewieController.videoPlayerController.setVolume(1);
    chewieController.videoPlayerController.setPlaybackSpeed(1);
    chewieController.videoPlayerController.pause();
    chewieController.videoPlayerController.seekTo(const Duration(seconds: 0));
  }
  
  @override
  void dispose() {
    super.dispose();
    chewieController.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: isInitedVideo
      ? Stack(
        children: [
          GestureDetector(
            onTap: () {
              previewVideo();
            },
            child: VisibilityDetector(
              key: Key(widget.messageModel.id.toString()),
                onVisibilityChanged: (VisibilityInfo info) async{
                
                if (info.visibleFraction == 0 && chewieController.isPlaying) {
                  // print("Minh Do ---- video reset: ${info.visibleFraction}");
                  await chewieController.videoPlayerController.pause();
                  await chewieController.videoPlayerController.seekTo(const Duration(seconds: 0));
                }
              },
              child: SizedBox(
                width: ChatScreenForm.getMaxWidth(),
                child: AspectRatio(
                    aspectRatio: chewieController.videoPlayerController.value.aspectRatio,        
                    child: Chewie(
                    controller: chewieController,
                  ),
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: ValueListenableBuilder<bool>(
              valueListenable: isInputbarcode,
              builder: (BuildContext context, bool value, Widget? child) {
                if(videoPlayerController.value.isBuffering){
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }else if(chewieController.videoPlayerController.value.isPlaying == false){
                  return Center(
                    child: GestureDetector(
                      onTap: () {
                        //play video
                        chewieController.videoPlayerController.play();
                        context.chatBloc.add(
                          PlayMediaEvent(keyId: widget.messageModel.id)
                        );
                      },
                      child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 50,
                        ),
                    ),
                  );
                }else{
                  return Container();
                }
                
              }
            ),
          ),
        ],
      )
      : Container(
        width: ChatScreenForm.getMaxWidth(),
        height: 200,
        color: COLOR_CONST.alto,
      ),
    );
  }
}