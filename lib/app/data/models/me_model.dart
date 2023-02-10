class MeModel {
  String? id;
  String? phone;
  String? email;
  bool? isPhoneConfirmed;
  String? lastSignInAt;
  String? firstName;
  String? lastName;
  String? gender;
  bool? hasPin;

  ProfileModel? profile;

  List<ProfileModel>? profiles;

  MeModel(
      {this.id,
      this.phone,
      this.email,
      this.isPhoneConfirmed,
      this.lastSignInAt,
      this.firstName,
      this.lastName,
      this.gender,
      this.hasPin,
      this.profile,
      this.profiles});

  MeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    email = json['email'];
    isPhoneConfirmed = json['isPhoneConfirmed'];
    lastSignInAt = json['lastSignInAt'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    hasPin = json['hasPin'];

    profile =
        json['profile'] != null ? ProfileModel.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['phone'] = phone;
    data['email'] = email;
    data['isPhoneConfirmed'] = isPhoneConfirmed;
    data['lastSignInAt'] = lastSignInAt;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender;
    data['hasPin'] = hasPin;

    if (profile != null) {
      data['profile'] = profile!.toJson();
    }

    if (profiles != null) {
      data['profiles'] = profiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProfileModel {
  String? id;
  Tenant? tenant;
  String? socialIdentityProvider;

  String? phone;
  String? email;
  String? firstName;
  String? lastName;
  String? gender;

  String? avatar;

  ProfileModel({
    this.id,
    this.tenant,
    this.socialIdentityProvider,
    this.phone,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.avatar,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenant = json['tenant'] != null ? Tenant.fromJson(json['tenant']) : null;
    socialIdentityProvider = json['socialIdentityProvider'];

    phone = json['phone'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];

    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (tenant != null) {
      data['tenant'] = tenant!.toJson();
    }
    data['socialIdentityProvider'] = socialIdentityProvider;
    data['phone'] = phone;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['gender'] = gender;

    data['avatar'] = avatar;

    return data;
  }
}

class Tenant {
  String? id;
  String? name;
  String? displayName;

  Tenant({this.id, this.name, this.displayName});

  Tenant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayName = json['displayName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['displayName'] = displayName;
    return data;
  }
}

class Errors {
  String? message;
  List<String>? path;
  Extensions? extensions;

  Errors({this.message, this.path, this.extensions});

  Errors.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    path = json['path'].cast<String>();
    extensions = json['extensions'] != null
        ? Extensions.fromJson(json['extensions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['path'] = path;
    if (extensions != null) {
      data['extensions'] = extensions!.toJson();
    }
    return data;
  }
}

class Extensions {
  String? code;

  Extensions({this.code});

  Extensions.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    return data;
  }
}
