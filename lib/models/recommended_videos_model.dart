class VideosModel{
  final String image;
  final String text1;
  final String text2;

  VideosModel(this.image, this.text1, this.text2,);
}
List<VideosModel> tiredVideos =
[
  VideosModel('assets/images/images.jpg', 'تعرف على علامات الإصابة بفيروس كورونا', 'المده - 0:30'),
];
List<VideosModel> safeVideos=
[
  VideosModel('assets/images/SocialDistancing.jpg', 'ما هي الإجراءات التي يجب إتخاذها \n للوقايه من فيروس الكورونا؟ ', 'المده - 0:30',),
  VideosModel('assets/images/gettyimages-1216798006-0b51553c8444acfca53984ebf250e29d7f18919d-scaled.jpg', 'العزل المنزلي لمريض كورونا', 'المده - 0:45',),
];
List<VideosModel> fitness=
[
  VideosModel('assets/images/Belly breathing step 3.png', 'تمارين لتحسين عمل الجهاز التنفسي ', 'المده - 1:15',),
  VideosModel('assets/images/15974746374368049.jpg', 'تمارين التنفس العميق وتقويه الرئه', 'المده - 0:35',),
  VideosModel('assets/images/respiratory-system-4869736_1280-780x470.png', 'تمارين لعلاج صعوبه التنفس وتقوية\n العصلات المسئوله عن التنفس ','المده - 1:45',),
];