/// Everything a listener needs to reach a host or relay: which Wi-Fi to join
/// and where on it to find the session. Encoded into the QR code.
class JoinInfo {
  const JoinInfo({
    required this.ssid,
    required this.password,
    this.hosts = const [],
    this.port = defaultPort,
    this.sessionName = '',
    this.sessionId,
  });

  static const int defaultPort = 47800;

  final String ssid;
  final String password;
  final List<String> hosts;
  final int port;
  final String sessionName;
  final int? sessionId;

  JoinInfo copyWith({
    String? ssid,
    String? password,
    List<String>? hosts,
    int? port,
    String? sessionName,
    int? sessionId,
  }) =>
      JoinInfo(
        ssid: ssid ?? this.ssid,
        password: password ?? this.password,
        hosts: hosts ?? this.hosts,
        port: port ?? this.port,
        sessionName: sessionName ?? this.sessionName,
        sessionId: sessionId ?? this.sessionId,
      );

  /// App QR: `partysync://join?s=<ssid>&p=<pass>&h=<ip,ip>&port=<port>&n=<name>&id=<sid>`
  String toUri() => Uri(
        scheme: 'partysync',
        host: 'join',
        queryParameters: {
          's': ssid,
          'p': password,
          if (hosts.isNotEmpty) 'h': hosts.join(','),
          if (port != defaultPort) 'port': '$port',
          if (sessionName.isNotEmpty) 'n': sessionName,
          if (sessionId != null) 'id': '$sessionId',
        },
      ).toString();

  /// Standard Wi-Fi QR that the phone's own camera app can join directly.
  String toWifiQr() {
    final security = password.isEmpty ? 'nopass' : 'WPA';
    return 'WIFI:T:$security;S:${_escape(ssid)};P:${_escape(password)};;';
  }

  static JoinInfo? tryParse(String raw) {
    final text = raw.trim();
    if (text.startsWith('partysync://')) return _parseUri(text);
    if (text.toUpperCase().startsWith('WIFI:')) return _parseWifi(text);
    return null;
  }

  static JoinInfo? _parseUri(String text) {
    final uri = Uri.tryParse(text);
    if (uri == null || uri.host != 'join') return null;
    final q = uri.queryParameters;
    final ssid = q['s'] ?? '';
    final hosts = (q['h'] ?? '').split(',').where((h) => h.isNotEmpty).toList();
    if (ssid.isEmpty && hosts.isEmpty) return null;
    return JoinInfo(
      ssid: ssid,
      password: q['p'] ?? '',
      hosts: hosts,
      port: int.tryParse(q['port'] ?? '') ?? defaultPort,
      sessionName: q['n'] ?? '',
      sessionId: int.tryParse(q['id'] ?? ''),
    );
  }

  static JoinInfo? _parseWifi(String text) {
    final fields = <String, String>{};
    final body = text.substring(5);
    final key = StringBuffer();
    final value = StringBuffer();
    var inValue = false;
    for (var i = 0; i < body.length; i++) {
      final c = body[i];
      if (c == r'\' && i + 1 < body.length) {
        (inValue ? value : key).write(body[++i]);
      } else if (c == ':' && !inValue) {
        inValue = true;
      } else if (c == ';') {
        if (key.isNotEmpty) fields[key.toString().toUpperCase()] = value.toString();
        key.clear();
        value.clear();
        inValue = false;
      } else {
        (inValue ? value : key).write(c);
      }
    }
    final ssid = fields['S'] ?? '';
    if (ssid.isEmpty) return null;
    return JoinInfo(ssid: ssid, password: fields['P'] ?? '');
  }

  static String _escape(String s) =>
      s.replaceAllMapped(RegExp(r'([\\;,:"])'), (m) => '\\${m[1]}');
}
