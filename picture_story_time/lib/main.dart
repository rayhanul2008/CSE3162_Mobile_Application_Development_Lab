import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(PictureStoryApp());
}

class PictureStoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Picture Story Time',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoryLibraryScreen(),
    );
  }
}

class StoryLibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story Library'),
      ),
      body: ListView.builder(
        itemCount: storyList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the story viewer screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StoryViewerScreen(story: storyList[index]),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.asset(
                    storyList[index].coverImage,
                    width: 250,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    storyList[index].title,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class StoryViewerScreen extends StatelessWidget {
  final Story story;

  StoryViewerScreen({required this.story});

  @override
  Widget build(BuildContext context) {
    FlutterTts tts = FlutterTts();
    return Scaffold(
      appBar: AppBar(
        title: Text(story.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              story.coverImage,
              width: 600,
              height: 500,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                story.content,
                style: TextStyle(fontSize: 16),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement interactive elements or read-aloud functionality
                tts.speak(story.content);
              },
              child: Text('Read Aloud'),
            ),
          ],
        ),
      ),
    );
  }
}

class Story {
  final String title;
  final String coverImage;
  final String content;

  Story({required this.title, required this.coverImage, required this.content});
}

// Dummy data
List<Story> storyList = [
  Story(
    title: 'Allama Delwar Hossain Sayeedi Biography',
    coverImage: 'assets/1.jpg',
    content: 'Allama Delwar Hossain Sayeedi: A Life Devoted to Faith and Knowledge Born on a tranquil morning in a remote village, Allama Delwar Hossain Sayeedi was destined to become an iconic figure in the world of religion and scholarship. His journey began with a fervent curiosity for understanding the mysteries of life and a deep-seated reverence for his faith. From an early age, Sayeedi demonstrated an insatiable hunger for knowledge. His pursuit of education led him to the hallowed halls of esteemed institutions, where he imbibed the teachings of the greatest scholars and philosophers of his time. It was during these formative years that he developed an unshakable bond with his best friend, Principal Mawlana Sayed Kamal Uddin Jafari, a relationship that would shape his path and inspire his pursuit of excellence. Sayeedis insatiable appetite for wisdom led him to become a prolific author, penning a remarkable collection of 75 books that touched upon diverse topics ranging from theology to societal issues. His insightful words resonated deeply with those seeking answers and enlightenment, earning him a revered place among scholars and seekers alike. Throughout his life, Sayeedi remained a staunch advocate for the ideals he held dear. His loyalty to his favorite political party, Jamaat-e-Islami Bangladesh, and his unyielding commitment to fostering education through his involvement with student organizations like Satra Shibir & Satri Sangastha showcased his dedication to nurturing the values he cherished. But it was his unswerving devotion to Almighty Allah that defined Sayeedis character. His fears were simple: the fear of straying from the righteous path and the fear of forgetting his Creator. These fears, however, only fueled his unrelenting determination to spread the message of Islam far and wide. Sayeedis life was a tapestry woven with cherished memories. One of his most cherished moments was his first visit to the Kaaba, a spiritual experience that transcended words. This visit reinforced his resolve to live a life of virtue and humility, values that he held dear till his last breath. As life progressed, Sayeedis dream of seeing Islamic principles flourish in his homeland took root. His desire for a just and righteous society led him to work tirelessly to establish the foundations for an Islamic rule in Bangladesh, a dream he hoped would one day come to fruition. Inevitably, the pages of life turned, and a dark chapter unfolded with his second arrest in 2010. Despite the challenges and adversity that followed, Sayeedis unwavering faith remained unbroken. His incarceration only deepened his connection with the divine, and he continued to inspire countless souls even from behind bars. Tragedy struck on August 14, 2023, when Sayeedi breathed his last due to a heart ailment. His departure left a void that could never be filled, but his legacy lives on in the hearts of those who admired his wisdom, devotion, and humility. The funeral prayers held in his honor, attended by a multitude of mourners, was a testament to the impact he had on countless lives. In the end, Allama Delwar Hossain Sayeedis journey was a testament to the power of faith, knowledge, and unwavering commitment. He taught us that even in the face of adversity, the pursuit of truth and virtue remains paramount. His legacy continues to inspire generations to come, echoing his message of hope, compassion, and the relentless pursuit of understanding the divine.',
  ),
  Story(
    title: 'Rayhanul Islam Mukul',
    coverImage: 'assets/2.jpg',
    content:'Md. Rayhanul Islam, a name that resonates with goodness and positivity. Our journey as friends began in the world of Computer Science and Engineering, where our shared passion for technology laid the foundation of a strong bond. Rayhanuls charismatic personality and quick wit made every interaction a delightful experience. His infectious sense of humor never failed to lighten the mood, turning even the most stressful days into bearable ones. Whether it was a witty one-liner during a challenging coding session or a clever retort during a heated debate, Rayhanuls humor was a constant source of joy. But there was more to Rayhanul than just his humor. His love for travel opened up new horizons for us. From impromptu road trips to meticulously planned adventures, every journey with him was an exploration of both the world and ourselves. His adventurous spirit pushed us to step out of our comfort zones and embrace the unknown. Beyond his humor and love for travel, Rayhanuls intelligence was truly remarkable. His prowess in IQ challenges and problem-solving competitions made him a winner in every sense of the word. His dedication to his studies and his ability to grasp complex concepts quickly was both admirable and inspiring. In every way, Rayhanul exemplified what it means to be a good friend. His unwavering support, genuine kindness, and ability to bring laughter to even the darkest of days made him a true gem in our lives. His story is one of friendship, adventure, humor, and intelligence—a story that will forever hold a special place in our hearts.',
  ),
  Story(
    title: 'Asifur Rahman',
    coverImage: 'assets/3.jpg',
    content:'Asifur Rahmans story took an unexpected turn—a love story that bloomed amidst lines of code and algorithms. Mahi, Shimla, and Sharmeen, three distinct threads woven into his life, created a tapestry of emotions that reshaped his world. Mahi: Mahi, a fellow coder with a heart as vibrant as her mind, caught Asifurs attention during a hackathon. Their conversations began with debugging but swiftly transcended into deep discussions about life, ambitions, and dreams. Their bond grew stronger as they exchanged not just code but heartfelt words, discovering that their connection ran deeper than shared interests. Their love story unfolded gradually, like the most intricate program, and added a touch of warmth to Asifurs world. Shimla: Shimla, a traveler with a soul hungry for adventure, walked into Asifurs life during a coding conference. Her passion for exploring the world resonated with his own love for travel, and their stories intertwined like paths on a map. Coding challenges became a backdrop to their conversations about mountains, cultures, and the beauty of the unknown. Asifur found himself drawn to Shimlas free spirit, and her presence ignited his own sense of wanderlust. Sharmeen: Sharmeen, a classmate with a brilliant mind and a compassionate heart, shared countless late-night coding sessions with Asifur. Their friendship was a steady anchor, weathering the storms of challenging assignments and sleepless coding marathons. Over time, Asifur realized that the laughter they shared and the support they provided were the foundation of something deeper. Sharmeens presence brought stability to his life, reminding him that love could also be found in the comfort of a familiar connection. Asifurs journey in the world of programming and love encapsulated the complexities of human emotions. The love he shared with Mahi, Shimla, and Sharmeen was a testament to the fact that even in the most logical of fields, the heart has its own algorithms. Each relationship added a unique dimension to his story, reminding him that the lines of code he wrote were just one part of the intricate code of life. His love story, like a program with multiple functions, showcased the different facets of his personality and the beauty of embracing emotions alongside logic. Asifur Rahman, the top programmer with a heart that understood both bytes and beats, showed that in the world of coding and relationships, the most fulfilling outcomes arise when you allow the heart to compile with the mind.',
  ),
  Story(
    title: 'Sanjoy Kumer',
    coverImage: 'assets/4.jpg',
    content: 'In the realm of academic excellence and personal growth, Sanjoy Kumer stood out as a shining example of intelligence, determination, and a kind heart. His journey through the halls of learning was marked by remarkable achievements and endearing qualities that left an indelible mark on those around him. As a student, Sanjoys academic brilliance was a beacon of inspiration. With a flawless CGPA of 4 out of 4, he effortlessly conquered complex subjects and intricate concepts. His dedication to his studies was matched only by his genuine curiosity to understand the nuances of every topic he encountered. But behind his academic achievements lay a hidden struggle. Despite his intelligence and charm, Sanjoys personal journey carried its own set of challenges. The quest for a meaningful relationship eluded him, and this unfulfilled aspect of his life cast a shadow on his spirit. He often found himself grappling with sadness and feelings of isolation, wondering why he couldnot find a connection that resonated as deeply as his academic pursuits. However, Sanjoys heart remained a treasure trove of kindness and empathy. He was the friend who lent a listening ear during tough times and the shoulder to lean on when challenges seemed insurmountable. His own struggles didnt hinder his ability to connect with others, understand their pain, and offer unwavering support. His empathy was a testament to his strength of character and his ability to rise above personal hardships. Despite the weight of his unfulfilled desires, Sanjoys prowess as a programmer remained untouched. His ability to decipher complex code and create elegant solutions showcased his logical thinking and creativity. His mind was a playground for innovation, and his coding projects often left peers in awe of his technical acumen. When it came to convincing others, Sanjoy was a true master of the art. Whether it was persuading a group to choose a particular project idea or rallying support for a cause he believed in, his eloquence and passion were undeniable. His ability to articulate ideas and inspire action marked him as a natural leader. Sanjoy Kumers story is a testament to the resilience of the human spirit. Despite the challenges he faced in one aspect of his life, he continued to shine brightly in academics, kindness, and technical prowess. His journey reminds us that even in the face of personal struggles, the impact we have on others and the world around us can be profound and meaningful.',
  ),
  // Add more stories here
];