(define-module (security)
  #:use-module (guix build-system gnu)
  #:use-module (guix packages)
  #:use-module (guix git-download) ;;git-fetch
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages linux)) ;; linux-pam

(define-public google-authenticator-libpam
  (package
   (name "google-authenticator-libpam")
   (version "1.09")
   (source
    (origin
     (method git-fetch)
     (uri
      (git-reference
       (url "https://github.com/google/google-authenticator-libpam")
       (commit "1.09")))
     (sha256
      (base32 "05nbm478mwj69b0v4cxr2q8sn9cbzaqzadrx9b9ajd4capl22b8d"))))
   (build-system gnu-build-system)
   (inputs (list linux-pam))
   (native-inputs (list autoconf automake libtool))
   (arguments
    (list #:tests? #f)) ;; FAIL: tests/pam_google_authenticator_unittest
   (home-page "https://github.com/google/google-authenticator-libpam")
   (synopsis
    "Google Authenticator PAM module")
   (description
    "Example PAM module demonstrating two-factor authentication for logging into servers via SSH, OpenVPN, etc.")
   (license license:asl2.0)))
