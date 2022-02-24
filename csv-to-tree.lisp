;;;; csv-to-tree.lisp

(in-package #:csv-to-tree)

(defpackage csv-to-tree
  (:use :cl)
  (:export :csv-to-tree))		; => #<PACKAGE "CSV-TO-TREE">
(in-package :csv-to-tree)		; => #<PACKAGE "CSV-TO-TREE">

(defun row-proc (line &optional (sep #\,))
  "行毎にS式に変換"
  (read-from-string
   (format nil "(~a)"
	   (substitute #\space sep
		       (string-right-trim
			'(#\return)
			line)))))	; => ROW-PROC

(defun cut (file &rest cols)
  "ファイルから必要な列のデータを抽出"
  (with-open-file (in file)
    (loop :for line = (read-line in nil nil)
          :while line
          :collect (loop :for i :in cols
			 :collect (nth i (row-proc line)))))) ; => CUT

(defvar title-line "タイトル行格納域")	; => TITLE-LINE

(defmacro chk-ttl (file &rest cols)
  "先頭行がタイトル行か確認し、適宜データ処理するマクロ"
  `(let ((data (cut ,file ,@cols)))
    (if (y-or-n-p "Is the first line the title line?")
	(progn
	  (setq title-line (car data))
	  (cdr data))
	data)))				; => CHK-TTL

(defun subtotal (list &aux (group (cadar list)))
  "行政区域毎に緯度経度の平均値を計算取得し、ツリー構造にまとめる。"
  (let ((lat 0)
	(lon 0)
	(cnt 0)
	(result ())
	(*read-default-float-format* 'double-float))
    (loop :for (pref muni x y) :in list
	  :do (if (equal group muni)
		  (progn (setq lat (+ lat (read-from-string x))
			       lon (+ lon (read-from-string y)))
			 (incf cnt))
		  (progn
		    (push (list group (/ lat cnt) (/ lon cnt)) result)
		    (setq lat (read-from-string x)
			  lon (read-from-string y)
			  cnt 1
			  group muni)))
	  :finally (progn
		     (push (list group (/ lat cnt) (/ lon cnt)) result)
		     (return (push pref result)))))) ; => SUBTOTAL

(defmacro csv-to-tree (file &rest cols)
  `(subtotal (chk-ttl ,file ,@cols)))	; => CSV-TO-TREE

