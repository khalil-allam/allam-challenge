import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)
    let windowSize = NSSize(width: 440, height: 800) // Set your desired width and height here
    self.setContentSize(windowSize)
    self.minSize = windowSize
    self.maxSize = windowSize
    self.styleMask.remove(.resizable) // Disable window resizing
    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}
