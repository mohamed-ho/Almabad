import 'package:firebase_auth/firebase_auth.dart';

class FirebaseExceptionHandler {
  static String handleException(dynamic error) {
    if (error is FirebaseAuthException) {
      return _handleAuthException(error);
    } else if (error is FirebaseException) {
      return _handleFirebaseException(error);
    } else {
      return "An unknown error occurred.";
    }
  }

  static String _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return "The email address is not valid.";
      case 'user-disabled':
        return "The user account has been disabled.";
      case 'user-not-found':
        return "No user found with this email.";
      case 'wrong-password':
        return "Incorrect password.";
      case 'email-already-in-use':
        return "This email is already registered.";
      case 'weak-password':
        return "The password is too weak.";
      case 'operation-not-allowed':
        return "This operation is not allowed.";
      default:
        return "Authentication error: ${e.message}";
    }
  }

  static String _handleFirebaseException(FirebaseException e) {
    switch (e.plugin) {
      case 'firestore':
        return _handleFirestoreErrors(e);
      case 'firebase_storage':
        return _handleStorageErrors(e);
      default:
        return "Firebase error: ${e.message}";
    }
  }

  static String _handleFirestoreErrors(FirebaseException e) {
    switch (e.code) {
      case 'not-found':
        return "The requested document was not found.";
      case 'permission-denied':
        return "You do not have permission to perform this operation.";
      case 'unavailable':
        return "Firestore service is temporarily unavailable.";
      default:
        return "Firestore error: ${e.message}";
    }
  }

  static String _handleStorageErrors(FirebaseException e) {
    switch (e.code) {
      case 'object-not-found':
        return "The requested storage object was not found.";
      case 'unauthorized':
        return "You are not authorized to perform this operation.";
      case 'cancelled':
        return "The operation was canceled.";
      case 'quota-exceeded':
        return "The storage quota has been exceeded.";
      default:
        return "Storage error: ${e.message}";
    }
  }
}
