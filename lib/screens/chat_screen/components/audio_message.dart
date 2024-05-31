
import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sample_ui_project/resources/barrel_const.dart';
import 'package:sample_ui_project/screens/register_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../data/model/message_model.dart';
import '../bloc/chat_bloc.dart';

class AudioMessage extends StatefulWidget {

  const AudioMessage({
    super.key,
    required this.messageModel,
  });


  @override
  State<AudioMessage> createState() => _AudioMessageState();

  final MessageModel messageModel;
}

class _AudioMessageState extends State<AudioMessage> with WidgetsBindingObserver{
  final AudioPlayer _audioPlayer = AudioPlayer();

  Color mainColor = COLOR_CONST.malibu;
  Color secondaryColor = COLOR_CONST.white;

  @override
  void initState() {
    super.initState();
    init();
    setColors();
    WidgetsBinding.instance.addObserver(this);
    
  }

  void setColors() async {
    if(!widget.messageModel.isMySend){
      mainColor = COLOR_CONST.alto.withOpacity(0.8);
      secondaryColor = COLOR_CONST.black;
    }
  }

  void init() async {
    await _audioPlayer.setAudioSource(
      widget.messageModel.urlFile.isNotEmpty 
      ? AudioSource.uri(Uri.parse(widget.messageModel.urlFile))
      : AudioSource.file(widget.messageModel.file?.path ?? ""),
      initialPosition: Duration.zero
    );

    // ignore: use_build_context_synchronously
    context.chatBloc.stream.listen((event) {
        // print("Minh Do ----- ${event.playMediaId} --- ${widget.messageModel.id}");
        if(event.playMediaId == widget.messageModel.id){
          _audioPlayer.pause();
          _audioPlayer.seek(Duration.zero);
        }
      }
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _audioPlayer.stop();
    }
  }

  void _playPause(ProcessingState? processingState) async{
    if (_audioPlayer.playing != true) {
      _audioPlayer.play();
      context.chatBloc.add(
        PlayMediaEvent(keyId: widget.messageModel.id)
      );
    } else if (processingState != ProcessingState.completed) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.seek(Duration.zero);
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours > 0) {
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    } else {
      return "$twoDigitMinutes:$twoDigitSeconds";
    }
  }

  Stream<PositionData> get _positionDataStream => 
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _audioPlayer.positionStream,
          _audioPlayer.bufferedPositionStream,
          _audioPlayer.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));
  

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.messageModel.id.toString()),
        onVisibilityChanged: (VisibilityInfo info) {
        
        if (info.visibleFraction == 0 && _audioPlayer.playing) {
          _audioPlayer.pause();
          _audioPlayer.seek(Duration.zero);
        }
      },
      child: Container(
        // constraints: const BoxConstraints(
        //   // minWidth: 0, 
        //   // maxWidth: ChatScreenForm.getMaxWidth(),
        //   minHeight: 0,
        //   maxHeight: double.infinity
        // ),
        height: 60,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 15
        ),
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: widget.messageModel.isMySend ?
            const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomLeft: Radius.circular(18),
            ) : const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomRight: Radius.circular(18),
            )
        ),
        child: Align(
          
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 40,
                child: StreamBuilder<PlayerState>(
                  stream: _audioPlayer.playerStateStream,
                  builder: (context, snapshot) {
                    final playerState = snapshot.data;
                    final processingState = playerState?.processingState;
                    final playing = playerState?.playing ?? false;
    
                    if(processingState == ProcessingState.completed){
                      _audioPlayer.seek(Duration.zero);
                      _audioPlayer.pause();
                    }
    
                    if (processingState == ProcessingState.loading ||
                        processingState == ProcessingState.buffering) {
                      return CupertinoActivityIndicator(
                        color: secondaryColor,
                      );
                    } else{
                      return CupertinoButton(
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        onPressed: (){
                          _playPause(processingState);
                        },
                        child: Icon(
                          (playing && processingState != ProcessingState.completed) ? Icons.pause : Icons.play_arrow,
                          size: 30,
                          color: secondaryColor,
                        ),
                      );
                    }
                  },
                ),
              ),
    
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 3.0,
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6.0),
                  overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
                  thumbColor: secondaryColor,
                  activeTrackColor: secondaryColor,
                  inactiveTrackColor: widget.messageModel.isMySend 
                    ? COLOR_CONST.alto.withOpacity(0.5)
                    : COLOR_CONST.black.withOpacity(0.5),
                  overlayColor: secondaryColor.withOpacity(0.2),
                  trackShape: const RectangularSliderTrackShape(),
                ),
                child: StreamBuilder<PositionData>(
                  stream: _positionDataStream,
                  builder: (context, snapshot) {
                    
                    final positionData = snapshot.data;
    
                    final duration = positionData?.duration ?? Duration.zero;
                    final position = positionData?.position ?? Duration.zero;
                    
                      return Slider(
                        min: 0.0,
                        max: duration.inMilliseconds.toDouble(),
                        value: min(position.inMilliseconds.toDouble(),
                            duration.inMilliseconds.toDouble()),
                        onChangeStart: (value) {
                          _audioPlayer.pause();
                        },
                        onChanged: (value) {
                            _audioPlayer.seek(Duration(milliseconds: value.round()));
                            // _audioPlayer.play();
                            // context.chatBloc.add(
                            //   PlayMediaEvent(keyId: widget.messageModel.id)
                            // );
                        },
                        onChangeEnd: (value) {
                          _audioPlayer.play();
                          context.chatBloc.add(
                            PlayMediaEvent(keyId: widget.messageModel.id)
                          );
                        },
                      );
                    }
                  ),
                ),
            
              const Gap(10),
              StreamBuilder<PositionData>(
                stream: _positionDataStream,
                builder: (context, snapshot) {
                  final positionData = snapshot.data;
    
                  final duration = positionData?.duration ?? Duration.zero;
                  final position = positionData?.position ?? Duration.zero;
                  return Text(
                    _formatDuration(duration - position),
                    style: FONT_CONST.regular(
                    fontSize: 12, 
                      color:  widget.messageModel.isMySend ? COLOR_CONST.white : COLOR_CONST.black
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PositionData {
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;

  PositionData(this.position, this.bufferedPosition, this.duration);
}