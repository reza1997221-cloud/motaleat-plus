
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()=>runApp(const App());
class App extends StatelessWidget{
 const App({super.key});
 @override Widget build(BuildContext context)=>MaterialApp(
  debugShowCheckedModeBanner:false,title:'مطالعات‌پلاس | پایه هشتم',
  theme:ThemeData(useMaterial3:true,colorScheme:ColorScheme.fromSeed(seedColor:const Color(0xFF1769AA)),scaffoldBackgroundColor:const Color(0xFFF4F8FC)),
  home:const Home());
}
class Home extends StatefulWidget{const Home({super.key});@override State<Home> createState()=>_HomeState();}
class _HomeState extends State<Home>{
 Set<int> done={};
 @override void initState(){super.initState();load();}
 Future<void> load()async{final p=await SharedPreferences.getInstance();setState(()=>done=(p.getStringList('done')??[]).map(int.parse).toSet());}
 Future<void> mark(int id)async{final p=await SharedPreferences.getInstance();setState(()=>done.add(id));await p.setStringList('done',done.map((e)=>'$e').toList());}
 Widget lessonTile(int id,String title)=>Card(elevation:0,color:Colors.white,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(16)),child:ListTile(
 leading:CircleAvatar(backgroundColor:const Color(0xFFE5F1FC),child:Text('$id',style:const TextStyle(color:Color(0xFF1769AA)))),
 title:Text(title,style:const TextStyle(fontWeight:FontWeight.bold)),
 subtitle:Text(done.contains(id)?'مطالعه شده':'آموزش • خلاصه • نمونه سؤال • آزمون'),
 trailing:Icon(done.contains(id)?Icons.check_circle:Icons.arrow_back_ios_new,color:const Color(0xFF1769AA)),
 onTap:()=>Navigator.push(context,MaterialPageRoute(builder:(_)=>Lesson(id:id,onDone:()=>mark(id))))));
 @override Widget build(BuildContext context)=>Directionality(textDirection:TextDirection.rtl,child:Scaffold(
 appBar:AppBar(title:const Text('مطالعات‌پلاس',style:TextStyle(fontWeight:FontWeight.bold)),centerTitle:true,backgroundColor:Colors.white),
 body:ListView(padding:const EdgeInsets.all(18),children:[
 Container(padding:const EdgeInsets.all(20),decoration:BoxDecoration(gradient:const LinearGradient(colors:[Color(0xFF1769AA),Color(0xFF42A5F5)]),borderRadius:BorderRadius.circular(22)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
 const Text('یادگیری مطالعات اجتماعی، ساده‌تر از همیشه',style:TextStyle(color:Colors.white,fontSize:18,fontWeight:FontWeight.bold)),
 const SizedBox(height:8),const Text('پایه هشتم • آموزش، خلاصه و آزمون',style:TextStyle(color:Colors.white70)),
 const SizedBox(height:16),ClipRRect(borderRadius:BorderRadius.circular(20),child:LinearProgressIndicator(value:done.length/24,minHeight:8,backgroundColor:Colors.white30,color:Colors.white)),
 const SizedBox(height:7),Text('${done.length} درس از ۲۴ درس مطالعه شده',style:const TextStyle(color:Colors.white))])),
 const SizedBox(height:22),const Text('فصل اول | تعاون',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
 for(int i=1;i<=2;i++) lessonTile(i,i==1?'تعاون (۱)':'تعاون (۲)'),
 const SizedBox(height:12),const Text('فصل دوم | نقش دولت در اداره کشور',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
 lessonTile(3,'ساختار و تشکیلات دولت'),
 lessonTile(4,'وظایف دولت'),
 const SizedBox(height:12),const Text('فصل سوم | نوجوانان و قانون',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
 lessonTile(5,'آسیب‌های اجتماعی و پیشگیری از آنها'),
 lessonTile(6,'قوه قضائیه'),
 const SizedBox(height:12),const Text('فصل چهارم | عصر ارتباطات',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
 lessonTile(7,'ارتباط و رسانه'),
 lessonTile(8,'رسانه‌ها در زندگی ما'),
 const SizedBox(height:12),const Text('فصل پنجم | از حرا تا نینوا',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
 lessonTile(9,'ظهور اسلام در شبه‌جزیرۀ عربستان'),
 lessonTile(10,'از رحلت پیامبر تا قیام کربلا (نینوا)'),
 const SizedBox(height:12),const Text('فصل ششم | عصری تازه در تاریخ ایران',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
 lessonTile(11,'ورود اسلام به ایران'),
 lessonTile(12,'عصر طلایی فرهنگ و تمدن ایرانی ـ اسلامی'),
 const SizedBox(height:12),const Text('فصل هفتم | از غزنویان تا هجوم چنگیزخان',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
 lessonTile(13,'غزنویان، سلجوقیان و خوارزمشاهیان'),
 lessonTile(14,'میراث فرهنگی ایران در عصر سلجوقی'),
 const SizedBox(height:12),const Text('فصل هشتم | عصر مغول و تیموری',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
 lessonTile(15,'حملۀ چنگیز و تیمور به ایران'),
 lessonTile(16,'پیروزی فرهنگ بر شمشیر'),
 const SizedBox(height:12),const Text('فصل نهم | آسیا، پهناورترین قاره',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
 lessonTile(17,'ویژگی‌های طبیعی آسیا'),
 lessonTile(18,'ویژگی‌های انسانی و اقتصادی آسیا'),
 const SizedBox(height:12),const Text('فصل دهم | منطقۀ جنوب غربی آسیا و جایگاه ایران در آن',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
 lessonTile(19,'ویژگی‌های منطقۀ جنوب غربی آسیا'),
 lessonTile(20,'ایران و منطقۀ جنوب غربی آسیا'),
 const SizedBox(height:12),const Text('فصل یازدهم | اروپا و افریقا',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
 lessonTile(21,'ویژگی‌های طبیعی و انسانی اروپا'),
 lessonTile(22,'ویژگی‌های طبیعی و انسانی افریقا'),
 const SizedBox(height:12),const Text('فصل دوازدهم | قاره آمریکا و قاره اقیانوسیه',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
 lessonTile(23,'قاره آمریکا'),
 lessonTile(24,'قاره استرالیا و اقیانوسیه')
 ]),
 bottomNavigationBar:NavigationBar(selectedIndex:0,onDestinationSelected:(i){if(i==2)Navigator.push(context,MaterialPageRoute(builder:(_)=>const QuestionBankPage()));if(i==3)Navigator.push(context,MaterialPageRoute(builder:(_)=>ProgressPage(done:done.length)));},destinations:const [
 NavigationDestination(icon:Icon(Icons.home_outlined),label:'خانه'),
 NavigationDestination(icon:Icon(Icons.menu_book_outlined),label:'درس‌ها'),
 NavigationDestination(icon:Icon(Icons.quiz_outlined),label:'آزمون‌ها'),
 NavigationDestination(icon:Icon(Icons.person_outline),label:'پیشرفت')])));}
class Lesson extends StatefulWidget{final int id;final VoidCallback onDone;const Lesson({super.key,required this.id,required this.onDone});@override State<Lesson> createState()=>_LessonState();}
class _LessonState extends State<Lesson>{
 Map<String,dynamic>? d;final Map<int,int> answers={};
 @override void initState(){super.initState();load();}
 Future<void> load()async{final s=await rootBundle.loadString('assets/content/lesson_${widget.id.toString().padLeft(2,'0')}.json');setState(()=>d=jsonDecode(s));}
 @override Widget build(BuildContext context){
 if(d==null)return const Scaffold(body:Center(child:CircularProgressIndicator()));
 return Directionality(textDirection:TextDirection.rtl,child:Scaffold(appBar:AppBar(title:Text('درس ${widget.id}: ${d!['title']}')),
 body:ListView(padding:const EdgeInsets.all(16),children:[
 Text(d!['chapter'],style:const TextStyle(color:Colors.blue,fontWeight:FontWeight.bold)),
 const SizedBox(height:8),Text(d!['intro'],style:const TextStyle(fontSize:17,height:1.9,fontWeight:FontWeight.w600)),
 for(final s in d!['sections']) Card(elevation:0,child:Padding(padding:const EdgeInsets.all(15),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
 Text(s['title'],style:const TextStyle(fontSize:17,fontWeight:FontWeight.bold,color:Color(0xFF1769AA))),
 const SizedBox(height:8),Text(s['body'],style:const TextStyle(fontSize:15,height:1.9))]))),
 const SizedBox(height:12),const Text('خلاصه نکات مهم',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
 for(final x in d!['summary'])ListTile(dense:true,leading:const Icon(Icons.check_circle_outline,color:Colors.green),title:Text(x)),
 const Text('آزمون کوتاه',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
 for(int i=0;i<(d!['quiz'] as List).length;i++) quiz(d!['quiz'][i],i),
 const SizedBox(height:12),FilledButton.icon(onPressed:(){widget.onDone();ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('پیشرفت شما ذخیره شد')));},icon:const Icon(Icons.done),label:const Text('علامت‌گذاری به‌عنوان مطالعه‌شده'))
 ])));}
 Widget quiz(Map q,int i)=>Card(elevation:0,child:Padding(padding:const EdgeInsets.all(14),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
 Text('${i+1}. ${q['q']}',style:const TextStyle(fontWeight:FontWeight.bold)),
 ...(q['options'] as List).asMap().entries.map((e)=>RadioListTile<int>(dense:true,contentPadding:EdgeInsets.zero,value:e.key,groupValue:answers[i],title:Text(e.value),onChanged:(v)=>setState(()=>answers[i]=v!))),
 if(answers.containsKey(i))Text(answers[i]==q['answer']?'پاسخ درست است.':'پاسخ درست را دوباره بررسی کن.',style:TextStyle(color:answers[i]==q['answer']?Colors.green:Colors.red,fontWeight:FontWeight.bold))
 ])));
}


class BankQuestion {
 final int lesson; final String lessonTitle; final String question; final List<String> options; final int answer;
 BankQuestion({required this.lesson,required this.lessonTitle,required this.question,required this.options,required this.answer});
}

class QuestionBankPage extends StatefulWidget { const QuestionBankPage({super.key}); @override State<QuestionBankPage> createState()=>_QuestionBankPageState(); }
class _QuestionBankPageState extends State<QuestionBankPage> {
 List<BankQuestion> bank=[]; bool loading=true; int selectedLesson=0; int questionCount=20; int durationMinutes=45;
 @override void initState(){super.initState();load();}
 Future<void> load() async {
  final result=<BankQuestion>[];
  for(int i=1;i<=24;i++){
   final raw=await rootBundle.loadString('assets/content/lesson_${i.toString().padLeft(2,'0')}.json');
   final d=jsonDecode(raw) as Map<String,dynamic>;
   for(final q in (d['quiz'] as List)){
    result.add(BankQuestion(lesson:i,lessonTitle:d['title'],question:q['q'],options:List<String>.from(q['options']),answer:q['answer']));
   }
  }
  if(mounted)setState((){bank=result;loading=false;});
 }
 @override Widget build(BuildContext context)=>Directionality(textDirection:TextDirection.rtl,child:Scaffold(appBar:AppBar(title:const Text('بانک سؤال و آزمون')),
 body:loading?const Center(child:CircularProgressIndicator()):ListView(padding:const EdgeInsets.all(18),children:[
  Container(padding:const EdgeInsets.all(18),decoration:BoxDecoration(color:const Color(0xFFE5F1FC),borderRadius:BorderRadius.circular(18)),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
   const Text('آزمون مطالعات اجتماعی هشتم',style:TextStyle(fontSize:19,fontWeight:FontWeight.bold,color:Color(0xFF1769AA))),const SizedBox(height:8),
   Text('${bank.length} سؤال چهارگزینه‌ای از ۲۴ درس در بانک سؤال موجود است.'),
  ])),const SizedBox(height:20),const Text('محدوده آزمون',style:TextStyle(fontWeight:FontWeight.bold,fontSize:16)),const SizedBox(height:8),
  DropdownButtonFormField<int>(value:selectedLesson,decoration:const InputDecoration(border:OutlineInputBorder(),labelText:'انتخاب درس'),items:[const DropdownMenuItem(value:0,child:Text('همه درس‌ها')),...List.generate(24,(i)=>DropdownMenuItem(value:i+1,child:Text('درس ${i+1}')))],onChanged:(v)=>setState(()=>selectedLesson=v??0)),
  const SizedBox(height:18),const Text('تعداد سؤال',style:TextStyle(fontWeight:FontWeight.bold,fontSize:16)),const SizedBox(height:8),
  DropdownButtonFormField<int>(value:questionCount,decoration:const InputDecoration(border:OutlineInputBorder()),items:const [DropdownMenuItem(value:10,child:Text('۱۰ سؤال')),DropdownMenuItem(value:20,child:Text('۲۰ سؤال')),DropdownMenuItem(value:999,child:Text('همه سؤال‌ها'))],onChanged:(v)=>setState(()=>questionCount=v??20)),
  const SizedBox(height:18),const Text('مدت آزمون',style:TextStyle(fontWeight:FontWeight.bold,fontSize:16)),const SizedBox(height:8),
  DropdownButtonFormField<int>(value:durationMinutes,decoration:const InputDecoration(border:OutlineInputBorder(),labelText:'زمان پاسخ‌گویی'),items:const [DropdownMenuItem(value:30,child:Text('۳۰ دقیقه')),DropdownMenuItem(value:45,child:Text('۴۵ دقیقه')),DropdownMenuItem(value:60,child:Text('۶۰ دقیقه'))],onChanged:(v)=>setState(()=>durationMinutes=v??45)),
  const SizedBox(height:22),FilledButton.icon(onPressed:bank.isEmpty?null:()=>start(),icon:const Icon(Icons.play_arrow),label:const Text('شروع آزمون استاندارد'),style:FilledButton.styleFrom(minimumSize:const Size.fromHeight(52))),
  const SizedBox(height:12),const Text('سؤال‌ها از آزمون‌های کوتاه موجود در محتوای درس‌ها استخراج شده‌اند.',style:TextStyle(color:Colors.black54,height:1.7))
 ])));
 void start(){
  final pool=bank.where((q)=>selectedLesson==0||q.lesson==selectedLesson).toList()..shuffle();
  if(pool.isEmpty){ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text('برای این درس سؤالی ثبت نشده است.')));return;}
  final chosen=pool.take(questionCount==999?pool.length:questionCount).toList();
  Navigator.push(context,MaterialPageRoute(builder:(_)=>ExamPage(questions:chosen,durationMinutes:durationMinutes)));
 }
}

class ExamPage extends StatefulWidget {
 final List<BankQuestion> questions; final int durationMinutes;
 const ExamPage({super.key,required this.questions,required this.durationMinutes});
 @override State<ExamPage> createState()=>_ExamPageState();
}
class _ExamPageState extends State<ExamPage>{
 final Map<int,int> answers={};
 late int remainingSeconds;
 Timer? timer;
 bool submitted=false;
 @override void initState(){super.initState();remainingSeconds=widget.durationMinutes*60;timer=Timer.periodic(const Duration(seconds:1),(_){if(!mounted||submitted)return;if(remainingSeconds<=1){setState(()=>remainingSeconds=0);submit();}else{setState(()=>remainingSeconds--);}});}
 @override void dispose(){timer?.cancel();super.dispose();}
 String get clock=>'${(remainingSeconds~/60).toString().padLeft(2,'0')}:${(remainingSeconds%60).toString().padLeft(2,'0')}';
 int get correct=>answers.entries.where((e)=>widget.questions[e.key].answer==e.value).length;
 void submit(){if(submitted)return;timer?.cancel();setState(()=>submitted=true);}
 @override Widget build(BuildContext context){final total=widget.questions.length;final unanswered=total-answers.length;final grade=total==0?0:correct*20/total;
 return Directionality(textDirection:TextDirection.rtl,child:Scaffold(appBar:AppBar(title:Text(submitted?'نتیجه آزمون':'آزمون استاندارد'),actions:submitted?null:[Padding(padding:const EdgeInsets.symmetric(horizontal:14),child:Center(child:Text(clock,style:TextStyle(fontSize:18,fontWeight:FontWeight.bold,color:remainingSeconds<300?Colors.red:const Color(0xFF1769AA)))))]),
 body:submitted?ListView(padding:const EdgeInsets.all(18),children:[
  Card(elevation:0,color:const Color(0xFFE5F1FC),child:Padding(padding:const EdgeInsets.all(20),child:Column(children:[const Icon(Icons.emoji_events,size:64,color:Color(0xFF1769AA)),const Text('کارنامه آزمون',style:TextStyle(fontSize:23,fontWeight:FontWeight.bold)),const SizedBox(height:14),Text('${grade.toStringAsFixed(2)} از ۲۰',style:const TextStyle(fontSize:30,fontWeight:FontWeight.bold,color:Color(0xFF1769AA))),const SizedBox(height:8),Text('$correct پاسخ درست از $total سؤال'),Text('$unanswered سؤال بی‌پاسخ'),Text('درصد موفقیت: ${(correct*100/total).round()}٪')]))),
  const SizedBox(height:18),const Text('بررسی پاسخ‌ها',style:TextStyle(fontSize:18,fontWeight:FontWeight.bold)),
  for(int i=0;i<total;i++)...[
   Card(elevation:0,child:Padding(padding:const EdgeInsets.all(14),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text('سؤال ${i+1} • درس ${widget.questions[i].lesson}',style:const TextStyle(color:Color(0xFF1769AA),fontWeight:FontWeight.bold)),const SizedBox(height:6),Text(widget.questions[i].question,style:const TextStyle(fontWeight:FontWeight.bold)),const SizedBox(height:8),Text('پاسخ شما: ${answers.containsKey(i)?widget.questions[i].options[answers[i]!]:"بدون پاسخ"}',style:TextStyle(color:answers.containsKey(i)&&answers[i]==widget.questions[i].answer?Colors.green:Colors.red)),Text('پاسخ صحیح: ${widget.questions[i].options[widget.questions[i].answer]}',style:const TextStyle(color:Colors.green,fontWeight:FontWeight.bold))]))),
  ],const SizedBox(height:12),FilledButton(onPressed:()=>Navigator.pop(context),child:const Text('بازگشت به بانک سؤال'))
 ]):Column(children:[
  Container(width:double.infinity,padding:const EdgeInsets.symmetric(horizontal:16,vertical:10),color:remainingSeconds<300?Colors.red.shade50:const Color(0xFFE5F1FC),child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Text('پاسخ داده‌شده: ${answers.length}/$total'),Text('نمره نهایی از ۲۰',style:TextStyle(color:Colors.blue.shade900,fontWeight:FontWeight.bold))])),
  Expanded(child:ListView.builder(padding:const EdgeInsets.all(14),itemCount:total,itemBuilder:(context,i){final q=widget.questions[i];return Card(elevation:0,margin:const EdgeInsets.only(bottom:12),child:Padding(padding:const EdgeInsets.all(14),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
   Text('سؤال ${i+1}  |  درس ${q.lesson}: ${q.lessonTitle}',style:const TextStyle(color:Color(0xFF1769AA),fontSize:12,fontWeight:FontWeight.bold)),const SizedBox(height:8),Text(q.question,style:const TextStyle(fontSize:16,fontWeight:FontWeight.bold,height:1.6)),
   ...List.generate(q.options.length,(j)=>RadioListTile<int>(dense:true,contentPadding:EdgeInsets.zero,value:j,groupValue:answers[i],title:Text(q.options[j]),onChanged:(v)=>setState(()=>answers[i]=v!)))
 ])));})),
  Padding(padding:const EdgeInsets.all(16),child:FilledButton.icon(onPressed:()=>showDialog(context:context,builder:(ctx)=>AlertDialog(title:const Text('پایان آزمون؟'),content:Text('${answers.length} از $total سؤال پاسخ داده شده است.\nسؤال‌های بی‌پاسخ: $unanswered\nپس از ثبت، امکان تغییر پاسخ‌ها وجود ندارد.'),actions:[TextButton(onPressed:()=>Navigator.pop(ctx),child:const Text('ادامه آزمون')),FilledButton(onPressed:(){Navigator.pop(ctx);submit();},child:const Text('ثبت آزمون'))])),icon:const Icon(Icons.check),label:const Text('پایان آزمون و ثبت نمره'),style:FilledButton.styleFrom(minimumSize:const Size.fromHeight(50))))
 ])));
 }
}

class ProgressPage extends StatelessWidget {final int done;const ProgressPage({super.key,required this.done});@override Widget build(BuildContext context)=>Directionality(textDirection:TextDirection.rtl,child:Scaffold(appBar:AppBar(title:const Text('گزارش پیشرفت')),
 body:Padding(padding:const EdgeInsets.all(22),child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
 const Icon(Icons.insights,size:64,color:Color(0xFF1769AA)),const SizedBox(height:14),const Text('وضعیت مطالعه شما',textAlign:TextAlign.center,style:TextStyle(fontSize:21,fontWeight:FontWeight.bold)),const SizedBox(height:24),Text('$done از ۲۴ درس تکمیل شده',textAlign:TextAlign.center,style:const TextStyle(fontSize:18)),const SizedBox(height:12),ClipRRect(borderRadius:BorderRadius.circular(12),child:LinearProgressIndicator(value:done/24,minHeight:12)),const SizedBox(height:10),Text('${(done*100/24).round()}٪ پیشرفت',textAlign:TextAlign.center,style:const TextStyle(color:Color(0xFF1769AA),fontWeight:FontWeight.bold)),const SizedBox(height:24),const Text('برای ثبت پیشرفت، پس از مطالعه هر درس دکمه «علامت‌گذاری به‌عنوان مطالعه‌شده» را بزنید.',textAlign:TextAlign.center,style:TextStyle(height:1.8,color:Colors.black54))
 ]))));}}
