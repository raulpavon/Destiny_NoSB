//
//  StoryManager.swift
//  Destiny_NoSB
//
//  Created by Raúl Pavón on 15/02/22.
//

import Foundation

struct StoryManager {
    
    var storyNumber = 0
    
    let stories = [
        Story(
            title: GlobalConstants.Destiny.Story.title1,
            choice1: GlobalConstants.Destiny.Choices.choice1, choice1Destination: 2,
            choice2: GlobalConstants.Destiny.Choices.choice2, choice2Destination: 1
        ),
        Story(
            title: GlobalConstants.Destiny.Story.title2,
            choice1: GlobalConstants.Destiny.Choices.choice3, choice1Destination: 2,
            choice2: GlobalConstants.Destiny.Choices.choice4, choice2Destination: 3
        ),
        Story(
            title: GlobalConstants.Destiny.Story.title3,
            choice1: GlobalConstants.Destiny.Choices.choice5, choice1Destination: 5,
            choice2: GlobalConstants.Destiny.Choices.choice6, choice2Destination: 4
        ),
        Story(
            title: GlobalConstants.Destiny.Story.title4,
            choice1: GlobalConstants.Destiny.Choices.the, choice1Destination: 0,
            choice2: GlobalConstants.Destiny.Choices.end
            , choice2Destination: 0
        ),
        Story(
            title: GlobalConstants.Destiny.Story.title5,
            choice1: GlobalConstants.Destiny.Choices.the, choice1Destination: 0,
            choice2: GlobalConstants.Destiny.Choices.end, choice2Destination: 0
        ),
        Story(
            title: GlobalConstants.Destiny.Story.title6,
            choice1: GlobalConstants.Destiny.Choices.the, choice1Destination: 0,
            choice2: GlobalConstants.Destiny.Choices.end, choice2Destination: 0
        )
    ]
    
    func getStoryTitle() -> String {
        return stories[storyNumber].title
    }
    
    func getChoice1() -> String {
        return stories[storyNumber].choice1
    }
    
    func getChoice2() -> String {
        return stories[storyNumber].choice2
    }
    
    mutating func nextStory(userChoice: String) {
        
        let currentStory = stories[storyNumber]
        if userChoice == currentStory.choice1 {
            storyNumber = currentStory.choice1Destination
        } else if userChoice == currentStory.choice2 {
            storyNumber = currentStory.choice2Destination
        }
    }
}
