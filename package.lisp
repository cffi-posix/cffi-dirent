;;
;;  cffi-dirent  -  Common Lisp wrapper for dirent.h
;;
;;  Copyright 2017,2018 Thomas de Grivel <thoxdg@gmail.com>
;;
;;  Permission to use, copy, modify, and distribute this software for any
;;  purpose with or without fee is hereby granted, provided that the above
;;  copyright notice and this permission notice appear in all copies.
;;
;;  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
;;  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;;  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
;;  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;;  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;;  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
;;  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
;;

(in-package :common-lisp)

(defpackage :cffi-dirent
  (:nicknames :dirent)
  (:use
   :cffi
   :common-lisp
   :errno)
  (:export
   #:c-opendir
   #:c-fdopendir
   #:c-closedir
   #:c-readdir
   #:c-readdir-r
   #:c-rewinddir
   #:c-seekdir
   #:c-telldir
   #:opendir
   #:fdopendir
   #:closedir
   #:with-dir
   #:readdir
   #:dirent-ino
   #:dirent-off
   #:dirent-reclen
   #:dirent-type
   #:dirent-name
   #:do-dir
   #:dir
   #:readdir-r
   #:rewinddir
   #:seekdir
   #:telldir
   #:dirfd
   #:+dt-unknown+
   #:+dt-fifo+
   #:+dt-chr+
   #:+dt-dir+
   #:+dt-blk+
   #:+dt-reg+
   #:+dt-lnk+
   #:+dt-sock+
   #:+dt-wht+))
