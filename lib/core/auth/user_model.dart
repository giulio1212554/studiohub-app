enum UserRole { owner, employee }

class AppUser {
  final String id;
  final String name;
  final String email;
  final UserRole role;
  final bool active;
  final DateTime createdAt;

  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.active = true,
    required this.createdAt,
  });

  bool get isOwner => role == UserRole.owner;

  AppUser copyWith({
    String? name,
    String? email,
    UserRole? role,
    bool? active,
  }) {
    return AppUser(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      active: active ?? this.active,
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'role': role.name,
        'active': active,
        'created_at': createdAt.toIso8601String(),
      };

  factory AppUser.fromMap(Map<String, dynamic> m) => AppUser(
        id: m['id'] as String,
        name: m['name'] as String,
        email: m['email'] as String? ?? '',
        role: UserRole.values.firstWhere(
          (r) => r.name == m['role'],
          orElse: () => UserRole.employee,
        ),
        active: m['active'] as bool? ?? true,
        createdAt: DateTime.tryParse(m['created_at']?.toString() ?? '') ??
            DateTime.now(),
      );
}
