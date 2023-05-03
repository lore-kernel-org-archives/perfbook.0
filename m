Return-Path: <SRS0=XXQI=AY=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683157546; x=1685749546;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0oiGZMBI86rN/e3s4CTfpXvbonQA8nmpBRCtlmN0LD0=;
        b=BzpRA5GgvzE3CVAjrWrXA/YP7JjPx+1mhp/HnXbNVc+18nJLW2qAj7x+rJwRKbXcpC
         FOJ97jKcryNXt5NmXzG5rKf5La9fGt64Cij65KdPT1Rv55JQEvjcsCwyAjZpw2D3djpa
         x7wAXiD9VNzBDOQmPAxKCHZ+R/HsGeGQ667bx6QfN2UF+DJbKf1dbjKllZY92aCmr1X+
         hideQuo67SPhKEsqtJY8ToG28HqPz2rZs/DaYxXCkzQERd3feec2FHveQAlGLHZ9erYQ
         vlx+0swh/QBRyT8PrbbBafAOoBPsouAPMirgVUQxYnQ7iOg0HXtEkQ/Md5ajnQboHb6h
         Rm/w==
Message-ID: <058ced54-cd44-7db1-35b6-24f7c91ab116@gmail.com>
Date: Thu, 4 May 2023 08:45:40 +0900
MIME-Version: 1.0
Subject: [PATCH -perfbook 4/4] Update plot of RCU-test-ratio as of v6.3
Content-Language: en-US
References: <0d6a6549-6292-d30b-c1a3-19b42f672480@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <0d6a6549-6292-d30b-c1a3-19b42f672480@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 CodeSamples/formal/data/RCU-test-ratio.eps | 3034 ++++++++++----------
 1 file changed, 1534 insertions(+), 1500 deletions(-)

diff --git a/CodeSamples/formal/data/RCU-test-ratio.eps b/CodeSamples/formal/data/RCU-test-ratio.eps
index fda03a84cbd7..fb2828e36c5f 100644
--- a/CodeSamples/formal/data/RCU-test-ratio.eps
+++ b/CodeSamples/formal/data/RCU-test-ratio.eps
@@ -1,9 +1,9 @@
 %!PS-Adobe-2.0
 %%Title: RCU-test-ratio.eps
 %%Creator: gnuplot 5.2 patchlevel 8
-%%CreationDate: Thu Feb 23 22:38:30 2023
+%%CreationDate: Wed May  3 17:12:30 2023
 %%DocumentFonts: (atend)
-%%BoundingBox: 50 50 453 230
+%%BoundingBox: 50 50 654 320
 %%Orientation: Portrait
 %%Pages: (atend)
 %%EndComments
@@ -30,7 +30,7 @@ gnudict begin
 /Gamma 1.0 def
 /BackgroundColor {-1.000 -1.000 -1.000} def
 %
-/vshift -26 def
+/vshift -40 def
 /dl1 {
   10.0 Dashlength userlinewidth gnulinewidth div mul mul mul
   Rounded { currentlinewidth 0.75 mul sub dup 0 le { pop 0.01 } if } if
@@ -45,7 +45,7 @@ gnudict begin
 /vpt vpt_ def
 /doclip {
   ClipToBoundingBox {
-    newpath 50 50 moveto 453 50 lineto 453 230 lineto 50 230 lineto closepath
+    newpath 50 50 moveto 654 50 lineto 654 320 lineto 50 320 lineto closepath
     clip
   } if
 } def
@@ -471,7 +471,7 @@ currentdict end definefont pop
   Blacktext {gsave 0 setgray MFshow grestore} {MFshow} ifelse } bind def
 /XYsave    { [( ) 1 2 true false 3 ()] } bind def
 /XYrestore { [( ) 1 2 true false 4 ()] } bind def
-%%BeginProcSet: /usr/local/texlive/2022/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb
+%%BeginProcSet: /usr/local/texlive/2023/texmf-dist/fonts/type1/urw/helvetic/uhvr8a.pfb
 %!PS-AdobeFont-1.0: NimbusSanL-Regu 1.05a
 %%Title: NimbusSanL-Regu
 %%CreationDate: Thu Mar 20 10:08:51 2003
@@ -1872,7 +1872,7 @@ SDict begin [
   /Creator (gnuplot 5.2 patchlevel 8)
 %  /Producer (gnuplot)
 %  /Keywords ()
-  /CreationDate (Thu Feb 23 22:38:30 2023)
+  /CreationDate (Wed May  3 17:12:30 2023)
   /DOCINFO pdfmark
 end
 } ifelse
@@ -1912,1747 +1912,1769 @@ doclip
 0.100 0.100 scale
 0 setgray
 newpath
-(NimbusSanL-Regu) findfont 80 scalefont setfont
+(NimbusSanL-Regu) findfont 120 scalefont setfont
 BackgroundColor 0 lt 3 1 roll 0 lt exch 0 lt or or not {gsave BackgroundColor C clippath fill grestore} if
 1.000 UL
 LTb
 LCb setrgbcolor
-551 512 M
+795 768 M
 -63 0 V
 stroke
-440 512 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0)]
-] -26.7 MRshow
-/NimbusSanL-Regu findfont 80 scalefont setfont
-/vshift -26 def
+660 768 M
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 ( 0)]
+] -40.0 MRshow
+/NimbusSanL-Regu findfont 120 scalefont setfont
+/vshift -40 def
 1.000 UL
 LTb
 LCb setrgbcolor
-551 685 M
+795 1027 M
 -63 0 V
 stroke
-440 685 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 5000)]
-] -26.7 MRshow
-/NimbusSanL-Regu findfont 80 scalefont setfont
+660 1027 M
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 ( 5000)]
+] -40.0 MRshow
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-551 857 M
+795 1286 M
 -63 0 V
 stroke
-440 857 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 10000)]
-] -26.7 MRshow
-/NimbusSanL-Regu findfont 80 scalefont setfont
+660 1286 M
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 ( 10000)]
+] -40.0 MRshow
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-551 1030 M
+795 1545 M
 -63 0 V
 stroke
-440 1030 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 15000)]
-] -26.7 MRshow
-/NimbusSanL-Regu findfont 80 scalefont setfont
+660 1545 M
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 ( 15000)]
+] -40.0 MRshow
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-551 1202 M
+795 1803 M
 -63 0 V
 stroke
-440 1202 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 20000)]
-] -26.7 MRshow
-/NimbusSanL-Regu findfont 80 scalefont setfont
+660 1803 M
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 ( 20000)]
+] -40.0 MRshow
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-551 1375 M
+795 2062 M
 -63 0 V
 stroke
-440 1375 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 25000)]
-] -26.7 MRshow
-/NimbusSanL-Regu findfont 80 scalefont setfont
+660 2062 M
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 ( 25000)]
+] -40.0 MRshow
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-551 1547 M
+795 2321 M
 -63 0 V
 stroke
-440 1547 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 30000)]
-] -26.7 MRshow
-/NimbusSanL-Regu findfont 80 scalefont setfont
+660 2321 M
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 ( 30000)]
+] -40.0 MRshow
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-551 1720 M
+795 2580 M
 -63 0 V
 stroke
-440 1720 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 35000)]
-] -26.7 MRshow
-/NimbusSanL-Regu findfont 80 scalefont setfont
+660 2580 M
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 ( 35000)]
+] -40.0 MRshow
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-583 512 M
+843 768 M
 stroke
-583 464 M
+843 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.12)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.12)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-615 512 M
+891 768 M
 stroke
 LTb
 LCb setrgbcolor
-646 512 M
+938 768 M
 stroke
 LTb
 LCb setrgbcolor
-678 512 M
+986 768 M
 stroke
 LTb
 LCb setrgbcolor
-710 512 M
+1034 768 M
 stroke
-710 464 M
+1034 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.16)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.16)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-742 512 M
+1082 768 M
 stroke
 LTb
 LCb setrgbcolor
-773 512 M
+1130 768 M
 stroke
 LTb
 LCb setrgbcolor
-805 512 M
+1177 768 M
 stroke
 LTb
 LCb setrgbcolor
-837 512 M
+1225 768 M
 stroke
-837 464 M
+1225 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.20)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.20)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-869 512 M
+1273 768 M
 stroke
 LTb
 LCb setrgbcolor
-900 512 M
+1321 768 M
 stroke
 LTb
 LCb setrgbcolor
-932 512 M
+1368 768 M
 stroke
 LTb
 LCb setrgbcolor
-964 512 M
+1416 768 M
 stroke
-964 464 M
+1416 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.24)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.24)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-996 512 M
+1464 768 M
 stroke
 LTb
 LCb setrgbcolor
-1027 512 M
+1512 768 M
 stroke
 LTb
 LCb setrgbcolor
-1059 512 M
+1560 768 M
 stroke
 LTb
 LCb setrgbcolor
-1091 512 M
+1607 768 M
 stroke
-1091 464 M
+1607 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.28)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.28)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-1123 512 M
+1655 768 M
 stroke
 LTb
 LCb setrgbcolor
-1154 512 M
+1703 768 M
 stroke
 LTb
 LCb setrgbcolor
-1186 512 M
+1751 768 M
 stroke
 LTb
 LCb setrgbcolor
-1218 512 M
+1799 768 M
 stroke
-1218 464 M
+1799 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.32)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.32)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-1250 512 M
+1846 768 M
 stroke
 LTb
 LCb setrgbcolor
-1281 512 M
+1894 768 M
 stroke
 LTb
 LCb setrgbcolor
-1313 512 M
+1942 768 M
 stroke
 LTb
 LCb setrgbcolor
-1345 512 M
+1990 768 M
 stroke
-1345 464 M
+1990 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v2.6.36)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v2.6.36)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-1377 512 M
+2037 768 M
 stroke
 LTb
 LCb setrgbcolor
-1408 512 M
+2085 768 M
 stroke
 LTb
 LCb setrgbcolor
-1440 512 M
+2133 768 M
 stroke
 LTb
 LCb setrgbcolor
-1472 512 M
+2181 768 M
 stroke
-1472 464 M
+2181 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.0)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.0)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-1504 512 M
+2229 768 M
 stroke
 LTb
 LCb setrgbcolor
-1535 512 M
+2276 768 M
 stroke
 LTb
 LCb setrgbcolor
-1567 512 M
+2324 768 M
 stroke
 LTb
 LCb setrgbcolor
-1599 512 M
+2372 768 M
 stroke
-1599 464 M
+2372 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.4)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.4)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-1631 512 M
+2420 768 M
 stroke
 LTb
 LCb setrgbcolor
-1662 512 M
+2468 768 M
 stroke
 LTb
 LCb setrgbcolor
-1694 512 M
+2515 768 M
 stroke
 LTb
 LCb setrgbcolor
-1726 512 M
+2563 768 M
 stroke
-1726 464 M
+2563 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.8)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.8)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-1758 512 M
+2611 768 M
 stroke
 LTb
 LCb setrgbcolor
-1789 512 M
+2659 768 M
 stroke
 LTb
 LCb setrgbcolor
-1821 512 M
+2706 768 M
 stroke
 LTb
 LCb setrgbcolor
-1853 512 M
+2754 768 M
 stroke
-1853 464 M
+2754 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.12)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.12)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-1885 512 M
+2802 768 M
 stroke
 LTb
 LCb setrgbcolor
-1916 512 M
+2850 768 M
 stroke
 LTb
 LCb setrgbcolor
-1948 512 M
+2898 768 M
 stroke
 LTb
 LCb setrgbcolor
-1980 512 M
+2945 768 M
 stroke
-1980 464 M
+2945 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v3.16)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v3.16)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-2012 512 M
+2993 768 M
 stroke
 LTb
 LCb setrgbcolor
-2043 512 M
+3041 768 M
 stroke
 LTb
 LCb setrgbcolor
-2075 512 M
+3089 768 M
 stroke
 LTb
 LCb setrgbcolor
-2107 512 M
+3137 768 M
 stroke
-2107 464 M
+3137 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.0)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.0)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-2139 512 M
+3184 768 M
 stroke
 LTb
 LCb setrgbcolor
-2170 512 M
+3232 768 M
 stroke
 LTb
 LCb setrgbcolor
-2202 512 M
+3280 768 M
 stroke
 LTb
 LCb setrgbcolor
-2234 512 M
+3328 768 M
 stroke
-2234 464 M
+3328 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.4)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.4)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-2266 512 M
+3376 768 M
 stroke
 LTb
 LCb setrgbcolor
-2297 512 M
+3423 768 M
 stroke
 LTb
 LCb setrgbcolor
-2329 512 M
+3471 768 M
 stroke
 LTb
 LCb setrgbcolor
-2361 512 M
+3519 768 M
 stroke
-2361 464 M
+3519 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.8)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.8)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-2393 512 M
+3567 768 M
 stroke
 LTb
 LCb setrgbcolor
-2424 512 M
+3614 768 M
 stroke
 LTb
 LCb setrgbcolor
-2456 512 M
+3662 768 M
 stroke
 LTb
 LCb setrgbcolor
-2488 512 M
+3710 768 M
 stroke
-2488 464 M
+3710 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.12)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.12)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-2520 512 M
+3758 768 M
 stroke
 LTb
 LCb setrgbcolor
-2551 512 M
+3806 768 M
 stroke
 LTb
 LCb setrgbcolor
-2583 512 M
+3853 768 M
 stroke
 LTb
 LCb setrgbcolor
-2615 512 M
+3901 768 M
 stroke
-2615 464 M
+3901 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v4.16)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v4.16)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-2647 512 M
+3949 768 M
 stroke
 LTb
 LCb setrgbcolor
-2678 512 M
+3997 768 M
 stroke
 LTb
 LCb setrgbcolor
-2710 512 M
+4045 768 M
 stroke
 LTb
 LCb setrgbcolor
-2742 512 M
+4092 768 M
 stroke
 LTb
 LCb setrgbcolor
-2774 512 M
+4140 768 M
 stroke
-2774 464 M
+4140 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.0)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.0)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-2805 512 M
+4188 768 M
 stroke
 LTb
 LCb setrgbcolor
-2837 512 M
+4236 768 M
 stroke
 LTb
 LCb setrgbcolor
-2869 512 M
+4283 768 M
 stroke
 LTb
 LCb setrgbcolor
-2901 512 M
+4331 768 M
 stroke
-2901 464 M
+4331 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.4)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.4)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-2932 512 M
+4379 768 M
 stroke
 LTb
 LCb setrgbcolor
-2964 512 M
+4427 768 M
 stroke
 LTb
 LCb setrgbcolor
-2996 512 M
+4475 768 M
 stroke
 LTb
 LCb setrgbcolor
-3028 512 M
+4522 768 M
 stroke
-3028 464 M
+4522 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.8)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.8)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-3059 512 M
+4570 768 M
 stroke
 LTb
 LCb setrgbcolor
-3091 512 M
+4618 768 M
 stroke
 LTb
 LCb setrgbcolor
-3123 512 M
+4666 768 M
 stroke
 LTb
 LCb setrgbcolor
-3155 512 M
+4714 768 M
 stroke
-3155 464 M
+4714 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.12)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.12)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-3186 512 M
+4761 768 M
 stroke
 LTb
 LCb setrgbcolor
-3218 512 M
+4809 768 M
 stroke
 LTb
 LCb setrgbcolor
-3250 512 M
+4857 768 M
 stroke
 LTb
 LCb setrgbcolor
-3282 512 M
+4905 768 M
 stroke
-3282 464 M
+4905 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v5.16)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v5.16)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-3313 512 M
+4952 768 M
 stroke
 LTb
 LCb setrgbcolor
-3345 512 M
+5000 768 M
 stroke
 LTb
 LCb setrgbcolor
-3377 512 M
+5048 768 M
 stroke
 LTb
 LCb setrgbcolor
-3409 512 M
+5096 768 M
 stroke
-3409 464 M
+5096 696 M
 currentpoint gsave translate 90 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (v6.0)]
-] -26.7 MRshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v6.0)]
+] -40.0 MRshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-3440 512 M
+5144 768 M
 stroke
 LTb
 LCb setrgbcolor
-3472 512 M
+5191 768 M
 stroke
 LTb
 LCb setrgbcolor
-3504 512 M
+5239 768 M
+stroke
+5239 696 M
+currentpoint gsave translate 90 rotate 0 0 moveto
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (v6.3)]
+] -40.0 MRshow
+grestore
+/NimbusSanL-Regu findfont 120 scalefont setfont
+1.000 UL
+LTb
+LCb setrgbcolor
+5287 768 M
 63 0 V
 stroke
-3615 512 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 0)]
-] -26.7 MLshow
-/NimbusSanL-Regu findfont 80 scalefont setfont
+5422 768 M
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 ( 0)]
+] -40.0 MLshow
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-3504 754 M
+5287 1130 M
 63 0 V
 stroke
-3615 754 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 10)]
-] -26.7 MLshow
-/NimbusSanL-Regu findfont 80 scalefont setfont
+5422 1130 M
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 ( 10)]
+] -40.0 MLshow
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-3504 995 M
+5287 1493 M
 63 0 V
 stroke
-3615 995 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 20)]
-] -26.7 MLshow
-/NimbusSanL-Regu findfont 80 scalefont setfont
+5422 1493 M
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 ( 20)]
+] -40.0 MLshow
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-3504 1237 M
+5287 1855 M
 63 0 V
 stroke
-3615 1237 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 30)]
-] -26.7 MLshow
-/NimbusSanL-Regu findfont 80 scalefont setfont
+5422 1855 M
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 ( 30)]
+] -40.0 MLshow
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-3504 1478 M
+5287 2218 M
 63 0 V
 stroke
-3615 1478 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 40)]
-] -26.7 MLshow
-/NimbusSanL-Regu findfont 80 scalefont setfont
+5422 2218 M
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 ( 40)]
+] -40.0 MLshow
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
-3504 1720 M
+5287 2580 M
 63 0 V
 stroke
-3615 1720 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 ( 50)]
-] -26.7 MLshow
-/NimbusSanL-Regu findfont 80 scalefont setfont
+5422 2580 M
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 ( 50)]
+] -40.0 MLshow
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 LCb setrgbcolor
 1.000 UL
 LTB
 LCb setrgbcolor
-551 1720 N
-551 512 L
-2953 0 V
-0 1208 V
--2953 0 V
+795 2580 N
+795 768 L
+4492 0 V
+0 1812 V
+-4492 0 V
 Z stroke
 1.000 UP
 1.000 UL
 LTb
 LCb setrgbcolor
 LCb setrgbcolor
-76 1116 M
+114 1674 M
 currentpoint gsave translate -270 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (LoC)]
-] -26.7 MCshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (LoC)]
+] -40.0 MCshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 LTb
 LCb setrgbcolor
-3847 1116 M
+5770 1674 M
 currentpoint gsave translate -270 rotate 0 0 moveto
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (% Test)]
-] -26.7 MCshow
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (% Test)]
+] -40.0 MCshow
 grestore
-/NimbusSanL-Regu findfont 80 scalefont setfont
+/NimbusSanL-Regu findfont 120 scalefont setfont
 LTb
 LCb setrgbcolor
-2027 56 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (Linux Release)]
-] -26.7 MCshow
-/NimbusSanL-Regu findfont 80 scalefont setfont
+3041 84 M
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (Linux Release)]
+] -40.0 MCshow
+/NimbusSanL-Regu findfont 120 scalefont setfont
 LTb
 % Begin plot #1
 1.000 UL
 LTb
 0.00 0.00 0.00 C
 LCb setrgbcolor
-2044 1617 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (RCU)]
-] -26.7 MRshow
-/NimbusSanL-Regu findfont 80 scalefont setfont
+3081 2457 M
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (RCU)]
+] -40.0 MRshow
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2092 1597 255 40 BoxColFill
+0.180 3153 2427 351 60 BoxColFill
 LCb setrgbcolor
-2092 1597 N
-255 0 V
+3153 2427 N
+351 0 V
+0 60 V
+-351 0 V
+0 -60 V
+Z stroke
+1.000 UL
+LTb
+0.00 0.00 0.00 C
+0.180 826 768 35 41 BoxColFill
+LCb setrgbcolor
+826 768 N
 0 40 V
--255 0 V
+34 0 V
 0 -40 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 572 512 23 28 BoxColFill
+0.180 874 768 34 41 BoxColFill
 LCb setrgbcolor
-572 512 N
-0 27 V
-22 0 V
-0 -27 V
--22 0 V
+874 768 N
+0 40 V
+33 0 V
+0 -40 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 603 512 24 28 BoxColFill
+0.180 922 768 34 54 BoxColFill
 LCb setrgbcolor
-603 512 N
-0 27 V
-23 0 V
-0 -27 V
--23 0 V
+922 768 N
+0 53 V
+33 0 V
+0 -53 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 635 512 23 36 BoxColFill
+0.180 969 768 35 57 BoxColFill
 LCb setrgbcolor
-635 512 N
-0 35 V
-22 0 V
-0 -35 V
--22 0 V
+969 768 N
+0 56 V
+34 0 V
+0 -56 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 667 512 23 38 BoxColFill
+0.180 1017 768 35 47 BoxColFill
 LCb setrgbcolor
-667 512 N
-0 37 V
-22 0 V
-0 -37 V
--22 0 V
+1017 768 N
+0 46 V
+34 0 V
+0 -46 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 699 512 23 32 BoxColFill
+0.180 1065 768 34 48 BoxColFill
 LCb setrgbcolor
-699 512 N
-0 31 V
-22 0 V
-0 -31 V
--22 0 V
+1065 768 N
+0 47 V
+33 0 V
+0 -47 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 730 512 24 32 BoxColFill
+0.180 1113 768 34 49 BoxColFill
 LCb setrgbcolor
-730 512 N
-0 31 V
-23 0 V
-0 -31 V
--23 0 V
+1113 768 N
+0 48 V
+33 0 V
+0 -48 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 762 512 23 33 BoxColFill
+0.180 1161 768 34 65 BoxColFill
 LCb setrgbcolor
-762 512 N
-0 32 V
-22 0 V
-0 -32 V
--22 0 V
+1161 768 N
+0 64 V
+33 0 V
+0 -64 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 794 512 23 44 BoxColFill
+0.180 1208 768 35 65 BoxColFill
 LCb setrgbcolor
-794 512 N
-0 43 V
-22 0 V
-0 -43 V
--22 0 V
+1208 768 N
+0 64 V
+34 0 V
+0 -64 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 826 512 23 44 BoxColFill
+0.180 1256 768 35 65 BoxColFill
 LCb setrgbcolor
-826 512 N
-0 43 V
-22 0 V
-0 -43 V
--22 0 V
+1256 768 N
+0 64 V
+34 0 V
+0 -64 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 857 512 24 44 BoxColFill
+0.180 1304 768 34 65 BoxColFill
 LCb setrgbcolor
-857 512 N
-0 43 V
-23 0 V
-0 -43 V
--23 0 V
+1304 768 N
+0 64 V
+33 0 V
+0 -64 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 889 512 23 44 BoxColFill
+0.180 1352 768 34 65 BoxColFill
 LCb setrgbcolor
-889 512 N
-0 43 V
-22 0 V
-0 -43 V
--22 0 V
+1352 768 N
+0 64 V
+33 0 V
+0 -64 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 921 512 23 44 BoxColFill
+0.180 1400 768 34 67 BoxColFill
 LCb setrgbcolor
-921 512 N
-0 43 V
-22 0 V
-0 -43 V
--22 0 V
+1400 768 N
+0 66 V
+33 0 V
+0 -66 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 953 512 23 45 BoxColFill
+0.180 1447 768 35 164 BoxColFill
 LCb setrgbcolor
-953 512 N
-0 44 V
-22 0 V
-0 -44 V
--22 0 V
+1447 768 N
+0 163 V
+34 0 V
+0 -163 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 984 512 24 110 BoxColFill
+0.180 1495 768 35 164 BoxColFill
 LCb setrgbcolor
-984 512 N
-0 109 V
-23 0 V
-0 -109 V
--23 0 V
+1495 768 N
+0 163 V
+34 0 V
+0 -163 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1016 512 23 109 BoxColFill
+0.180 1543 768 34 207 BoxColFill
 LCb setrgbcolor
-1016 512 N
-0 108 V
-22 0 V
-0 -108 V
--22 0 V
+1543 768 N
+0 206 V
+33 0 V
+0 -206 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1048 512 23 138 BoxColFill
+0.180 1591 768 34 217 BoxColFill
 LCb setrgbcolor
-1048 512 N
-0 137 V
-22 0 V
-0 -137 V
--22 0 V
+1591 768 N
+0 216 V
+33 0 V
+0 -216 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1080 512 23 145 BoxColFill
+0.180 1638 768 35 337 BoxColFill
 LCb setrgbcolor
-1080 512 N
-0 144 V
-22 0 V
-0 -144 V
--22 0 V
+1638 768 N
+0 336 V
+34 0 V
+0 -336 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1111 512 24 225 BoxColFill
+0.180 1686 768 35 339 BoxColFill
 LCb setrgbcolor
-1111 512 N
-0 224 V
-23 0 V
-0 -224 V
--23 0 V
+1686 768 N
+0 338 V
+34 0 V
+0 -338 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1143 512 23 226 BoxColFill
+0.180 1734 768 34 344 BoxColFill
 LCb setrgbcolor
-1143 512 N
-0 225 V
-22 0 V
-0 -225 V
--22 0 V
+1734 768 N
+0 343 V
+33 0 V
+0 -343 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1175 512 23 230 BoxColFill
+0.180 1782 768 34 234 BoxColFill
 LCb setrgbcolor
-1175 512 N
-0 229 V
-22 0 V
-0 -229 V
--22 0 V
+1782 768 N
+0 233 V
+33 0 V
+0 -233 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1207 512 23 156 BoxColFill
+0.180 1830 768 34 273 BoxColFill
 LCb setrgbcolor
-1207 512 N
-0 155 V
-22 0 V
-0 -155 V
--22 0 V
+1830 768 N
+0 272 V
+33 0 V
+0 -272 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1238 512 24 183 BoxColFill
+0.180 1877 768 35 304 BoxColFill
 LCb setrgbcolor
-1238 512 N
-0 182 V
-23 0 V
-0 -182 V
--23 0 V
+1877 768 N
+0 303 V
+34 0 V
+0 -303 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1270 512 23 203 BoxColFill
+0.180 1925 768 35 316 BoxColFill
 LCb setrgbcolor
-1270 512 N
-0 202 V
-22 0 V
-0 -202 V
--22 0 V
+1925 768 N
+0 315 V
+34 0 V
+0 -315 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1302 512 23 211 BoxColFill
+0.180 1973 768 34 329 BoxColFill
 LCb setrgbcolor
-1302 512 N
-0 210 V
-22 0 V
-0 -210 V
--22 0 V
+1973 768 N
+0 328 V
+33 0 V
+0 -328 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1334 512 23 220 BoxColFill
+0.180 2021 768 34 370 BoxColFill
 LCb setrgbcolor
-1334 512 N
-0 219 V
-22 0 V
-0 -219 V
--22 0 V
+2021 768 N
+0 369 V
+33 0 V
+0 -369 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1365 512 24 247 BoxColFill
+0.180 2069 768 34 407 BoxColFill
 LCb setrgbcolor
-1365 512 N
-0 246 V
-23 0 V
-0 -246 V
--23 0 V
+2069 768 N
+0 406 V
+33 0 V
+0 -406 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1397 512 23 271 BoxColFill
+0.180 2116 768 35 408 BoxColFill
 LCb setrgbcolor
-1397 512 N
-0 270 V
-22 0 V
-0 -270 V
--22 0 V
+2116 768 N
+0 407 V
+34 0 V
+0 -407 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1429 512 23 272 BoxColFill
+0.180 2164 768 35 469 BoxColFill
 LCb setrgbcolor
-1429 512 N
-0 271 V
-22 0 V
-0 -271 V
--22 0 V
+2164 768 N
+0 468 V
+34 0 V
+0 -468 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1461 512 23 313 BoxColFill
+0.180 2212 768 34 469 BoxColFill
 LCb setrgbcolor
-1461 512 N
-0 312 V
-22 0 V
-0 -312 V
--22 0 V
+2212 768 N
+0 468 V
+33 0 V
+0 -468 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1492 512 24 313 BoxColFill
+0.180 2260 768 34 478 BoxColFill
 LCb setrgbcolor
-1492 512 N
-0 312 V
-23 0 V
-0 -312 V
--23 0 V
+2260 768 N
+0 477 V
+33 0 V
+0 -477 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1524 512 23 319 BoxColFill
+0.180 2307 768 35 506 BoxColFill
 LCb setrgbcolor
-1524 512 N
-0 318 V
-22 0 V
-0 -318 V
--22 0 V
+2307 768 N
+0 505 V
+34 0 V
+0 -505 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1556 512 23 337 BoxColFill
+0.180 2355 768 35 534 BoxColFill
 LCb setrgbcolor
-1556 512 N
-0 336 V
-22 0 V
-0 -336 V
--22 0 V
+2355 768 N
+0 533 V
+34 0 V
+0 -533 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1588 512 23 356 BoxColFill
+0.180 2403 768 34 566 BoxColFill
 LCb setrgbcolor
-1588 512 N
-0 355 V
-22 0 V
-0 -355 V
--22 0 V
+2403 768 N
+0 565 V
+33 0 V
+0 -565 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1619 512 24 378 BoxColFill
+0.180 2451 768 34 567 BoxColFill
 LCb setrgbcolor
-1619 512 N
-0 377 V
-23 0 V
-0 -377 V
--23 0 V
+2451 768 N
+0 566 V
+33 0 V
+0 -566 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1651 512 23 378 BoxColFill
+0.180 2499 768 34 569 BoxColFill
 LCb setrgbcolor
-1651 512 N
-0 377 V
-22 0 V
-0 -377 V
--22 0 V
+2499 768 N
+0 568 V
+33 0 V
+0 -568 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1683 512 23 380 BoxColFill
+0.180 2546 768 35 601 BoxColFill
 LCb setrgbcolor
-1683 512 N
-0 379 V
-22 0 V
-0 -379 V
--22 0 V
+2546 768 N
+0 600 V
+34 0 V
+0 -600 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1715 512 23 401 BoxColFill
+0.180 2594 768 35 611 BoxColFill
 LCb setrgbcolor
-1715 512 N
-0 400 V
-22 0 V
-0 -400 V
--22 0 V
+2594 768 N
+0 610 V
+34 0 V
+0 -610 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1746 512 24 408 BoxColFill
+0.180 2642 768 34 613 BoxColFill
 LCb setrgbcolor
-1746 512 N
-0 407 V
-23 0 V
-0 -407 V
--23 0 V
+2642 768 N
+0 612 V
+33 0 V
+0 -612 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1778 512 23 409 BoxColFill
+0.180 2690 768 34 557 BoxColFill
 LCb setrgbcolor
-1778 512 N
-0 408 V
-22 0 V
-0 -408 V
--22 0 V
+2690 768 N
+0 556 V
+33 0 V
+0 -556 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1810 512 23 372 BoxColFill
+0.180 2738 768 34 578 BoxColFill
 LCb setrgbcolor
-1810 512 N
-0 371 V
-22 0 V
-0 -371 V
--22 0 V
+2738 768 N
+0 577 V
+33 0 V
+0 -577 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1842 512 23 386 BoxColFill
+0.180 2785 768 35 589 BoxColFill
 LCb setrgbcolor
-1842 512 N
-0 385 V
-22 0 V
-0 -385 V
--22 0 V
+2785 768 N
+0 588 V
+34 0 V
+0 -588 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1873 512 24 393 BoxColFill
+0.180 2833 768 35 599 BoxColFill
 LCb setrgbcolor
-1873 512 N
-0 392 V
-23 0 V
-0 -392 V
--23 0 V
+2833 768 N
+0 598 V
+34 0 V
+0 -598 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1905 512 23 400 BoxColFill
+0.180 2881 768 34 603 BoxColFill
 LCb setrgbcolor
-1905 512 N
-0 399 V
-22 0 V
-0 -399 V
--22 0 V
+2881 768 N
+0 602 V
+33 0 V
+0 -602 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1937 512 23 402 BoxColFill
+0.180 2929 768 34 614 BoxColFill
 LCb setrgbcolor
-1937 512 N
-0 401 V
-22 0 V
-0 -401 V
--22 0 V
+2929 768 N
+0 613 V
+33 0 V
+0 -613 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 1969 512 23 410 BoxColFill
+0.180 2976 768 35 626 BoxColFill
 LCb setrgbcolor
-1969 512 N
-0 409 V
-22 0 V
-0 -409 V
--22 0 V
+2976 768 N
+0 625 V
+34 0 V
+0 -625 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2001 512 23 418 BoxColFill
+0.180 3024 768 35 657 BoxColFill
 LCb setrgbcolor
-2001 512 N
-0 417 V
-22 0 V
-0 -417 V
--22 0 V
+3024 768 N
+0 656 V
+34 0 V
+0 -656 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2032 512 23 439 BoxColFill
+0.180 3072 768 35 664 BoxColFill
 LCb setrgbcolor
-2032 512 N
-0 438 V
-22 0 V
-0 -438 V
--22 0 V
+3072 768 N
+0 663 V
+34 0 V
+0 -663 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2064 512 23 443 BoxColFill
+0.180 3120 768 34 662 BoxColFill
 LCb setrgbcolor
-2064 512 N
-0 442 V
-22 0 V
-0 -442 V
--22 0 V
+3120 768 N
+0 661 V
+33 0 V
+0 -661 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2096 512 23 442 BoxColFill
+0.180 3168 768 34 674 BoxColFill
 LCb setrgbcolor
-2096 512 N
-0 441 V
-22 0 V
-0 -441 V
--22 0 V
+3168 768 N
+0 673 V
+33 0 V
+0 -673 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2128 512 23 450 BoxColFill
+0.180 3215 768 35 675 BoxColFill
 LCb setrgbcolor
-2128 512 N
-0 449 V
-22 0 V
-0 -449 V
--22 0 V
+3215 768 N
+0 674 V
+34 0 V
+0 -674 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2159 512 24 451 BoxColFill
+0.180 3263 768 35 683 BoxColFill
 LCb setrgbcolor
-2159 512 N
-0 450 V
-23 0 V
-0 -450 V
--23 0 V
+3263 768 N
+0 682 V
+34 0 V
+0 -682 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2191 512 23 456 BoxColFill
+0.180 3311 768 34 716 BoxColFill
 LCb setrgbcolor
-2191 512 N
-0 455 V
-22 0 V
-0 -455 V
--22 0 V
+3311 768 N
+0 715 V
+33 0 V
+0 -715 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2223 512 23 478 BoxColFill
+0.180 3359 768 34 724 BoxColFill
 LCb setrgbcolor
-2223 512 N
-0 477 V
-22 0 V
-0 -477 V
--22 0 V
+3359 768 N
+0 723 V
+33 0 V
+0 -723 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2255 512 23 483 BoxColFill
+0.180 3407 768 34 729 BoxColFill
 LCb setrgbcolor
-2255 512 N
-0 482 V
-22 0 V
-0 -482 V
--22 0 V
+3407 768 N
+0 728 V
+33 0 V
+0 -728 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2286 512 24 487 BoxColFill
+0.180 3454 768 35 737 BoxColFill
 LCb setrgbcolor
-2286 512 N
-0 486 V
-23 0 V
-0 -486 V
--23 0 V
+3454 768 N
+0 736 V
+34 0 V
+0 -736 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2318 512 23 492 BoxColFill
+0.180 3502 768 35 741 BoxColFill
 LCb setrgbcolor
-2318 512 N
-0 491 V
-22 0 V
-0 -491 V
--22 0 V
+3502 768 N
+0 740 V
+34 0 V
+0 -740 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2350 512 23 495 BoxColFill
+0.180 3550 768 34 745 BoxColFill
 LCb setrgbcolor
-2350 512 N
-0 494 V
-22 0 V
-0 -494 V
--22 0 V
+3550 768 N
+0 744 V
+33 0 V
+0 -744 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2382 512 23 497 BoxColFill
+0.180 3598 768 34 748 BoxColFill
 LCb setrgbcolor
-2382 512 N
-0 496 V
-22 0 V
-0 -496 V
--22 0 V
+3598 768 N
+0 747 V
+33 0 V
+0 -747 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2413 512 24 500 BoxColFill
+0.180 3646 768 34 759 BoxColFill
 LCb setrgbcolor
-2413 512 N
-0 499 V
-23 0 V
-0 -499 V
--23 0 V
+3646 768 N
+0 758 V
+33 0 V
+0 -758 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2445 512 23 507 BoxColFill
+0.180 3693 768 35 887 BoxColFill
 LCb setrgbcolor
-2445 512 N
-0 506 V
-22 0 V
-0 -506 V
--22 0 V
+3693 768 N
+0 886 V
+34 0 V
+0 -886 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2477 512 23 592 BoxColFill
+0.180 3741 768 35 786 BoxColFill
 LCb setrgbcolor
-2477 512 N
-0 591 V
-22 0 V
-0 -591 V
--22 0 V
+3741 768 N
+0 785 V
+34 0 V
+0 -785 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2509 512 23 536 BoxColFill
+0.180 3789 768 34 781 BoxColFill
 LCb setrgbcolor
-2509 512 N
-0 535 V
-22 0 V
-0 -535 V
--22 0 V
+3789 768 N
+0 780 V
+33 0 V
+0 -780 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2540 512 24 533 BoxColFill
+0.180 3837 768 34 785 BoxColFill
 LCb setrgbcolor
-2540 512 N
-0 532 V
-23 0 V
-0 -532 V
--23 0 V
+3837 768 N
+0 784 V
+33 0 V
+0 -784 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2572 512 23 535 BoxColFill
+0.180 3884 768 35 781 BoxColFill
 LCb setrgbcolor
-2572 512 N
-0 534 V
-22 0 V
-0 -534 V
--22 0 V
+3884 768 N
+0 780 V
+34 0 V
+0 -780 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2604 512 23 532 BoxColFill
+0.180 3932 768 35 780 BoxColFill
 LCb setrgbcolor
-2604 512 N
-0 531 V
-22 0 V
-0 -531 V
--22 0 V
+3932 768 N
+0 779 V
+34 0 V
+0 -779 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2636 512 23 532 BoxColFill
+0.180 3980 768 34 779 BoxColFill
 LCb setrgbcolor
-2636 512 N
-0 531 V
-22 0 V
-0 -531 V
--22 0 V
+3980 768 N
+0 778 V
+33 0 V
+0 -778 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2667 512 24 531 BoxColFill
+0.180 4028 768 34 791 BoxColFill
 LCb setrgbcolor
-2667 512 N
-0 530 V
-23 0 V
-0 -530 V
--23 0 V
+4028 768 N
+0 790 V
+33 0 V
+0 -790 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2699 512 23 539 BoxColFill
+0.180 4076 768 34 767 BoxColFill
 LCb setrgbcolor
-2699 512 N
-0 538 V
-22 0 V
-0 -538 V
--22 0 V
+4076 768 N
+0 766 V
+33 0 V
+0 -766 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2731 512 23 523 BoxColFill
+0.180 4123 768 35 772 BoxColFill
 LCb setrgbcolor
-2731 512 N
-0 522 V
-22 0 V
-0 -522 V
--22 0 V
+4123 768 N
+0 771 V
+34 0 V
+0 -771 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2763 512 23 527 BoxColFill
+0.180 4171 768 35 750 BoxColFill
 LCb setrgbcolor
-2763 512 N
-0 526 V
-22 0 V
-0 -526 V
--22 0 V
+4171 768 N
+0 749 V
+34 0 V
+0 -749 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2794 512 24 511 BoxColFill
+0.180 4219 768 34 748 BoxColFill
 LCb setrgbcolor
-2794 512 N
-0 510 V
-23 0 V
-0 -510 V
--23 0 V
+4219 768 N
+0 747 V
+33 0 V
+0 -747 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2826 512 23 509 BoxColFill
+0.180 4267 768 34 754 BoxColFill
 LCb setrgbcolor
-2826 512 N
-0 508 V
-22 0 V
-0 -508 V
--22 0 V
+4267 768 N
+0 753 V
+33 0 V
+0 -753 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2858 512 23 514 BoxColFill
+0.180 4315 768 34 781 BoxColFill
 LCb setrgbcolor
-2858 512 N
-0 513 V
-22 0 V
-0 -513 V
--22 0 V
+4315 768 N
+0 780 V
+33 0 V
+0 -780 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2890 512 23 532 BoxColFill
+0.180 4362 768 35 784 BoxColFill
 LCb setrgbcolor
-2890 512 N
-0 531 V
-22 0 V
-0 -531 V
--22 0 V
+4362 768 N
+0 783 V
+34 0 V
+0 -783 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2921 512 24 534 BoxColFill
+0.180 4410 768 35 796 BoxColFill
 LCb setrgbcolor
-2921 512 N
-0 533 V
-23 0 V
-0 -533 V
--23 0 V
+4410 768 N
+0 795 V
+34 0 V
+0 -795 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2953 512 23 542 BoxColFill
+0.180 4458 768 34 812 BoxColFill
 LCb setrgbcolor
-2953 512 N
-0 541 V
-22 0 V
-0 -541 V
--22 0 V
+4458 768 N
+0 811 V
+33 0 V
+0 -811 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 2985 512 23 553 BoxColFill
+0.180 4506 768 34 884 BoxColFill
 LCb setrgbcolor
-2985 512 N
-0 552 V
-22 0 V
-0 -552 V
--22 0 V
+4506 768 N
+0 883 V
+33 0 V
+0 -883 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 3017 512 23 602 BoxColFill
+0.180 4553 768 35 896 BoxColFill
 LCb setrgbcolor
-3017 512 N
-0 601 V
-22 0 V
-0 -601 V
--22 0 V
+4553 768 N
+0 895 V
+34 0 V
+0 -895 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 3048 512 24 611 BoxColFill
+0.180 4601 768 35 905 BoxColFill
 LCb setrgbcolor
-3048 512 N
-0 610 V
-23 0 V
-0 -610 V
--23 0 V
+4601 768 N
+0 904 V
+34 0 V
+0 -904 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 3080 512 23 618 BoxColFill
+0.180 4649 768 34 910 BoxColFill
 LCb setrgbcolor
-3080 512 N
-0 617 V
-22 0 V
-0 -617 V
--22 0 V
+4649 768 N
+0 909 V
+33 0 V
+0 -909 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 3112 512 23 621 BoxColFill
+0.180 4697 768 34 962 BoxColFill
 LCb setrgbcolor
-3112 512 N
-0 620 V
-22 0 V
-0 -620 V
--22 0 V
+4697 768 N
+0 961 V
+33 0 V
+0 -961 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 3144 512 23 656 BoxColFill
+0.180 4745 768 34 974 BoxColFill
 LCb setrgbcolor
-3144 512 N
-0 655 V
-22 0 V
-0 -655 V
--22 0 V
+4745 768 N
+0 973 V
+33 0 V
+0 -973 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 3175 512 24 664 BoxColFill
+0.180 4792 768 35 982 BoxColFill
 LCb setrgbcolor
-3175 512 N
-0 663 V
-23 0 V
-0 -663 V
--23 0 V
+4792 768 N
+0 981 V
+34 0 V
+0 -981 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 3207 512 23 669 BoxColFill
+0.180 4840 768 35 982 BoxColFill
 LCb setrgbcolor
-3207 512 N
-0 668 V
-22 0 V
-0 -668 V
--22 0 V
+4840 768 N
+0 981 V
+34 0 V
+0 -981 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 3239 512 23 669 BoxColFill
+0.180 4888 768 34 982 BoxColFill
 LCb setrgbcolor
-3239 512 N
-0 668 V
-22 0 V
-0 -668 V
--22 0 V
+4888 768 N
+0 981 V
+33 0 V
+0 -981 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 3271 512 23 669 BoxColFill
+0.180 4936 768 34 994 BoxColFill
 LCb setrgbcolor
-3271 512 N
-0 668 V
-22 0 V
-0 -668 V
--22 0 V
+4936 768 N
+0 993 V
+33 0 V
+0 -993 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 3302 512 24 677 BoxColFill
+0.180 4984 768 34 1000 BoxColFill
 LCb setrgbcolor
-3302 512 N
-0 676 V
-23 0 V
-0 -676 V
--23 0 V
+4984 768 N
+0 999 V
+33 0 V
+0 -999 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 3334 512 23 680 BoxColFill
+0.180 5031 768 35 1032 BoxColFill
 LCb setrgbcolor
-3334 512 N
-0 679 V
-22 0 V
-0 -679 V
--22 0 V
+5031 768 N
+0 1031 V
+34 0 V
+0 -1031 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 3366 512 23 704 BoxColFill
+0.180 5079 768 35 1034 BoxColFill
 LCb setrgbcolor
-3366 512 N
-0 703 V
-22 0 V
-0 -703 V
--22 0 V
+5079 768 N
+0 1033 V
+34 0 V
+0 -1033 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 3398 512 23 706 BoxColFill
+0.180 5127 768 34 1054 BoxColFill
 LCb setrgbcolor
-3398 512 N
-0 705 V
-22 0 V
-0 -705 V
--22 0 V
+5127 768 N
+0 1053 V
+33 0 V
+0 -1053 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 3429 512 24 719 BoxColFill
+0.180 5175 768 34 1073 BoxColFill
 LCb setrgbcolor
-3429 512 N
-0 718 V
-23 0 V
-0 -718 V
--23 0 V
+5175 768 N
+0 1072 V
+33 0 V
+0 -1072 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.00 0.00 0.00 C
-0.180 3461 512 23 732 BoxColFill
+0.180 5222 768 35 1093 BoxColFill
 LCb setrgbcolor
-3461 512 N
-0 731 V
-22 0 V
-0 -731 V
--22 0 V
+5222 768 N
+0 1092 V
+34 0 V
+0 -1092 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
@@ -3663,1137 +3685,1149 @@ LTb
 LTb
 0.90 0.62 0.00 C
 LCb setrgbcolor
-2044 1537 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (RCU Test)]
-] -26.7 MRshow
-/NimbusSanL-Regu findfont 80 scalefont setfont
+3081 2337 M
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (RCU Test)]
+] -40.0 MRshow
+/NimbusSanL-Regu findfont 120 scalefont setfont
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2092 1517 255 40 BoxColFill
+0.180 3153 2307 351 60 BoxColFill
 LCb setrgbcolor
-2092 1517 N
-255 0 V
-0 40 V
--255 0 V
-0 -40 V
+3153 2307 N
+351 0 V
+0 60 V
+-351 0 V
+0 -60 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 572 539 23 1 BoxColFill
+0.180 826 808 35 1 BoxColFill
 LCb setrgbcolor
-572 539 N
-22 0 V
--22 0 V
+826 808 N
+34 0 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 603 539 24 1 BoxColFill
+0.180 874 808 34 1 BoxColFill
 LCb setrgbcolor
-603 539 N
-23 0 V
--23 0 V
+874 808 N
+33 0 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 635 547 23 1 BoxColFill
+0.180 922 821 34 1 BoxColFill
 LCb setrgbcolor
-635 547 N
-22 0 V
--22 0 V
+922 821 N
+33 0 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 667 549 23 19 BoxColFill
+0.180 969 824 35 27 BoxColFill
 LCb setrgbcolor
-667 549 N
-0 18 V
-22 0 V
-0 -18 V
--22 0 V
+969 824 N
+0 26 V
+34 0 V
+0 -26 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 699 543 23 21 BoxColFill
+0.180 1017 814 35 32 BoxColFill
 LCb setrgbcolor
-699 543 N
-0 20 V
-22 0 V
-0 -20 V
--22 0 V
+1017 814 N
+0 31 V
+34 0 V
+0 -31 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 730 543 24 22 BoxColFill
+0.180 1065 815 34 32 BoxColFill
 LCb setrgbcolor
-730 543 N
-0 21 V
-23 0 V
-0 -21 V
--23 0 V
+1065 815 N
+0 31 V
+33 0 V
+0 -31 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 762 544 23 26 BoxColFill
+0.180 1113 816 34 38 BoxColFill
 LCb setrgbcolor
-762 544 N
-0 25 V
-22 0 V
-0 -25 V
--22 0 V
+1113 816 N
+0 37 V
+33 0 V
+0 -37 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 794 555 23 35 BoxColFill
+0.180 1161 832 34 53 BoxColFill
 LCb setrgbcolor
-794 555 N
-0 34 V
-22 0 V
-0 -34 V
--22 0 V
+1161 832 N
+0 52 V
+33 0 V
+0 -52 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 826 555 23 35 BoxColFill
+0.180 1208 832 35 53 BoxColFill
 LCb setrgbcolor
-826 555 N
-0 34 V
-22 0 V
-0 -34 V
--22 0 V
+1208 832 N
+0 52 V
+34 0 V
+0 -52 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 857 555 24 35 BoxColFill
+0.180 1256 832 35 53 BoxColFill
 LCb setrgbcolor
-857 555 N
-0 34 V
-23 0 V
-0 -34 V
--23 0 V
+1256 832 N
+0 52 V
+34 0 V
+0 -52 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 889 555 23 35 BoxColFill
+0.180 1304 832 34 53 BoxColFill
 LCb setrgbcolor
-889 555 N
-0 34 V
-22 0 V
-0 -34 V
--22 0 V
+1304 832 N
+0 52 V
+33 0 V
+0 -52 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 921 555 23 35 BoxColFill
+0.180 1352 832 34 53 BoxColFill
 LCb setrgbcolor
-921 555 N
-0 34 V
-22 0 V
-0 -34 V
--22 0 V
+1352 832 N
+0 52 V
+33 0 V
+0 -52 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 953 556 23 35 BoxColFill
+0.180 1400 834 34 52 BoxColFill
 LCb setrgbcolor
-953 556 N
-0 34 V
-22 0 V
-0 -34 V
--22 0 V
+1400 834 N
+0 51 V
+33 0 V
+0 -51 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 984 621 24 35 BoxColFill
+0.180 1447 931 35 53 BoxColFill
 LCb setrgbcolor
-984 621 N
-0 34 V
-23 0 V
-0 -34 V
--23 0 V
+1447 931 N
+0 52 V
+34 0 V
+0 -52 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1016 620 23 36 BoxColFill
+0.180 1495 931 35 52 BoxColFill
 LCb setrgbcolor
-1016 620 N
-0 35 V
-22 0 V
-0 -35 V
--22 0 V
+1495 931 N
+0 51 V
+34 0 V
+0 -51 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1048 649 23 41 BoxColFill
+0.180 1543 974 34 61 BoxColFill
 LCb setrgbcolor
-1048 649 N
-0 40 V
-22 0 V
-0 -40 V
--22 0 V
+1543 974 N
+0 60 V
+33 0 V
+0 -60 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1080 656 23 41 BoxColFill
+0.180 1591 984 34 61 BoxColFill
 LCb setrgbcolor
-1080 656 N
-0 40 V
-22 0 V
-0 -40 V
--22 0 V
+1591 984 N
+0 60 V
+33 0 V
+0 -60 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1111 736 24 43 BoxColFill
+0.180 1638 1104 35 64 BoxColFill
 LCb setrgbcolor
-1111 736 N
-0 42 V
-23 0 V
-0 -42 V
--23 0 V
+1638 1104 N
+0 63 V
+34 0 V
+0 -63 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1143 737 23 44 BoxColFill
+0.180 1686 1106 35 65 BoxColFill
 LCb setrgbcolor
-1143 737 N
-0 43 V
-22 0 V
-0 -43 V
--22 0 V
+1686 1106 N
+0 64 V
+34 0 V
+0 -64 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1175 741 23 44 BoxColFill
+0.180 1734 1111 34 65 BoxColFill
 LCb setrgbcolor
-1175 741 N
-0 43 V
-22 0 V
-0 -43 V
--22 0 V
+1734 1111 N
+0 64 V
+33 0 V
+0 -64 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1207 667 23 45 BoxColFill
+0.180 1782 1001 34 66 BoxColFill
 LCb setrgbcolor
-1207 667 N
-0 44 V
-22 0 V
-0 -44 V
--22 0 V
+1782 1001 N
+0 65 V
+33 0 V
+0 -65 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1238 694 24 45 BoxColFill
+0.180 1830 1040 34 68 BoxColFill
 LCb setrgbcolor
-1238 694 N
-0 44 V
-23 0 V
-0 -44 V
--23 0 V
+1830 1040 N
+0 67 V
+33 0 V
+0 -67 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1270 714 23 49 BoxColFill
+0.180 1877 1071 35 73 BoxColFill
 LCb setrgbcolor
-1270 714 N
-0 48 V
-22 0 V
-0 -48 V
--22 0 V
+1877 1071 N
+0 72 V
+34 0 V
+0 -72 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1302 722 23 49 BoxColFill
+0.180 1925 1083 35 73 BoxColFill
 LCb setrgbcolor
-1302 722 N
-0 48 V
-22 0 V
-0 -48 V
--22 0 V
+1925 1083 N
+0 72 V
+34 0 V
+0 -72 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1334 731 23 48 BoxColFill
+0.180 1973 1096 34 72 BoxColFill
 LCb setrgbcolor
-1334 731 N
-0 47 V
-22 0 V
-0 -47 V
--22 0 V
+1973 1096 N
+0 71 V
+33 0 V
+0 -71 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1365 758 24 49 BoxColFill
+0.180 2021 1137 34 73 BoxColFill
 LCb setrgbcolor
-1365 758 N
-0 48 V
-23 0 V
-0 -48 V
--23 0 V
+2021 1137 N
+0 72 V
+33 0 V
+0 -72 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1397 782 23 58 BoxColFill
+0.180 2069 1174 34 85 BoxColFill
 LCb setrgbcolor
-1397 782 N
-0 57 V
-22 0 V
-0 -57 V
--22 0 V
+2069 1174 N
+0 84 V
+33 0 V
+0 -84 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1429 783 23 58 BoxColFill
+0.180 2116 1175 35 85 BoxColFill
 LCb setrgbcolor
-1429 783 N
-0 57 V
-22 0 V
-0 -57 V
--22 0 V
+2116 1175 N
+0 84 V
+34 0 V
+0 -84 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1461 824 23 57 BoxColFill
+0.180 2164 1236 35 86 BoxColFill
 LCb setrgbcolor
-1461 824 N
-0 56 V
-22 0 V
-0 -56 V
--22 0 V
+2164 1236 N
+0 85 V
+34 0 V
+0 -85 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1492 824 24 57 BoxColFill
+0.180 2212 1236 34 86 BoxColFill
 LCb setrgbcolor
-1492 824 N
-0 56 V
-23 0 V
-0 -56 V
--23 0 V
+2212 1236 N
+0 85 V
+33 0 V
+0 -85 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1524 830 23 57 BoxColFill
+0.180 2260 1245 34 85 BoxColFill
 LCb setrgbcolor
-1524 830 N
-0 56 V
-22 0 V
-0 -56 V
--22 0 V
+2260 1245 N
+0 84 V
+33 0 V
+0 -84 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1556 848 23 65 BoxColFill
+0.180 2307 1273 35 95 BoxColFill
 LCb setrgbcolor
-1556 848 N
-0 64 V
-22 0 V
-0 -64 V
--22 0 V
+2307 1273 N
+0 94 V
+34 0 V
+0 -94 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1588 867 23 67 BoxColFill
+0.180 2355 1301 35 100 BoxColFill
 LCb setrgbcolor
-1588 867 N
-0 66 V
-22 0 V
-0 -66 V
--22 0 V
+2355 1301 N
+0 99 V
+34 0 V
+0 -99 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1619 889 24 75 BoxColFill
+0.180 2403 1333 34 112 BoxColFill
 LCb setrgbcolor
-1619 889 N
-0 74 V
-23 0 V
-0 -74 V
--23 0 V
+2403 1333 N
+0 111 V
+33 0 V
+0 -111 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1651 889 23 76 BoxColFill
+0.180 2451 1334 34 113 BoxColFill
 LCb setrgbcolor
-1651 889 N
-0 75 V
-22 0 V
-0 -75 V
--22 0 V
+2451 1334 N
+0 112 V
+33 0 V
+0 -112 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1683 891 23 76 BoxColFill
+0.180 2499 1336 34 114 BoxColFill
 LCb setrgbcolor
-1683 891 N
-0 75 V
-22 0 V
-0 -75 V
--22 0 V
+2499 1336 N
+0 113 V
+33 0 V
+0 -113 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1715 912 23 76 BoxColFill
+0.180 2546 1368 35 113 BoxColFill
 LCb setrgbcolor
-1715 912 N
-0 75 V
-22 0 V
-0 -75 V
--22 0 V
+2546 1368 N
+0 112 V
+34 0 V
+0 -112 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1746 919 24 77 BoxColFill
+0.180 2594 1378 35 116 BoxColFill
 LCb setrgbcolor
-1746 919 N
-0 76 V
-23 0 V
-0 -76 V
--23 0 V
+2594 1378 N
+0 115 V
+34 0 V
+0 -115 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1778 920 23 78 BoxColFill
+0.180 2642 1380 34 116 BoxColFill
 LCb setrgbcolor
-1778 920 N
-0 77 V
-22 0 V
-0 -77 V
--22 0 V
+2642 1380 N
+0 115 V
+33 0 V
+0 -115 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1810 883 23 76 BoxColFill
+0.180 2690 1324 34 114 BoxColFill
 LCb setrgbcolor
-1810 883 N
-0 75 V
-22 0 V
-0 -75 V
--22 0 V
+2690 1324 N
+0 113 V
+33 0 V
+0 -113 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1842 897 23 75 BoxColFill
+0.180 2738 1345 34 112 BoxColFill
 LCb setrgbcolor
-1842 897 N
-0 74 V
-22 0 V
-0 -74 V
--22 0 V
+2738 1345 N
+0 111 V
+33 0 V
+0 -111 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1873 904 24 75 BoxColFill
+0.180 2785 1356 35 112 BoxColFill
 LCb setrgbcolor
-1873 904 N
-0 74 V
-23 0 V
-0 -74 V
--23 0 V
+2785 1356 N
+0 111 V
+34 0 V
+0 -111 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1905 911 23 119 BoxColFill
+0.180 2833 1366 35 179 BoxColFill
 LCb setrgbcolor
-1905 911 N
-0 118 V
-22 0 V
-0 -118 V
--22 0 V
+2833 1366 N
+0 178 V
+34 0 V
+0 -178 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1937 913 23 135 BoxColFill
+0.180 2881 1370 34 202 BoxColFill
 LCb setrgbcolor
-1937 913 N
-0 134 V
-22 0 V
-0 -134 V
--22 0 V
+2881 1370 N
+0 201 V
+33 0 V
+0 -201 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 1969 921 23 141 BoxColFill
+0.180 2929 1381 34 212 BoxColFill
 LCb setrgbcolor
-1969 921 N
-0 140 V
-22 0 V
-0 -140 V
--22 0 V
+2929 1381 N
+0 211 V
+33 0 V
+0 -211 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2001 929 23 142 BoxColFill
+0.180 2976 1393 35 213 BoxColFill
 LCb setrgbcolor
-2001 929 N
-0 141 V
-22 0 V
-0 -141 V
--22 0 V
+2976 1393 N
+0 212 V
+34 0 V
+0 -212 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2032 950 23 147 BoxColFill
+0.180 3024 1424 35 221 BoxColFill
 LCb setrgbcolor
-2032 950 N
-0 146 V
-22 0 V
-0 -146 V
--22 0 V
+3024 1424 N
+0 220 V
+34 0 V
+0 -220 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2064 954 23 147 BoxColFill
+0.180 3072 1431 35 220 BoxColFill
 LCb setrgbcolor
-2064 954 N
-0 146 V
-22 0 V
-0 -146 V
--22 0 V
+3072 1431 N
+0 219 V
+34 0 V
+0 -219 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2096 953 23 148 BoxColFill
+0.180 3120 1429 34 221 BoxColFill
 LCb setrgbcolor
-2096 953 N
-0 147 V
-22 0 V
-0 -147 V
--22 0 V
+3120 1429 N
+0 220 V
+33 0 V
+0 -220 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2128 961 23 149 BoxColFill
+0.180 3168 1441 34 224 BoxColFill
 LCb setrgbcolor
-2128 961 N
-0 148 V
-22 0 V
-0 -148 V
--22 0 V
+3168 1441 N
+0 223 V
+33 0 V
+0 -223 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2159 962 24 151 BoxColFill
+0.180 3215 1442 35 226 BoxColFill
 LCb setrgbcolor
-2159 962 N
-0 150 V
-23 0 V
-0 -150 V
--23 0 V
+3215 1442 N
+0 225 V
+34 0 V
+0 -225 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2191 967 23 151 BoxColFill
+0.180 3263 1450 35 227 BoxColFill
 LCb setrgbcolor
-2191 967 N
-0 150 V
-22 0 V
-0 -150 V
--22 0 V
+3263 1450 N
+0 226 V
+34 0 V
+0 -226 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2223 989 23 151 BoxColFill
+0.180 3311 1483 34 227 BoxColFill
 LCb setrgbcolor
-2223 989 N
-0 150 V
-22 0 V
-0 -150 V
--22 0 V
+3311 1483 N
+0 226 V
+33 0 V
+0 -226 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2255 994 23 154 BoxColFill
+0.180 3359 1491 34 230 BoxColFill
 LCb setrgbcolor
-2255 994 N
-0 153 V
-22 0 V
-0 -153 V
--22 0 V
+3359 1491 N
+0 229 V
+33 0 V
+0 -229 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2286 998 24 154 BoxColFill
+0.180 3407 1496 34 230 BoxColFill
 LCb setrgbcolor
-2286 998 N
-0 153 V
-23 0 V
-0 -153 V
--23 0 V
+3407 1496 N
+0 229 V
+33 0 V
+0 -229 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2318 1003 23 190 BoxColFill
+0.180 3454 1504 35 285 BoxColFill
 LCb setrgbcolor
-2318 1003 N
-0 189 V
-22 0 V
-0 -189 V
--22 0 V
+3454 1504 N
+0 284 V
+34 0 V
+0 -284 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2350 1006 23 192 BoxColFill
+0.180 3502 1508 35 288 BoxColFill
 LCb setrgbcolor
-2350 1006 N
-0 191 V
-22 0 V
-0 -191 V
--22 0 V
+3502 1508 N
+0 287 V
+34 0 V
+0 -287 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2382 1008 23 192 BoxColFill
+0.180 3550 1512 34 287 BoxColFill
 LCb setrgbcolor
-2382 1008 N
-0 191 V
-22 0 V
-0 -191 V
--22 0 V
+3550 1512 N
+0 286 V
+33 0 V
+0 -286 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2413 1011 24 192 BoxColFill
+0.180 3598 1515 34 288 BoxColFill
 LCb setrgbcolor
-2413 1011 N
-0 191 V
-23 0 V
-0 -191 V
--23 0 V
+3598 1515 N
+0 287 V
+33 0 V
+0 -287 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2445 1018 23 192 BoxColFill
+0.180 3646 1526 34 289 BoxColFill
 LCb setrgbcolor
-2445 1018 N
-0 191 V
-22 0 V
-0 -191 V
--22 0 V
+3646 1526 N
+0 288 V
+33 0 V
+0 -288 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2477 1103 23 194 BoxColFill
+0.180 3693 1654 35 290 BoxColFill
 LCb setrgbcolor
-2477 1103 N
-0 193 V
-22 0 V
-0 -193 V
--22 0 V
+3693 1654 N
+0 289 V
+34 0 V
+0 -289 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2509 1047 23 197 BoxColFill
+0.180 3741 1553 35 294 BoxColFill
 LCb setrgbcolor
-2509 1047 N
-0 196 V
-22 0 V
-0 -196 V
--22 0 V
+3741 1553 N
+0 293 V
+34 0 V
+0 -293 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2540 1044 24 198 BoxColFill
+0.180 3789 1548 34 297 BoxColFill
 LCb setrgbcolor
-2540 1044 N
-0 197 V
-23 0 V
-0 -197 V
--23 0 V
+3789 1548 N
+0 296 V
+33 0 V
+0 -296 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2572 1046 23 199 BoxColFill
+0.180 3837 1552 34 297 BoxColFill
 LCb setrgbcolor
-2572 1046 N
-0 198 V
-22 0 V
-0 -198 V
--22 0 V
+3837 1552 N
+0 296 V
+33 0 V
+0 -296 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2604 1043 23 197 BoxColFill
+0.180 3884 1548 35 294 BoxColFill
 LCb setrgbcolor
-2604 1043 N
-0 196 V
-22 0 V
-0 -196 V
--22 0 V
+3884 1548 N
+0 293 V
+34 0 V
+0 -293 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2636 1043 23 198 BoxColFill
+0.180 3932 1547 35 297 BoxColFill
 LCb setrgbcolor
-2636 1043 N
-0 197 V
-22 0 V
-0 -197 V
--22 0 V
+3932 1547 N
+0 296 V
+34 0 V
+0 -296 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2667 1042 24 200 BoxColFill
+0.180 3980 1546 34 299 BoxColFill
 LCb setrgbcolor
-2667 1042 N
-0 199 V
-23 0 V
-0 -199 V
--23 0 V
+3980 1546 N
+0 298 V
+33 0 V
+0 -298 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2699 1050 23 207 BoxColFill
+0.180 4028 1558 34 310 BoxColFill
 LCb setrgbcolor
-2699 1050 N
-0 206 V
-22 0 V
-0 -206 V
--22 0 V
+4028 1558 N
+0 309 V
+33 0 V
+0 -309 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2731 1034 23 210 BoxColFill
+0.180 4076 1534 34 315 BoxColFill
 LCb setrgbcolor
-2731 1034 N
-0 209 V
-22 0 V
-0 -209 V
--22 0 V
+4076 1534 N
+0 314 V
+33 0 V
+0 -314 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2763 1038 23 295 BoxColFill
+0.180 4123 1539 35 443 BoxColFill
 LCb setrgbcolor
-2763 1038 N
-0 294 V
-22 0 V
-0 -294 V
--22 0 V
+4123 1539 N
+0 442 V
+34 0 V
+0 -442 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2794 1022 24 220 BoxColFill
+0.180 4171 1517 35 329 BoxColFill
 LCb setrgbcolor
-2794 1022 N
-0 219 V
-23 0 V
-0 -219 V
--23 0 V
+4171 1517 N
+0 328 V
+34 0 V
+0 -328 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2826 1020 23 211 BoxColFill
+0.180 4219 1515 34 315 BoxColFill
 LCb setrgbcolor
-2826 1020 N
-0 210 V
-22 0 V
-0 -210 V
--22 0 V
+4219 1515 N
+0 314 V
+33 0 V
+0 -314 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2858 1025 23 214 BoxColFill
+0.180 4267 1521 34 322 BoxColFill
 LCb setrgbcolor
-2858 1025 N
-0 213 V
-22 0 V
-0 -213 V
--22 0 V
+4267 1521 N
+0 321 V
+33 0 V
+0 -321 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2890 1043 23 215 BoxColFill
+0.180 4315 1548 34 322 BoxColFill
 LCb setrgbcolor
-2890 1043 N
-0 214 V
-22 0 V
-0 -214 V
--22 0 V
+4315 1548 N
+0 321 V
+33 0 V
+0 -321 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2921 1045 24 216 BoxColFill
+0.180 4362 1551 35 323 BoxColFill
 LCb setrgbcolor
-2921 1045 N
-0 215 V
-23 0 V
-0 -215 V
--23 0 V
+4362 1551 N
+0 322 V
+34 0 V
+0 -322 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2953 1053 23 221 BoxColFill
+0.180 4410 1563 35 331 BoxColFill
 LCb setrgbcolor
-2953 1053 N
-0 220 V
-22 0 V
-0 -220 V
--22 0 V
+4410 1563 N
+0 330 V
+34 0 V
+0 -330 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 2985 1064 23 224 BoxColFill
+0.180 4458 1579 34 335 BoxColFill
 LCb setrgbcolor
-2985 1064 N
-0 223 V
-22 0 V
-0 -223 V
--22 0 V
+4458 1579 N
+0 334 V
+33 0 V
+0 -334 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 3017 1113 23 230 BoxColFill
+0.180 4506 1651 34 344 BoxColFill
 LCb setrgbcolor
-3017 1113 N
-0 229 V
-22 0 V
-0 -229 V
--22 0 V
+4506 1651 N
+0 343 V
+33 0 V
+0 -343 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 3048 1122 24 270 BoxColFill
+0.180 4553 1663 35 404 BoxColFill
 LCb setrgbcolor
-3048 1122 N
-0 269 V
-23 0 V
-0 -269 V
--23 0 V
+4553 1663 N
+0 403 V
+34 0 V
+0 -403 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 3080 1129 23 274 BoxColFill
+0.180 4601 1672 35 411 BoxColFill
 LCb setrgbcolor
-3080 1129 N
-0 273 V
-22 0 V
-0 -273 V
--22 0 V
+4601 1672 N
+0 410 V
+34 0 V
+0 -410 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 3112 1132 23 279 BoxColFill
+0.180 4649 1677 34 417 BoxColFill
 LCb setrgbcolor
-3112 1132 N
-0 278 V
-22 0 V
-0 -278 V
--22 0 V
+4649 1677 N
+0 416 V
+33 0 V
+0 -416 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 3144 1167 23 312 BoxColFill
+0.180 4697 1729 34 468 BoxColFill
 LCb setrgbcolor
-3144 1167 N
-0 311 V
-22 0 V
-0 -311 V
--22 0 V
+4697 1729 N
+0 467 V
+33 0 V
+0 -467 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 3175 1175 24 331 BoxColFill
+0.180 4745 1741 34 496 BoxColFill
 LCb setrgbcolor
-3175 1175 N
-0 330 V
-23 0 V
-0 -330 V
--23 0 V
+4745 1741 N
+0 495 V
+33 0 V
+0 -495 V
+-33 0 V
+Z stroke
+1.000 UL
+LTb
+0.90 0.62 0.00 C
+0.180 4792 1749 35 518 BoxColFill
+LCb setrgbcolor
+4792 1749 N
+0 517 V
+34 0 V
+0 -517 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 3207 1180 23 346 BoxColFill
+0.180 4840 1749 35 536 BoxColFill
 LCb setrgbcolor
-3207 1180 N
-0 345 V
-22 0 V
-0 -345 V
--22 0 V
+4840 1749 N
+0 535 V
+34 0 V
+0 -535 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 3239 1180 23 358 BoxColFill
+0.180 4888 1749 34 537 BoxColFill
 LCb setrgbcolor
-3239 1180 N
-0 357 V
-22 0 V
-0 -357 V
--22 0 V
+4888 1749 N
+0 536 V
+33 0 V
+0 -536 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 3271 1180 23 359 BoxColFill
+0.180 4936 1761 34 544 BoxColFill
 LCb setrgbcolor
-3271 1180 N
-0 358 V
-22 0 V
-0 -358 V
--22 0 V
+4936 1761 N
+0 543 V
+33 0 V
+0 -543 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 3302 1188 24 362 BoxColFill
+0.180 4984 1767 34 546 BoxColFill
 LCb setrgbcolor
-3302 1188 N
-0 361 V
-23 0 V
-0 -361 V
--23 0 V
+4984 1767 N
+0 545 V
+33 0 V
+0 -545 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 3334 1191 23 365 BoxColFill
+0.180 5031 1799 35 553 BoxColFill
 LCb setrgbcolor
-3334 1191 N
-0 364 V
-22 0 V
-0 -364 V
--22 0 V
+5031 1799 N
+0 552 V
+34 0 V
+0 -552 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 3366 1215 23 368 BoxColFill
+0.180 5079 1801 35 556 BoxColFill
 LCb setrgbcolor
-3366 1215 N
-0 367 V
-22 0 V
-0 -367 V
--22 0 V
+5079 1801 N
+0 555 V
+34 0 V
+0 -555 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 3398 1217 23 371 BoxColFill
+0.180 5127 1821 34 566 BoxColFill
 LCb setrgbcolor
-3398 1217 N
-0 370 V
-22 0 V
-0 -370 V
--22 0 V
+5127 1821 N
+0 565 V
+33 0 V
+0 -565 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 3429 1230 24 378 BoxColFill
+0.180 5175 1840 34 581 BoxColFill
 LCb setrgbcolor
-3429 1230 N
-0 377 V
-23 0 V
-0 -377 V
--23 0 V
+5175 1840 N
+0 580 V
+33 0 V
+0 -580 V
+-33 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
-0.180 3461 1243 23 388 BoxColFill
+0.180 5222 1860 35 594 BoxColFill
 LCb setrgbcolor
-3461 1243 N
-0 387 V
-22 0 V
-0 -387 V
--22 0 V
+5222 1860 N
+0 593 V
+34 0 V
+0 -593 V
+-34 0 V
 Z stroke
 1.000 UL
 LTb
 0.90 0.62 0.00 C
 % End plot #2
 % Begin plot #3
-1.000 UL
+1.500 UL
 LTb
 0.55 0.00 0.00 C
 LCb setrgbcolor
-2044 1457 M
-[ [(NimbusSanL-Regu) 80.0 0.0 true true 0 (% Test)]
-] -26.7 MRshow
-/NimbusSanL-Regu findfont 80 scalefont setfont
-1.000 UL
+3081 2217 M
+[ [(NimbusSanL-Regu) 120.0 0.0 true true 0 (% Test)]
+] -40.0 MRshow
+/NimbusSanL-Regu findfont 120 scalefont setfont
+1.500 UL
 LTb
 0.55 0.00 0.00 C
-2092 1457 M
-255 0 V
-583 512 M
-32 0 V
-31 0 V
-32 778 V
-32 193 V
-32 -5 V
-31 87 V
-32 29 V
-32 3 V
-32 0 V
-31 -5 V
-32 0 V
-32 -17 V
-32 -483 V
-31 2 V
-32 -38 V
-32 -20 V
-32 -140 V
-31 0 V
-32 -5 V
-32 150 V
-32 -51 V
-31 -17 V
-32 -14 V
-32 -15 V
-32 -38 V
-31 24 V
-32 -2 V
-32 -46 V
-32 0 V
-31 -8 V
-32 20 V
-32 -3 V
-32 17 V
-31 3 V
-32 4 V
-32 -21 V
-32 0 V
-31 0 V
-32 26 V
-32 -19 V
-32 -5 V
-31 169 V
-32 51 V
-32 14 V
-32 -7 V
-31 -7 V
-32 -5 V
-32 5 V
-32 -5 V
-31 5 V
-32 -2 V
-32 -22 V
-32 0 V
-31 -3 V
-32 95 V
-32 2 V
-32 -2 V
-31 -3 V
-32 -5 V
-32 -70 V
-32 53 V
-31 8 V
-32 -3 V
-32 -2 V
-32 2 V
-31 5 V
-32 12 V
-32 22 V
-32 176 V
-31 -142 V
-32 -20 V
-32 5 V
-32 -14 V
-31 -3 V
-32 5 V
-32 -2 V
-32 -29 V
-31 72 V
-32 3 V
-32 5 V
-32 31 V
-31 24 V
-32 19 V
-32 20 V
-32 2 V
-31 0 V
-32 -2 V
-32 -10 V
-32 0 V
-31 0 V
-32 5 V
+3153 2217 M
+351 0 V
+843 768 M
+48 0 V
+47 0 V
+48 1167 V
+48 290 V
+48 -7 V
+48 130 V
+47 44 V
+48 3 V
+48 0 V
+48 -7 V
+47 0 V
+48 -25 V
+48 -725 V
+48 3 V
+48 -58 V
+47 -29 V
+48 -210 V
+48 0 V
+48 -7 V
+48 225 V
+47 -76 V
+48 -26 V
+48 -22 V
+48 -21 V
+47 -58 V
+48 36 V
+48 -4 V
+48 -69 V
+48 0 V
+47 -10 V
+48 29 V
+48 -4 V
+48 25 V
+48 4 V
+47 7 V
+48 -32 V
+48 0 V
+48 0 V
+47 39 V
+48 -29 V
+48 -7 V
+48 254 V
+48 76 V
+47 22 V
+48 -11 V
+48 -7 V
+48 -11 V
+48 11 V
+47 -11 V
+48 7 V
+48 -4 V
+48 -32 V
+48 0 V
+47 -4 V
+48 141 V
+48 8 V
+48 -8 V
+47 -3 V
+48 -7 V
+48 -105 V
+48 94 V
+48 11 V
+47 -4 V
+48 0 V
+48 4 V
+48 7 V
+48 14 V
+47 33 V
+48 268 V
+48 -214 V
+48 -32 V
+47 7 V
+48 -22 V
+48 -3 V
+48 7 V
+48 -4 V
+47 -43 V
+48 108 V
+48 8 V
+48 7 V
+48 47 V
+47 36 V
+48 29 V
+48 29 V
+48 4 V
+47 -4 V
+48 0 V
+48 -14 V
+48 0 V
+48 0 V
+47 7 V
+48 4 V
 % End plot #3
 stroke
 2.000 UL
@@ -4802,11 +4836,11 @@ LCb setrgbcolor
 1.000 UL
 LTB
 LCb setrgbcolor
-551 1720 N
-551 512 L
-2953 0 V
-0 1208 V
--2953 0 V
+795 2580 N
+795 768 L
+4492 0 V
+0 1812 V
+-4492 0 V
 Z stroke
 1.000 UP
 1.000 UL
-- 
2.25.1


