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

(include "dirent.h")
;(include "fcntl.h")

(ctype ino-t "ino_t")
(ctype off-t "off_t")

(cstruct dirent "struct dirent"
	 (d-ino "d_ino" :type ino-t)
	 (d-off "d_off" :type off-t)
	 (d-reclen "d_reclen" :type :unsigned-short)
	 (d-type "d_type" :type :unsigned-char)
	 (d-name "d_name" :type :char :count 256))

(constant (+dt-unknown+ "DT_UNKNOWN"))
(constant (+dt-fifo+ "DT_FIFO"))
(constant (+dt-chr+ "DT_CHR"))
(constant (+dt-dir+ "DT_DIR"))
(constant (+dt-blk+ "DT_BLK"))
(constant (+dt-reg+ "DT_REG"))
(constant (+dt-lnk+ "DT_LNK"))
(constant (+dt-sock+ "DT_SOCK"))
(constant (+dt-wht+ "DT_WHT"))
