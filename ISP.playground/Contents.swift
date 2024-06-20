import UIKit

/* ISP : Interface Seggrigation ::
 
 
 ISP states that clients (classes) shouldn't be forced to depend on functionalities they don't use. This means breaking down large interfaces into smaller, more specific ones.
 
 What is ISP?

 ISP is a core principle in object-oriented design (OOD) that emphasizes creating smaller, more specific interfaces instead of large, general-purpose ones. It essentially states that clients (classes that use interfaces) shouldn't be forced to depend on functionalities they don't utilize.
 
 Benefits of ISP:

 Reduced Coupling: Classes only rely on the functionalities they need, leading to looser dependencies and easier maintenance.
 Improved Maintainability: Smaller interfaces are easier to understand, modify, and test.
 Increased Flexibility: New functionalities can be introduced through dedicated interfaces without affecting existing ones.
 */


/*Example:  Media Player
 
 Imagine you have a MediaPlayer that can play audio and video files. Not all functionalities might be needed for every scenario. Let's see an example that violates ISP and then a better approach:
 */

protocol MediaPlayer {
  func playAudio(file: String)
  func playVideo(file: String)
  func adjustVolume(level: Float) // Not needed for all players
}

class AudioPlayer: MediaPlayer {
  func playAudio(file: String) {
    // Implement audio playback logic
  }
  func playVideo(file: String) {
    fatalError("This functionality is not supported")
  }
  func adjustVolume(level: Float) {
    // Implement volume adjustment logic
  }
}

class VideoPlayer: MediaPlayer {
  func playAudio(file: String) {
    fatalError("This functionality is not supported")
  }
  func playVideo(file: String) {
    // Implement video playback logic
  }
  func adjustVolume(level: Float) {
    // Implement volume adjustment logic
  }
}



/* Good Design With Interface Segrrigation*/
/*protocol AudioPlayer {
  func playAudio(file: String)
  func adjustVolume(level: Float)
}

protocol VideoPlayer {
  func playVideo(file: String)
  func adjustVolume(level: Float)
}

class BasicAudioPlayer: AudioPlayer {
  func playAudio(file: String) {
    // Implement audio playback logic
  }
  func adjustVolume(level: Float) {
    // Implement volume adjustment logic
  }
}

class AdvancedVideoPlayer: VideoPlayer {
  func playVideo(file: String) {
    // Implement video playback logic
  }
  func adjustVolume(level: Float) {
    // Implement volume adjustment logic
  }
}
*/4
