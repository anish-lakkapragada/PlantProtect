# Plant Protect - Blair Hacks '22 [Best Environment]


## Demo 

https://user-images.githubusercontent.com/68448458/154864463-ba8c0a2c-31e9-4276-b459-36cdb0dcdfe7.mov

## Inspiration

One day, on a nature camp, we were asked to pluck out plants (contrary to common sense) because they were *invasive*, which meant that they came from a different habitat and were hurting the native plants in this one. Years later, we realized this was a meaningful problem to solve, and we were motivated by the fact that we would be one of the first ones to do it with the help of machine learning. 

## What it does

Plant Protect is an iOS app we created for hikers and nature enthusiasts to take photos of plants they encounter to detect if they are invasive (and which invasive plant they may be) or not. It will detect if a plant is either non-invasive (native) or one of the 4 most common invasive species in the US - Wisteria, Japanese Honeysuckle, Japanese Barberry, or Purple Loosestrife. This is meant to help people identify the invasive species around them so they can protect the biodiversity of the local ecosystem. 

## How we built it

We first scraped images from the internet (because there were no publicly available datasets) and used them to train an ML model with Apple's CreateML framework. We then quickly deployed this model in a swift app using Apple's CoreML SDK. We also had time, and wanted to share the word about Plant Protect, so we created a [website](https://anish-lakkapragada.github.io/BlairHacks/)

## Challenges we ran into

Because our data was collected from google images searches, quality control was paramount and thus we did a lot of manual processing on our data. We also ran into challenges with the fact that some of the plants looked similar to each other, so we kept on searching for more data and changing the model configurations so they worked better. 

## Accomplishments that we're proud of

**Our app's ML model reached 90% validation accuracy** on detecting whether a plant was non-invasive or one of the 4 invasive species. We are also proud that we were successfully able to deploy this model into an app and also had spare time to create a website to showcase our work. 

## What we learned

From Blair Hacks 2022, we learned that we have to be able to quickly adapt to new techniques. For example when building the model, the accuracy was first pretty low in the 80s but by adding more data and trying out different model configurations we could get it up to 90%. We also learned that you should plan ahead what you are going to build (e.x. app UI) before implementing as that is the best way to have cohesive thought processes and executable plans. 

## What's next for Plant Protect

We hope to release our app on the App Store. We also would like to include more classes of invasive species beyond just the US and perhaps have the model be able to detect objects in an livestream video. 
