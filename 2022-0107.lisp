#!/usr/bin/sbcl --script
# -*- coding: utf-8 -*-
(ql:quickload '() :silent t)
(defpackage :myapp
  (:use :cl)
  (:export :main))
(in-package :myapp)

(defun read-file (file)
  (with-open-file (in file)
    (loop for line = (read-line in nil nil)
          while line
          collect line)))		; => READ-FILE

;; 大きすぎてエラーになった。
;;(read-file "~/Downloads/kokudochiriin/17000-19.0a/17_2020.csv") ; =>
(defun head (list n)
  (butlast list (- (length list) n)))	; => HEAD

(defun tail (list n)
  (last list n))			; => TAIL


(defun read-file-top-bot (file)
  (let ((data (cdr (with-open-file (in file)
		     (loop for line = (read-line in nil nil)
			   while line
			   collect (read-from-string
				    (concatenate 'string "("
						 (substitute #\space #\, (string-right-trim
									  '(#\return)
									  line)) ")"))))))) 
    (append (head data 5)
            (tail data 5))))		; => READ-FILE-TOP-BOT


(defun get-data ()
  (cdr (with-open-file (in "./newly_confirmed_cases_daily.csv")
         (loop for line = (read-line in nil nil)
               while line
               collect (read-from-string
                        (concatenate 'string "("
                                     (substitute #\space #\, (string-right-trim
                                                              '(#\return)
                                                              line)) ")")))))) ; => GET-DATA

(setq file "~/Downloads/kokudochiriin/17000-19.0a/17_2020.csv") ; => "~/Downloads/kokudochiriin/17000-19.0a/17_2020.csv"
(setq data (read-file-top-bot file))				; => 


(defclass prefs ()
  ((name :initarg :name :initform "" :accessor name))) ; => #<STANDARD-CLASS MYAPP::PREFS>

(defclass muni (prefs) ())		; => #<STANDARD-CLASS MYAPP::MUNI>

(defclass section (muni) ())		; => #<STANDARD-CLASS MYAPP::SECTION>

(defclass subsection (section) ())	; => #<STANDARD-CLASS MYAPP::SUBSECTION>

(setf p01 (make-instance 'prefs
			 :name "北海道")) ; => #<PREFS {1002E21123}>
(setf m001 (make-instance 'muni
			 :name ""))
(setf p02 (make-instance 'prefs
			 :name "青森県")) ; => #<PREFS {1002E91BE3}>

(setf p03 (make-instance 'prefs
			 :name "岩手県")) ; => #<PREFS {1003759F43}>

(setf p04 (make-instance 'prefs
			 :name "宮城県")) ; => #<PREFS {10037CB113}>
(setf p05 (make-instance 'prefs
			 :name "秋田県")) ; => #<PREFS {1003844863}>
(setf p06 (make-instance 'prefs
			 :name "山形県")) ; => #<PREFS {10038C2FC3}>
(setf p07 (make-instance 'prefs
			 :name "福島県")) ; => #<PREFS {1003934113}>
(setf p08 (make-instance 'prefs
			 :name "茨城県")) ; => #<PREFS {10039B5703}>
(setf p09 (make-instance 'prefs
			 :name "栃木県")) ; => #<PREFS {1003A4ED73}>
(setf p10 (make-instance 'prefs
			 :name "群馬県")) ; => #<PREFS {1003AC8E23}>
(setf p11 (make-instance 'prefs
			 :name "埼玉県")) ; => #<PREFS {1003B69833}>
(setf p12 (make-instance 'prefs
			 :name "千葉県")) ; => #<PREFS {1003BE2163}>
(setf p13 (make-instance 'prefs
			 :name "東京都")) ; => #<PREFS {1003C58F63}>
(setf p14 (make-instance 'prefs
			 :name "神奈川県")) ; => #<PREFS {1003CD2993}>
(setf p15 (make-instance 'prefs
			 :name "新潟県")) ; => #<PREFS {1003D44113}>
(setf p16 (make-instance 'prefs
			 :name "富山県")) ; => #<PREFS {1003DBD703}>
(setf p17 (make-instance 'prefs
			 :name "石川県")) ; => #<PREFS {1003E2F0F3}>
(setf p18 (make-instance 'prefs
			 :name "福井県")) ; => #<PREFS {1003EA8473}>
(setf p19 (make-instance 'prefs
			 :name "山梨県")) ; => #<PREFS {1003F29833}>
(setf p20 (make-instance 'prefs
			 :name "長野県")) ; => #<PREFS {1003FA2FC3}>
(setf p21 (make-instance 'prefs
			 :name "岐阜県")) ; => #<PREFS {1004021863}>
(setf p22 (make-instance 'prefs
			 :name "静岡県")) ; => #<PREFS {100409B483}>
(setf p23 (make-instance 'prefs
			 :name "愛知県")) ; => #<PREFS {1004118EE3}>
(setf p24 (make-instance 'prefs
			 :name "三重県")) ; => #<PREFS {1004199EA3}>
(setf p25 (make-instance 'prefs
			 :name "滋賀県")) ; => #<PREFS {100420B1E3}>
(setf p26 (make-instance 'prefs
			 :name "京都府")) ; => #<PREFS {1005051B83}>
(setf p27 (make-instance 'prefs
			 :name "大阪府")) ; => #<PREFS {100428C113}>
(setf p28 (make-instance 'prefs
			 :name "兵庫県")) ; => #<PREFS {1004FCAC33}>
(setf p29 (make-instance 'prefs
			 :name "奈良県")) ; => #<PREFS {1004411833}>
(setf p30 (make-instance 'prefs
			 :name "和歌山県")) ; => #<PREFS {1004D713E3}>
(setf p31 (make-instance 'prefs
			 :name "鳥取県")) ; => #<PREFS {100448BF93}>
(setf p32 (make-instance 'prefs
			 :name "島根県")) ; => #<PREFS {1004509473}>
(setf p33 (make-instance 'prefs
			 :name "岡山県")) ; => #<PREFS {100457B623}>
(setf p34 (make-instance 'prefs
			 :name "広島県")) ; => #<PREFS {1004ED2523}>
(setf p35 (make-instance 'prefs
			 :name "山口県")) ; => #<PREFS {10046F15F3}>
(setf p36 (make-instance 'prefs
			 :name "徳島県")) ; => #<PREFS {1004E590A3}>
(setf p37 (make-instance 'prefs
			 :name "香川県")) ; => #<PREFS {1004DE29B3}>
(setf p38 (make-instance 'prefs
			 :name "愛媛県")) ; => #<PREFS {1004812E23}>
(setf p39 (make-instance 'prefs
			 :name "高知県")) ; => #<PREFS {1004F513E3}>
(setf p40 (make-instance 'prefs
			 :name "福岡県")) ; => #<PREFS {1004971833}>
(setf p41 (make-instance 'prefs
			 :name "佐賀県")) ; => #<PREFS {10049E3493}>
(setf p42 (make-instance 'prefs
			 :name "長崎県")) ; => #<PREFS {1004A65133}>
(setf p43 (make-instance 'prefs
			 :name "熊本県")) ; => #<PREFS {1004ADE8D3}>
(setf p44 (make-instance 'prefs
			 :name "大分県")) ; => #<PREFS {1004B69833}>
(setf p45 (make-instance 'prefs
			 :name "宮崎県")) ; => #<PREFS {1004BE1533}>
(setf p46 (make-instance 'prefs
			 :name "鹿児島県")) ; => #<PREFS {1004C53B73}>
(setf p47 (make-instance 'prefs
			 :name "沖縄県")) ; => #<PREFS {1004CCA133}>
(defun main ()

  )
