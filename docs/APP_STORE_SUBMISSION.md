# Crowd Speaker: App Store submission checklist

App Store Connect app `6822414111` (bundle `com.partysync.partySync`), version 1.0, status "Prepare for Submission".
State below was read from ASC on 2026-10-14. Nothing has been changed in ASC yet.

## Current state in ASC

| Area | State |
|---|---|
| App name | "Crowd Speaker" (now matches in code and ASC) |
| Subtitle | empty |
| Category | Utilities (primary), Music (secondary): done |
| Age rating | 4+: done |
| Content rights | "No third-party content": done |
| Encryption | handled by `ITSAppUsesNonExemptEncryption=false`: done |
| DSA trader status | non-trader declared (fine for an individual-style listing; confirm for CLEANDOT as a company) |
| Privacy policy URL | **empty** |
| App Privacy ("nutrition label") | **not started** |
| Price | **not set** |
| Availability (countries) | **not set** |
| Screenshots (iPhone + iPad) | **none** |
| Promo text / description / keywords | **empty** |
| Support URL | **empty** |
| Copyright | **empty** |
| Build | **none attached** (1.0 builds 1 and 2 are in TestFlight; attach one) |
| App Review info (contact, notes) | **empty** |
| Release option | not chosen |

## Things you need to make (images and hosting)

1. **App Store screenshots.** Required: iPhone 6.9" and iPad 13" (the app is universal, `TARGETED_DEVICE_FAMILY = "1,2"`).
   - iPhone 6.9": 1320 x 2868 px (or 1290 x 2796). PNG or JPG, no alpha, 1 to 10 images. Smaller iPhone sizes are scaled from this.
   - iPad 13": 2064 x 2752 px (or 2048 x 2732).
   - Suggested 5 shots: Home (Be the mic / Join as speaker); Host QR code screen; Host live with network map; Listener playing and synced; Speaker lag correction / sync delay settings.
   - Easiest route: run the app in the iPhone 17 Pro Max and iPad Pro 13" simulators and press Cmd+S, then add a headline caption over each in Figma or Canva.
2. **App icon.** Already in the build (1024 x 1024, no alpha). Nothing to make.
3. **Privacy policy page** at a public URL. It can be a one-page site (GitHub Pages, Notion public page, your company site). Content: no accounts, no analytics, no ads; voice audio is streamed only over the local Wi-Fi between the user's own phones and is never recorded or sent to any server; camera is used only to scan QR codes; nothing leaves the device; contact email.
4. **Support page** at a public URL (can be the same site, with a contact email and a short FAQ).
5. Optional: a 15 to 30 s App Preview video (same sizes as screenshots) and a header asset (the new product page header, 5244 x 2950). Neither is required.

## Copy to paste into ASC (version 1.0, English U.S.)

**Name** (already set in ASC): `Crowd Speaker`

**Subtitle** (max 30): `Phones become one loudspeaker`

**Promotional text** (max 170):
`One phone is the mic. Every other phone, and any Bluetooth speaker, plays your voice in sync. No internet, no sign-up.`

**Description** (max 4000):
```
Crowd Speaker turns the phones in a room into one big, perfectly synced loudspeaker.

One phone is the mic. Everyone else joins by scanning a QR code, and their phones (and any Bluetooth speaker connected to them) play the host's voice at the same moment.

Use it for:
• Tours, classes and workshops
• Weddings, parties and outdoor events
• Sports and team talks
• Anywhere one voice has to reach a lot of people

HOW IT WORKS
1. The host taps "Be the mic" and shows the QR code.
2. Everyone else taps "Join as a speaker" and scans it.
3. Phones join the host's Wi-Fi, sync their clocks and start playing together.

FEATURES
• Tight sync: every phone plays the same sample at the same time, within a few milliseconds
• Works with Bluetooth speakers: connect one to your phone as usual
• No internet needed: everything runs over a local Wi-Fi network or hotspot
• Private: no account, no ads, no tracking. Your voice never leaves the local network and is never recorded
• Live view for the host: see who is connected, buffer health and battery
• Speaker lag correction and sync delay controls to fine-tune the room

NOTES
• All phones must be on the same Wi-Fi network or the host's hotspot.
• iPhones can host and listen. Android phones can also relay the signal to reach more people.
```

**Keywords** (max 100, comma-separated, no spaces): `loudspeaker,megaphone,speaker,mic,PA,sync,party,broadcast,bluetooth,announce,group,wifi`

**Support URL:** `<your support page URL>`
**Marketing URL:** optional
**Version:** `1.0`
**Copyright:** `2026 CLEANDOT ENTERPRISES PRIVATE LIMITED`

## App Privacy (ASC > App Privacy > Get Started)

From the code: no analytics or ad SDKs, no server calls (only local UDP), `shared_preferences` for local settings only.
- "Do you or your third-party partners collect data from this app?" -> **No, we do not collect data from this app.**
- Then **Publish**.
- Paste the privacy policy URL into the Privacy Policy field on that page.

## App Review information

- Sign-in required: **off** (no accounts)
- Contact: first name, last name, phone, email (yours)
- Notes (suggested):
```
Crowd Speaker needs at least two devices on the same Wi-Fi. One device taps "Be the mic" and shows a QR code; a second device taps "Join as a speaker" and scans it. Permissions: Microphone (host captures voice), Camera (scan QR code), Local Network (send/receive audio between phones on the same Wi-Fi), Hotspot Configuration (join the host's Wi-Fi from inside the app). No account or server is involved; audio never leaves the local network.
If only one device is available, the app can still be reviewed up to the Home, Host setup and QR code screens. Happy to provide a screen recording of two phones syncing on request.
```
- Attach a short screen recording of two phones working together (see to-do list below). Reviewers often have one device, so this speeds approval.

## Pricing and availability

- Price: **Free** (no IAP, no ads in the code).
- Availability: all countries/regions (default) unless you want to limit.
- Apple Silicon Mac / Vision Pro availability: untick unless you've tested (the app depends on iPhone audio and Wi-Fi hardware).
- Distribution: Public.

## Final steps (once everything above is filled)

1. Version page > **Build** > Add Build > pick the latest 1.0 build (build 2).
2. Choose release: manual release is the safest for a first launch.
3. **Add for Review** > Submit.

## Your to-do list (short)

- [x] App name: Crowd Speaker (ASC, Info.plist and Android label all match; CrowdMic was taken)
- [ ] Create + host the privacy policy page, get the URL
- [ ] Create + host the support page, get the URL
- [ ] Take iPhone 6.9" screenshots (1320 x 2868), 3 to 5 of them
- [ ] Take iPad 13" screenshots (2064 x 2752), 3 to 5 of them
- [ ] Record a 30 s two-phone demo video for App Review (optional but recommended)
- [ ] Enter your review contact phone number and email
- [ ] Confirm CLEANDOT's DSA trader status is right (Apple may need a trader address and phone if you are a trader)
- [ ] Test on at least two real phones before submitting (README says it has not been tested on real phones)
