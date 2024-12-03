import 'package:almabad/features/home/data/datasources/temple_remote_data_source.dart';
import 'package:almabad/features/home/data/models/land_mark_model.dart';
import 'package:almabad/features/home/data/models/temple_model.dart';
import 'package:almabad/features/home/data/models/ticket_price_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddTemples extends StatelessWidget {
  const AddTemples({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // ignore: avoid_function_literals_in_foreach_calls
              egyptianTemples.forEach((e) async {
                await TempleRemoteDataSourceImpl(
                        firebaseFirestore: FirebaseFirestore.instance)
                    .addTemple(e);
              });
            },
            child: const Text('add'),
          ),
        ),
      ),
    );
  }
}

List<TempleModel> egyptianTemples = [
  TempleModel(
    id: '',
    name: 'معبد الكرنك',
    description: '''
يُعد معبد الكرنك أحد أعظم المعابد التي تم تشييدها في مصر القديمة، حيث بدأ بناؤه في الأسرة الوسطى (حوالي 2000 قبل الميلاد) واستمر التوسع فيه حتى العصر البطلمي. بني هذا المعبد ليكون مركزًا لعبادة الإله آمون رع، إله الشمس والخصوبة. 
تبلغ مساحة المعبد حوالي 200 فدان، ويحتوي على أعمدة ضخمة، وتماثيل رائعة، ومسلات شاهقة. يشتهر بقاعة الأعمدة الكبرى التي تضم 134 عمودًا يصل ارتفاع بعضها إلى 21 مترًا. كما يحتوي المعبد على بحيرة مقدسة كانت تُستخدم للتطهير وطقوس دينية. 
يُعد معبد الكرنك اليوم من أبرز المعالم السياحية في الأقصر وموقعًا للعديد من الاكتشافات الأثرية. 
''',
    location: 'الأقصر، مصر',
    openTime: '06:00 AM',
    closeTime: '05:00 PM',
    imagePath:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/%D9%85%D8%B9%D8%A8%D8%AF_%D8%A7%D9%84%D9%83%D8%B1%D9%86%D9%83_%D9%85%D8%AD%D8%A7%D9%81%D8%B8%D8%A9_%D8%A7%D9%84%D8%A7%D9%82%D8%B5%D8%B1.jpg/640px-%D9%85%D8%B9%D8%A8%D8%AF_%D8%A7%D9%84%D9%83%D8%B1%D9%86%D9%83_%D9%85%D8%AD%D8%A7%D9%81%D8%B8%D8%A9_%D8%A7%D9%84%D8%A7%D9%82%D8%B5%D8%B1.jpg',
    landmarks: [
      LandMarkModel(
        name: 'قاعة الأعمدة الكبرى',
        description: '''
تُعد قاعة الأعمدة الكبرى من أعظم المعالم الهندسية في معبد الكرنك. تم بناؤها خلال حكم الملك سيتي الأول ورمسيس الثاني. 
تضم القاعة 134 عمودًا ضخمًا، موزعة على 16 صفًا، حيث يصل ارتفاع الأعمدة الوسطى إلى حوالي 21 مترًا. كانت القاعة تستخدم لإقامة الاحتفالات والطقوس الملكية. تقع في منتصف المعبد، وهي تُعتبر رمزًا للإبداع الهندسي في مصر القديمة.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Karnak_Temple%2C_Luxor%2C_Egypt_%282504823891%29.jpg/640px-Karnak_Temple%2C_Luxor%2C_Egypt_%282504823891%29.jpg',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'البحيرة المقدسة',
        description: '''
تمثل البحيرة المقدسة عنصرًا رئيسيًا في الطقوس الدينية بمعبد الكرنك. تقع بالقرب من الفناء المركزي وتمتد على مساحة واسعة. 
كان الكهنة يستخدمون البحيرة لتطهير أنفسهم قبل أداء الطقوس. البحيرة محاطة بجدران مزينة برسومات ونقوش دينية، وهي من أفضل البحيرات المحفوظة في مصر القديمة.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/%D8%A7%D9%84%D8%A8%D8%AD%D9%8A%D8%B1%D8%A9_%D8%A7%D9%84%D9%85%D9%82%D8%AF%D8%B3%D8%A9_%D8%A8%D9%85%D8%B9%D8%A8%D8%AF_%D8%A7%D9%84%D9%83%D8%B1%D9%86%D9%83.jpg/640px-%D8%A7%D9%84%D8%A8%D8%AD%D9%8A%D8%B1%D8%A9_%D8%A7%D9%84%D9%85%D9%82%D8%AF%D8%B3%D8%A9_%D8%A8%D9%85%D8%B9%D8%A8%D8%AF_%D8%A7%D9%84%D9%83%D8%B1%D9%86%D9%83.jpg',
        inTicket: false,
      ),
      LandMarkModel(
        name: 'طريق الكباش',
        description: '''
يربط طريق الكباش بين معبدي الكرنك والأقصر. يمتد الطريق بطول حوالي 2.7 كيلومتر، ويتميز بصفوف من تماثيل الكباش الحجرية على جانبيه. 
بُني الطريق للاحتفال بمهرجان الأوبت، وهو من أبرز المعالم التي تدل على عظمة العمارة المصرية القديمة.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Avenue_of_Sphinxes_-_Karnak_Temple_-_Luxor_-_panoramio.jpg/640px-Avenue_of_Sphinxes_-_Karnak_Temple_-_Luxor_-_panoramio.jpg',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'مسلة تحتمس الأول',
        description: '''
تُعتبر مسلة تحتمس الأول من أبرز المعالم في معبد الكرنك. تقع في الفناء الشرقي للمعبد، ويبلغ ارتفاعها حوالي 19 مترًا. 
المسلة مصنوعة من الجرانيت الوردي، وكانت تُستخدم لتكريم الإله آمون رع.
''',
        iamge:
            'data:image/jpeg;base64,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',
        inTicket: true,
      ),
    ],
    numberOfLikes: 2500,
    price: TicketPriceModel(
      egyptionStudent: 10,
      egyption: 20,
      arab: 30,
      foreign: 50,
    ),
  ),
  TempleModel(
    id: '',
    name: 'معبد الأقصر',
    description: '''
يُعتبر معبد الأقصر تحفة معمارية بُنيت خلال الأسرة الثامنة عشرة (حوالي 1400 قبل الميلاد) في عهد الملك أمنحتب الثالث، وتم توسيعه لاحقًا على يد رمسيس الثاني. 
كان الهدف من بناء المعبد هو الاحتفال بمهرجان الأوبت السنوي وتجديد قوة الفرعون. يتميز المعبد بأعمدة ضخمة وتماثيل عملاقة لرمسيس الثاني. 
كما يحتوي المعبد على نقوش بارزة تصور مشاهد من الطقوس الملكية والدينية. موقعه في مدينة الأقصر يجعله واحدًا من أشهر المعابد في مصر.
''',
    location: 'الأقصر، مصر',
    openTime: '06:00 AM',
    closeTime: '09:00 PM',
    imagePath:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Templo_de_Luxor%2C_Luxor%2C_Egipto%2C_2022-04-01%2C_DD_29.jpg/640px-Templo_de_Luxor%2C_Luxor%2C_Egipto%2C_2022-04-01%2C_DD_29.jpg',
    landmarks: [
      LandMarkModel(
        name: 'الصروح الكبرى',
        description: '''
الصروح الكبرى هي بوابة المعبد الرئيسية التي بناها الملك رمسيس الثاني. تتميز بنقوش تصور الانتصارات العسكرية للملك وتماثيل ضخمة تحيط بها. 
تقع الصروح في المدخل الجنوبي للمعبد وتُعتبر من المعالم الأكثر إثارة للإعجاب.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Egypt.LuxorTemple.05.jpg/220px-Egypt.LuxorTemple.05.jpg',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'فناء أمنحتب الثالث',
        description: '''
يقع فناء أمنحتب الثالث في وسط المعبد، ويضم صفوفًا من الأعمدة المزينة بنقوش تصور الطقوس الدينية. 
بُني الفناء ليكون مكانًا للاحتفالات الملكية ويعكس جمال التصميم المصري القديم.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/df/Luxor_Temple%2C_The_Colonnade_of_Amenhotep_III%2C_Luxor%2C_Egypt.jpg/640px-Luxor_Temple%2C_The_Colonnade_of_Amenhotep_III%2C_Luxor%2C_Egypt.jpg',
        inTicket: false,
      ),
      LandMarkModel(
        name: 'قدس الأقداس',
        description: '''
قدس الأقداس هو الجزء الأكثر قداسة في المعبد. يحتوي على تمثال للإله آمون رع ومكانًا لتقديم القرابين. 
يقع في الجزء الشمالي من المعبد ويعكس الإبداع الديني والفني في مصر القديمة.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Central_Bark_Shrine_in_Karnak_-_interior_20.jpg/640px-Central_Bark_Shrine_in_Karnak_-_interior_20.jpg',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'الطريق الروماني',
        description: '''
أُضيف الطريق الروماني لاحقًا إلى المعبد في العصر الروماني، ويضم نقوشًا لاتينية وتماثيل صغيرة تعكس الطابع الثقافي لتلك الفترة.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Luxor_Temple_2022_08.jpg/640px-Luxor_Temple_2022_08.jpg',
        inTicket: false,
      ),
    ],
    numberOfLikes: 2000,
    price: TicketPriceModel(
      egyptionStudent: 10,
      egyption: 25,
      arab: 35,
      foreign: 55,
    ),
  ),
  TempleModel(
    id: '',
    name: 'معبد أبو سمبل',
    description: '''
يُعد معبد أبو سمبل أحد أبرز المعالم في تاريخ مصر القديمة، وهو يشهد على براعة الهندسة المعمارية المصرية في فترة حكم الملك رمسيس الثاني. تم بناء المعبد في القرن الثالث عشر قبل الميلاد في موقع استراتيجي في جنوب مصر، في محافظة أسوان. كان الهدف من بناء المعبد ليس فقط تكريم الآلهة، بل أيضًا لتخليد انتصارات رمسيس الثاني العسكرية وتقديمه كإله حي. يُعتبر معبد أبو سمبل واحدًا من أهم المعابد المنحوتة في الصخور في مصر.

يتكون المعبد من معبدين، أحدهما مخصص للملك رمسيس الثاني والآخر لزوجته الملكة نفرتاري. يحتوي المعبد على العديد من المعالم المدهشة، ومنها الواجهة الرئيسية التي تضم أربعة تماثيل ضخمة للملك رمسيس الثاني. هذه التماثيل ترتفع إلى 20 مترًا، مما يعكس العظمة والقوة التي كان يسعى الملك لإظهارها لشعبه. تم تصميم المعبد بحيث تتعامد أشعة الشمس على وجه الملك في يومي ميلاده وتتويجه، مما يعكس التقدم العلمي والديني لمصر في تلك الحقبة. المعبد ليس فقط مكانًا للعبادة، بل أيضًا بمثابة تكريم للآلهة رع حور أختي، وبتاح، وآمون، الذين تم تخصيص المعابد لهم في هذا الموقع.

لقد تمت عملية نقل المعبد بالكامل في الخمسينيات من القرن العشرين عندما تم بناء السد العالي في أسوان، وهو ما يعد من أكبر الإنجازات الهندسية في العصر الحديث. معبد أبو سمبل يعد معلمًا سياحيًا رئيسيًا يجذب الزوار من جميع أنحاء العالم لرؤية هذه التحفة الفنية المدهشة.
''',
    location: 'أسوان، مصر',
    openTime: '05:00 AM',
    closeTime: '06:00 PM',
    imagePath:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/%D9%85%D8%B9%D8%A8%D8%AF_%D8%A3%D8%A8%D9%88_%D8%B3%D9%85%D8%A8%D9%84_%D9%A5.jpg/640px-%D9%85%D8%B9%D8%A8%D8%AF_%D8%A3%D8%A8%D9%88_%D8%B3%D9%85%D8%A8%D9%84_%D9%A5.jpg',
    landmarks: [
      LandMarkModel(
        name: 'الواجهة الرئيسية',
        description: '''
الواجهة الرئيسية لمعبد أبو سمبل هي واحدة من أروع المعالم في المعابد المصرية القديمة، وتعد الواجهة الفريدة علامة بارزة في تصميم المعابد المنحوتة في الصخور. تتكون الواجهة من أربعة تماثيل ضخمة للملك رمسيس الثاني، حيث يبلغ ارتفاع كل تمثال 20 مترًا، مما يجعلها من أضخم التماثيل التي تمثل ملوك مصر القديمة. يتميز كل تمثال بتفاصيل دقيقة ورائعة، ويُظهر الملك رمسيس الثاني جالسًا على عرشه مرتديًا التاج الملكي وهو يحمل الصولجان والمذكرة، رمزَي السلطة الملكية.

تم تصميم هذه التماثيل بشكل يعكس عظمة الملك وتفوقه العسكري، حيث تم نقش مشاهد من انتصاراته على الأعداء على جدران المعابد المجاورة. هذه النقوش تمثل بشكل رئيسي معركة قادش التي وقعت بين المصريين والحيثيين. كما تحتوي الواجهة أيضًا على نقوش تصور الطقوس الدينية والاحتفالات التي كانت تقام لتكريم الآلهة.

التماثيل الأربعة هي جزء من مفهوم معماري فريد يعكس الرغبة في تأكيد هيبة الملك رمسيس الثاني ودوره كإله في العالم بعد موته. تُعتبر هذه الواجهة رمزًا للقدرة الفنية والهندسية التي كانت تمتاز بها مصر القديمة، وهي أيضًا دليل على الفهم العميق للملوك المصريين لكيفية استخدام الطبيعة والتضاريس في تصميم المعابد التي تكون محورية في حياتهم الدينية والسياسية.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Abu_Simbel_Temple_May_30_2007.jpg/640px-Abu_Simbel_Temple_May_30_2007.jpg',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'قاعة الأعمدة',
        description: '''
قاعة الأعمدة في معبد أبو سمبل هي من أروع أجزاء المعبد وأكثرها إثارة للإعجاب، حيث تضم 8 تماثيل ضخمة للملك رمسيس الثاني، وهي موزعة على جانبي القاعة بشكل مهيب. هذه الأعمدة تمثل جانبًا من طقوس العبادة التي كانت تُقام في المعبد. كانت القاعة تستخدم لإقامة الطقوس الدينية والاحتفالات الكبرى التي كانت تعزز دور الملك في الحياة الدينية والروحية لمصر القديمة.

تماثيل الأعمدة تمثل الملك رمسيس الثاني في أوضاع متنوعة، وتُظهره في أشكال مهيبة تعكس مكانته كحاكم ورمز ديني. النقوش التي تزين الجدران تصف مشاهد من حياة الملك، مثل معركته الشهيرة في قادش واحتفالاته بالنصر. كما توجد نقوش أخرى تمثل الملك وهو يقدم القرابين للآلهة، مما يعكس التفاعل الديني العميق بين الملك والإله.

تعتبر هذه القاعة أيضًا مكانًا للزوار للاستمتاع بالعظمة الفنية لمصر القديمة، وهي توفر رؤية فريدة لكيفية استخدام العمارة لخلق بيئة تتناغم مع الأغراض الدينية والاحتفالية. تعتبر قاعة الأعمدة أحد المعالم الرائعة التي تستقطب الزوار وتستحق الزيارة للاستمتاع بجمال تصميمها وروعتها الفنية.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/By_ovedc_-_Abu_Simbel_temples_-_21.jpg/640px-By_ovedc_-_Abu_Simbel_temples_-_21.jpg',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'قدس الأقداس',
        description: '''
قدس الأقداس في معبد أبو سمبل هو المكان الأكثر قداسة في المعبد، ويُعتبر رمزا للعبادة والنور الإلهي. يحتوي قدس الأقداس على تماثيل للآلهة رع حور أختي، وبتاح، وآمون، بالإضافة إلى تمثال للملك رمسيس الثاني. تم تصميم هذا الجزء من المعبد بطريقة فنية مدهشة بحيث تتعامد أشعة الشمس مرتين في العام، تحديدًا في يومي ميلاد الملك وتويجته، وتضيء وجه الملك بشكل مدهش.

الهدف من هذا التصميم كان خلق تأثير مذهل يجسد القوة الإلهية للملك رمسيس الثاني وارتباطه المباشر بالآلهة. من خلال هذا الظاهرة الطبيعية، كان يرمز إلى أن الملك ليس فقط قائدًا عسكريًا عظيمًا، بل أيضًا كان يُعتبر إلهًا حيًا على الأرض، وأنه يُحظى برعاية الآلهة. تعد هذه الظاهرة أحد أكثر جوانب معبد أبو سمبل شهرةً وتميزًا.

قدس الأقداس هو المكان الذي كان يتم فيه تقديم القرابين الكبرى، وكان يخص الآلهة الحاكمة في المعبد. يمثل هذا الجزء أهمية كبيرة في فهم العقيدة الدينية المصرية القديمة وعلاقتها بالملوك الذين كانوا يعتبرون شركاء للآلهة في العرش الملكي.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/By_ovedc_-_Abu_Simbel_temples_-_26.jpg/640px-By_ovedc_-_Abu_Simbel_temples_-_26.jpg',
        inTicket: true,
      ),
    ],
    numberOfLikes: 3000,
    price: TicketPriceModel(
      egyptionStudent: 15,
      egyption: 30,
      arab: 50,
      foreign: 80,
    ),
  ),
  TempleModel(
    id: '',
    name: 'معبد حتشبسوت',
    description: '''
معبد حتشبسوت هو أحد أعظم المعابد الجنائزية في مصر القديمة، ويعد من أبرز المعالم التاريخية في مدينة الأقصر. بُني في القرن الخامس عشر قبل الميلاد بأمر من الملكة حتشبسوت، إحدى أشهر ملكات مصر القديمة التي حكمت مصر في فترة العهد الجديد. يقع المعبد في منطقة الدير البحري على الضفة الغربية لنهر النيل، وهو محاط بمناظر طبيعية خلابة ويعكس البراعة المعمارية المصرية القديمة. 

تم تصميم المعبد بطريقة فريدة تعكس التناغم بين العمارة والبيئة المحيطة به. يتكون المعبد من ثلاث شرفات متدرجة محفورة في الجبل، وتمتاز هذه الشرفات بنقوش ضخمة تروي أحداثًا هامة من حياة الملكة حتشبسوت. يحتوي المعبد أيضًا على قاعة نقوش تحتوي على مشاهد من رحلاتها إلى بلاد بونت، وهي منطقة ساحلية قديمة غنية بالموارد التي كانت حتشبسوت تستورد منها البخور والعطور. كما تتضمن النقوش صورًا لأحداث تاريخية وفنية تمثل حكمها وإنجازاتها.

المعبد يميز نفسه عن المعابد المصرية الأخرى بتصميمه الذي يجمع بين المباني العمودية والعناصر الطبيعية، حيث أن تصميم الشرفات المتدرجة يمثل توازنًا بين القوة الروحية والطبيعة الجبلية المحيطة. يُعد هذا المعبد واحدًا من أكثر المعابد المدهشة من الناحية المعمارية في مصر القديمة، وقد بُني ليكون مكانًا للعبادة والاحتفالات الدينية وتخليد ذكرى الملكة حتشبسوت. هذا المعبد لا يعكس فقط روعة العمارة المصرية، بل هو أيضًا شاهِد على حكم امرأة عظيمة في تاريخ مصر القديم.
''',
    location: 'الأقصر، مصر',
    openTime: '06:00 AM',
    closeTime: '05:00 PM',
    imagePath:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Templo_funerario_de_Hatshepsut%2C_Valle_de_las_Reyes%2C_Luxor%2C_Egipto%2C_2022-04-03%2C_DD_118.jpg/640px-Templo_funerario_de_Hatshepsut%2C_Valle_de_las_Reyes%2C_Luxor%2C_Egipto%2C_2022-04-03%2C_DD_118.jpg',
    landmarks: [
      LandMarkModel(
        name: 'الشرفات المتدرجة',
        description: '''
الشرفات المتدرجة هي واحدة من أهم سمات معبد حتشبسوت وأكثرها إثارة للاهتمام. تتكون الشرفات من ثلاث مستويات تتدرج بشكل متسلسل، محفورة في الجبل بشكل رائع يظهر براعة المهندسين المصريين القدماء في الاستفادة من التضاريس الجبلية. تم تصميم هذه الشرفات بحيث تتداخل مع البيئة الجبلية المحيطة، ما يعطي انطباعًا قويًا بالتناغم بين الطبيعة والعمران.

كل شرفة من الشرفات المتدرجة تحتوي على صروح وأعمدة ضخمة تحيط بها نقوش تمثل مشاهد من حياة الملكة حتشبسوت، بما في ذلك مشاهد من رحلاتها إلى بلاد بونت. تُظهر هذه النقوش أن الملكة كانت تدير المملكة بحكمة واقتدار، حيث تظهر نقوش عديدة تحكي عن استيراد البخور والمواد الثمينة من بلاد بونت. إضافة إلى ذلك، تحتوي الشرفات على تماثيل للملكة حتشبسوت وأبناءها، مما يعكس قوتها وشرعيتها في الحكم.

الكلّ من التصميم المعماري والنقوش التي تزين هذه الشرفات توفر لنا لمحة فريدة عن ماضي مصر القديم ورؤيتها الجمالية للعمران. ومع مرور الوقت، أصبح معبد حتشبسوت رمزًا للإنجازات المعمارية والفنية في مصر القديمة، ويُعتبر زيارة الشرفات المتدرجة تجربة لا تُنسى لكل من يهتم بتاريخ العمارة المصرية.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Thebes%2C_Luxor%2C_Egypt%2C_Temple_of_Hatshepsut_2.jpg/640px-Thebes%2C_Luxor%2C_Egypt%2C_Temple_of_Hatshepsut_2.jpg',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'قاعة النقوش',
        description: '''
قاعة النقوش في معبد حتشبسوت هي واحدة من أبرز معالم المعبد التي تجذب الزوار بسبب تنوع النقوش التي تزين جدرانها. هذه النقوش تُعتبر سجلاً تاريخيًا هامًا، حيث تُصور رحلات الملكة حتشبسوت إلى بلاد بونت، وهي واحدة من أقدم الرحلات التجارية في التاريخ المصري القديم. النقوش توثق تفاصيل الرحلة، التي كانت تهدف إلى تأمين تجارة البخور والعطور وغيرها من الموارد الثمينة. مشاهد الرحلة تظهر الملكة حتشبسوت على متن السفن وهي تتجه إلى بلاد بونت، حيث تظهر النقوش كيف كانت تشرف على تجارها وتستقبل الهدايا القيمة التي كانت تجلبها السفن من تلك الأراضي.

علاوة على ذلك، تضم قاعة النقوش مشاهد متنوعة من حياة الملكة حتشبسوت وحكمها، بما في ذلك صورًا لها وهي تُقدّم القرابين للإله آمون، وتُظهر النقوش أيضًا أعمالًا دينية وتاريخية مهمة. الجدران المزخرفة تصور مشاهد من ممارساتها الدينية، مثل تكريس المعبد لخدمة الآلهة، وتوثق أعيادًا كبيرة ومناسبات دينية أخرى كانت تقام في المعبد. 

هذه النقوش لا تقتصر على جوانب الحياة الملكية والديانة فحسب، بل تشمل أيضًا جوانب من الحياة اليومية، مما يتيح لنا فهمًا عميقًا للعادات والطقوس التي كانت تمارس في ذلك الوقت. زيارة قاعة النقوش في معبد حتشبسوت تتيح للزوار فرصة للتفاعل مع الماضي واكتشاف المزيد عن حياة الملكة حتشبسوت التي كانت واحدة من أبرز شخصيات التاريخ المصري القديم.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Anubis_Chapel%2C_Mortuary_Temple_of_Hatshepsut%2C_Luxor%2C_LG%2C_EGY_%2848010632738%29.jpg/640px-Anubis_Chapel%2C_Mortuary_Temple_of_Hatshepsut%2C_Luxor%2C_LG%2C_EGY_%2848010632738%29.jpg',
        inTicket: true,
      ),
    ],
    numberOfLikes: 1800,
    price: TicketPriceModel(
      egyptionStudent: 10,
      egyption: 20,
      arab: 35,
      foreign: 60,
    ),
  ),
  TempleModel(
    id: '',
    name: 'معبد إدفو',
    description: '''
يُعد معبد إدفو أحد أفضل المعابد المحفوظة من العصر البطلمي في مصر القديمة، حيث بُني بين عامي 237 و57 قبل الميلاد في فترة حكم البطالمة. كان المعبد مخصصًا لعبادة الإله حورس، ويعد من أكبر وأكمل المعابد المكرسة لهذا الإله في مصر. يتميز المعبد بجدرانه المليئة بالنقوش والتماثيل التي توثق أحداثًا تاريخية ودينية مهمة، وخاصة المعركة الشهيرة بين الإله حورس والإله ست، التي تمثل الصراع بين الخير والشر.

تم بناء معبد إدفو من الحجر الرملي، ويتميز بتصميمه الهندسي المعقد. يتكون المعبد من صروح ضخمة، وحرم داخلي، وقاعة أعمدة واسعة، بالإضافة إلى قدس الأقداس الذي كان يحتفظ بمركب الإله حورس. داخل المعبد، توجد مجموعة من النقوش التفصيلية التي تشرح الطقوس الدينية المتعلقة بالإله حورس وأسطوراته، بالإضافة إلى مشاهد من حياة الفراعنة. هذه النقوش تعتبر مصدرًا هامًا لفهم الأساطير المصرية القديمة وكيفية تأدية الطقوس المختلفة. 

يعتبر معبد إدفو من أهم المواقع السياحية في مصر بفضل كونه واحدًا من أروع وأكمل المعابد القديمة المحفوظة. فهو يقدم لمحة واضحة عن كيفية استخدام المعابد المصرية في العصور القديمة للعبادة، والطريقة التي كانت تمارس بها الطقوس والتقاليد الدينية. كما أن المعبد يتمتع بتاريخ طويل ومعقد يربط بين مختلف الفترات المصرية، بما في ذلك عهد البطالمة، مما يجعله مقصدًا هامًا للباحثين عن تاريخ مصر القديمة. 
''',
    location: 'إدفو، أسوان، مصر',
    openTime: '07:00 AM',
    closeTime: '05:00 PM',
    imagePath:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Temple_of_Edfu%2C_Pylon%2C_Egypt.jpg/640px-Temple_of_Edfu%2C_Pylon%2C_Egypt.jpg',
    landmarks: [
      LandMarkModel(
        name: 'الصروح',
        description: '''
تعد صروح معبد إدفو من أبرز المعالم المعمارية التي تميز المعبد عن غيره من المعابد في مصر القديمة. تبلغ ارتفاعات الصروح حوالي 36 مترًا، وهي مزينة بنقوش ضخمة تظهر معارك الإله حورس ضد الإله ست، والتي تعتبر واحدة من أكثر الأساطير شهرة في المعتقدات المصرية القديمة. هذه المعركة تُعد رمزية للصراع الأبدي بين الخير والشر، حيث يظهر حورس في النقوش وهو يحارب ست في محاولة لاستعادة العدالة والحق في الأرض.

تعتبر نقوش الصروح مصدرًا تاريخيًا وثقافيًا هامًا حيث تمثل العديد من الطقوس الدينية التي كانت تُمارس في معبد إدفو. تُظهر النقوش تفاصيل دقيقة عن الاحتفالات التي كانت تُنظم لتكريم الإله حورس، وتوثق أيضًا لحظات هامة من حياة الفرعون والملكة. لا تقتصر النقوش على توثيق الأحداث الدينية فقط، بل تشمل أيضًا مشاهد من الحياة اليومية في تلك الفترة. إضافة إلى ذلك، تتضمن الصروح نقوشًا تمجد حاكم مصر في تلك الفترة، مما يعكس مدى ارتباط الدين بالسلطة السياسية في المجتمع المصري القديم.

هذه النقوش تلعب دورًا أساسيًا في فهم كيفية تفاعل المصريين القدماء مع آلهتهم ومع فرعونهم، وتوضح لنا الطريقة التي كان يتم بها تصور السلطة الدينية والسياسية في مصر القديمة. إن صروح معبد إدفو تعتبر من أهم المعالم التي تمثل الفن المصري القديم، وتعكس البراعة الفنية والتقنية التي كان يتمتع بها المصريون القدماء.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Edfu_Temple_9614.JPG/640px-Edfu_Temple_9614.JPG',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'قاعة الأعمدة',
        description: '''
قاعة الأعمدة في معبد إدفو هي إحدى المعالم الهندسية المدهشة في هذا المعبد. تضم القاعة 12 عمودًا ضخمة، وتعتبر بمثابة المدخل الرئيسي للجزء الأكثر قداسة في المعبد. الأعمدة مزينة بنقوش رائعة تعكس مشاهد من الاحتفالات الدينية المختلفة التي كانت تُقام لتكريم الإله حورس. تم بناء القاعة بمساحة واسعة لتستوعب الطقوس الملكية والدينية التي كانت تُنفذ فيها. 

هذه القاعة ليست فقط مكانًا للعبادة، بل أيضًا كانت تستخدم كمكان لتعليم وتوجيه الكهنة وموظفي المعبد حول كيفية تنفيذ الطقوس بطريقة صحيحة. الأعمدة نفسها تتميز بزخارف دقيقة ومرتفعة، وتعكس الفنون المعمارية والتقنية المتقدمة التي كانت سائدة في فترة بناء المعبد. علاوة على ذلك، تشكل هذه الأعمدة رابطًا بين جزء المعبد العام وقدس الأقداس الذي يُعتبر أقدس الأماكن في المعبد. 

النقوش على الأعمدة لا تمثل فقط الآلهة والطقوس، بل تتضمن أيضًا مشاهد توثق العلاقة بين الملك والإله حورس. هذه النقوش تُظهر الملك في مواضع مختلفة خلال المعارك مع أعدائه، ما يعكس اعتقاد المصريين القدماء بأنهم يمتلكون القوة الإلهية لحماية مصر وتحقيق العدالة. تُعد قاعة الأعمدة في معبد إدفو واحدة من أفضل الأمثلة على الهندسة المعمارية المصرية القديمة، وهي نقطة محورية لفهم كيفية إقامة الاحتفالات الملكية في مصر القديمة.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/By_ovedc_-_Edfu_Temple_-_29.jpg/640px-By_ovedc_-_Edfu_Temple_-_29.jpg',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'قدس الأقداس',
        description: '''
قدس الأقداس في معبد إدفو هو أقدس الأماكن في المعبد، وهو المكان الذي يُحتفظ فيه بمركب الإله حورس. يُعد هذا الجزء من المعبد الأكثر قدسية ويُعتبر مركز العبادة الحقيقية. قدس الأقداس محاط بجدران مزخرفة بنقوش تظهر العديد من الطقوس والاحتفالات التي كانت تُقام فيه. في هذا المكان، كان يتم تقديم القرابين للإله حورس كجزء من الطقوس الدينية التي تهدف إلى الحفاظ على النظام الكوني والعدالة. 

تصميم قدس الأقداس يتمتع بالبساطة مقارنة ببقية المعبد، إلا أنه يتميز بأجواء روحية مهيبة تنبع من هدوئه وقدسيته. كانت هذه المنطقة تُعتبر مخصصة للكهنة فقط، ولم يكن يسمح للزوار العاديين بالاقتراب منها. في داخل قدس الأقداس، يوجد ناووس حجري كان يُستخدم لحفظ مركب الإله حورس، وهو يرمز إلى الرحلة الروحية التي يقوم بها الإله عبر السماء. 

تعتبر النقوش التي تزين جدران قدس الأقداس شاهدة على أهمية هذا المكان في الحياة الدينية للمصريين القدماء. وتُظهر هذه النقوش ارتباطًا قويًا بين الملك والإله حورس، حيث كان الملك يُعتبر تجسيدًا للإله على الأرض، وكان يُعتقد أنه يشترك في القدرة على الإشراف على العالمين الإلهي والبشري.
''',
        iamge:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWdWbvHuORq8LkU-IpRxFfJL-0s6ZOR2dllQ&s',
        inTicket: true,
      ),
    ],
    numberOfLikes: 2200,
    price: TicketPriceModel(
      egyptionStudent: 10,
      egyption: 20,
      arab: 30,
      foreign: 50,
    ),
  ),
  TempleModel(
    id: '',
    name: 'معبد كوم أمبو',
    description: '''
معبد كوم أمبو هو معبد مزدوج يقع في مدينة كوم أمبو في محافظة أسوان بمصر. بُني في العصر البطلمي حوالي عام 180 قبل الميلاد، ويعد واحدًا من أبرز المعابد التي تجسد التوازن بين عبادة إلهين مختلفين، وهما الإله سوبك وإله النيل والخصوبة، والإله حورس الأكبر، إله السماء والنور. هذا التنوع في العبادة يظهر بوضوح في تصميم المعبد الفريد الذي يتكون من محورين رئيسيين لكل إله.

يتميز معبد كوم أمبو بتخطيطه المعماري المزدوج، حيث تم تقسيم المعبد إلى جزئين متوازيين: الجزء المخصص لعبادة الإله سوبك والجزء المخصص لعبادة الإله حورس. يتضمن كل جزء قاعة أعمدة، قدس الأقداس، والعديد من النقوش والتماثيل التي تروي قصص الأساطير المصرية القديمة المتعلقة بهذين الإلهين. المعبد يتمتع بتصميم متناظر بشكل مذهل، حيث يتم تكرار المعابد والأعمدة والمقدسات في كلا الجزئين بشكل متوازن، وهو ما يعكس التناغم بين الآلهة والتوازن الروحي في المعتقدات المصرية القديمة.

إلى جانب الجوانب الدينية، يحتوي معبد كوم أمبو أيضًا على العديد من النقوش الهامة التي تُظهر التطور العلمي والتقني في مصر القديمة، مثل النقوش الطبية التي تعرض الأدوات الجراحية التي استخدمها الأطباء في تلك الفترة. يروي المعبد قصة تطور الطب المصري القديم وعلاقته بالآلهة، مما يعكس العلاقة الوثيقة بين الدين والعلم في تلك الحقبة الزمنية. 
معبد كوم أمبو لا يُعد فقط مركزًا دينيًا، بل أيضًا رمزًا للمهارة المعمارية والفنية في العصر البطلمي.
''',
    location: 'كوم أمبو، أسوان، مصر',
    openTime: '07:00 AM',
    closeTime: '05:00 PM',
    imagePath:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Temple_of_Kom_Ombo_%282427959005%29.jpg/640px-Temple_of_Kom_Ombo_%282427959005%29.jpg',
    landmarks: [
      LandMarkModel(
        name: 'قاعة الأعمدة',
        description: '''
قاعة الأعمدة في معبد كوم أمبو هي واحدة من أبرز معالم المعبد المزدوج، حيث تتميز بتصميمها الرائع الذي يعكس التناظر بين الجانبين المخصصين للإلهين سوبك وحورس. تتكون القاعة من مجموعة من الأعمدة الضخمة التي تزينها النقوش الدقيقة التي تصور الطقوس الدينية المرتبطة بكل إله. تم تصميم الأعمدة بشكل يتناسب مع المساحة المعمارية ويعكس الجماليات الدقيقة التي كانت تتمتع بها المعابد المصرية القديمة.

في الجزء المخصص للإله سوبك، تجد النقوش التي تروي أساطير هذا الإله المرتبط بالنيل والخصوبة. أما في الجزء المخصص للإله حورس، فتوجد نقوش تظهر دور حورس كإله للسماء والنور، فضلاً عن مشاهد من الأساطير التي تبرز صراعاته مع قوى الشر. كما تُظهر النقوش دقة الفن المصري القديم في تصوير الطقوس، مما يعكس التزام الكهنة بالحفاظ على تقاليد العبادة الدقيقة.

تعتبر قاعة الأعمدة مركزًا للعبادة في معبد كوم أمبو، وتعد واحدة من أبرز الأمثلة على كيفية استخدام المعمار المصري القديم لإبراز الروح الدينية والعقائدية التي كانت سائدة في تلك الفترة.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Temple_of_Kom_Ombo_%282427979759%29.jpg/640px-Temple_of_Kom_Ombo_%282427979759%29.jpg',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'قدس الأقداس',
        description: '''
قدس الأقداس في معبد كوم أمبو هو الجزء الأكثر قداسة في المعبد، حيث يتجسد فيه تكريم الإلهين سوبك وحورس. تم تصميم قدس الأقداس بحيث يتم تكريم كل إله بشكل متساوٍ، مما يعكس التوازن الديني الذي كان يسود في مصر القديمة. يحتوي قدس الأقداس على مذابح مخصصة لكل من سوبك وحورس، حيث كانت تُجرى الطقوس الدينية والعروض القرابين في هذه المنطقة المقدسة.

في الجزء المخصص للإله سوبك، تم العثور على العديد من النقوش التي تمثل هذا الإله في صور مختلفة، مثل سوبك وهو يحمل رموزًا مرتبطة بالخصوبة والنيل. أما في الجزء المخصص للإله حورس، فقد تم تصويره في العديد من الأشكال، حيث يظهر كإله للسماء والنور. التصميم المزدوج لقدس الأقداس يبرز العلاقة الوثيقة بين العبادة الدينية والعقيدة المصرية القديمة التي ترى في الآلهة مصدرًا للحياة والخصوبة والنور.

قدس الأقداس في معبد كوم أمبو ليس فقط مكانًا مقدسًا للعبادة، بل يعد أيضًا نقطة محورية لفهم ديناميكية العلاقة بين الآلهة المصريين وتقاليدهم الدينية العميقة. يشير إلى كيف كانت الطقوس الدينية تنظم بشكل دقيق ومتناظر لتكريم الآلهة.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Temple_of_Sobek%2C_Kom_Ombo_%289797652225%29.jpg/640px-Temple_of_Sobek%2C_Kom_Ombo_%289797652225%29.jpg',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'نقوش الأدوات الطبية',
        description: '''
نقوش الأدوات الطبية في معبد كوم أمبو تعد واحدة من أبرز الاكتشافات التي تكشف عن تطور الطب في مصر القديمة. تعد هذه النقوش فريدة من نوعها حيث تصور أدوات جراحية متعددة كانت تستخدم في إجراء العمليات الطبية في تلك الفترة. تعتبر هذه النقوش دليلاً على التقدم العلمي الذي حققته الحضارة المصرية القديمة في مجال الطب، وتُظهر كيف كان الأطباء في ذلك الوقت يتعاملون مع الأمراض والإصابات.

تمثل النقوش أدوات مثل المشارط، والملاقط، والمبازل، وغيرها من الأدوات الجراحية التي كان يستخدمها الأطباء في إجراء العمليات الجراحية. كما تُظهر النقوش كيفية إجراء عمليات معقدة مثل إزالة الأورام أو معالجة الكسور. كما كان يُعتبر الأطباء في مصر القديمة ممثلين للإله إمحوتب، الذي كان يُعتبر إله الطب والشفاء، مما يعكس العلاقة الوثيقة بين الدين والعلم في ذلك الوقت.

تُظهر هذه النقوش التقدم الكبير في مجال الطب والجراحة في مصر القديمة، كما تُبرز قدرة المصريين القدماء على استخدام الأدوات الدقيقة لإجراء العمليات الطبية المعقدة. يمكن القول إن هذه النقوش تسلط الضوء على الابتكار الطبي الذي كان جزءًا لا يتجزأ من ثقافة مصر القديمة.
''',
        iamge:
            'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEghGn7fgUNSA_ppRwZSssQyBgw-hyIJuUrCx4_JB6maYj4R53f7nGaNu585_1cBhFnC2afi5bHmDZBSKGWXM8QiCbez827WpJjeQBviDc0CvZGi11sU_CR2BQnJpZYPznnoJYPfhMhPUKvx/s1600/%D8%A7%D8%AF%D9%88%D8%A7%D8%AA+%D8%A7%D9%84%D8%AC%D8%B1%D8%A7%D8%AD%D9%87.JPG',
        inTicket: false,
      ),
    ],
    numberOfLikes: 1900,
    price: TicketPriceModel(
      egyptionStudent: 10,
      egyption: 20,
      arab: 30,
      foreign: 50,
    ),
  ),
  TempleModel(
    id: '',
    name: 'معبد دندرة',
    description: '''
يُعد معبد دندرة من أعظم المعابد المصرية القديمة، ويقع في محافظة قنا بصعيد مصر. تم بناء المعبد خلال العصر البطلمي واستُكمل في العصر الروماني، مما يجعله شاهدًا على تعاقب الحضارات المصرية المختلفة. كُرس المعبد لعبادة الإلهة حتحور، التي كانت تُعتبر إلهة الحب والجمال والموسيقى في مصر القديمة. يتميز هذا المعبد بتصميمه الفريد الذي يجمع بين العمارة المصرية القديمة والتأثيرات الهلنستية التي ظهرت خلال الفترة البطلمية.

يحتوي المعبد على العديد من النقوش والألوان الزاهية التي لا تزال تحتفظ ببهائها حتى اليوم. تصور هذه النقوش طقوس العبادة، الاحتفالات الدينية، وحياة المصريين القدماء اليومية. السقف المزخرف يُظهر رسومًا فلكية تعكس فهم المصريين للكون والنجوم. ومن أبرز هذه الرسومات الزودياك أو دائرة الأبراج التي تُعد إحدى أعظم التحف الفنية في المعبد.

يضم معبد دندرة العديد من الغرف، منها قدس الأقداس الذي كان يُعتبر النقطة المحورية للعبادة، إلى جانب الغرف الجانبية المخصصة للطقوس المختلفة. ومن المعالم البارزة أيضًا حجرة الولادة الإلهية التي كانت مخصصة للاحتفال بالميلاد الإلهي، حيث تحتوي على نقوش تفصيلية عن ولادة الإله حورس.

معبد دندرة ليس مجرد معبد ديني، بل هو تحفة فنية تجمع بين الرمزية الدينية والجمال المعماري. يمثل المعبد شهادة على براعة المصريين القدماء في الهندسة والنحت، بالإضافة إلى فهمهم العميق للعقيدة والدين. يزور المعبد اليوم العديد من السياح والباحثين الذين يسعون لفهم المزيد عن هذه الحضارة العريقة.
''',
    location: 'دندرة، قنا، مصر',
    openTime: '08:00 AM',
    closeTime: '05:00 PM',
    imagePath:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Dendera_Tempel_33.jpg/640px-Dendera_Tempel_33.jpg',
    landmarks: [
      LandMarkModel(
        name: 'قدس الأقداس',
        description: '''
قدس الأقداس في معبد دندرة هو أبرز المعالم المقدسة في المعبد، ويقع في مركزه ليكون محور العبادة الرئيسية للإلهة حتحور. يُعتبر هذا المكان موطنًا للطقوس الدينية التي كانت تُقام لإرضاء الإلهة، حيث كان الكهنة يقدمون القرابين والصلوات. تتميز جدران قدس الأقداس بنقوش مذهلة تصور مشاهد من الطقوس الدينية ومظاهر تكريم الإلهة حتحور.

تشمل النقوش تصويرًا للإلهة وهي تستقبل القرابين من الكهنة، إلى جانب مشاهد تصور الملك البطلمي وهو يقدم الهدايا للإلهة. النقوش الموجودة داخل قدس الأقداس تتميز بدقة التفاصيل والألوان الزاهية التي تضفي جمالًا وروحانية على المكان. قدس الأقداس ليس مجرد مكان للعبادة، بل يمثل مركزًا للروحانية والتواصل بين البشر والآلهة في مصر القديمة.

تم تصميم قدس الأقداس ليعكس القداسة والتكريم، حيث كانت هذه الغرفة تعد بمثابة القلب النابض للمعبد. يجذب هذا المكان العديد من الزوار اليوم الذين يأتون لاكتشاف جمال الفن المصري القديم وروعة المعتقدات الدينية.
''',
        iamge:
            'https://gate.ahram.org.eg/Media/News/2024/6/23/2024-638547810687418323-741.jpg',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'سقف المعبد',
        description: '''
يُعد سقف معبد دندرة من أبرز عناصره الفنية والمعمارية، حيث يحتوي على رسومات ونقوش فلكية تمثل الأبراج السماوية والسماء الليلية كما رآها المصريون القدماء. يشتهر السقف بنقش دائرة الأبراج (الزودياك)، وهي خريطة فلكية تصور الكواكب والنجوم وأبراج السماء بطريقة مذهلة تعكس الفهم العميق للكون في تلك الحقبة.

تصور النقوش أيضًا حتحور، إلى جانب آلهة أخرى مثل رع وأوزوريس، الذين كانوا يمثلون مختلف جوانب الكون. السقف مقسم إلى أجزاء، كل جزء يعبر عن موسم أو حدث فلكي معين، مما يعكس اهتمام المصريين القدماء بعلم الفلك. النقوش لم تقتصر فقط على الجمال البصري، بل كانت تُستخدم أيضًا لأغراض دينية وطقوسية، حيث كانت تعبر عن استمرارية الحياة والتواصل مع الآلهة.

زيارة سقف المعبد تمنح الزوار تجربة استثنائية لرؤية الفن المصري القديم وكيف دمج المصريون بين الدين والعلم والفن في تصاميمهم.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/26903-_Dendera_ceiling_reliefs%2C_freshly_cleaned.jpg/640px-26903-_Dendera_ceiling_reliefs%2C_freshly_cleaned.jpg',
        inTicket: false,
      ),
      LandMarkModel(
        name: 'حجرة الولادة الإلهية',
        description: '''
حجرة الولادة الإلهية في معبد دندرة هي مكان ذو طابع ديني فريد، حيث تم تخصيصها للاحتفال بالميلاد الإلهي الذي كان جزءًا من الطقوس الدينية الخاصة بالإلهة حتحور. تحتوي الحجرة على نقوش رائعة تصور ولادة الإله حورس، وهي تعبر عن فكرة الولادة الإلهية التي كانت تمثل مصدر الحياة والقوة في العقيدة المصرية القديمة.

تتميز جدران الحجرة بتفاصيل فنية دقيقة تصور الإلهة حتحور وهي تحتضن الطفل الإله حورس، إلى جانب مشاهد تصور الكهنة وهم يحتفلون بالمناسبة. النقوش والألوان داخل الحجرة تعكس الجوانب الرمزية للخصوبة والحياة الجديدة. كانت هذه الغرفة تُستخدم خلال طقوس سنوية للاحتفال بالميلاد الإلهي، مما يجعلها جزءًا هامًا من الروحانية المصرية القديمة.

تعتبر حجرة الولادة الإلهية اليوم مصدر إلهام للزوار الذين يرغبون في استكشاف جمال ورمزية الفن المصري القديم وكيف كانت المعتقدات الدينية تعكس قيمًا فلسفية وروحانية عميقة.
''',
        iamge:
            'https://m.gomhuriaonline.com/Upload/News/4-2-2019_11_58_55_GomhuriaOnline_1549274335.jpg',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'واجهة المعبد',
        description: '''
واجهة معبد دندرة هي واحدة من أروع عناصر العمارة المصرية القديمة، وتعد رمزًا لعظمة الهندسة المعمارية البطلمية. تحتوي الواجهة على نقوش بارزة تصور الإلهة حتحور وعددًا من الملوك الذين كانوا يقدمون الولاء للإلهة. هذه النقوش تعبر عن العلاقة الوثيقة بين الآلهة والحكام الذين كانوا يُعتبرون ممثلين للآلهة على الأرض.

النقوش على الواجهة تبرز تفوق الفن المصري القديم في التفاصيل، حيث يمكن رؤية مشاهد تصور حتحور وهي تُقدم البركات للملك، بالإضافة إلى تصوير مظاهر من الطقوس الدينية. تم تصميم الواجهة لتكون مرئية من مسافة بعيدة، مما يجعلها بمثابة دعوة لزوار المعبد للدخول واكتشاف جماله وروحانيته.

واجهة المعبد تعكس الروح الدينية والفنية التي سادت في مصر القديمة، وهي اليوم تعتبر واحدة من أبرز المعالم التي تجذب الزوار من جميع أنحاء العالم.
''',
        iamge:
            'https://gate.ahram.org.eg/Media/News/2024/9/27/19_2024-638630244386277689-627.jpg',
        inTicket: false,
      ),
    ],
    numberOfLikes: 1800,
    price: TicketPriceModel(
      egyptionStudent: 10,
      egyption: 25,
      arab: 35,
      foreign: 55,
    ),
  ),
  TempleModel(
    id: '',
    name: 'معبد فيلة',
    description: '''
معبد فيلة يُعد أحد أعظم معابد مصر القديمة وأبرز معالمها التاريخية. بُني خلال العصر البطلمي وكان مكرسًا للإلهة إيزيس، التي لعبت دورًا مركزيًا في الديانة المصرية القديمة. يقع المعبد الآن على جزيرة أجيليكا بأسوان بعد نقله بالكامل من موقعه الأصلي بسبب بناء السد العالي. يعتبر المعبد من أجمل أمثلة العمارة البطلمية في مصر، ويعكس اهتمام المصريين القدماء بالتصميم الفني والديني.

يتميز المعبد بتصميمه الفريد الذي يتألف من سلسلة من الأروقة المزخرفة، القاعات المقدسة، والمعابد الفرعية. الجدران مليئة بالنقوش التي تصور قصصًا أسطورية مثل قصة إيزيس وأوزوريس، بالإضافة إلى مشاهد من الطقوس الدينية. يظهر المعبد براعة الفنانين القدماء في نحت التفاصيل الدقيقة باستخدام أدوات بسيطة.

النقل الذي أُجري في الستينيات كان عملية هندسية بارعة أنقذت المعبد من الغرق. تم تفكيكه بدقة وإعادة بنائه على جزيرة أجيليكا، مع الحفاظ على كل قطعة منه بدقة شديدة. يعكس المعبد مزيجًا من التأثيرات الثقافية، بما في ذلك العمارة البطلمية والرومانية.

معبد فيلة اليوم يُعتبر مقصدًا سياحيًا هامًا، حيث يستقطب آلاف الزوار سنويًا. يقدم المعبد تجربة غنية تُظهر جمال الفن المصري القديم وتاريخه الغني، وهو شاهد حي على عظمة الحضارة المصرية التي امتدت لآلاف السنين.
''',
    location: 'جزيرة أجيليكا، أسوان، مصر',
    openTime: '07:00 AM',
    closeTime: '05:00 PM',
    imagePath:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/%D9%85%D8%B9%D8%A8%D8%AF_%D9%81%D9%8A%D9%84%D8%A9_5.jpg/640px-%D9%85%D8%B9%D8%A8%D8%AF_%D9%81%D9%8A%D9%84%D8%A9_5.jpg',
    landmarks: [
      LandMarkModel(
        name: 'بوابة بطليموس الثاني',
        description: '''
بوابة بطليموس الثاني هي المدخل الرئيسي لمعبد فيلة، وتُعد واحدة من أجمل معالمه. تتميز البوابة بزخارفها التي تصور مشاهد من العبادة للإلهة إيزيس. تُظهر النقوش الملك بطليموس الثاني وهو يقدم القرابين لإيزيس، مما يعكس دوره كحامي الدين. النقوش مليئة بالتفاصيل الدقيقة التي تعبر عن التفاني في الفن المصري القديم.

الزخارف أيضًا تضم تمثيلات للإله حورس، مما يعكس العلاقة الوثيقة بين الآلهة في الديانة المصرية. البوابة مزينة بنصوص هيروغليفية تدعو إلى البركة والحماية. كانت هذه البوابة بمثابة رمز للتواصل بين العالم الأرضي والعالم الروحي، حيث يدخل الزائر إلى المعبد ليكون في حضور الآلهة.

اليوم، تعتبر البوابة نقطة جذب للزوار الذين يستمتعون بالتقاط الصور والتأمل في جمال النحت ودلالاته الرمزية.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/The_Temple_of_Isis_from_Philae%2C_Lake_Nasser%2C_Egypt.jpg/640px-The_Temple_of_Isis_from_Philae%2C_Lake_Nasser%2C_Egypt.jpg',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'قاعة الأعمدة',
        description: '''
قاعة الأعمدة في معبد فيلة تُعد واحدة من أبرز معالمه وأكثرها إثارة للإعجاب. تحتوي القاعة على صفوف من الأعمدة المزينة بنقوش دقيقة تصور مشاهد من الطقوس الدينية. الأعمدة مزينة بتيجان زخرفية تعكس جمال الفن المصري القديم، حيث تتخذ أشكال زهرة البردي وزهرة اللوتس.

النقوش الموجودة على الأعمدة والجدران تُظهر مشاهد لتقديم القرابين والصلاة، مما يعكس الدور المركزي الذي لعبه المعبد في الحياة الدينية للمصريين القدماء. القاعة كانت تُستخدم كمكان للتجمعات الدينية والاحتفالات الخاصة، مما يجعلها جزءًا هامًا من الحياة الروحية في معبد فيلة.

السقف المزخرف يحتوي على نقوش تعكس مظاهر الكون كما رآها المصريون القدماء، مع تصوير للآلهة والنجوم. زيارة القاعة تقدم تجربة فريدة للتعرف على العمارة المصرية القديمة وعظمتها.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/%D9%85%D8%B9%D8%A8%D8%AF_%D9%88%D8%AC%D8%B2%D9%8A%D8%B1%D8%A9_%D9%81%D9%8A%D9%84%D8%A9.jpg/640px-%D9%85%D8%B9%D8%A8%D8%AF_%D9%88%D8%AC%D8%B2%D9%8A%D8%B1%D8%A9_%D9%81%D9%8A%D9%84%D8%A9.jpg',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'حجرة إيزيس',
        description: '''
حجرة إيزيس هي القلب الروحي لمعبد فيلة، حيث كانت تُستخدم للعبادة وتقديم القرابين للإلهة إيزيس. تحتوي الحجرة على مذبح مخصص، حيث كان الكهنة يضعون القرابين ويؤدون الطقوس الدينية. الجدران مزينة بنقوش رائعة تصور مشاهد للآلهة والملوك وهم يقدمون الهدايا ويطلبون البركات.

تُظهر النقوش مشاهد من أسطورة إيزيس وأوزوريس، بما في ذلك ولادة الإله حورس، مما يعكس أهمية هذه الأسطورة في الديانة المصرية القديمة. الحجرة كانت تُعتبر مكانًا مقدسًا للتواصل مع الآلهة، حيث كان يُعتقد أن الإلهة إيزيس تسكن في هذا المكان.

اليوم، تُعد الحجرة مقصدًا هامًا للزوار الذين يرغبون في اكتشاف جمال الفن المصري القديم وفهم الجوانب الروحية للحياة المصرية.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/%D8%A3%D8%AD%D8%AF_%D8%AC%D8%AF%D8%B1%D8%A7%D9%86_%D9%85%D8%B9%D8%A8%D8%AF_%D9%81%D9%8A%D9%84%D8%A9.jpg/640px-%D8%A3%D8%AD%D8%AF_%D8%AC%D8%AF%D8%B1%D8%A7%D9%86_%D9%85%D8%B9%D8%A8%D8%AF_%D9%81%D9%8A%D9%84%D8%A9.jpg',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'الكشك الروماني',
        description: '''
الكشك الروماني هو بناء صغير يقع بجوار معبد فيلة، ويعكس تأثير العمارة الرومانية على الفن المصري القديم. يتألف الكشك من أعمدة مزخرفة تدعم سقفًا مفتوحًا، ويُعتقد أنه كان يُستخدم كمكان للعبادة أو الاستراحة.

النقوش الموجودة على الأعمدة تعكس التقاليد الرومانية، مع تأثيرات مصرية تظهر في تصميم الزخارف. هذا المزيج الثقافي يعكس التفاعل الحضاري الذي حدث خلال الفترة الرومانية في مصر. الكشك يبرز التغيرات التي طرأت على العمارة المصرية نتيجة للتأثيرات الأجنبية.

اليوم، يُعتبر الكشك رمزًا للتكامل الثقافي، ويجذب الزوار الذين يرغبون في رؤية جانب مختلف من تاريخ مصر القديمة.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/%D8%A7%D8%AD%D8%AF_%D8%A3%D8%AC%D8%B2%D8%A7%D8%A1_%D9%85%D8%B9%D8%A8%D8%AF_%D9%81%D9%8A%D9%84%D8%A9._%D8%A3%D8%B3%D9%88%D8%A7%D9%86.jpg/640px-%D8%A7%D8%AD%D8%AF_%D8%A3%D8%AC%D8%B2%D8%A7%D8%A1_%D9%85%D8%B9%D8%A8%D8%AF_%D9%81%D9%8A%D9%84%D8%A9._%D8%A3%D8%B3%D9%88%D8%A7%D9%86.jpg',
        inTicket: false,
      ),
    ],
    numberOfLikes: 2100,
    price: TicketPriceModel(
      egyptionStudent: 10,
      egyption: 25,
      arab: 35,
      foreign: 60,
    ),
  ),
  TempleModel(
    id: '',
    name: 'معبد هابو',
    description: '''
معبد هابو، المعروف أيضًا بمعبد مدينة هابو، هو أحد أعظم المعابد الجنائزية في مصر القديمة ويُعتبر رمزًا هامًا للعمارة في عصر الدولة الحديثة. بُني المعبد خلال حكم الملك رمسيس الثالث في القرن الثاني عشر قبل الميلاد، ويُكرس لعبادة الإله آمون، بالإضافة إلى تكريم إنجازات الملك.

يمتاز المعبد بمساحته الواسعة وتصميمه الفريد الذي يضم أروقة وأفنية وصروحًا ضخمة. يُعتبر المعبد بمثابة سجل مصور لتاريخ الملك رمسيس الثالث، حيث تحتوي جدرانه على نقوش توثق انتصاراته العسكرية على شعوب البحر وهجماته على قبائل ليبية. النقوش تزخر بالتفاصيل، وتُظهر الأسلحة، الأعداء، والمشاهد الاحتفالية التي تبرز عظمة الملك وقوته.

إلى جانب النقوش العسكرية، يعكس المعبد الحياة الدينية في مصر القديمة من خلال مشاهد الطقوس اليومية والقرابين المقدمة للإله آمون والآلهة الأخرى. كما يضم المعبد نقوشًا تبرز الفن المعماري المبتكر في ذلك الوقت، مثل تفاصيل التيجان والأعمدة المزخرفة.

الموقع يعكس التفاني في بناء المعابد، حيث تمتد الأجزاء المختلفة منه لتشمل العديد من الأفنية والغرف المزخرفة. زيارة المعبد تقدم تجربة فريدة لفهم التاريخ المصري القديم وجوانبه العسكرية والدينية.
''',
    location: 'البر الغربي، الأقصر، مصر',
    openTime: '06:00 AM',
    closeTime: '06:00 PM',
    imagePath:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/%D9%88%D8%A7%D8%AC%D9%87%D8%A9_%D9%85%D8%B9%D8%A8%D8%AF_%D8%B1%D9%85%D8%B3%D9%8A%D8%B3_%D8%A7%D9%84%D8%AB%D8%A7%D9%84%D8%AB_%D8%A7%D9%88_%D9%85%D8%B9%D8%A8%D8%AF_%D9%87%D8%A7%D8%A8%D9%88_%D8%A8%D9%85%D8%AF%D9%8A%D9%86%D8%A9_%D8%A7%D9%84%D8%A7%D9%82%D8%B5%D8%B1.jpg/640px-%D9%88%D8%A7%D8%AC%D9%87%D8%A9_%D9%85%D8%B9%D8%A8%D8%AF_%D8%B1%D9%85%D8%B3%D9%8A%D8%B3_%D8%A7%D9%84%D8%AB%D8%A7%D9%84%D8%AB_%D8%A7%D9%88_%D9%85%D8%B9%D8%A8%D8%AF_%D9%87%D8%A7%D8%A8%D9%88_%D8%A8%D9%85%D8%AF%D9%8A%D9%86%D8%A9_%D8%A7%D9%84%D8%A7%D9%82%D8%B5%D8%B1.jpg ',
    landmarks: [
      LandMarkModel(
        name: 'الفناء الأول',
        description: '''
الفناء الأول في معبد هابو يُعتبر نقطة الدخول الرئيسية وأحد أكثر المواقع إثارة للإعجاب. يتميز الفناء بمساحته الشاسعة، حيث تحيط به جدران مزينة بنقوش مفصلة تسجل الانتصارات العسكرية للملك رمسيس الثالث على شعوب البحر.

النقوش تصور الملك في مشاهد معقدة، حيث يظهر في وضعيات قتالية، ويستعرض قوته وهو يقدم الأعداء المأسورين للإله آمون. بالإضافة إلى المشاهد العسكرية، يحتوي الفناء على نقوش تصور الحياة اليومية والطقوس الدينية. الأعمدة المحيطة بالفناء مزينة بزخارف معقدة تشمل نصوصًا هيروغليفية وأشكالًا رمزية.

كان هذا الفناء يُستخدم أيضًا كمكان للاحتفالات الرسمية واستقبال الزوار الملكيين، مما يجعله جزءًا هامًا من الحياة الاجتماعية والدينية في المعبد.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Thebes%2C_Medinet_Habu%2C_Egypt%2C_Temple_of_Ramesses_III%2C_First_Pylon_2.jpg/640px-Thebes%2C_Medinet_Habu%2C_Egypt%2C_Temple_of_Ramesses_III%2C_First_Pylon_2.jpg',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'التمثالان الضخمان',
        description: '''
التمثالان الضخمان في معبد هابو هما من أبرز المعالم التي تعكس عظمة الملك رمسيس الثالث. التمثالان يقعان داخل المعبد، وهما مصنوعان من الجرانيت الأحمر، وهو مادة معروفة بقوتها وجمالها، مما يبرز فخامة التصميم ودقة التنفيذ.

يظهر التمثالان الملك جالسًا على عرشه بحجم يفوق الواقع، ويمثلان رموزًا لقوة الملك وهيبته. النقوش المحفورة على التماثيل توثق أسماء الملك وألقابه، إلى جانب مشاهد رمزية تُظهر الملك وهو يتلقى البركة من الآلهة. 

التفاصيل الدقيقة في التماثيل، مثل التيجان الملكية والزخارف التي تغطي العرش، تعكس البراعة الفنية والهندسية التي ميزت المصريين القدماء. كان التمثالان يُعتبران رمزًا للحماية، حيث يُعتقد أنهما يحرسان قدسية المعبد.

وجود التماثيل داخل المعبد يضيف إلى قيمته الروحية، ويُظهر مكانة رمسيس الثالث كملك مقدس مرتبط بالآلهة المصرية.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Statues_at_the_mortuary_temple_of_Ramesses_III.jpg/640px-Statues_at_the_mortuary_temple_of_Ramesses_III.jpg',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'قدس الأقداس',
        description: '''
قدس الأقداس في معبد هابو هو القلب الروحي للمعبد والمكان الأكثر قداسة. كان يُستخدم لتقديم القرابين للإله آمون باعتباره الإله الرئيسي في الديانة المصرية القديمة. الموقع يتميز بهدوئه وزخارفه الدقيقة التي تضفي جوًا من الروحانية.

النقوش الموجودة على جدران قدس الأقداس تصور مشاهد للملك رمسيس الثالث وهو يقدم القرابين للإله آمون، بالإضافة إلى تصوير آلهة أخرى مشاركة في الطقوس. النقوش مليئة بالتفاصيل الرمزية التي تعكس الفهم العميق للمصريين القدماء للطقوس الدينية.

كان قدس الأقداس يُعتبر مكانًا لا يُسمح بدخوله إلا للكهنة والملك، مما يعكس طابعه الحصري. اليوم، يتيح هذا الموقع للزوار فرصة فريدة لاستكشاف جانب مهم من الحياة الروحية في مصر القديمة.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Hypostyle_hall_at_the_mortuary_temple_of_Ramesses_III.jpg/640px-Hypostyle_hall_at_the_mortuary_temple_of_Ramesses_III.jpg',
        inTicket: false,
      ),
    ],
    numberOfLikes: 1700,
    price: TicketPriceModel(
      egyptionStudent: 10,
      egyption: 25,
      arab: 35,
      foreign: 50,
    ),
  ),
  TempleModel(
    id: '',
    name: 'وادي الملوك',
    description: '''
وادي الملوك هو موقع أثري شهير يقع على الضفة الغربية لنهر النيل، مقابل مدينة الأقصر في مصر. يُعتبر الوادي مقبرة ملكية استخدمها الفراعنة في عصر الدولة الحديثة لدفن ملوكهم ونبلائهم. يحتوي الوادي على أكثر من 60 مقبرة منحوتة في الصخور، تشمل أشهر الملوك مثل توت عنخ آمون، ورمسيس الثاني، وسيتي الأول.

تصميم المقابر داخل الوادي يعكس الطقوس الدينية والمعتقدات المرتبطة بالحياة الآخرة. النقوش والرسومات الموجودة على جدران المقابر تُصور مشاهد من "كتاب الموتى" وأساطير دينية أخرى تُوضح رحلة الملك إلى العالم الآخر.

الوادي يُعد مثالًا على الإبداع الهندسي والفني للمصريين القدماء، وهو موقع جذب سياحي شهير يُتيح للزوار فرصة استكشاف التاريخ المصري القديم وتجربة الفخامة الملكية.
''',
    location: 'البر الغربي، الأقصر، مصر',
    openTime: '06:00 AM',
    closeTime: '06:00 PM',
    imagePath:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/La_val%C3%A9e_des_rois_%D9%88%D8%A7%D8%AF%D9%89_%D8%A7%D9%84%D9%85%D9%84%D9%88%D9%83_-_panoramio.jpg/640px-La_val%C3%A9e_des_rois_%D9%88%D8%A7%D8%AF%D9%89_%D8%A7%D9%84%D9%85%D9%84%D9%88%D9%83_-_panoramio.jpg',
    landmarks: [
      LandMarkModel(
        name: 'مقبرة توت عنخ آمون ',
        description: '''
مقبرة توت عنخ آمون هي الأشهر في وادي الملوك، حيث اكتشفها عالم الآثار هوارد كارتر في عام 1922. تحتوي المقبرة على مجموعة رائعة من القطع الأثرية، بما في ذلك القناع الذهبي الشهير للملك.

النقوش على جدران المقبرة تُصور مشاهد من حياة الملك، بالإضافة إلى طقوس دينية تُساعده في رحلته إلى العالم الآخر. المقبرة تُبرز ثراء العصر الذي عاش فيه الملك وتُعد واحدة من أهم الاكتشافات الأثرية في القرن العشرين.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/KV11_Tomb_of_Ramses_III_DSCF2941.jpg/640px-KV11_Tomb_of_Ramses_III_DSCF2941.jpg',
        inTicket: false,
      ),
      LandMarkModel(
        name: 'مقبرة رمسيس السادس',
        description: '''
مقبرة رمسيس السادس تُعتبر واحدة من أكبر المقابر في وادي الملوك. تتميز برسوماتها ونقوشها المذهلة التي تُصور مشاهد من "كتاب البوابات" و"كتاب الكهوف"، وهي نصوص جنائزية تهدف إلى توجيه الملك في الحياة الآخرة.

النقوش تُبرز تفاصيل مذهلة عن المعتقدات الدينية المصرية، مع تصوير للآلهة والمشاهد الأسطورية. الغرف الداخلية تمتد بشكل معقد، مما يعكس الإبداع الهندسي في تصميم المقابر الملكية.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/TOMB_OF_RAMSES_IX_%28KV_6%29_Vally_ofthe_kings.jpg/640px-TOMB_OF_RAMSES_IX_%28KV_6%29_Vally_ofthe_kings.jpg',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'مقبرة سيتي الأول ',
        description: '''
مقبرة سيتي الأول تُعتبر من أكبر وأفخم المقابر في وادي الملوك. النقوش على جدرانها هي من بين الأجمل والأكثر تفصيلًا، حيث تُصور نصوصًا دينية مثل "كتاب الآخرة" و"كتاب البوابات".

المقبرة تضم ممرات واسعة وغرفًا متعددة مزينة بزخارف دقيقة تعكس الفخامة الملكية. تُعد هذه المقبرة دليلًا على مهارة الفنانين المصريين القدماء في استخدام الألوان والنقوش لخلق مشاهد فنية فريدة.
''',
        iamge:
            'https://egymonuments.gov.eg/media/5157/whatsapp-image-2019-10-28-at-1005.jpg',
        inTicket: true,
      ),
      LandMarkModel(
        name: 'مقبرة رمسيس الثالث ',
        description: '''
مقبرة رمسيس الثالث، المعروفة أيضًا باسم "مقبرة الحور"، تُعتبر من أجمل المقابر في وادي الملوك. تتميز المقبرة بممراتها المزخرفة برسومات دقيقة ونقوش تُصور مشاهد دينية ونصوص جنائزية مثل "كتاب الأرض" و"كتاب الكهوف".

النقوش تُبرز حياة الملك وعلاقته بالآلهة، مع تصوير لمعاركه وانتصاراته. تصميم المقبرة يضم غرفًا متعددة تُظهر تطور العمارة الجنائزية في عصر الدولة الحديثة، مما يجعلها واحدة من أكثر المقابر إثارة للإعجاب.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/90/Tumba_de_Rams%C3%A9s_III%2C_Valle_de_las_Reyes%2C_Luxor%2C_Egipto%2C_2022-04-03%2C_DD_39.jpg/640px-Tumba_de_Rams%C3%A9s_III%2C_Valle_de_las_Reyes%2C_Luxor%2C_Egipto%2C_2022-04-03%2C_DD_39.jpg',
        inTicket: true,
      ),
    ],
    numberOfLikes: 2500,
    price: TicketPriceModel(
      egyptionStudent: 20,
      egyption: 40,
      arab: 60,
      foreign: 80,
    ),
  ),
  TempleModel(
    id: '',
    name: 'وادي الملكات',
    description: '''
وادي الملكات هو موقع أثري يقع على الضفة الغربية لنهر النيل بالقرب من الأقصر. كان يُستخدم كمقبرة للملكات الملكيات والأميرات وأفراد العائلة المالكة في عصر الدولة الحديثة. يحتوي الوادي على أكثر من 90 مقبرة، تتراوح بين البسيطة والفخمة، وتُعد مقبرة الملكة نفرتاري أشهرها.

المقابر في وادي الملكات مُزينة بنقوش ورسومات ملونة تُصور مشاهد من الحياة اليومية والطقوس الدينية والأساطير المرتبطة بالحياة الآخرة. يُعتبر الوادي شاهدًا على الرقي الفني والديني للحضارة المصرية القديمة.
''',
    location: 'البر الغربي، الأقصر، مصر',
    openTime: '06:00 AM',
    closeTime: '06:00 PM',
    imagePath:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Valley_of_the_Queens_2022_07.jpg/640px-Valley_of_the_Queens_2022_07.jpg',
    landmarks: [
      LandMarkModel(
        name: 'مقبرة نفرتاري (QV66)',
        description: '''
مقبرة الملكة نفرتاري، زوجة الملك رمسيس الثاني، هي الأكثر شهرة في وادي الملكات. تُعتبر المقبرة أعجوبة فنية بسبب رسوماتها الجدارية المبهرة التي تُصور الملكة مع الآلهة في مشاهد دينية وأساطير الحياة الآخرة.

النقوش والرسومات تتميز بألوانها الزاهية والتفاصيل الدقيقة، وهي واحدة من أفضل الأمثلة على الفن الجنائزي في مصر القديمة. يُسمح بدخول المقبرة لعدد محدود من الزوار للحفاظ على النقوش.
''',
        iamge:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Osiris%2C_Khepri_and_Nefertari_in_her_tomb.jpg/640px-Osiris%2C_Khepri_and_Nefertari_in_her_tomb.jpg',
        inTicket: true,
      ),
    ],
    numberOfLikes: 1800,
    price: TicketPriceModel(
      egyptionStudent: 15,
      egyption: 30,
      arab: 50,
      foreign: 70,
    ),
  ),

  // أكمل بقية المعابد...
];


/**
 * 
  الكرنك الاقصر ابو سمبل حتشبسوت ادفو كوم امبو دندرة فيلة هابو
 * 
 */