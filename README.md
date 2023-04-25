# RetroPoint

Our Retro Point plans
* 		Both: Screen Fancy Image : Intro
* 		Mr M: Screen Fancy Image : Topic & Problem for indie dev and startup founder
* 		Mr A: Screen Fancy Image : I have a great idea, let's write an app to present what we want to talk today. But I don't know how to start?
* 		Mr M: Mac : Show OpenGPT and create an app for presentation for Mac (iPad, tvOS) —> Point 1
* 		Start with Point2 —> Mr A: Mac : Use Xcode with Copilot to create first slide view with content.
* 		Mr A: App: Slide SwiftUI explain —> Point 3
* 		Point 3 —> Mr M: Mac : Use OpenGPT, create slides and share knowledge and experience
* 		Mr. M: App: Present new slides - talk about it —> Point 3+++
* 		Point 4 —> Mr A: Mac :  Use Copilot, what is inside, experience and do some slides / knowledge
* 		Mr. A: App: Present last slides - talk about it
* 		Code final - and say thank you


## Point 0 —> Point 1 Michael Script: 

Hello everyone, —> introduction by Michael, Andre is silent.
So for those who join over zoom, there’s no slide at this point, there will be a surprise as we love easter eggs between my current speech about what we will do in this talk. We will do a tech talk with a “real” tech activities.

### Problem Statement

So is any one of you is an indie dev? Or startup founder? Or have a cool pet project as a hobby or even for your side income for living?
Both of us have it even though no one download it on store, but, I believe we ever have that moment then stopped for a while because when we want to grow it more, we didn’t have time or hint what to do next, or even how to start it and build wonderful MVP. As a startup founder we always want to have at least MVP product that can be sufficient enough to be presented, promoted or even solid enough to be funded, but we back to same problem, no time, hard to multi-task, hard to find ideas, design, lack of resources, suggestion and more, or even for non engineer you don’t know how to code. All of you must have heard about many cool stuff related to AI these days (ChatGPT, OpenAI, Copilot, AutoGPT, StableDiffusion, many more), and somehow we kind of excited of it, but then we never try to use it beyond just a normal conversation with it. This talk is for you! We will explore more about utilize AI as a tool and assistant for us for creating MVP product of your idea, and make it happen. This talk we will focus on two greatest AI at the moment which is ChatGPT and Copilot. How? Learning by doing! (Michael shouting).
We will building the app right now with you with the help of AI. (Andre comes)

## Point 1 —> Point 2 Andre Script

From 1st example to first Slide
Now we have seen the great use of ChatGPT, but I think it is oversized for a MVP or a prototype. Let's stripe down the boring `hard` stuff of management and focus to more reliable MVP for our starting point. 

I left a Fix me in the Code

## Point 2 —> Point 3 Andre Script:

Use Point 2 as base with changes of removing the Management Code

Add Code ViewModel Code:
```swift
struct SlideViewModel {
    let title: String
    let bulletPoints: [String]
}
```

Then create a slide viewmodel with `Why should I use SwiftUI?` I will try to use the copilot, if it give me the right answer.
```swift
let slides = [
    SlideViewModel(title: "Why should I use SwiftUI?", bulletPoints: [
        "It's easy to use",
        "It's declarative",
        "It's cross platform",
        "It's reactive",
        "It's fast",
        "It's fun"
    ]),
]
```

Then I will write the slide view code, by my self with the help of Copilot.
The end result should look like this
```swift
struct SlideView: View {
    let slideViewModel: SlideViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(slideViewModel.title)
                    .scaledFont(size: 20, weight: .bold)
                    .foregroundColor(.white)
            }
            .padding(.vertical, 32)
            .frame(maxWidth: .infinity, alignment: .center)

            VStack(alignment: .leading) {
                ForEach(slideViewModel.bulletPoints, id: \.self) { point in
                    HStack {
                        Image(systemName: "circle.fill")
                            .imageScale(.small)
                            .font(.callout)

                        Text(point)
                            .scaledFont(size: 12, weight: .bold)
                    }
                    .padding(.bottom, 16)
                    .foregroundColor(.white)
                }
            }
            .padding(64)
            Spacer()

        }
        .padding(50)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}
```



Chat with Code
I want the bullet points be left aligned

change the alignment of the slides to be left

## Point 3 —> Point 4 Michael Script:

### [Michael Talk]

So now let’s start to expand the slide more than 1. What we should add next? Of course talk about why ChatGPT is useful and my own experience with it. Now let’s try to add some content for first slide, by opening ChatGPT and ask what are the benefits of ChatGPT when building MVP. 

### [Live QnA with ChatGPT]
### [Adding slide content and explain as a noob prompter]
### [Adding second slide content from first point and ChatGPT as well]
### [Add more prev and next button]

Talk about SwiftUI fun stuff and quick creation of these buttons

### [Add Image Slide]

Now let’s add another new feature which is an image. Slide with supported image. I will add new slide type, let’s ask ChatGPT to assist us, pretend that we are a noob prompt engineer. Let’s positioning us as non engineer but want to build an app, put aside our knowledge regarding formatting, parsing, etc.

### [Jump directly to Point4 and explain one by one]

When I wrote the code along with you guys, I just copied directly what I had from chat gpt.
Now, I have already verified the content and combined with my own personal experience. Now let’s talk more deep about it 

### [Slide 2 till the end]

### [Slide 2: Faster prototyping]

#### Let’s talk the reason why it can faster prototyping:

#### Saving time on designing and coding complex input systems
-> Chat GPT can generate user input for us, so we don’t need think too much on complexity of program that we envision.

#### Reduce the need for manual input testing and enable early user testing:
-> allowing for quicker iteration and allowing for rapid iteration and refinement based on user feedback

#### Lower the barrier to entry for prototyping
-> enabling even non-technical team members to contribute to the development process

#### Accelerate the development timeline
-> we can gain competitive advantage in the market quicker and focus on other non-tech stuff as well. 

#### Let’s talk the reason why it can Improved User Engagement:

#### Interactive response, Personalized response based on input: 
> both of them are quite similar, basically with ChatGPT, it can generate the response tailored to the user’s specific needs and interest which means improve engagement by providing users with more personalized experience to meets their unique needs and preferences. As long as we format the input as we wish, it can very helpful for any of us to build our first product in short time.

#### Handles large volumes of inquiries in real-time: 
> GPT can handle large volume of user inquiries simultaneously with fast and efficient responses. For developers what we need to do is parsing it correctly as we intend to. For user this can help reduce wait times and improve user satisfaction. For example we have aggregator MVP product, we can easily aggregate or summarize the data in short time with GPT, or other example is to identifying security logs as potential to cyber attacks and provide recommendations to user.

#### Record history of conversation:
> This abilities will help us to focus on what’s next to do, as GPT provide accurate and helpful response, it also track our history (as long as we don’t clear it). This way we can try create relevant and useful information base on what we have input in the past. Improving user engagement will led to customer satisfaction and increased positive word-of-mouth referrals. Not only that it can help to encourage user to continue use the product and lead to higher user retention rates!

#### Provides 24/7 support:
> Quite obvious, imagine you need support team but you only a solo dev or small group of startup team, and no money to hire CS team. With GPT you can train GPT with input to act as CS even 24/7 around the clock, all language, and in convenience.

#### Let’s talk the reason why it can Reduced Development Costs with ChatGPT:

#### Personal Assistants (copywriting, marketing, product, etc), Help with the tedious task (i.e. generating mock data, test cases, content outlines, ideas), Automating time-consuming tasks (i.e. FAQ, inquiries, security thread detection):

-> This can reduce the need for a large team of developers or specialists, lowering development costs especially for initial stage of development. If we developers, how do we growth our products without marketing, copywriting, and other non-technical stuff? with the help of GPT and act as our personal secretary they can help to suggest or advice us the correct next step to do as they have horizontal knowledge of all of the area that we need.

#### Help to find and identify root cause of a bug:
-> We don’t have dedicated QA, we are the QA but sometimes we are stuck on something, on same time we need to fix some literally high crash bug with something that we not familiar with especially if we are not really a tech guy. GPT comes handy, they can identify and suggest what are the next step we can do. We can also provide log of data and ask GPT analyze the important area for us which is super helpful.

#### Improves efficiency and speed, Improves accuracy and reduces errors and downtime:
-> By having more accuracy it can lead to fewer bugs and issues, ultimately reducing the need for costly bug fixes and maintenance. Then, well all of the point I mentioned above will lead to all of this point that can lead to quicker time-to-market and competitive advantage in the market, at least we are one step closer than the other. 

#### Lowers the barrier to entry for development:
-> As you can see, GPT is easy to use, it only need a text input and give us text output. We don’t need reinvent the wheel by making super complex setup with advanced framework, example MLKit from apple, or Hadoop, for processing big data and make our own language processing concept, but we can use GPT instead.  This easiness also enable non-technical team members to contribute to the development process, ultimately reducing development costs, even non tech guy can also become product engineer itselves!

#### Reduces the need for physical resources:
-> So well yeah, we can see that GPT can reduce the need for physical resources such as customer service teams or content creation teams for initial stage of building MVP products. This can ultimately reduce overhead costs and lower the total cost of development.


#### MVP Product example: Medical diagnosis MVP Product: Doctor -> input patient symptoms

Output -> compare / combine data base on internal inventory that the company had
User Output ->  generate list of potential diagnoses along with recommended tests and treatments with list of availabilities of price package from hospital
Result ->  Speed and efficiency in handling data, more precise output, contextual understanding and analysis, improved analysis and decision-making, and reduced risk of bias and subjectivity

#### Make the best out of ChatGPT: Understand the limitations of ChatGPT:
-> ChatGPT is a powerful tool, but it's important to understand its limitations and potential biases. Be aware of the limitations and consider using additional tools or techniques to supplement ChatGPT's capabilities. i.e. 4000 words in one output (we can handle by telling them “go on”). i.e. the model we use, GPT 3.5 vs GPT 4.0

#### Incorporate human oversight and intervention
-> While ChatGPT can automate many tasks, it's important to incorporate human oversight and intervention to ensure accuracy and avoid potential biases or errors. Incorporate human oversight and intervention as needed to ensure that ChatGPT is generating accurate and helpful responses. We still need human in-depth knowledge especially specialist, this will be helpful for later stage of your product development, that’s why we also need prompt engineer.

#### Better input prompt = better outcome
-> By training the AI we can make them learn to make suitable and accurate response base on our input. We can give some rules related to the output inside input prompt itselves as well.  ChatGPT's accuracy and effectiveness depends on the quality and relevance of the training data. It ensure that it generates accurate and helpful responses

#### Learn how to parse string to your expected format, Connect output with your internal data
-> If you have own API i.e. as our diagnosis use cases, we can ask GPT to give output from GPT to match with our internal api parameters (FYI, we don’t need to expose our API).

#### Use ChatGPT for specific tasks and applications
-> Make the AI as personal assistants. ChatGPT is most effective when used for specific tasks or applications, rather than trying to apply it broadly to all aspects of a product or service. Identify the specific tasks or applications where ChatGPT can add the most value, and focus on developing those use cases

#### Continuously monitor and refine ChatGPT's performance
-> ChatGPT's performance can vary over time, so it's important to continuously monitor and refine its performance. Regularly review ChatGPT's performance and adjust its training data or parameters as necessary to ensure optimal performance

## Point 4 —> Point 5 Andre Script:
