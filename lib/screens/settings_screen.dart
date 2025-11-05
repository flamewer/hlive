import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  String _selectedLanguage = 'English';
  double _textSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'General Settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Column(
                  children: [
                    SwitchListTile(
                      title: const Text('Enable Notifications'),
                      value: _notificationsEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          _notificationsEnabled = value;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Dark Mode'),
                      value: _darkModeEnabled,
                      onChanged: (bool value) {
                        setState(() {
                          _darkModeEnabled = value;
                        });
                      },
                    ),
                    ListTile(
                      title: const Text('Language'),
                      subtitle: Text(_selectedLanguage),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: _showLanguagePicker,
                    ),
                    ListTile(
                      title: const Text('Text Size'),
                      subtitle: Text('${_textSize.toInt()}'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: _showTextSizeSlider,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Account Settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Edit Profile'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Handle edit profile
                      },
                    ),
                    ListTile(
                      title: const Text('Change Password'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Handle change password
                      },
                    ),
                    ListTile(
                      title: const Text('Privacy Settings'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Handle privacy settings
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'About',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: const Text('Terms of Service'),
                      onTap: () {
                        // Handle terms of service
                      },
                    ),
                    ListTile(
                      title: const Text('Privacy Policy'),
                      onTap: () {
                        // Handle privacy policy
                      },
                    ),
                    ListTile(
                      title: const Text('Version'),
                      subtitle: const Text('1.0.0'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle logout
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLanguagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ListTile(
                title: Text(
                  'Select Language',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: const Text('English'),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'English';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Spanish'),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'Spanish';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('French'),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'French';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('German'),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'German';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showTextSizeSlider() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Text Size',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Slider(
                  value: _textSize,
                  min: 12,
                  max: 24,
                  divisions: 6,
                  label: _textSize.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _textSize = value;
                    });
                  },
                ),
                Text('Current size: ${_textSize.round()}'),
              ],
            ),
          ),
        );
      },
    );
  }
}