import 'package:ourESchool/core/Models/Announcement.dart';
import 'package:ourESchool/core/enums/ViewState.dart';
import 'package:ourESchool/core/services/AnnouncementServices.dart';
import 'package:ourESchool/core/services/analytics_service.dart';
import 'package:ourESchool/core/viewmodel/BaseModel.dart';
import 'package:ourESchool/locator.dart';

class CreateAnnouncementModel extends BaseModel {
  AnnouncementServices _announcementServices = locator<AnnouncementServices>();
  final AnalyticsService _analyticsService = locator<AnalyticsService>();

  Future postAnnouncement(Announcement announcement) async {
    setState(ViewState.Busy);
    await _announcementServices.postAnnouncement(announcement);
    await _analyticsService.logPostCreated(
        hasImage: announcement.photoPath != null);
    setState(ViewState.Idle);
  }
}
