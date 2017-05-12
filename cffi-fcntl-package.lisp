
(in-package :common-lisp)

(defpackage :cffi-fcntl
  (:nicknames :fcntl)
  (:use
   :cffi
   :cffi-errno
   :common-lisp)
  (:export
   #:c-fcntl
   #:c-fcntl/int
   #:c-fcntl/pointer
   #:fcntl-getfl
   #:fcntl-setfl
   #:+o-rdonly+
   #:+o-wronly+
   #:+o-rdwr+
   #:+o-creat+
   #:+o-excl+
   #:+o-noctty+
   #:+o-trunc+
   #:+o-append+
   #:+o-nonblock+
   #:+o-ndelay+
   #:+o-sync+
   #:+o-sync+
   #:+o-async+
   #:+o-largefile+
   #:+o-directory+
   #:+o-nofollow+
   #:+o-cloexec+
   #:+o-direct+
   #:+o-noatime+
   #:+o-path+
   #:+o-dsync+
   #:+o-tmpfile+
   #:+f-getlk+
   #:+f-setlk+
   #:+f-setlkw+
   #:+f-getlk64+
   #:+f-setlk64+
   #:+f-setlkw64+
   #:+f-dupfd+
   #:+f-getfd+
   #:+f-setfd+
   #:+f-getfl+
   #:+f-setfl+
   #:+f-setown+
   #:+f-getown+
   #:+f-setsig+
   #:+f-getsig+
   #:+f-setown-ex+
   #:+f-getown-ex+
   #:+f-setlease+
   #:+f-getlease+
   #:+f-notify+
   #:+f-setpipe-sz+
   #:+f-getpipe-sz+
   #:+f-dupfd-cloexec+
   #:+f-cloexec+
   #:+f-rdlck+
   #:+f-wrlck+
   #:+f-unlck+
   #:+f-exlck+
   #:+f-shlck+
   #:+lock-sh+
   #:+lock-ex+
   #:+lock-nb+
   #:+lock-un+
   #:+lock-mand+
   #:+lock-read+
   #:+lock-write+
   #:+lock-rw+
   #:+dn-access+
   #:+dn-modify+
   #:+dn-create+
   #:+dn-delete+
   #:+dn-rename+
   #:+dn-attrib+
   #:+dn-multishot+
   #:+posix-fadv-normal+
   #:+posix-fadv-random+
   #:+posix-fadv-sequential+
   #:+posix-fadv-willneed+
   #:+posix-fadv-dontneed+
   #:+posix-fadv-noreuse+
   #:+sync-file-range-wait-before+
   #:+sync-file-range-write+
   #:+sync-file-range-wait-after+
   #:+splice-f-move+
   #:+splice-f-nonblock+
   #:+splice-f-more+
   #:+splice-f-gift+
   #:+falloc-fl-keep-size+
   #:+falloc-fl-punch-hole+
   #:+falloc-fl-collapse-range+
   #:+falloc-fl-zero-range+
   #:+max-handle-sz+))
