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

(in-package :cffi-dirent)

(defcfun ("opendir" c-opendir) :pointer
  (name :string))

(defun opendir (name)
  (let ((dirp (c-opendir name)))
    (if (null-pointer-p dirp)
	(error-errno "opendir")
	dirp)))

(defcfun ("fdopendir" c-fdopendir) :pointer
  (fd :int))

(defun fdopendir (fd)
  (let ((dirp (c-fdopendir fd)))
    (if (null-pointer-p dirp)
	(error-errno "fdopendir")
	dirp)))

(defcfun ("closedir" c-closedir) :int
  (dirp :pointer))

(defun closedir (dirp)
  (let ((r (c-closedir dirp)))
    (if (< r 0)
	(error-errno "closedir")
	r)))

(defmacro with-dir ((var name) &body body)
  (let ((dirp (gensym "DIRP-")))
    `(let ((,dirp (opendir ,name)))
       (unwind-protect (let ((,var ,dirp))
			 ,@body)
	 (closedir ,dirp)))))

(defcfun ("readdir" c-readdir) :pointer
  (dirp :pointer))

(defun readdir (dirp)
  (setf errno 0)
  (let ((dirent (c-readdir dirp)))
    (if (null-pointer-p dirent)
	(if (zerop errno)
	    nil
	    (error-errno "readdir"))
	dirent)))

(defun dirent-ino (dirent)
  (foreign-slot-value dirent '(:struct dirent) 'd-ino))

(defun dirent-off (dirent)
  (foreign-slot-value dirent '(:struct dirent) 'd-off))

(defun dirent-reclen (dirent)
  (foreign-slot-value dirent '(:struct dirent) 'd-reclen))

(defun dirent-type (dirent)
  (foreign-slot-value dirent '(:struct dirent) 'd-type))

(defun dirent-name (dirent)
  (let ((d-name (foreign-slot-value dirent '(:struct dirent) 'd-name)))
    (convert-from-foreign d-name :string)))

(defmacro do-dir ((var name) &body body)
  (let ((dirp (gensym "DIRP-"))
	(dirent (gensym "DIRENT-")))
    `(with-dir (,dirp ,name)
       (loop
	  (let ((,dirent (readdir ,dirp)))
	    (unless ,dirent
	      (return))
	    (let ((,var ,dirent))
	      ,@body))))))

#+test
(do-dir (df "/")
  (format t "~&~S ~S ~S ~S ~S~%"
	  (dirent-ino df)
	  (dirent-off df)
	  (dirent-reclen df)
	  (dirent-type df)
	  (dirent-name df)))
