Return-Path: <imrep.amz@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jTK+9dHnDHtNL7tkjudnDi6310gq+j/3gblJQyJ80hY=;
 b=N225sbem0D4S7AQRA04WTS4hWpavt0ciRPxtEbDQ8p2fvptrqNKltipN322Rx3yb7L
 yI+xfQi9Dss0vX1Ogksz8IsqQ5ORKgSN5yO2tT7dAkUByhnU7VFDI20hBC5rFiLWPCNO
 aCsxhxGy1rgR3zbcD8dSV2ncBPN4n6pZM7iIqDllvD3tn7Ly2cpgO2E9nEg+VHrksaz/
 lhpGNZAycWqdGIxQk3Edgu77QTMUrv9+rWcEd3ltWVRyfNxnF2Dg+ztMuqL1SwQl+JoU
 ZQHTt/BWIQfZtXCPykDUA1+MN3d1m7ctHC7OMjzYmtu5RYNlIlhkch8NZbOdFu1IgtEi
 1Xrg==
From: Imre Palik <imrep.amz@gmail.com>
Subject: [PATCH 4/4] Regenerating the atomic counter graph on a more modern
 CPU
Date: Mon, 23 Jul 2018 22:07:28 +0200
Message-Id: <1532376448-15103-5-git-send-email-imrep.amz@gmail.com>
In-Reply-To: <1532376448-15103-1-git-send-email-imrep.amz@gmail.com>
References: <1532376448-15103-1-git-send-email-imrep.amz@gmail.com>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, "Palik, Imre" <imrep.amz@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From: "Palik, Imre" <imrep.amz@gmail.com>

Regenerating the graph on Kaby Lake, and updating the text.

Signed-off-by: Imre Palik <imrep.amz@gmail.com>
---
 CodeSamples/count/atomic.eps    | 483 +++++++++++++----------
 CodeSamples/count/atomic125.eps | 856 +++++++++++++++++-----------------------
 CodeSamples/count/atomic125.png | Bin 3337 -> 3189 bytes
 count/count.tex                 |  12 +-
 defer/rcuintro.tex              |   2 +-
 locking/locking.tex             |   2 +-
 6 files changed, 658 insertions(+), 697 deletions(-)

diff --git a/CodeSamples/count/atomic.eps b/CodeSamples/count/atomic.eps
index 5e3ed2b..c2fc079 100644
--- a/CodeSamples/count/atomic.eps
+++ b/CodeSamples/count/atomic.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: Is Parallel Programming Hard, And, If So, What Can You Do About It?
-%%Creator: gnuplot 4.4 patchlevel 0
-%%CreationDate: Wed Jan  5 07:20:50 2011
+%%Creator: gnuplot 5.0 patchlevel 3
+%%CreationDate: Mon Jul 16 22:02:17 2018
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 95 302 355
 %%Orientation: Portrait
@@ -20,42 +20,29 @@ gnudict begin
 /Dashlength 1 def
 /Landscape false def
 /Level1 false def
+/Level3 false def
 /Rounded false def
 /ClipToBoundingBox false def
+/SuppressPDFMark false def
 /TransparentPatterns false def
 /gnulinewidth 5.000 def
 /userlinewidth gnulinewidth def
 /Gamma 1.0 def
+/BackgroundColor {-1.000 -1.000 -1.000} def
 %
 /vshift -33 def
 /dl1 {
-  10.0 Dashlength mul mul
+  10.0 Dashlength userlinewidth gnulinewidth div mul mul mul
   Rounded { currentlinewidth 0.75 mul sub dup 0 le { pop 0.01 } if } if
 } def
 /dl2 {
-  10.0 Dashlength mul mul
+  10.0 Dashlength userlinewidth gnulinewidth div mul mul mul
   Rounded { currentlinewidth 0.75 mul add } if
 } def
 /hpt_ 31.5 def
 /vpt_ 31.5 def
 /hpt hpt_ def
 /vpt vpt_ def
-Level1 {} {
-/SDict 10 dict def
-systemdict /pdfmark known not {
-  userdict /pdfmark systemdict /cleartomark get put
-} if
-SDict begin [
-  /Title (Is Parallel Programming Hard, And, If So, What Can You Do About It?)
-  /Subject (gnuplot plot)
-  /Creator (gnuplot 4.4 patchlevel 0)
-  /Author (paulmck)
-%  /Producer (gnuplot)
-%  /Keywords ()
-  /CreationDate (Wed Jan  5 07:20:50 2011)
-  /DOCINFO pdfmark
-end
-} ifelse
 /doclip {
   ClipToBoundingBox {
     newpath 50 50 moveto 302 50 lineto 302 410 lineto 50 410 lineto closepath
@@ -63,7 +50,7 @@ end
   } if
 } def
 %
-% Gnuplot Prolog Version 4.4 (January 2010)
+% Gnuplot Prolog Version 5.1 (Oct 2015)
 %
 %/SuppressPDFMark true def
 %
@@ -75,15 +62,16 @@ end
 /Z {closepath} bind def
 /C {setrgbcolor} bind def
 /f {rlineto fill} bind def
+/g {setgray} bind def
 /Gshow {show} def   % May be redefined later in the file to support UTF-8
 /vpt2 vpt 2 mul def
 /hpt2 hpt 2 mul def
 /Lshow {currentpoint stroke M 0 vshift R 
-	Blacktext {gsave 0 setgray show grestore} {show} ifelse} def
+	Blacktext {gsave 0 setgray textshow grestore} {textshow} ifelse} def
 /Rshow {currentpoint stroke M dup stringwidth pop neg vshift R
-	Blacktext {gsave 0 setgray show grestore} {show} ifelse} def
+	Blacktext {gsave 0 setgray textshow grestore} {textshow} ifelse} def
 /Cshow {currentpoint stroke M dup stringwidth pop -2 div vshift R 
-	Blacktext {gsave 0 setgray show grestore} {show} ifelse} def
+	Blacktext {gsave 0 setgray textshow grestore} {textshow} ifelse} def
 /UP {dup vpt_ mul /vpt exch def hpt_ mul /hpt exch def
   /hpt2 hpt 2 mul def /vpt2 vpt 2 mul def} def
 /DL {Color {setrgbcolor Solid {pop []} if 0 setdash}
@@ -96,7 +84,8 @@ end
 	dup 1 lt {pop 1} if 10 mul /udl exch def} def
 /PL {stroke userlinewidth setlinewidth
 	Rounded {1 setlinejoin 1 setlinecap} if} def
-% Default Line colors
+3.8 setmiterlimit
+% Classic Line colors (version 5.0)
 /LCw {1 1 1} def
 /LCb {0 0 0} def
 /LCa {0 0 0} def
@@ -109,19 +98,21 @@ end
 /LC6 {0 0 0} def
 /LC7 {1 0.3 0} def
 /LC8 {0.5 0.5 0.5} def
-% Default Line Types
+% Default dash patterns (version 5.0)
+/LTB {BL [] LCb DL} def
 /LTw {PL [] 1 setgray} def
-/LTb {BL [] LCb DL} def
+/LTb {PL [] LCb DL} def
 /LTa {AL [1 udl mul 2 udl mul] 0 setdash LCa setrgbcolor} def
 /LT0 {PL [] LC0 DL} def
-/LT1 {PL [4 dl1 2 dl2] LC1 DL} def
-/LT2 {PL [2 dl1 3 dl2] LC2 DL} def
-/LT3 {PL [1 dl1 1.5 dl2] LC3 DL} def
-/LT4 {PL [6 dl1 2 dl2 1 dl1 2 dl2] LC4 DL} def
-/LT5 {PL [3 dl1 3 dl2 1 dl1 3 dl2] LC5 DL} def
-/LT6 {PL [2 dl1 2 dl2 2 dl1 6 dl2] LC6 DL} def
-/LT7 {PL [1 dl1 2 dl2 6 dl1 2 dl2 1 dl1 2 dl2] LC7 DL} def
-/LT8 {PL [2 dl1 2 dl2 2 dl1 2 dl2 2 dl1 2 dl2 2 dl1 4 dl2] LC8 DL} def
+/LT1 {PL [2 dl1 3 dl2] LC1 DL} def
+/LT2 {PL [1 dl1 1.5 dl2] LC2 DL} def
+/LT3 {PL [6 dl1 2 dl2 1 dl1 2 dl2] LC3 DL} def
+/LT4 {PL [1 dl1 2 dl2 6 dl1 2 dl2 1 dl1 2 dl2] LC4 DL} def
+/LT5 {PL [4 dl1 2 dl2] LC5 DL} def
+/LT6 {PL [1.5 dl1 1.5 dl2 1.5 dl1 1.5 dl2 1.5 dl1 6 dl2] LC6 DL} def
+/LT7 {PL [3 dl1 3 dl2 1 dl1 3 dl2] LC7 DL} def
+/LT8 {PL [2 dl1 2 dl2 2 dl1 6 dl2] LC8 DL} def
+/SL {[] 0 setdash} def
 /Pnt {stroke [] 0 setdash gsave 1 setlinecap M 0 0 V stroke grestore} def
 /Dia {stroke [] 0 setdash 2 copy vpt add M
   hpt neg vpt neg V hpt vpt neg V
@@ -328,7 +319,8 @@ end
 /PatternFill {gsave /PFa [ 9 2 roll ] def
   PFa 0 get PFa 2 get 2 div add PFa 1 get PFa 3 get 2 div add translate
   PFa 2 get -2 div PFa 3 get -2 div PFa 2 get PFa 3 get Rec
-  gsave 1 setgray fill grestore clip
+  TransparentPatterns {} {gsave 1 setgray fill grestore} ifelse
+  clip
   currentlinewidth 0.5 mul setlinewidth
   /PFs PFa 2 get dup mul PFa 3 get dup mul add sqrt def
   0 0 M PFa 5 get rotate PFs -2 div dup translate
@@ -342,9 +334,14 @@ end
 %
 /languagelevel where
  {pop languagelevel} {1} ifelse
- 2 lt
-	{/InterpretLevel1 true def}
-	{/InterpretLevel1 Level1 def}
+dup 2 lt
+	{/InterpretLevel1 true def
+	 /InterpretLevel3 false def}
+	{/InterpretLevel1 Level1 def
+	 2 gt
+	    {/InterpretLevel3 Level3 def}
+	    {/InterpretLevel3 false def}
+	 ifelse }
  ifelse
 %
 % PostScript level 2 pattern fill definitions
@@ -433,16 +430,17 @@ Level1 {Level1PatternFill} {Level2PatternFill} ifelse
 /Symbol-Oblique /Symbol findfont [1 0 .167 1 0 0] makefont
 dup length dict begin {1 index /FID eq {pop pop} {def} ifelse} forall
 currentdict end definefont pop
+%
 /MFshow {
    { dup 5 get 3 ge
      { 5 get 3 eq {gsave} {grestore} ifelse }
      {dup dup 0 get findfont exch 1 get scalefont setfont
      [ currentpoint ] exch dup 2 get 0 exch R dup 5 get 2 ne {dup dup 6
-     get exch 4 get {Gshow} {stringwidth pop 0 R} ifelse }if dup 5 get 0 eq
+     get exch 4 get {textshow} {stringwidth pop 0 R} ifelse }if dup 5 get 0 eq
      {dup 3 get {2 get neg 0 exch R pop} {pop aload pop M} ifelse} {dup 5
      get 1 eq {dup 2 get exch dup 3 get exch 6 get stringwidth pop -2 div
      dup 0 R} {dup 6 get stringwidth pop -2 div 0 R 6 get
-     show 2 index {aload pop M neg 3 -1 roll neg R pop pop} {pop pop pop
+     textshow 2 index {aload pop M neg 3 -1 roll neg R pop pop} {pop pop pop
      pop aload pop M} ifelse }ifelse }ifelse }
      ifelse }
    forall} def
@@ -1850,6 +1848,51 @@ ba6d2a8e73b10c6de72a8e8f3bfeab8344fe6622fadd5d01457e31e8facd74cb
 cleartomark
 {restore}if
 %%EndProcSet
+Level1 SuppressPDFMark or 
+{} {
+/SDict 10 dict def
+systemdict /pdfmark known not {
+  userdict /pdfmark systemdict /cleartomark get put
+} if
+SDict begin [
+  /Title (Is Parallel Programming Hard, And, If So, What Can You Do About It?)
+  /Subject (gnuplot plot)
+  /Creator (gnuplot 5.0 patchlevel 3)
+  /Author (imre)
+%  /Producer (gnuplot)
+%  /Keywords ()
+  /CreationDate (Mon Jul 16 22:02:17 2018)
+  /DOCINFO pdfmark
+end
+} ifelse
+%
+% Support for boxed text - Ethan A Merritt May 2005
+%
+/InitTextBox { userdict /TBy2 3 -1 roll put userdict /TBx2 3 -1 roll put
+           userdict /TBy1 3 -1 roll put userdict /TBx1 3 -1 roll put
+	   /Boxing true def } def
+/ExtendTextBox { Boxing
+    { gsave dup false charpath pathbbox
+      dup TBy2 gt {userdict /TBy2 3 -1 roll put} {pop} ifelse
+      dup TBx2 gt {userdict /TBx2 3 -1 roll put} {pop} ifelse
+      dup TBy1 lt {userdict /TBy1 3 -1 roll put} {pop} ifelse
+      dup TBx1 lt {userdict /TBx1 3 -1 roll put} {pop} ifelse
+      grestore } if } def
+/PopTextBox { newpath TBx1 TBxmargin sub TBy1 TBymargin sub M
+               TBx1 TBxmargin sub TBy2 TBymargin add L
+	       TBx2 TBxmargin add TBy2 TBymargin add L
+	       TBx2 TBxmargin add TBy1 TBymargin sub L closepath } def
+/DrawTextBox { PopTextBox stroke /Boxing false def} def
+/FillTextBox { gsave PopTextBox 1 1 1 setrgbcolor fill grestore /Boxing false def} def
+0 0 0 0 InitTextBox
+/TBxmargin 20 def
+/TBymargin 20 def
+/Boxing false def
+/textshow { ExtendTextBox Gshow } def
+%
+% redundant definitions for compatibility with prologue.ps older than 5.0.2
+/LTB {BL [] LCb DL} def
+/LTb {PL [] LCb DL} def
 end
 %%EndProlog
 %%Page: 1 1
@@ -1861,402 +1904,436 @@ doclip
 0 setgray
 newpath
 (NimbusSanL-Regu) findfont 100 scalefont setfont
+BackgroundColor 0 lt 3 1 roll 0 lt exch 0 lt or or not {gsave BackgroundColor C clippath fill grestore} if
 1.000 UL
 LTb
-550 990 M
+LCb setrgbcolor
+490 975 M
 63 0 V
-1756 0 R
+1786 0 R
 -63 0 V
 stroke
-490 990 M
+430 975 M
 [ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 0)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-550 1192 M
+LCb setrgbcolor
+490 1181 M
 63 0 V
-1756 0 R
+1786 0 R
 -63 0 V
 stroke
-490 1192 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 100)]
+430 1181 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 20)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-550 1394 M
+LCb setrgbcolor
+490 1386 M
 63 0 V
-1756 0 R
+1786 0 R
 -63 0 V
 stroke
-490 1394 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 200)]
+430 1386 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 40)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-550 1597 M
+LCb setrgbcolor
+490 1592 M
 63 0 V
-1756 0 R
+1786 0 R
 -63 0 V
 stroke
-490 1597 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 300)]
+430 1592 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 60)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-550 1799 M
+LCb setrgbcolor
+490 1797 M
 63 0 V
-1756 0 R
+1786 0 R
 -63 0 V
 stroke
-490 1799 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 400)]
+430 1797 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 80)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-550 2001 M
+LCb setrgbcolor
+490 2003 M
 63 0 V
-1756 0 R
+1786 0 R
 -63 0 V
 stroke
-490 2001 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 500)]
+430 2003 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 100)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-550 2203 M
+LCb setrgbcolor
+490 2208 M
 63 0 V
-1756 0 R
+1786 0 R
 -63 0 V
 stroke
-490 2203 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 600)]
+430 2208 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 120)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-550 2406 M
+LCb setrgbcolor
+490 2414 M
 63 0 V
-1756 0 R
+1786 0 R
 -63 0 V
 stroke
-490 2406 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 700)]
+430 2414 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 140)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-550 2608 M
+LCb setrgbcolor
+490 2619 M
 63 0 V
-1756 0 R
+1786 0 R
 -63 0 V
 stroke
-490 2608 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 800)]
+430 2619 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 160)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-550 2810 M
+LCb setrgbcolor
+490 2825 M
 63 0 V
-1756 0 R
+1786 0 R
 -63 0 V
 stroke
-490 2810 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 900)]
+430 2825 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 180)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-550 990 M
+LCb setrgbcolor
+490 975 M
 0 63 V
-0 1757 R
+0 1787 R
 0 -63 V
 stroke
-550 890 M
+490 875 M
 [ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 1)]
 ] -33.3 MCshow
 1.000 UL
 LTb
-810 990 M
+LCb setrgbcolor
+754 975 M
 0 63 V
-0 1757 R
+0 1787 R
 0 -63 V
 stroke
-810 890 M
+754 875 M
 [ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 2)]
 ] -33.3 MCshow
 1.000 UL
 LTb
-1070 990 M
+LCb setrgbcolor
+1018 975 M
 0 63 V
-0 1757 R
+0 1787 R
 0 -63 V
 stroke
-1070 890 M
+1018 875 M
 [ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 3)]
 ] -33.3 MCshow
 1.000 UL
 LTb
-1330 990 M
+LCb setrgbcolor
+1282 975 M
 0 63 V
-0 1757 R
+0 1787 R
 0 -63 V
 stroke
-1330 890 M
+1282 875 M
 [ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 4)]
 ] -33.3 MCshow
 1.000 UL
 LTb
-1589 990 M
+LCb setrgbcolor
+1547 975 M
 0 63 V
-0 1757 R
+0 1787 R
 0 -63 V
 stroke
-1589 890 M
+1547 875 M
 [ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 5)]
 ] -33.3 MCshow
 1.000 UL
 LTb
-1849 990 M
+LCb setrgbcolor
+1811 975 M
 0 63 V
-0 1757 R
+0 1787 R
 0 -63 V
 stroke
-1849 890 M
+1811 875 M
 [ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 6)]
 ] -33.3 MCshow
 1.000 UL
 LTb
-2109 990 M
+LCb setrgbcolor
+2075 975 M
 0 63 V
-0 1757 R
+0 1787 R
 0 -63 V
 stroke
-2109 890 M
+2075 875 M
 [ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 7)]
 ] -33.3 MCshow
 1.000 UL
 LTb
-2369 990 M
+LCb setrgbcolor
+2339 975 M
 0 63 V
-0 1757 R
+0 1787 R
 0 -63 V
 stroke
-2369 890 M
+2339 875 M
 [ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 8)]
 ] -33.3 MCshow
 1.000 UL
 LTb
+LCb setrgbcolor
 1.000 UL
-LTb
-550 2810 N
-550 990 L
-1819 0 V
-0 1820 V
--1819 0 V
+LTB
+LCb setrgbcolor
+490 2825 N
+490 975 L
+1849 0 V
+0 1850 V
+-1849 0 V
 Z stroke
+1.000 UP
+1.000 UL
+LTb
 LCb setrgbcolor
-140 1900 M
+LCb setrgbcolor
+80 1900 M
 currentpoint gsave translate -270 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (Time Per Increment \(nanoseconds\))]
 ] -33.3 MCshow
 grestore
 LTb
 LCb setrgbcolor
-1459 740 M
+1414 725 M
 [ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (Number of CPUs \(Threads\))]
 ] -33.3 MCshow
 LTb
-1.000 UP
-1.000 UL
-LTb
 % Begin plot #1
 1.000 UP
 1.000 UL
-LT0
+LTb
+LCb setrgbcolor
 /NimbusSanL-Regu findfont 100 scalefont setfont
-550 1079 M
-0 2 V
--31 -2 R
-62 0 V
--62 2 R
-62 0 V
-229 118 R
+/vshift -33 def
+490 1019 M
 0 10 V
--31 -10 R
-62 0 V
--62 10 R
+0 -10 R
+31 0 V
+-31 10 R
+31 0 V
+233 335 R
+0 28 V
+-31 -28 R
 62 0 V
-229 189 R
-0 94 V
--31 -94 R
+-62 28 R
 62 0 V
--62 94 R
+233 102 R
+0 112 V
+987 1494 M
 62 0 V
-229 205 R
-0 97 V
--31 -97 R
+-62 112 R
 62 0 V
--62 97 R
+233 3 R
+0 199 V
+-31 -199 R
 62 0 V
-228 64 R
-0 80 V
--31 -80 R
+-62 199 R
 62 0 V
--62 80 R
+234 69 R
+0 133 V
+-31 -133 R
 62 0 V
-229 96 R
-0 281 V
--31 -281 R
+-62 133 R
 62 0 V
--62 281 R
+233 -1 R
+0 241 V
+-31 -241 R
 62 0 V
-229 11 R
-0 149 V
--31 -149 R
+-62 241 R
 62 0 V
--62 149 R
+233 -56 R
+0 238 V
+-31 -238 R
 62 0 V
-229 27 R
-0 144 V
--31 -144 R
+-62 238 R
 62 0 V
--62 144 R
-62 0 V
-550 1080 Pls
-810 1204 Pls
-1070 1454 Pls
-1330 1739 Pls
-1589 1904 Pls
-1849 2163 Pls
-2109 2398 Pls
-2369 2588 Pls
+233 63 R
+0 200 V
+-31 -200 R
+31 0 V
+-31 200 R
+31 0 V
+490 1023 Pls
+754 1378 Pls
+1018 1569 Pls
+1282 1696 Pls
+1547 1934 Pls
+1811 2119 Pls
+2075 2300 Pls
+2339 2625 Pls
 % End plot #1
 % Begin plot #2
 1.000 UL
+LTb
 LT1
+LCb setrgbcolor
 /NimbusSanL-Regu findfont 100 scalefont setfont
-550 1080 M
-260 124 V
-260 250 V
-260 285 V
-259 165 V
-260 259 V
-260 235 V
-260 190 V
+490 1023 M
+264 355 V
+264 191 V
+264 127 V
+265 238 V
+264 185 V
+264 181 V
+264 325 V
 % End plot #2
 % Begin plot #3
 stroke
+LTb
 LT2
+LCb setrgbcolor
 /NimbusSanL-Regu findfont 100 scalefont setfont
-550 1008 M
-18 0 V
+490 1066 M
 19 0 V
 18 0 V
-18 0 V
 19 0 V
-18 0 V
 19 0 V
 18 0 V
-18 0 V
 19 0 V
-18 0 V
-18 0 V
 19 0 V
 18 0 V
 19 0 V
-18 0 V
-18 0 V
 19 0 V
 18 0 V
-18 0 V
 19 0 V
-18 0 V
 19 0 V
 18 0 V
-18 0 V
 19 0 V
-18 0 V
-18 0 V
 19 0 V
-18 0 V
 19 0 V
 18 0 V
-18 0 V
 19 0 V
-18 0 V
-18 0 V
 19 0 V
 18 0 V
 19 0 V
-18 0 V
-18 0 V
 19 0 V
 18 0 V
-18 0 V
 19 0 V
-18 0 V
 19 0 V
 18 0 V
-18 0 V
 19 0 V
-18 0 V
-18 0 V
 19 0 V
 18 0 V
 19 0 V
-18 0 V
-18 0 V
 19 0 V
 18 0 V
-18 0 V
 19 0 V
-18 0 V
 19 0 V
 18 0 V
-18 0 V
 19 0 V
-18 0 V
+19 0 V
 18 0 V
 19 0 V
+19 0 V
 18 0 V
 19 0 V
+19 0 V
 18 0 V
+19 0 V
+19 0 V
 18 0 V
 19 0 V
+19 0 V
+19 0 V
 18 0 V
+19 0 V
+19 0 V
 18 0 V
 19 0 V
+19 0 V
 18 0 V
 19 0 V
+19 0 V
 18 0 V
+19 0 V
+19 0 V
 18 0 V
 19 0 V
+19 0 V
 18 0 V
+19 0 V
+19 0 V
 18 0 V
 19 0 V
+19 0 V
 18 0 V
 19 0 V
+19 0 V
 18 0 V
+19 0 V
+19 0 V
 18 0 V
 19 0 V
+19 0 V
 18 0 V
+19 0 V
+19 0 V
+19 0 V
 18 0 V
 19 0 V
+19 0 V
 18 0 V
 19 0 V
+19 0 V
 18 0 V
+19 0 V
+19 0 V
 18 0 V
 19 0 V
+19 0 V
 18 0 V
+19 0 V
 % End plot #3
 stroke
+2.000 UL
 LTb
-550 2810 N
-550 990 L
-1819 0 V
-0 1820 V
--1819 0 V
+LCb setrgbcolor
+1.000 UL
+LTB
+LCb setrgbcolor
+490 2825 N
+490 975 L
+1849 0 V
+0 1850 V
+-1849 0 V
 Z stroke
 1.000 UP
 1.000 UL
 LTb
+LCb setrgbcolor
 stroke
 grestore
 end
diff --git a/CodeSamples/count/atomic125.eps b/CodeSamples/count/atomic125.eps
index 179f3d4..1e28a27 100644
--- a/CodeSamples/count/atomic125.eps
+++ b/CodeSamples/count/atomic125.eps
@@ -1,7 +1,7 @@
 %!PS-Adobe-2.0
 %%Title: Is Parallel Programming Hard, And, If So, What Can You Do About It?
-%%Creator: gnuplot 4.4 patchlevel 0
-%%CreationDate: Wed Jan  5 07:20:51 2011
+%%Creator: gnuplot 5.0 patchlevel 3
+%%CreationDate: Mon Jul 16 22:02:17 2018
 %%DocumentFonts: (atend)
 %%BoundingBox: 50 95 302 355
 %%Orientation: Portrait
@@ -20,42 +20,29 @@ gnudict begin
 /Dashlength 1 def
 /Landscape false def
 /Level1 false def
+/Level3 false def
 /Rounded false def
 /ClipToBoundingBox false def
+/SuppressPDFMark false def
 /TransparentPatterns false def
 /gnulinewidth 5.000 def
 /userlinewidth gnulinewidth def
 /Gamma 1.0 def
+/BackgroundColor {-1.000 -1.000 -1.000} def
 %
 /vshift -33 def
 /dl1 {
-  10.0 Dashlength mul mul
+  10.0 Dashlength userlinewidth gnulinewidth div mul mul mul
   Rounded { currentlinewidth 0.75 mul sub dup 0 le { pop 0.01 } if } if
 } def
 /dl2 {
-  10.0 Dashlength mul mul
+  10.0 Dashlength userlinewidth gnulinewidth div mul mul mul
   Rounded { currentlinewidth 0.75 mul add } if
 } def
 /hpt_ 31.5 def
 /vpt_ 31.5 def
 /hpt hpt_ def
 /vpt vpt_ def
-Level1 {} {
-/SDict 10 dict def
-systemdict /pdfmark known not {
-  userdict /pdfmark systemdict /cleartomark get put
-} if
-SDict begin [
-  /Title (Is Parallel Programming Hard, And, If So, What Can You Do About It?)
-  /Subject (gnuplot plot)
-  /Creator (gnuplot 4.4 patchlevel 0)
-  /Author (paulmck)
-%  /Producer (gnuplot)
-%  /Keywords ()
-  /CreationDate (Wed Jan  5 07:20:51 2011)
-  /DOCINFO pdfmark
-end
-} ifelse
 /doclip {
   ClipToBoundingBox {
     newpath 50 50 moveto 302 50 lineto 302 410 lineto 50 410 lineto closepath
@@ -63,7 +50,7 @@ end
   } if
 } def
 %
-% Gnuplot Prolog Version 4.4 (January 2010)
+% Gnuplot Prolog Version 5.1 (Oct 2015)
 %
 %/SuppressPDFMark true def
 %
@@ -75,15 +62,16 @@ end
 /Z {closepath} bind def
 /C {setrgbcolor} bind def
 /f {rlineto fill} bind def
+/g {setgray} bind def
 /Gshow {show} def   % May be redefined later in the file to support UTF-8
 /vpt2 vpt 2 mul def
 /hpt2 hpt 2 mul def
 /Lshow {currentpoint stroke M 0 vshift R 
-	Blacktext {gsave 0 setgray show grestore} {show} ifelse} def
+	Blacktext {gsave 0 setgray textshow grestore} {textshow} ifelse} def
 /Rshow {currentpoint stroke M dup stringwidth pop neg vshift R
-	Blacktext {gsave 0 setgray show grestore} {show} ifelse} def
+	Blacktext {gsave 0 setgray textshow grestore} {textshow} ifelse} def
 /Cshow {currentpoint stroke M dup stringwidth pop -2 div vshift R 
-	Blacktext {gsave 0 setgray show grestore} {show} ifelse} def
+	Blacktext {gsave 0 setgray textshow grestore} {textshow} ifelse} def
 /UP {dup vpt_ mul /vpt exch def hpt_ mul /hpt exch def
   /hpt2 hpt 2 mul def /vpt2 vpt 2 mul def} def
 /DL {Color {setrgbcolor Solid {pop []} if 0 setdash}
@@ -96,7 +84,8 @@ end
 	dup 1 lt {pop 1} if 10 mul /udl exch def} def
 /PL {stroke userlinewidth setlinewidth
 	Rounded {1 setlinejoin 1 setlinecap} if} def
-% Default Line colors
+3.8 setmiterlimit
+% Classic Line colors (version 5.0)
 /LCw {1 1 1} def
 /LCb {0 0 0} def
 /LCa {0 0 0} def
@@ -109,19 +98,21 @@ end
 /LC6 {0 0 0} def
 /LC7 {1 0.3 0} def
 /LC8 {0.5 0.5 0.5} def
-% Default Line Types
+% Default dash patterns (version 5.0)
+/LTB {BL [] LCb DL} def
 /LTw {PL [] 1 setgray} def
-/LTb {BL [] LCb DL} def
+/LTb {PL [] LCb DL} def
 /LTa {AL [1 udl mul 2 udl mul] 0 setdash LCa setrgbcolor} def
 /LT0 {PL [] LC0 DL} def
-/LT1 {PL [4 dl1 2 dl2] LC1 DL} def
-/LT2 {PL [2 dl1 3 dl2] LC2 DL} def
-/LT3 {PL [1 dl1 1.5 dl2] LC3 DL} def
-/LT4 {PL [6 dl1 2 dl2 1 dl1 2 dl2] LC4 DL} def
-/LT5 {PL [3 dl1 3 dl2 1 dl1 3 dl2] LC5 DL} def
-/LT6 {PL [2 dl1 2 dl2 2 dl1 6 dl2] LC6 DL} def
-/LT7 {PL [1 dl1 2 dl2 6 dl1 2 dl2 1 dl1 2 dl2] LC7 DL} def
-/LT8 {PL [2 dl1 2 dl2 2 dl1 2 dl2 2 dl1 2 dl2 2 dl1 4 dl2] LC8 DL} def
+/LT1 {PL [2 dl1 3 dl2] LC1 DL} def
+/LT2 {PL [1 dl1 1.5 dl2] LC2 DL} def
+/LT3 {PL [6 dl1 2 dl2 1 dl1 2 dl2] LC3 DL} def
+/LT4 {PL [1 dl1 2 dl2 6 dl1 2 dl2 1 dl1 2 dl2] LC4 DL} def
+/LT5 {PL [4 dl1 2 dl2] LC5 DL} def
+/LT6 {PL [1.5 dl1 1.5 dl2 1.5 dl1 1.5 dl2 1.5 dl1 6 dl2] LC6 DL} def
+/LT7 {PL [3 dl1 3 dl2 1 dl1 3 dl2] LC7 DL} def
+/LT8 {PL [2 dl1 2 dl2 2 dl1 6 dl2] LC8 DL} def
+/SL {[] 0 setdash} def
 /Pnt {stroke [] 0 setdash gsave 1 setlinecap M 0 0 V stroke grestore} def
 /Dia {stroke [] 0 setdash 2 copy vpt add M
   hpt neg vpt neg V hpt vpt neg V
@@ -328,7 +319,8 @@ end
 /PatternFill {gsave /PFa [ 9 2 roll ] def
   PFa 0 get PFa 2 get 2 div add PFa 1 get PFa 3 get 2 div add translate
   PFa 2 get -2 div PFa 3 get -2 div PFa 2 get PFa 3 get Rec
-  gsave 1 setgray fill grestore clip
+  TransparentPatterns {} {gsave 1 setgray fill grestore} ifelse
+  clip
   currentlinewidth 0.5 mul setlinewidth
   /PFs PFa 2 get dup mul PFa 3 get dup mul add sqrt def
   0 0 M PFa 5 get rotate PFs -2 div dup translate
@@ -342,9 +334,14 @@ end
 %
 /languagelevel where
  {pop languagelevel} {1} ifelse
- 2 lt
-	{/InterpretLevel1 true def}
-	{/InterpretLevel1 Level1 def}
+dup 2 lt
+	{/InterpretLevel1 true def
+	 /InterpretLevel3 false def}
+	{/InterpretLevel1 Level1 def
+	 2 gt
+	    {/InterpretLevel3 Level3 def}
+	    {/InterpretLevel3 false def}
+	 ifelse }
  ifelse
 %
 % PostScript level 2 pattern fill definitions
@@ -433,16 +430,17 @@ Level1 {Level1PatternFill} {Level2PatternFill} ifelse
 /Symbol-Oblique /Symbol findfont [1 0 .167 1 0 0] makefont
 dup length dict begin {1 index /FID eq {pop pop} {def} ifelse} forall
 currentdict end definefont pop
+%
 /MFshow {
    { dup 5 get 3 ge
      { 5 get 3 eq {gsave} {grestore} ifelse }
      {dup dup 0 get findfont exch 1 get scalefont setfont
      [ currentpoint ] exch dup 2 get 0 exch R dup 5 get 2 ne {dup dup 6
-     get exch 4 get {Gshow} {stringwidth pop 0 R} ifelse }if dup 5 get 0 eq
+     get exch 4 get {textshow} {stringwidth pop 0 R} ifelse }if dup 5 get 0 eq
      {dup 3 get {2 get neg 0 exch R pop} {pop aload pop M} ifelse} {dup 5
      get 1 eq {dup 2 get exch dup 3 get exch 6 get stringwidth pop -2 div
      dup 0 R} {dup 6 get stringwidth pop -2 div 0 R 6 get
-     show 2 index {aload pop M neg 3 -1 roll neg R pop pop} {pop pop pop
+     textshow 2 index {aload pop M neg 3 -1 roll neg R pop pop} {pop pop pop
      pop aload pop M} ifelse }ifelse }ifelse }
      ifelse }
    forall} def
@@ -1850,6 +1848,51 @@ ba6d2a8e73b10c6de72a8e8f3bfeab8344fe6622fadd5d01457e31e8facd74cb
 cleartomark
 {restore}if
 %%EndProcSet
+Level1 SuppressPDFMark or 
+{} {
+/SDict 10 dict def
+systemdict /pdfmark known not {
+  userdict /pdfmark systemdict /cleartomark get put
+} if
+SDict begin [
+  /Title (Is Parallel Programming Hard, And, If So, What Can You Do About It?)
+  /Subject (gnuplot plot)
+  /Creator (gnuplot 5.0 patchlevel 3)
+  /Author (imre)
+%  /Producer (gnuplot)
+%  /Keywords ()
+  /CreationDate (Mon Jul 16 22:02:17 2018)
+  /DOCINFO pdfmark
+end
+} ifelse
+%
+% Support for boxed text - Ethan A Merritt May 2005
+%
+/InitTextBox { userdict /TBy2 3 -1 roll put userdict /TBx2 3 -1 roll put
+           userdict /TBy1 3 -1 roll put userdict /TBx1 3 -1 roll put
+	   /Boxing true def } def
+/ExtendTextBox { Boxing
+    { gsave dup false charpath pathbbox
+      dup TBy2 gt {userdict /TBy2 3 -1 roll put} {pop} ifelse
+      dup TBx2 gt {userdict /TBx2 3 -1 roll put} {pop} ifelse
+      dup TBy1 lt {userdict /TBy1 3 -1 roll put} {pop} ifelse
+      dup TBx1 lt {userdict /TBx1 3 -1 roll put} {pop} ifelse
+      grestore } if } def
+/PopTextBox { newpath TBx1 TBxmargin sub TBy1 TBymargin sub M
+               TBx1 TBxmargin sub TBy2 TBymargin add L
+	       TBx2 TBxmargin add TBy2 TBymargin add L
+	       TBx2 TBxmargin add TBy1 TBymargin sub L closepath } def
+/DrawTextBox { PopTextBox stroke /Boxing false def} def
+/FillTextBox { gsave PopTextBox 1 1 1 setrgbcolor fill grestore /Boxing false def} def
+0 0 0 0 InitTextBox
+/TBxmargin 20 def
+/TBymargin 20 def
+/Boxing false def
+/textshow { ExtendTextBox Gshow } def
+%
+% redundant definitions for compatibility with prologue.ps older than 5.0.2
+/LTB {BL [] LCb DL} def
+/LTb {PL [] LCb DL} def
 end
 %%EndProlog
 %%Page: 1 1
@@ -1861,595 +1904,436 @@ doclip
 0 setgray
 newpath
 (NimbusSanL-Regu) findfont 100 scalefont setfont
+BackgroundColor 0 lt 3 1 roll 0 lt exch 0 lt or or not {gsave BackgroundColor C clippath fill grestore} if
 1.000 UL
 LTb
-670 1050 M
+LCb setrgbcolor
+490 975 M
 63 0 V
-1636 0 R
+1786 0 R
 -63 0 V
 stroke
-610 1050 M
+430 975 M
 [ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 0)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-670 1239 M
+LCb setrgbcolor
+490 1181 M
 63 0 V
-1636 0 R
+1786 0 R
 -63 0 V
 stroke
-610 1239 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 5000)]
+430 1181 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 20)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-670 1428 M
+LCb setrgbcolor
+490 1386 M
 63 0 V
-1636 0 R
+1786 0 R
 -63 0 V
 stroke
-610 1428 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 10000)]
+430 1386 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 40)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-670 1617 M
+LCb setrgbcolor
+490 1592 M
 63 0 V
-1636 0 R
+1786 0 R
 -63 0 V
 stroke
-610 1617 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 15000)]
+430 1592 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 60)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-670 1806 M
+LCb setrgbcolor
+490 1797 M
 63 0 V
-1636 0 R
+1786 0 R
 -63 0 V
 stroke
-610 1806 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 20000)]
+430 1797 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 80)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-670 1994 M
+LCb setrgbcolor
+490 2003 M
 63 0 V
-1636 0 R
+1786 0 R
 -63 0 V
 stroke
-610 1994 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 25000)]
+430 2003 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 100)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-670 2183 M
+LCb setrgbcolor
+490 2208 M
 63 0 V
-1636 0 R
+1786 0 R
 -63 0 V
 stroke
-610 2183 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 30000)]
+430 2208 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 120)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-670 2372 M
+LCb setrgbcolor
+490 2414 M
 63 0 V
-1636 0 R
+1786 0 R
 -63 0 V
 stroke
-610 2372 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 35000)]
+430 2414 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 140)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-670 2561 M
+LCb setrgbcolor
+490 2619 M
 63 0 V
-1636 0 R
+1786 0 R
 -63 0 V
 stroke
-610 2561 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 40000)]
+430 2619 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 160)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-670 2750 M
+LCb setrgbcolor
+490 2825 M
 63 0 V
-1636 0 R
+1786 0 R
 -63 0 V
 stroke
-610 2750 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 45000)]
+430 2825 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 180)]
 ] -33.3 MRshow
 1.000 UL
 LTb
-670 1050 M
+LCb setrgbcolor
+490 975 M
 0 63 V
-0 1637 R
+0 1787 R
 0 -63 V
 stroke
-670 950 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 0)]
+490 875 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 1)]
 ] -33.3 MCshow
 1.000 UL
 LTb
-913 1050 M
+LCb setrgbcolor
+754 975 M
 0 63 V
-0 1637 R
+0 1787 R
 0 -63 V
 stroke
-913 950 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 20)]
+754 875 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 2)]
 ] -33.3 MCshow
 1.000 UL
 LTb
-1155 1050 M
+LCb setrgbcolor
+1018 975 M
 0 63 V
-0 1637 R
+0 1787 R
 0 -63 V
 stroke
-1155 950 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 40)]
+1018 875 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 3)]
 ] -33.3 MCshow
 1.000 UL
 LTb
-1398 1050 M
+LCb setrgbcolor
+1282 975 M
 0 63 V
-0 1637 R
+0 1787 R
 0 -63 V
 stroke
-1398 950 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 60)]
+1282 875 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 4)]
 ] -33.3 MCshow
 1.000 UL
 LTb
-1641 1050 M
+LCb setrgbcolor
+1547 975 M
 0 63 V
-0 1637 R
+0 1787 R
 0 -63 V
 stroke
-1641 950 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 80)]
+1547 875 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 5)]
 ] -33.3 MCshow
 1.000 UL
 LTb
-1884 1050 M
+LCb setrgbcolor
+1811 975 M
 0 63 V
-0 1637 R
+0 1787 R
 0 -63 V
 stroke
-1884 950 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 100)]
+1811 875 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 6)]
 ] -33.3 MCshow
 1.000 UL
 LTb
-2126 1050 M
+LCb setrgbcolor
+2075 975 M
 0 63 V
-0 1637 R
+0 1787 R
 0 -63 V
 stroke
-2126 950 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 120)]
+2075 875 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 7)]
 ] -33.3 MCshow
 1.000 UL
 LTb
-2369 1050 M
+LCb setrgbcolor
+2339 975 M
 0 63 V
-0 1637 R
+0 1787 R
 0 -63 V
 stroke
-2369 950 M
-[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 140)]
+2339 875 M
+[ [(NimbusSanL-Regu) 100.0 0.0 true true 0 ( 8)]
 ] -33.3 MCshow
 1.000 UL
 LTb
+LCb setrgbcolor
 1.000 UL
-LTb
-670 2750 N
-0 -1700 V
-1699 0 V
-0 1700 V
--1699 0 V
+LTB
+LCb setrgbcolor
+490 2825 N
+490 975 L
+1849 0 V
+0 1850 V
+-1849 0 V
 Z stroke
+1.000 UP
+1.000 UL
+LTb
 LCb setrgbcolor
-140 1900 M
+LCb setrgbcolor
+80 1900 M
 currentpoint gsave translate -270 rotate 0 0 moveto
 [ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (Time Per Increment \(ns\))]
 ] -33.3 MCshow
 grestore
 LTb
 LCb setrgbcolor
-1519 800 M
+1414 725 M
 [ [(NimbusSanL-Regu) 100.0 0.0 true true 0 (Number of CPUs \(Threads\))]
 ] -33.3 MCshow
 LTb
-1.000 UP
-1.000 UL
-LTb
 % Begin plot #1
 1.000 UP
 1.000 UL
-LT0
+LTb
+LCb setrgbcolor
 /NimbusSanL-Regu findfont 100 scalefont setfont
-682 1051 M
-0 1 V
--31 -1 R
-62 0 V
--62 1 R
-62 0 V
-18 12 R
-0 3 V
--31 -3 R
-62 0 V
--62 3 R
-62 0 V
-17 12 R
-0 6 V
--31 -6 R
-62 0 V
--62 6 R
-62 0 V
-18 20 R
-0 6 V
--31 -6 R
-62 0 V
--62 6 R
-62 0 V
-17 27 R
-0 9 V
--31 -9 R
-62 0 V
--62 9 R
-62 0 V
-18 32 R
-0 12 V
--31 -12 R
-62 0 V
--62 12 R
-62 0 V
-17 26 R
-0 14 V
--31 -14 R
-62 0 V
--62 14 R
-62 0 V
-18 32 R
-0 30 V
--31 -30 R
-62 0 V
--62 30 R
-62 0 V
-17 29 R
-0 46 V
--31 -46 R
-62 0 V
--62 46 R
-62 0 V
-18 6 R
-0 45 V
--31 -45 R
-62 0 V
--62 45 R
-62 0 V
-18 42 R
-0 48 V
--31 -48 R
-62 0 V
--62 48 R
-62 0 V
-17 24 R
-0 39 V
--31 -39 R
-62 0 V
--62 39 R
-62 0 V
-18 22 R
-0 58 V
--31 -58 R
-62 0 V
--62 58 R
-62 0 V
-17 24 R
-0 32 V
--31 -32 R
-62 0 V
--62 32 R
-62 0 V
-18 29 R
-0 82 V
--31 -82 R
-62 0 V
--62 82 R
-62 0 V
-17 -33 R
-0 74 V
--31 -74 R
-62 0 V
--62 74 R
-62 0 V
-18 -5 R
-0 79 V
--31 -79 R
-62 0 V
--62 79 R
-62 0 V
-17 -13 R
-0 83 V
--31 -83 R
-62 0 V
-stroke 1538 1921 M
--62 83 R
-62 0 V
-18 -32 R
-0 72 V
--31 -72 R
-62 0 V
--62 72 R
-62 0 V
-17 -12 R
-0 85 V
--31 -85 R
-62 0 V
--62 85 R
-62 0 V
-18 -31 R
-0 55 V
--31 -55 R
-62 0 V
--62 55 R
-62 0 V
-18 -12 R
-0 107 V
--31 -107 R
-62 0 V
--62 107 R
-62 0 V
-17 -48 R
-0 81 V
--31 -81 R
-62 0 V
--62 81 R
-62 0 V
-18 -31 R
-0 69 V
--31 -69 R
-62 0 V
--62 69 R
-62 0 V
-17 -36 R
-0 90 V
--31 -90 R
-62 0 V
--62 90 R
-62 0 V
-18 -51 R
-0 79 V
--31 -79 R
-62 0 V
--62 79 R
-62 0 V
-17 0 R
-0 47 V
--31 -47 R
-62 0 V
--62 47 R
-62 0 V
-18 -221 R
-0 217 V
--31 -217 R
-62 0 V
--62 217 R
-62 0 V
-17 31 R
-0 83 V
--31 -83 R
-62 0 V
--62 83 R
-62 0 V
-18 -291 R
-0 304 V
--31 -304 R
-62 0 V
--62 304 R
-62 0 V
-17 -44 R
-0 104 V
--31 -104 R
-62 0 V
--62 104 R
-62 0 V
-18 -16 R
-0 73 V
--31 -73 R
-62 0 V
--62 73 R
-62 0 V
-682 1052 Pls
-731 1066 Pls
-779 1081 Pls
-828 1108 Pls
-876 1143 Pls
-925 1185 Pls
-973 1224 Pls
-1022 1276 Pls
-1070 1339 Pls
-1119 1404 Pls
-1168 1479 Pls
-1216 1548 Pls
-1265 1630 Pls
-1313 1690 Pls
-1362 1764 Pls
-1410 1823 Pls
-1459 1888 Pls
-1507 1969 Pls
-1556 2005 Pls
-1604 2071 Pls
-1653 2123 Pls
-1702 2171 Pls
-1750 2223 Pls
-1799 2276 Pls
-1847 2336 Pls
-1896 2353 Pls
-1944 2416 Pls
-1993 2352 Pls
-2041 2515 Pls
-2090 2453 Pls
-2138 2572 Pls
-2187 2650 Pls
+/vshift -33 def
+490 1019 M
+0 10 V
+0 -10 R
+31 0 V
+-31 10 R
+31 0 V
+233 335 R
+0 28 V
+-31 -28 R
+62 0 V
+-62 28 R
+62 0 V
+233 102 R
+0 112 V
+987 1494 M
+62 0 V
+-62 112 R
+62 0 V
+233 3 R
+0 199 V
+-31 -199 R
+62 0 V
+-62 199 R
+62 0 V
+234 69 R
+0 133 V
+-31 -133 R
+62 0 V
+-62 133 R
+62 0 V
+233 -1 R
+0 241 V
+-31 -241 R
+62 0 V
+-62 241 R
+62 0 V
+233 -56 R
+0 238 V
+-31 -238 R
+62 0 V
+-62 238 R
+62 0 V
+233 63 R
+0 200 V
+-31 -200 R
+31 0 V
+-31 200 R
+31 0 V
+490 1023 Pls
+754 1378 Pls
+1018 1569 Pls
+1282 1696 Pls
+1547 1934 Pls
+1811 2119 Pls
+2075 2300 Pls
+2339 2625 Pls
 % End plot #1
 % Begin plot #2
 1.000 UL
+LTb
 LT1
+LCb setrgbcolor
 /NimbusSanL-Regu findfont 100 scalefont setfont
-682 1052 M
-49 14 V
-48 15 V
-49 27 V
-48 35 V
-49 42 V
-48 39 V
-49 52 V
-48 63 V
-49 65 V
-49 75 V
-48 69 V
-49 82 V
-48 60 V
-49 74 V
-48 59 V
-49 65 V
-48 81 V
-49 36 V
-48 66 V
-49 52 V
-49 48 V
-48 52 V
-49 53 V
-48 60 V
-49 17 V
-48 63 V
-49 -64 V
-48 163 V
-49 -62 V
-48 119 V
-49 78 V
+490 1023 M
+264 355 V
+264 191 V
+264 127 V
+265 238 V
+264 185 V
+264 181 V
+264 325 V
 % End plot #2
 % Begin plot #3
 stroke
+LTb
 LT2
+LCb setrgbcolor
 /NimbusSanL-Regu findfont 100 scalefont setfont
-682 1050 M
-15 0 V
-16 0 V
-15 0 V
-15 0 V
-15 0 V
-15 0 V
-16 0 V
-15 0 V
-15 0 V
-15 0 V
-15 0 V
-16 0 V
-15 0 V
-15 0 V
-15 0 V
-15 0 V
-16 0 V
-15 0 V
-15 0 V
-15 0 V
-15 0 V
-16 0 V
-15 0 V
-15 0 V
-15 0 V
-15 0 V
-16 0 V
-15 0 V
-15 0 V
-15 0 V
-15 0 V
-16 0 V
-15 0 V
-15 0 V
-15 0 V
-15 0 V
-16 0 V
-15 0 V
-15 0 V
-15 0 V
-15 0 V
-16 0 V
-15 0 V
-15 0 V
-15 0 V
-15 0 V
-16 0 V
-15 0 V
-15 0 V
-15 0 V
-15 0 V
-16 0 V
-15 0 V
-15 0 V
-15 0 V
-15 0 V
-16 0 V
-15 0 V
-15 0 V
-15 0 V
-15 0 V
-16 0 V
-15 0 V
-15 0 V
-15 0 V
-15 0 V
-16 0 V
-15 0 V
-15 0 V
-15 0 V
-15 0 V
-16 0 V
-15 0 V
-15 0 V
-15 0 V
-15 0 V
-16 0 V
-15 0 V
-15 0 V
-15 0 V
-15 0 V
-16 0 V
-15 0 V
-15 0 V
-15 0 V
-15 0 V
-16 0 V
-15 0 V
-15 0 V
-15 0 V
-15 0 V
-16 0 V
-15 0 V
-15 0 V
-15 0 V
-15 0 V
-16 0 V
-15 0 V
-15 0 V
+490 1066 M
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
+19 0 V
+18 0 V
+19 0 V
 % End plot #3
 stroke
+2.000 UL
 LTb
-670 2750 N
-0 -1700 V
-1699 0 V
-0 1700 V
--1699 0 V
+LCb setrgbcolor
+1.000 UL
+LTB
+LCb setrgbcolor
+490 2825 N
+490 975 L
+1849 0 V
+0 1850 V
+-1849 0 V
 Z stroke
 1.000 UP
 1.000 UL
 LTb
+LCb setrgbcolor
 stroke
 grestore
 end
diff --git a/CodeSamples/count/atomic125.png b/CodeSamples/count/atomic125.png
index f2b860ae4d0615f7580a5320ee7305cfd0777739..8cb327e16335a307735e8f9423a973fa5b7362aa 100644
GIT binary patch
delta 2747
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
BSH=JU

delta 2897
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
EKlOoE^Z)<=

diff --git a/count/count.tex b/count/count.tex
index 82d4a7f..b9cd888 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -267,8 +267,8 @@ accuracies far greater than 50\,\% are almost always necessary.
 \begin{figure}[tb]
 \centering
 \resizebox{2.5in}{!}{\includegraphics{CodeSamples/count/atomic}}
-\caption{Atomic Increment Scalability on Nehalem}
-\label{fig:count:Atomic Increment Scalability on Nehalem}
+\caption{Atomic Increment Scalability on Kaby Lake}
+\label{fig:count:Atomic Increment Scalability on Kaby Lake}
 \end{figure}

 The straightforward way to count accurately is to use atomic operations,
@@ -296,7 +296,7 @@ This poor performance should not be a surprise, given the discussion in
 Chapter~\ref{chp:Hardware and its Habits},
 nor should it be a surprise that the performance of atomic increment
 gets slower as the number of CPUs and threads increase, as shown in
-Figure~\ref{fig:count:Atomic Increment Scalability on Nehalem}.
+Figure~\ref{fig:count:Atomic Increment Scalability on Kaby Lake}.
 In this figure, the horizontal dashed line resting on the x~axis
 is the ideal performance that would be achieved
 by a perfectly scalable algorithm: with such an algorithm, a given
@@ -365,7 +365,7 @@ global variable, the cache line containing that variable must
 circulate among all the CPUs, as shown by the red arrows.
 Such circulation will take significant time, resulting in
 the poor performance seen in
-Figure~\ref{fig:count:Atomic Increment Scalability on Nehalem},
+Figure~\ref{fig:count:Atomic Increment Scalability on Kaby Lake},
 which might be thought of as shown in
 Figure~\ref{fig:count:Waiting to Count}.

@@ -3444,7 +3444,7 @@ courtesy of eventual consistency.
 	``Use the right tool for the job.''

 	As can be seen from
-	Figure~\ref{fig:count:Atomic Increment Scalability on Nehalem},
+	Figure~\ref{fig:count:Atomic Increment Scalability on Kaby Lake},
 	single-variable atomic increment need not apply for any job
 	involving heavy use of parallel updates.
 	In contrast, the algorithms shown in
@@ -3730,7 +3730,7 @@ Summarizing the summary:
 \item	Different levels of performance and scalability will affect
 	algorithm and data-structure design, as do a large number of
 	other factors.
-	Figure~\ref{fig:count:Atomic Increment Scalability on Nehalem}
+	Figure~\ref{fig:count:Atomic Increment Scalability on Kaby Lake}
 	illustrates this point:  Atomic increment might be completely
 	acceptable for a two-CPU system, but be completely inadequate for an
 	eight-CPU system.
diff --git a/defer/rcuintro.tex b/defer/rcuintro.tex
index 784c4cf..6e909c9 100644
--- a/defer/rcuintro.tex
+++ b/defer/rcuintro.tex
@@ -76,7 +76,7 @@ the figure.
 But how can we tell when the readers are finished?

 It is tempting to consider a reference-counting scheme, but
-Figure~\ref{fig:count:Atomic Increment Scalability on Nehalem}
+Figure~\ref{fig:count:Atomic Increment Scalability on Kaby Lake}
 in
 Chapter~\ref{chp:Counting}
 shows that this can also result in long delays, just as can
diff --git a/locking/locking.tex b/locking/locking.tex
index 7e93bdb..5db2358 100644
--- a/locking/locking.tex
+++ b/locking/locking.tex
@@ -1578,7 +1578,7 @@ Either way, line~22 releases the root \co{rcu_node} structure's
 	but only for relatively small numbers of CPUs.
 	To see why it is problematic in systems with many hundreds of
 	CPUs, look at
-	Figure~\ref{fig:count:Atomic Increment Scalability on Nehalem}
+	Figure~\ref{fig:count:Atomic Increment Scalability on Kaby Lake}
 	and extrapolate the delay from eight to 1,000 CPUs.
 } \QuickQuizEnd

-- 
2.7.4

