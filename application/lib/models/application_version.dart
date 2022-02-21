import '../utils/utils.dart';

enum VersionChannel { stable, beta, dev }

const appDataUrl = "https://lorenzoconcas.github.io/xiaomi_camera_effects_manager/repo/application.json";

class ApplicationVersion {
  String fileUrl;
  bool available;
  int integerVersion;
  String versionName;
  VersionChannel currentChannel =
      VersionChannel.dev; //this must be changed to stable before release

  ApplicationVersion(this.fileUrl, this.available, this.integerVersion,
      this.versionName, this.currentChannel);

  ApplicationVersion.fromJSON(VersionChannel channel, dynamic json)
      : fileUrl = Safe(json[channel.toString().replaceAll("VersionChannel.", "")]['url'], ""),
        available = Safe(json[channel.toString().replaceAll("VersionChannel.", "")]['available'], ""),
        integerVersion = Safe(json[channel.toString().replaceAll("VersionChannel.", "")]['integerVersion'], ""),
        versionName = Safe(json[channel.toString().replaceAll("VersionChannel.", "")]['versionName'], ""),
        currentChannel = channel;

  ApplicationVersion.empty()
      : fileUrl = "",
        available = false,
        integerVersion = 0,
        versionName = "unknown",
        currentChannel = VersionChannel.dev;

  @override
  String toString() {
    return "Current channel : ${currentChannel.toString()}"
        "\nAvailable version : $versionName";
  }
}
