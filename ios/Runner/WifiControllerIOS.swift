import NetworkExtension

/// Joins the host's or a relay's Wi-Fi from inside the app. iOS shows a
/// one-time "wants to join network" prompt. Needs the Hotspot Configuration
/// capability (Runner.entitlements).
final class WifiControllerIOS {
  private var joinedSSID: String?

  func join(ssid: String, password: String, completion: @escaping (String?) -> Void) {
    let config = password.isEmpty
      ? NEHotspotConfiguration(ssid: ssid)
      : NEHotspotConfiguration(ssid: ssid, passphrase: password, isWEP: false)
    // Stay joined while the app plays in the background.
    config.joinOnce = false
    NEHotspotConfigurationManager.shared.apply(config) { [weak self] error in
      DispatchQueue.main.async {
        guard let error = error as NSError? else {
          self?.joinedSSID = ssid
          completion(nil)
          return
        }
        if error.domain == NEHotspotConfigurationErrorDomain {
          switch NEHotspotConfigurationError(rawValue: error.code) {
          case .alreadyAssociated:
            self?.joinedSSID = ssid
            completion(nil)
          case .userDenied:
            completion("You declined joining \"\(ssid)\".")
          case .invalidWPAPassphrase:
            completion("The password for \"\(ssid)\" looks wrong.")
          default:
            completion("Couldn't join \"\(ssid)\" (\(error.localizedDescription)). "
              + "Join it in Settings → Wi-Fi, then choose \"I'm already on the host's Wi-Fi\".")
          }
        } else {
          completion(error.localizedDescription)
        }
      }
    }
  }

  func leave() {
    if let ssid = joinedSSID {
      NEHotspotConfigurationManager.shared.removeConfiguration(forSSID: ssid)
    }
    joinedSSID = nil
  }
}
