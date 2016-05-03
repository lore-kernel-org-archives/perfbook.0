Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding;
 bh=yq12Y3Zd6jQRQTBB6evE6ZAvHEIgJtsWVSJ19m9A/NQ=;
 b=GNdIEzCNQ8KxORO/Oy0ZqMnzKB5gOhq4hF57IeFHtkd49o4kZMA4wPt0wOhc22de3l
 GoCqAEupFOGRV7dqcfZUUVMKsQc15H9dC9Ky0WPqrUblowf3fNMYU8OZv6VjJtfgx48u
 nJEr4F9ZfYxx18jv1Ko7Lvj+2T/Y8ai14TFX+d1G28jN91KFmoIDRdzpwfaWetvgrXOF
 agOuhiI7Yzy8KJK+EjAm88SLBSph4DlVqx+NHJflIqEs59zftQyg1Ra3N2cm5fIf2Rs/
 HRRqqslRQVYyC/UWYnghT5oM4x4Ie/FRtLMr6G7Qa6393Gf5GZEKodgyFF4kpRwm2XX+
 8nog==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] advsync: Use colors nicer to your eyes
Message-ID: <8fa41e9d-4f4c-bf3c-b9f7-f5b8e1d97cad@gmail.com>
Date: Tue, 3 May 2016 21:16:08 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

From dc613116d3bac06a92fef5b3bf73fefd5132ec71 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiysw@gmail.com>
Date: Tue, 3 May 2016 20:40:41 +0900
Subject: [PATCH] advsync: Use colors nicer to your eyes

In the diagrams added in commit f324c22db701 ("advsync: Replace
table with diagrams in \"Variables Can"), fully saturated colors
were used. They are not friendly to your eyes.
This commit uses less saturated colors of blue and red hues.
It also adds trial versions of the diagrams which depict the
"non-responsive" state of CPUs, whose info were included in
the original table, by narrow bars of higher saturation colors
on the lower side.
They are not referred to in the text yet.
Input data and the source of the conversion program are also
updated.

Suggested-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
---
 advsync/MoreThanOneValue-15CPU-noresp.eps | 1306 +++++++++++++++++++++++++++++
 advsync/MoreThanOneValue-15CPU-noresp.fig |  489 +++++++++++
 advsync/MoreThanOneValue-15CPU.eps        |  536 ++++++++----
 advsync/MoreThanOneValue-15CPU.fig        |  756 +++++++++--------
 advsync/MoreThanOneValue-15CPU.input      |   39 +-
 utilities/MoreThanOneValue-15CPU.c        |  293 ++++---
 6 files changed, 2831 insertions(+), 588 deletions(-)
 create mode 100644 advsync/MoreThanOneValue-15CPU-noresp.eps
 create mode 100644 advsync/MoreThanOneValue-15CPU-noresp.fig

diff --git a/advsync/MoreThanOneValue-15CPU-noresp.eps b/advsync/MoreThanOneValue-15CPU-noresp.eps
new file mode 100644
index 0000000..ee631e8
--- /dev/null
+++ b/advsync/MoreThanOneValue-15CPU-noresp.eps
@@ -0,0 +1,1306 @@
+%!PS-Adobe-2.0
+%%Creator: dvips(k) 5.993 Copyright 2013 Radical Eye Software
+%%Title: job-001.dvi
+%%CreationDate: Tue May  3 19:31:34 2016
+%%Pages: 1
+%%PageOrder: Ascend
+%%BoundingBox: 156 2640 708 3230
+%%EndComments
+%DVIPSWebPage: (www.radicaleye.com)
+%DVIPSCommandLine: dvips job-001.dvi -o job-001.dvips.ps
+%DVIPSParameters: dpi=600
+%DVIPSSource:  TeX output 2016.05.03:1931
+%%BeginProcSet: tex.pro 0 0
+%!
+/TeXDict 300 dict def TeXDict begin/N{def}def/B{bind def}N/S{exch}N/X{S
+N}B/A{dup}B/TR{translate}N/isls false N/vsize 11 72 mul N/hsize 8.5 72
+mul N/landplus90{false}def/@rigin{isls{[0 landplus90{1 -1}{-1 1}ifelse 0
+0 0]concat}if 72 Resolution div 72 VResolution div neg scale isls{
+landplus90{VResolution 72 div vsize mul 0 exch}{Resolution -72 div hsize
+mul 0}ifelse TR}if Resolution VResolution vsize -72 div 1 add mul TR[
+matrix currentmatrix{A A round sub abs 0.00001 lt{round}if}forall round
+exch round exch]setmatrix}N/@landscape{/isls true N}B/@manualfeed{
+statusdict/manualfeed true put}B/@copies{/#copies X}B/FMat[1 0 0 -1 0 0]
+N/FBB[0 0 0 0]N/nn 0 N/IEn 0 N/ctr 0 N/df-tail{/nn 8 dict N nn begin
+/FontType 3 N/FontMatrix fntrx N/FontBBox FBB N string/base X array
+/BitMaps X/BuildChar{CharBuilder}N/Encoding IEn N end A{/foo setfont}2
+array copy cvx N load 0 nn put/ctr 0 N[}B/sf 0 N/df{/sf 1 N/fntrx FMat N
+df-tail}B/dfs{div/sf X/fntrx[sf 0 0 sf neg 0 0]N df-tail}B/E{pop nn A
+definefont setfont}B/Cw{Cd A length 5 sub get}B/Ch{Cd A length 4 sub get
+}B/Cx{128 Cd A length 3 sub get sub}B/Cy{Cd A length 2 sub get 127 sub}
+B/Cdx{Cd A length 1 sub get}B/Ci{Cd A type/stringtype ne{ctr get/ctr ctr
+1 add N}if}B/CharBuilder{save 3 1 roll S A/base get 2 index get S
+/BitMaps get S get/Cd X pop/ctr 0 N Cdx 0 Cx Cy Ch sub Cx Cw add Cy
+setcachedevice Cw Ch true[1 0 0 -1 -.1 Cx sub Cy .1 sub]{Ci}imagemask
+restore}B/D{/cc X A type/stringtype ne{]}if nn/base get cc ctr put nn
+/BitMaps get S ctr S sf 1 ne{A A length 1 sub A 2 index S get sf div put
+}if put/ctr ctr 1 add N}B/I{cc 1 add D}B/bop{userdict/bop-hook known{
+bop-hook}if/SI save N @rigin 0 0 moveto/V matrix currentmatrix A 1 get A
+mul exch 0 get A mul add .99 lt{/QV}{/RV}ifelse load def pop pop}N/eop{
+SI restore userdict/eop-hook known{eop-hook}if showpage}N/@start{
+userdict/start-hook known{start-hook}if pop/VResolution X/Resolution X
+1000 div/DVImag X/IEn 256 array N 2 string 0 1 255{IEn S A 360 add 36 4
+index cvrs cvn put}for pop 65781.76 div/vsize X 65781.76 div/hsize X}N
+/dir 0 def/dyy{/dir 0 def}B/dyt{/dir 1 def}B/dty{/dir 2 def}B/dtt{/dir 3
+def}B/p{dir 2 eq{-90 rotate show 90 rotate}{dir 3 eq{-90 rotate show 90
+rotate}{show}ifelse}ifelse}N/RMat[1 0 0 -1 0 0]N/BDot 260 string N/Rx 0
+N/Ry 0 N/V{}B/RV/v{/Ry X/Rx X V}B statusdict begin/product where{pop
+false[(Display)(NeXT)(LaserWriter 16/600)]{A length product length le{A
+length product exch 0 exch getinterval eq{pop true exit}if}{pop}ifelse}
+forall}{false}ifelse end{{gsave TR -.1 .1 TR 1 1 scale Rx Ry false RMat{
+BDot}imagemask grestore}}{{gsave TR -.1 .1 TR Rx Ry scale 1 1 false RMat
+{BDot}imagemask grestore}}ifelse B/QV{gsave newpath transform round exch
+round exch itransform moveto Rx 0 rlineto 0 Ry neg rlineto Rx neg 0
+rlineto fill grestore}B/a{moveto}B/delta 0 N/tail{A/delta X 0 rmoveto}B
+/M{S p delta add tail}B/b{S p tail}B/c{-4 M}B/d{-3 M}B/e{-2 M}B/f{-1 M}
+B/g{0 M}B/h{1 M}B/i{2 M}B/j{3 M}B/k{4 M}B/w{0 rmoveto}B/l{p -4 w}B/m{p
+-3 w}B/n{p -2 w}B/o{p -1 w}B/q{p 1 w}B/r{p 2 w}B/s{p 3 w}B/t{p 4 w}B/x{
+0 S rmoveto}B/y{3 2 roll p a}B/bos{/SS save N}B/eos{SS restore}B end
+
+%%EndProcSet
+%%BeginProcSet: special.pro 0 0
+%!
+TeXDict begin/SDict 200 dict N SDict begin/@SpecialDefaults{/hs 612 N
+/vs 792 N/ho 0 N/vo 0 N/hsc 1 N/vsc 1 N/ang 0 N/CLIP 0 N/rwiSeen false N
+/rhiSeen false N/letter{}N/note{}N/a4{}N/legal{}N}B/@scaleunit 100 N
+/@hscale{@scaleunit div/hsc X}B/@vscale{@scaleunit div/vsc X}B/@hsize{
+/hs X/CLIP 1 N}B/@vsize{/vs X/CLIP 1 N}B/@clip{/CLIP 2 N}B/@hoffset{/ho
+X}B/@voffset{/vo X}B/@angle{/ang X}B/@rwi{10 div/rwi X/rwiSeen true N}B
+/@rhi{10 div/rhi X/rhiSeen true N}B/@llx{/llx X}B/@lly{/lly X}B/@urx{
+/urx X}B/@ury{/ury X}B/magscale true def end/@MacSetUp{userdict/md known
+{userdict/md get type/dicttype eq{userdict begin md length 10 add md
+maxlength ge{/md md dup length 20 add dict copy def}if end md begin
+/letter{}N/note{}N/legal{}N/od{txpose 1 0 mtx defaultmatrix dtransform S
+atan/pa X newpath clippath mark{transform{itransform moveto}}{transform{
+itransform lineto}}{6 -2 roll transform 6 -2 roll transform 6 -2 roll
+transform{itransform 6 2 roll itransform 6 2 roll itransform 6 2 roll
+curveto}}{{closepath}}pathforall newpath counttomark array astore/gc xdf
+pop ct 39 0 put 10 fz 0 fs 2 F/|______NimbusMonL-Regu fnt invertflag{PaintBlack}
+if}N/txpose{pxs pys scale ppr aload pop por{noflips{pop S neg S TR pop 1
+-1 scale}if xflip yflip and{pop S neg S TR 180 rotate 1 -1 scale ppr 3
+get ppr 1 get neg sub neg ppr 2 get ppr 0 get neg sub neg TR}if xflip
+yflip not and{pop S neg S TR pop 180 rotate ppr 3 get ppr 1 get neg sub
+neg 0 TR}if yflip xflip not and{ppr 1 get neg ppr 0 get neg TR}if}{
+noflips{TR pop pop 270 rotate 1 -1 scale}if xflip yflip and{TR pop pop
+90 rotate 1 -1 scale ppr 3 get ppr 1 get neg sub neg ppr 2 get ppr 0 get
+neg sub neg TR}if xflip yflip not and{TR pop pop 90 rotate ppr 3 get ppr
+1 get neg sub neg 0 TR}if yflip xflip not and{TR pop pop 270 rotate ppr
+2 get ppr 0 get neg sub neg 0 S TR}if}ifelse scaleby96{ppr aload pop 4
+-1 roll add 2 div 3 1 roll add 2 div 2 copy TR .96 dup scale neg S neg S
+TR}if}N/cp{pop pop showpage pm restore}N end}if}if}N/normalscale{
+Resolution 72 div VResolution 72 div neg scale magscale{DVImag dup scale
+}if 0 setgray}N/psfts{S 65781.76 div N}N/startTexFig{/psf$SavedState
+save N userdict maxlength dict begin/magscale true def normalscale
+currentpoint TR/psf$ury psfts/psf$urx psfts/psf$lly psfts/psf$llx psfts
+/psf$y psfts/psf$x psfts currentpoint/psf$cy X/psf$cx X/psf$sx psf$x
+psf$urx psf$llx sub div N/psf$sy psf$y psf$ury psf$lly sub div N psf$sx
+psf$sy scale psf$cx psf$sx div psf$llx sub psf$cy psf$sy div psf$ury sub
+TR/showpage{}N/erasepage{}N/setpagedevice{pop}N/copypage{}N/p 3 def
+@MacSetUp}N/doclip{psf$llx psf$lly psf$urx psf$ury currentpoint 6 2 roll
+newpath 4 copy 4 2 roll moveto 6 -1 roll S lineto S lineto S lineto
+closepath clip newpath moveto}N/endTexFig{end psf$SavedState restore}N
+/@beginspecial{SDict begin/SpecialSave save N gsave normalscale
+currentpoint TR @SpecialDefaults count/ocount X/dcount countdictstack N}
+N/@setspecial{CLIP 1 eq{newpath 0 0 moveto hs 0 rlineto 0 vs rlineto hs
+neg 0 rlineto closepath clip}if ho vo TR hsc vsc scale ang rotate
+rwiSeen{rwi urx llx sub div rhiSeen{rhi ury lly sub div}{dup}ifelse
+scale llx neg lly neg TR}{rhiSeen{rhi ury lly sub div dup scale llx neg
+lly neg TR}if}ifelse CLIP 2 eq{newpath llx lly moveto urx lly lineto urx
+ury lineto llx ury lineto closepath clip}if/showpage{}N/erasepage{}N
+/setpagedevice{pop}N/copypage{}N newpath}N/@endspecial{count ocount sub{
+pop}repeat countdictstack dcount sub{end}repeat grestore SpecialSave
+restore end}N/@defspecial{SDict begin}N/@fedspecial{end}B/li{lineto}B
+/rl{rlineto}B/rc{rcurveto}B/np{/SaveX currentpoint/SaveY X N 1
+setlinecap newpath}N/st{stroke SaveX SaveY moveto}N/fil{fill SaveX SaveY
+moveto}N/ellipse{/endangle X/startangle X/yrad X/xrad X/savematrix
+matrix currentmatrix N TR xrad yrad scale 0 0 1 startangle endangle arc
+savematrix setmatrix}N end
+
+%%EndProcSet
+%%BeginProcSet: color.pro 0 0
+%!
+TeXDict begin/setcmykcolor where{pop}{/setcmykcolor{dup 10 eq{pop
+setrgbcolor}{1 sub 4 1 roll 3{3 index add neg dup 0 lt{pop 0}if 3 1 roll
+}repeat setrgbcolor pop}ifelse}B}ifelse/TeXcolorcmyk{setcmykcolor}def
+/TeXcolorrgb{setrgbcolor}def/TeXcolorgrey{setgray}def/TeXcolorgray{
+setgray}def/TeXcolorhsb{sethsbcolor}def/currentcmykcolor where{pop}{
+/currentcmykcolor{currentrgbcolor 10}B}ifelse/DC{exch dup userdict exch
+known{pop pop}{X}ifelse}B/GreenYellow{0.15 0 0.69 0 setcmykcolor}DC
+/Yellow{0 0 1 0 setcmykcolor}DC/Goldenrod{0 0.10 0.84 0 setcmykcolor}DC
+/Dandelion{0 0.29 0.84 0 setcmykcolor}DC/Apricot{0 0.32 0.52 0
+setcmykcolor}DC/Peach{0 0.50 0.70 0 setcmykcolor}DC/Melon{0 0.46 0.50 0
+setcmykcolor}DC/YellowOrange{0 0.42 1 0 setcmykcolor}DC/Orange{0 0.61
+0.87 0 setcmykcolor}DC/BurntOrange{0 0.51 1 0 setcmykcolor}DC
+/Bittersweet{0 0.75 1 0.24 setcmykcolor}DC/RedOrange{0 0.77 0.87 0
+setcmykcolor}DC/Mahogany{0 0.85 0.87 0.35 setcmykcolor}DC/Maroon{0 0.87
+0.68 0.32 setcmykcolor}DC/BrickRed{0 0.89 0.94 0.28 setcmykcolor}DC/Red{
+0 1 1 0 setcmykcolor}DC/OrangeRed{0 1 0.50 0 setcmykcolor}DC/RubineRed{
+0 1 0.13 0 setcmykcolor}DC/WildStrawberry{0 0.96 0.39 0 setcmykcolor}DC
+/Salmon{0 0.53 0.38 0 setcmykcolor}DC/CarnationPink{0 0.63 0 0
+setcmykcolor}DC/Magenta{0 1 0 0 setcmykcolor}DC/VioletRed{0 0.81 0 0
+setcmykcolor}DC/Rhodamine{0 0.82 0 0 setcmykcolor}DC/Mulberry{0.34 0.90
+0 0.02 setcmykcolor}DC/RedViolet{0.07 0.90 0 0.34 setcmykcolor}DC
+/Fuchsia{0.47 0.91 0 0.08 setcmykcolor}DC/Lavender{0 0.48 0 0
+setcmykcolor}DC/Thistle{0.12 0.59 0 0 setcmykcolor}DC/Orchid{0.32 0.64 0
+0 setcmykcolor}DC/DarkOrchid{0.40 0.80 0.20 0 setcmykcolor}DC/Purple{
+0.45 0.86 0 0 setcmykcolor}DC/Plum{0.50 1 0 0 setcmykcolor}DC/Violet{
+0.79 0.88 0 0 setcmykcolor}DC/RoyalPurple{0.75 0.90 0 0 setcmykcolor}DC
+/BlueViolet{0.86 0.91 0 0.04 setcmykcolor}DC/Periwinkle{0.57 0.55 0 0
+setcmykcolor}DC/CadetBlue{0.62 0.57 0.23 0 setcmykcolor}DC
+/CornflowerBlue{0.65 0.13 0 0 setcmykcolor}DC/MidnightBlue{0.98 0.13 0
+0.43 setcmykcolor}DC/NavyBlue{0.94 0.54 0 0 setcmykcolor}DC/RoyalBlue{1
+0.50 0 0 setcmykcolor}DC/Blue{1 1 0 0 setcmykcolor}DC/Cerulean{0.94 0.11
+0 0 setcmykcolor}DC/Cyan{1 0 0 0 setcmykcolor}DC/ProcessBlue{0.96 0 0 0
+setcmykcolor}DC/SkyBlue{0.62 0 0.12 0 setcmykcolor}DC/Turquoise{0.85 0
+0.20 0 setcmykcolor}DC/TealBlue{0.86 0 0.34 0.02 setcmykcolor}DC
+/Aquamarine{0.82 0 0.30 0 setcmykcolor}DC/BlueGreen{0.85 0 0.33 0
+setcmykcolor}DC/Emerald{1 0 0.50 0 setcmykcolor}DC/JungleGreen{0.99 0
+0.52 0 setcmykcolor}DC/SeaGreen{0.69 0 0.50 0 setcmykcolor}DC/Green{1 0
+1 0 setcmykcolor}DC/ForestGreen{0.91 0 0.88 0.12 setcmykcolor}DC
+/PineGreen{0.92 0 0.59 0.25 setcmykcolor}DC/LimeGreen{0.50 0 1 0
+setcmykcolor}DC/YellowGreen{0.44 0 0.74 0 setcmykcolor}DC/SpringGreen{
+0.26 0 0.76 0 setcmykcolor}DC/OliveGreen{0.64 0 0.95 0.40 setcmykcolor}
+DC/RawSienna{0 0.72 1 0.45 setcmykcolor}DC/Sepia{0 0.83 1 0.70
+setcmykcolor}DC/Brown{0 0.81 1 0.60 setcmykcolor}DC/Tan{0.14 0.42 0.56 0
+setcmykcolor}DC/Gray{0 0 0 0.50 setcmykcolor}DC/Black{0 0 0 1
+setcmykcolor}DC/White{0 0 0 0 setcmykcolor}DC end
+
+%%EndProcSet
+TeXDict begin 156819571 221710428 1000 600 600 (job-001.dvi)
+@start end
+%%EndProlog
+%%BeginSetup
+%%Feature: *Resolution 600dpi
+TeXDict begin
+ end
+%%EndSetup
+%%Page: 1 1
+TeXDict begin 1 0 bop Black Black 706 5483 a @beginspecial
+0 @llx 0 @lly 552 @urx 589 @ury 5520 @rwi @setspecial
+%%BeginDocument: job-001.fig2dev.ps
+%!PS-Adobe-3.0 EPSF-3.0
+%%Title: job-001.fig
+%%Creator: fig2dev Version 3.2 Patchlevel 5e
+%%CreationDate: Tue May  3 19:31:33 2016
+%%BoundingBox: 156 2640 708 3230
+%Magnification: 1.0000
+%%EndComments
+%%BeginProlog
+/$F2psDict 200 dict def
+$F2psDict begin
+$F2psDict /mtrx matrix put
+/col-1 {0 setgray} bind def
+/col0 {0.000 0.000 0.000 srgb} bind def
+/col1 {0.000 0.000 1.000 srgb} bind def
+/col2 {0.000 1.000 0.000 srgb} bind def
+/col3 {0.000 1.000 1.000 srgb} bind def
+/col4 {1.000 0.000 0.000 srgb} bind def
+/col5 {1.000 0.000 1.000 srgb} bind def
+/col6 {1.000 1.000 0.000 srgb} bind def
+/col7 {1.000 1.000 1.000 srgb} bind def
+/col8 {0.000 0.000 0.560 srgb} bind def
+/col9 {0.000 0.000 0.690 srgb} bind def
+/col10 {0.000 0.000 0.820 srgb} bind def
+/col11 {0.530 0.810 1.000 srgb} bind def
+/col12 {0.000 0.560 0.000 srgb} bind def
+/col13 {0.000 0.690 0.000 srgb} bind def
+/col14 {0.000 0.820 0.000 srgb} bind def
+/col15 {0.000 0.560 0.560 srgb} bind def
+/col16 {0.000 0.690 0.690 srgb} bind def
+/col17 {0.000 0.820 0.820 srgb} bind def
+/col18 {0.560 0.000 0.000 srgb} bind def
+/col19 {0.690 0.000 0.000 srgb} bind def
+/col20 {0.820 0.000 0.000 srgb} bind def
+/col21 {0.560 0.000 0.560 srgb} bind def
+/col22 {0.690 0.000 0.690 srgb} bind def
+/col23 {0.820 0.000 0.820 srgb} bind def
+/col24 {0.500 0.190 0.000 srgb} bind def
+/col25 {0.630 0.250 0.000 srgb} bind def
+/col26 {0.750 0.380 0.000 srgb} bind def
+/col27 {1.000 0.500 0.500 srgb} bind def
+/col28 {1.000 0.630 0.630 srgb} bind def
+/col29 {1.000 0.750 0.750 srgb} bind def
+/col30 {1.000 0.880 0.880 srgb} bind def
+/col31 {1.000 0.840 0.000 srgb} bind def
+
+end
+
+/cp {closepath} bind def
+/ef {eofill} bind def
+/gr {grestore} bind def
+/gs {gsave} bind def
+/sa {save} bind def
+/rs {restore} bind def
+/l {lineto} bind def
+/m {moveto} bind def
+/rm {rmoveto} bind def
+/n {newpath} bind def
+/s {stroke} bind def
+/sh {show} bind def
+/slc {setlinecap} bind def
+/slj {setlinejoin} bind def
+/slw {setlinewidth} bind def
+/srgb {setrgbcolor} bind def
+/rot {rotate} bind def
+/sc {scale} bind def
+/sd {setdash} bind def
+/ff {findfont} bind def
+/sf {setfont} bind def
+/scf {scalefont} bind def
+/sw {stringwidth} bind def
+/tr {translate} bind def
+/tnt {dup dup currentrgbcolor
+  4 -2 roll dup 1 exch sub 3 -1 roll mul add
+  4 -2 roll dup 1 exch sub 3 -1 roll mul add
+  4 -2 roll dup 1 exch sub 3 -1 roll mul add srgb}
+  bind def
+/shd {dup dup currentrgbcolor 4 -2 roll mul 4 -2 roll mul
+  4 -2 roll mul srgb} bind def
+/$F2psBegin {$F2psDict begin /$F2psEnteredState save def} def
+/$F2psEnd {$F2psEnteredState restore end} def
+
+/pageheader {
+save
+newpath 0 589 moveto 0 0 lineto 552 0 lineto 552 589 lineto closepath clip newpath
+-14.1 587.4 translate
+1 -1 scale
+$F2psBegin
+10 setmiterlimit
+0 slj 0 slc
+ 0.06299 0.06299 sc
+} bind def
+/pagefooter {
+$F2psEnd
+restore
+} bind def
+%%EndProlog
+pageheader
+%
+% Fig objects follow
+%
+% 
+% here starts figure with depth 50
+% Polyline
+0 slj
+0 slc
+7.500 slw
+n 700 0 m 880 0 l 880 270 l 700 270 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 880 0 m 2050 0 l 2050 270 l 880 270 l
+ cp gs col1 0.60 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 895 200 m 2040 200 l 2040 260 l 895 260 l
+ cp gs col1 0.40 tnt ef gr 
+% Polyline
+7.500 slw
+n 2050 0 m 2905 0 l 2905 270 l 2050 270 l
+ cp gs col1 0.85 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 2065 200 m 2895 200 l 2895 260 l 2065 260 l
+ cp gs col1 0.65 tnt ef gr 
+% Polyline
+7.500 slw
+n 2905 0 m 4075 0 l 4075 270 l 2905 270 l
+ cp gs col1 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 2920 200 m 4065 200 l 4065 260 l 2920 260 l
+ cp gs col1 0.55 tnt ef gr 
+% Polyline
+7.500 slw
+n 4075 0 m 5365 0 l 5365 270 l 4075 270 l
+ cp gs col4 0.85 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 4090 200 m 5355 200 l 5355 260 l 4090 260 l
+ cp gs col4 0.65 tnt ef gr 
+% Polyline
+7.500 slw
+n 5365 0 m 7330 0 l 7330 270 l 5365 270 l
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 5380 200 m 7320 200 l 7320 260 l 5380 260 l
+ cp gs col4 0.40 tnt ef gr 
+% Polyline
+7.500 slw
+n 7330 0 m 8425 0 l 8425 270 l 7330 270 l
+ cp gs col1 0.70 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 7345 200 m 8415 200 l 8415 260 l 7345 260 l
+ cp gs col1 0.50 tnt ef gr 
+% Polyline
+7.500 slw
+n 8425 0 m 8950 0 l 8950 270 l 8425 270 l
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+n 700 270 m 940 270 l 940 540 l 700 540 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 940 270 m 7315 270 l 7315 540 l 940 540 l
+ cp gs col1 0.65 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 955 470 m 7305 470 l 7305 530 l 955 530 l
+ cp gs col1 0.45 tnt ef gr 
+% Polyline
+7.500 slw
+n 7315 270 m 8350 270 l 8350 540 l 7315 540 l
+ cp gs col1 0.70 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 7345 470 m 8340 470 l 8340 530 l 7345 530 l
+ cp gs col1 0.50 tnt ef gr 
+% Polyline
+7.500 slw
+n 8350 270 m 8950 270 l 8950 540 l 8350 540 l
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+n 700 540 m 955 540 l 955 810 l 700 810 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 955 540 m 8365 540 l 8365 810 l 955 810 l
+ cp gs col1 0.70 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 985 740 m 8355 740 l 8355 800 l 985 800 l
+ cp gs col1 0.50 tnt ef gr 
+% Polyline
+7.500 slw
+n 8365 540 m 8950 540 l 8950 810 l 8365 810 l
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+n 700 810 m 925 810 l 925 1080 l 700 1080 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 925 810 m 3880 810 l 3880 1080 l 925 1080 l
+ cp gs col1 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 940 1010 m 3870 1010 l 3870 1070 l 940 1070 l
+ cp gs col1 0.55 tnt ef gr 
+% Polyline
+7.500 slw
+n 3880 810 m 5110 810 l 5110 1080 l 3880 1080 l
+ cp gs col4 0.85 tnt ef gr gs col0 s gr 
+% Polyline
+n 5110 810 m 6565 810 l 6565 1080 l 5110 1080 l
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 5725 1010 m 6555 1010 l 6555 1070 l 5725 1070 l
+ cp gs col4 0.40 tnt ef gr 
+% Polyline
+7.500 slw
+n 6565 810 m 7825 810 l 7825 1080 l 6565 1080 l
+ cp gs col4 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 6700 1010 m 7815 1010 l 7815 1070 l 6700 1070 l
+ cp gs col4 0.55 tnt ef gr 
+% Polyline
+7.500 slw
+n 7825 810 m 8950 810 l 8950 1080 l 7825 1080 l
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+n 700 1080 m 940 1080 l 940 1350 l 700 1350 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 940 1080 m 3910 1080 l 3910 1350 l 940 1350 l
+ cp gs col1 0.80 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 955 1280 m 3900 1280 l 3900 1340 l 955 1340 l
+ cp gs col1 0.60 tnt ef gr 
+% Polyline
+7.500 slw
+n 3910 1080 m 5155 1080 l 5155 1350 l 3910 1350 l
+ cp gs col4 0.85 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 4090 1280 m 5145 1280 l 5145 1340 l 4090 1340 l
+ cp gs col4 0.65 tnt ef gr 
+% Polyline
+7.500 slw
+n 5155 1080 m 6595 1080 l 6595 1350 l 5155 1350 l
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 5725 1280 m 6585 1280 l 6585 1340 l 5725 1340 l
+ cp gs col4 0.40 tnt ef gr 
+% Polyline
+7.500 slw
+n 6595 1080 m 7840 1080 l 7840 1350 l 6595 1350 l
+ cp gs col4 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 6700 1280 m 7830 1280 l 7830 1340 l 6700 1340 l
+ cp gs col4 0.55 tnt ef gr 
+% Polyline
+7.500 slw
+n 7840 1080 m 8950 1080 l 8950 1350 l 7840 1350 l
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+n 700 1350 m 955 1350 l 955 1620 l 700 1620 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 955 1350 m 3295 1350 l 3295 1620 l 955 1620 l
+ cp gs col1 0.85 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 970 1550 m 3285 1550 l 3285 1610 l 970 1610 l
+ cp gs col1 0.65 tnt ef gr 
+% Polyline
+7.500 slw
+n 3295 1350 m 5695 1350 l 5695 1620 l 3295 1620 l
+ cp gs col1 0.65 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 3310 1550 m 5685 1550 l 5685 1610 l 3310 1610 l
+ cp gs col1 0.45 tnt ef gr 
+% Polyline
+7.500 slw
+n 5695 1350 m 8200 1350 l 8200 1620 l 5695 1620 l
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 5725 1550 m 8190 1550 l 8190 1610 l 5725 1610 l
+ cp gs col4 0.40 tnt ef gr 
+% Polyline
+7.500 slw
+n 8200 1350 m 8950 1350 l 8950 1620 l 8200 1620 l
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+n 700 1620 m 970 1620 l 970 1890 l 700 1890 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 970 1620 m 3280 1620 l 3280 1890 l 970 1890 l
+ cp gs col1 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 985 1820 m 3270 1820 l 3270 1880 l 985 1880 l
+ cp gs col1 0.70 tnt ef gr 
+% Polyline
+7.500 slw
+n 3280 1620 m 5710 1620 l 5710 1890 l 3280 1890 l
+ cp gs col1 0.65 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 3295 1820 m 5700 1820 l 5700 1880 l 3295 1880 l
+ cp gs col1 0.45 tnt ef gr 
+% Polyline
+7.500 slw
+n 5710 1620 m 8185 1620 l 8185 1890 l 5710 1890 l
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 5725 1820 m 8175 1820 l 8175 1880 l 5725 1880 l
+ cp gs col4 0.40 tnt ef gr 
+% Polyline
+7.500 slw
+n 8185 1620 m 8950 1620 l 8950 1890 l 8185 1890 l
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+n 700 1890 m 925 1890 l 925 2160 l 700 2160 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 925 1890 m 1075 1890 l 1075 2160 l 925 2160 l
+ cp gs col7 1.00 shd ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 940 2090 m 1065 2090 l 1065 2150 l 940 2150 l
+ cp gs col7 0.75 shd ef gr 
+% Polyline
+7.500 slw
+n 1075 1890 m 8950 1890 l 8950 2160 l 1075 2160 l
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+n 700 2160 m 955 2160 l 955 2430 l 700 2430 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 955 2160 m 8950 2160 l 8950 2430 l 955 2430 l
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+n 700 2430 m 1015 2430 l 1015 2700 l 700 2700 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 1015 2430 m 5320 2430 l 5320 2700 l 1015 2700 l
+ cp gs col4 0.85 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 4090 2630 m 5310 2630 l 5310 2690 l 4090 2690 l
+ cp gs col4 0.65 tnt ef gr 
+% Polyline
+7.500 slw
+n 5320 2430 m 6655 2430 l 6655 2700 l 5320 2700 l
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 5725 2630 m 6645 2630 l 6645 2690 l 5725 2690 l
+ cp gs col4 0.40 tnt ef gr 
+% Polyline
+7.500 slw
+n 6655 2430 m 7780 2430 l 7780 2700 l 6655 2700 l
+ cp gs col4 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 6700 2630 m 7770 2630 l 7770 2690 l 6700 2690 l
+ cp gs col4 0.55 tnt ef gr 
+% Polyline
+7.500 slw
+n 7780 2430 m 8950 2430 l 8950 2700 l 7780 2700 l
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+n 700 2700 m 1000 2700 l 1000 2970 l 700 2970 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 1000 2700 m 1870 2700 l 1870 2970 l 1000 2970 l
+ cp gs col4 0.80 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 1015 2900 m 1860 2900 l 1860 2960 l 1015 2960 l
+ cp gs col4 0.60 tnt ef gr 
+% Polyline
+7.500 slw
+n 1870 2700 m 5335 2700 l 5335 2970 l 1870 2970 l
+ cp gs col4 0.85 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 4090 2900 m 5325 2900 l 5325 2960 l 4090 2960 l
+ cp gs col4 0.65 tnt ef gr 
+% Polyline
+7.500 slw
+n 5335 2700 m 6685 2700 l 6685 2970 l 5335 2970 l
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 5725 2900 m 6675 2900 l 6675 2960 l 5725 2960 l
+ cp gs col4 0.40 tnt ef gr 
+% Polyline
+7.500 slw
+n 6685 2700 m 7795 2700 l 7795 2970 l 6685 2970 l
+ cp gs col4 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 6700 2900 m 7785 2900 l 7785 2960 l 6700 2960 l
+ cp gs col4 0.55 tnt ef gr 
+% Polyline
+7.500 slw
+n 7795 2700 m 8950 2700 l 8950 2970 l 7795 2970 l
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+n 700 2970 m 895 2970 l 895 3240 l 700 3240 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 895 2970 m 8575 2970 l 8575 3240 l 895 3240 l
+ cp gs col4 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 6700 3170 m 8565 3170 l 8565 3230 l 6700 3230 l
+ cp gs col4 0.55 tnt ef gr 
+% Polyline
+7.500 slw
+n 8575 2970 m 8950 2970 l 8950 3240 l 8575 3240 l
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+n 700 3240 m 880 3240 l 880 3510 l 700 3510 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 880 3240 m 1555 3240 l 1555 3510 l 880 3510 l
+ cp gs col4 0.70 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 895 3440 m 1545 3440 l 1545 3500 l 895 3500 l
+ cp gs col4 0.50 tnt ef gr 
+% Polyline
+7.500 slw
+n 1555 3240 m 8545 3240 l 8545 3510 l 1555 3510 l
+ cp gs col4 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 6700 3440 m 8535 3440 l 8535 3500 l 6700 3500 l
+ cp gs col4 0.55 tnt ef gr 
+% Polyline
+7.500 slw
+n 8545 3240 m 8950 3240 l 8950 3510 l 8545 3510 l
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+n 700 3510 m 895 3510 l 895 3780 l 700 3780 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 895 3510 m 1000 3510 l 1000 3780 l 895 3780 l
+ cp gs col4 0.65 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 910 3710 m 990 3710 l 990 3770 l 910 3770 l
+ cp gs col4 0.45 tnt ef gr 
+% Polyline
+7.500 slw
+n 1000 3510 m 6385 3510 l 6385 3780 l 1000 3780 l
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
+% Polyline
+n 6385 3510 m 8620 3510 l 8620 3780 l 6385 3780 l
+ cp gs col4 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 6700 3710 m 8610 3710 l 8610 3770 l 6700 3770 l
+ cp gs col4 0.55 tnt ef gr 
+% Polyline
+7.500 slw
+n 8620 3510 m 8950 3510 l 8950 3780 l 8620 3780 l
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+n 700 3780 m 940 3780 l 940 4050 l 700 4050 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 940 3780 m 6415 3780 l 6415 4050 l 940 4050 l
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 1090 3980 m 6405 3980 l 6405 4040 l 1090 4040 l
+ cp gs col4 0.40 tnt ef gr 
+% Polyline
+7.500 slw
+n 6415 3780 m 8635 3780 l 8635 4050 l 6415 4050 l
+ cp gs col4 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 6700 3980 m 8625 3980 l 8625 4040 l 6700 4040 l
+ cp gs col4 0.55 tnt ef gr 
+% Polyline
+7.500 slw
+n 8635 3780 m 8950 3780 l 8950 4050 l 8635 4050 l
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+15.000 slw
+gs  clippath
+8814 4280 m 8965 4280 l 8965 4220 l 8814 4220 l 8814 4220 l 8934 4250 l 8814 4280 l cp
+eoclip
+n 700 4250 m
+ 8950 4250 l gs col0 s gr gr
+
+% arrowhead
+7.500 slw
+n 8814 4280 m 8934 4250 l 8814 4220 l 8814 4280 l  cp gs 0.00 setgray ef gr  col0 s
+% Polyline
+n 700 4200 m
+ 700 4300 l gs col0 s gr 
+% Polyline
+n 1450 4200 m
+ 1450 4300 l gs col0 s gr 
+% Polyline
+n 2200 4200 m
+ 2200 4300 l gs col0 s gr 
+% Polyline
+n 2950 4200 m
+ 2950 4300 l gs col0 s gr 
+% Polyline
+n 3700 4200 m
+ 3700 4300 l gs col0 s gr 
+% Polyline
+n 4450 4200 m
+ 4450 4300 l gs col0 s gr 
+% Polyline
+n 5200 4200 m
+ 5200 4300 l gs col0 s gr 
+% Polyline
+n 5950 4200 m
+ 5950 4300 l gs col0 s gr 
+% Polyline
+n 6700 4200 m
+ 6700 4300 l gs col0 s gr 
+% Polyline
+n 7450 4200 m
+ 7450 4300 l gs col0 s gr 
+% Polyline
+n 8200 4200 m
+ 8200 4300 l gs col0 s gr 
+% Polyline
+n 700 4860 m 2500 4860 l 2500 5130 l 700 5130 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 2500 4860 m 8200 4860 l 8200 5130 l 2500 5130 l
+ cp gs col1 0.60 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 2650 5060 m 8190 5060 l 8190 5120 l 2650 5120 l
+ cp gs col1 0.40 tnt ef gr 
+% Polyline
+7.500 slw
+n 700 5130 m 3100 5130 l 3100 5400 l 700 5400 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 3100 5130 m 8200 5130 l 8200 5400 l 3100 5400 l
+ cp gs col1 0.65 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 3250 5330 m 8190 5330 l 8190 5390 l 3250 5390 l
+ cp gs col1 0.45 tnt ef gr 
+% Polyline
+7.500 slw
+n 700 5400 m 3250 5400 l 3250 5670 l 700 5670 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 3250 5400 m 8200 5400 l 8200 5670 l 3250 5670 l
+ cp gs col1 0.70 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 3550 5600 m 8190 5600 l 8190 5660 l 3550 5660 l
+ cp gs col1 0.50 tnt ef gr 
+% Polyline
+7.500 slw
+n 700 5670 m 2950 5670 l 2950 5940 l 700 5940 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 2950 5670 m 8200 5670 l 8200 5940 l 2950 5940 l
+ cp gs col1 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 3100 5870 m 8190 5870 l 8190 5930 l 3100 5930 l
+ cp gs col1 0.55 tnt ef gr 
+% Polyline
+7.500 slw
+n 700 5940 m 3100 5940 l 3100 6210 l 700 6210 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 3100 5940 m 8200 5940 l 8200 6210 l 3100 6210 l
+ cp gs col1 0.80 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 3250 6140 m 8190 6140 l 8190 6200 l 3250 6200 l
+ cp gs col1 0.60 tnt ef gr 
+% Polyline
+7.500 slw
+n 700 6210 m 3250 6210 l 3250 6480 l 700 6480 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 3250 6210 m 8200 6210 l 8200 6480 l 3250 6480 l
+ cp gs col1 0.85 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 3400 6410 m 8190 6410 l 8190 6470 l 3400 6470 l
+ cp gs col1 0.65 tnt ef gr 
+% Polyline
+7.500 slw
+n 700 6480 m 3400 6480 l 3400 6750 l 700 6750 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 3400 6480 m 8200 6480 l 8200 6750 l 3400 6750 l
+ cp gs col1 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 3550 6680 m 8190 6680 l 8190 6740 l 3550 6740 l
+ cp gs col1 0.70 tnt ef gr 
+% Polyline
+7.500 slw
+n 700 6750 m 2950 6750 l 2950 7020 l 700 7020 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 2950 6750 m 4450 6750 l 4450 7020 l 2950 7020 l
+ cp gs col7 1.00 shd ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 3100 6950 m 4440 6950 l 4440 7010 l 3100 7010 l
+ cp gs col7 0.75 shd ef gr 
+% Polyline
+7.500 slw
+n 4450 6750 m 8200 6750 l 8200 7020 l 4450 7020 l
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+n 700 7020 m 3250 7020 l 3250 7290 l 700 7290 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 3250 7020 m 8200 7020 l 8200 7290 l 3250 7290 l
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+n 700 7290 m 3850 7290 l 3850 7560 l 700 7560 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 3850 7290 m 8200 7290 l 8200 7560 l 3850 7560 l
+ cp gs col4 0.85 tnt ef gr gs col0 s gr 
+% Polyline
+n 700 7560 m 3700 7560 l 3700 7830 l 700 7830 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 3700 7560 m 8200 7560 l 8200 7830 l 3700 7830 l
+ cp gs col4 0.80 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 3850 7760 m 8190 7760 l 8190 7820 l 3850 7820 l
+ cp gs col4 0.60 tnt ef gr 
+% Polyline
+7.500 slw
+n 700 7830 m 2650 7830 l 2650 8100 l 700 8100 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 2650 7830 m 8200 7830 l 8200 8100 l 2650 8100 l
+ cp gs col4 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+n 700 8100 m 2500 8100 l 2500 8370 l 700 8370 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 2500 8100 m 8200 8100 l 8200 8370 l 2500 8370 l
+ cp gs col4 0.70 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 2650 8300 m 8190 8300 l 8190 8360 l 2650 8360 l
+ cp gs col4 0.50 tnt ef gr 
+% Polyline
+7.500 slw
+n 700 8370 m 2650 8370 l 2650 8640 l 700 8640 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 2650 8370 m 3700 8370 l 3700 8640 l 2650 8640 l
+ cp gs col4 0.65 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 2800 8570 m 3690 8570 l 3690 8630 l 2800 8630 l
+ cp gs col4 0.45 tnt ef gr 
+% Polyline
+7.500 slw
+n 3700 8370 m 8200 8370 l 8200 8640 l 3700 8640 l
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
+% Polyline
+n 700 8640 m 3100 8640 l 3100 8910 l 700 8910 l
+ cp gs 0.40 setgray ef gr gs col0 s gr 
+% Polyline
+n 3100 8640 m 8200 8640 l 8200 8910 l 3100 8910 l
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 4600 8840 m 8190 8840 l 8190 8900 l 4600 8900 l
+ cp gs col4 0.40 tnt ef gr 
+% Polyline
+15.000 slw
+gs  clippath
+8064 9140 m 8215 9140 l 8215 9080 l 8064 9080 l 8064 9080 l 8184 9110 l 8064 9140 l cp
+eoclip
+n 700 9110 m
+ 8200 9110 l gs col0 s gr gr
+
+% arrowhead
+7.500 slw
+n 8064 9140 m 8184 9110 l 8064 9080 l 8064 9140 l  cp gs 0.00 setgray ef gr  col0 s
+% Polyline
+n 700 9060 m
+ 700 9160 l gs col0 s gr 
+% Polyline
+n 1450 9060 m
+ 1450 9160 l gs col0 s gr 
+% Polyline
+n 2200 9060 m
+ 2200 9160 l gs col0 s gr 
+% Polyline
+n 2950 9060 m
+ 2950 9160 l gs col0 s gr 
+% Polyline
+n 3700 9060 m
+ 3700 9160 l gs col0 s gr 
+% Polyline
+n 4450 9060 m
+ 4450 9160 l gs col0 s gr 
+% Polyline
+n 5200 9060 m
+ 5200 9160 l gs col0 s gr 
+% Polyline
+n 5950 9060 m
+ 5950 9160 l gs col0 s gr 
+% Polyline
+n 6700 9060 m
+ 6700 9160 l gs col0 s gr 
+% Polyline
+n 7450 9060 m
+ 7450 9160 l gs col0 s gr 
+% Polyline
+ [60] 0 sd
+n 700 4250 m
+ 700 4860 l gs col0 s gr  [] 0 sd
+% Polyline
+ [60] 0 sd
+n 1450 4250 m
+ 8200 4860 l gs col0 s gr  [] 0 sd
+% Polyline
+n 3900 4725 m
+ 3900 9270 l gs col0 s gr 
+/NimbusSanL-Bold ff 135.00 scf sf
+1465 200 m
+gs 1 -1 sc (1) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+2470 200 m
+gs 1 -1 sc (6) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+3490 200 m
+gs 1 -1 sc (4) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+4720 200 m
+gs 1 -1 sc (10) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+6340 200 m
+gs 1 -1 sc (15) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+7870 200 m
+gs 1 -1 sc (3) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+8680 200 m
+gs 1 -1 sc (9) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+4120 470 m
+gs 1 -1 sc (2) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+7825 470 m
+gs 1 -1 sc (3) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+8650 470 m
+gs 1 -1 sc (9) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+4660 740 m
+gs 1 -1 sc (3) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+8650 740 m
+gs 1 -1 sc (9) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+2395 1010 m
+gs 1 -1 sc (4) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+4495 1010 m
+gs 1 -1 sc (10) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+5830 1010 m
+gs 1 -1 sc (15) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+7195 1010 m
+gs 1 -1 sc (12) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+8380 1010 m
+gs 1 -1 sc (9) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+2425 1280 m
+gs 1 -1 sc (5) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+4525 1280 m
+gs 1 -1 sc (10) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+5875 1280 m
+gs 1 -1 sc (15) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+7210 1280 m
+gs 1 -1 sc (12) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+8395 1280 m
+gs 1 -1 sc (9) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+2125 1550 m
+gs 1 -1 sc (6) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+4495 1550 m
+gs 1 -1 sc (2) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+6940 1550 m
+gs 1 -1 sc (15) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+8575 1550 m
+gs 1 -1 sc (9) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+2125 1820 m
+gs 1 -1 sc (7) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+4495 1820 m
+gs 1 -1 sc (2) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+6940 1820 m
+gs 1 -1 sc (15) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+8560 1820 m
+gs 1 -1 sc (9) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+1000 2090 m
+gs 1 -1 sc (8) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+5005 2090 m
+gs 1 -1 sc (9) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+4945 2360 m
+gs 1 -1 sc (9) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+3160 2630 m
+gs 1 -1 sc (10) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+5980 2630 m
+gs 1 -1 sc (15) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+7210 2630 m
+gs 1 -1 sc (12) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+8365 2630 m
+gs 1 -1 sc (9) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+1435 2900 m
+gs 1 -1 sc (11) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+3595 2900 m
+gs 1 -1 sc (10) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+6010 2900 m
+gs 1 -1 sc (15) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+7240 2900 m
+gs 1 -1 sc (12) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+8365 2900 m
+gs 1 -1 sc (9) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+4735 3170 m
+gs 1 -1 sc (12) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+8755 3170 m
+gs 1 -1 sc (9) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+1210 3440 m
+gs 1 -1 sc (13) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+5050 3440 m
+gs 1 -1 sc (12) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+8740 3440 m
+gs 1 -1 sc (9) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+940 3710 m
+gs 1 -1 sc (14) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+3685 3710 m
+gs 1 -1 sc (15) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+7495 3710 m
+gs 1 -1 sc (12) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+8785 3710 m
+gs 1 -1 sc (9) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+3670 3980 m
+gs 1 -1 sc (15) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+7525 3980 m
+gs 1 -1 sc (12) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+8785 3980 m
+gs 1 -1 sc (9) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+700 4450 m
+gs 1 -1 sc (0) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+1450 4450 m
+gs 1 -1 sc (50) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+2200 4450 m
+gs 1 -1 sc (100) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+2950 4450 m
+gs 1 -1 sc (150) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+3700 4450 m
+gs 1 -1 sc (200) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+4450 4450 m
+gs 1 -1 sc (250) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+5200 4450 m
+gs 1 -1 sc (300) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+5950 4450 m
+gs 1 -1 sc (350) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+6700 4450 m
+gs 1 -1 sc (400) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+7450 4450 m
+gs 1 -1 sc (450) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+8200 4450 m
+gs 1 -1 sc (500) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 200 m
+gs 1 -1 sc (CPU  1) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 470 m
+gs 1 -1 sc (CPU  2) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 740 m
+gs 1 -1 sc (CPU  3) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 1010 m
+gs 1 -1 sc (CPU  4) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 1280 m
+gs 1 -1 sc (CPU  5) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 1550 m
+gs 1 -1 sc (CPU  6) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 1820 m
+gs 1 -1 sc (CPU  7) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 2090 m
+gs 1 -1 sc (CPU  8) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 2360 m
+gs 1 -1 sc (CPU  9) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 2630 m
+gs 1 -1 sc (CPU 10) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 2900 m
+gs 1 -1 sc (CPU 11) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 3170 m
+gs 1 -1 sc (CPU 12) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 3440 m
+gs 1 -1 sc (CPU 13) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 3710 m
+gs 1 -1 sc (CPU 14) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 3980 m
+gs 1 -1 sc (CPU 15) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+5350 5060 m
+gs 1 -1 sc (1) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+5650 5330 m
+gs 1 -1 sc (2) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+5650 5600 m
+gs 1 -1 sc (3) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+5500 5870 m
+gs 1 -1 sc (4) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+5650 6140 m
+gs 1 -1 sc (5) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+5650 6410 m
+gs 1 -1 sc (6) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+5800 6680 m
+gs 1 -1 sc (7) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+3700 6950 m
+gs 1 -1 sc (8) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+6250 6950 m
+gs 1 -1 sc (9) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+5650 7220 m
+gs 1 -1 sc (9) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+5950 7490 m
+gs 1 -1 sc (10) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+5950 7760 m
+gs 1 -1 sc (11) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+5350 8030 m
+gs 1 -1 sc (12) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+5350 8300 m
+gs 1 -1 sc (13) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+3100 8570 m
+gs 1 -1 sc (14) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+5950 8570 m
+gs 1 -1 sc (15) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Bold ff 135.00 scf sf
+5650 8840 m
+gs 1 -1 sc (15) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+700 9310 m
+gs 1 -1 sc (0) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+1450 9310 m
+gs 1 -1 sc (5) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+2200 9310 m
+gs 1 -1 sc (10) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+2950 9310 m
+gs 1 -1 sc (15) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+3700 9310 m
+gs 1 -1 sc (20) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+4450 9310 m
+gs 1 -1 sc (25) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+5200 9310 m
+gs 1 -1 sc (30) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+5950 9310 m
+gs 1 -1 sc (35) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+6700 9310 m
+gs 1 -1 sc (40) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 135.00 scf sf
+7450 9310 m
+gs 1 -1 sc (45) dup sw pop 2 div neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 5060 m
+gs 1 -1 sc (CPU  1) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 5330 m
+gs 1 -1 sc (CPU  2) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 5600 m
+gs 1 -1 sc (CPU  3) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 5870 m
+gs 1 -1 sc (CPU  4) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 6140 m
+gs 1 -1 sc (CPU  5) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 6410 m
+gs 1 -1 sc (CPU  6) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 6680 m
+gs 1 -1 sc (CPU  7) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 6950 m
+gs 1 -1 sc (CPU  8) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 7220 m
+gs 1 -1 sc (CPU  9) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 7490 m
+gs 1 -1 sc (CPU 10) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 7760 m
+gs 1 -1 sc (CPU 11) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 8030 m
+gs 1 -1 sc (CPU 12) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 8300 m
+gs 1 -1 sc (CPU 13) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 8570 m
+gs 1 -1 sc (CPU 14) dup sw pop neg 0 rm  col0 sh gr
+/NimbusSanL-Regu ff 127.50 scf sf
+670 8840 m
+gs 1 -1 sc (CPU 15) dup sw pop neg 0 rm  col0 sh gr
+% here ends figure;
+pagefooter
+showpage
+%%Trailer
+%EOF
+
+%%EndDocument
+ @endspecial Black Black eop end
+%%Trailer
+
+userdict /end-hook known{end-hook}if
+%%EOF
diff --git a/advsync/MoreThanOneValue-15CPU-noresp.fig b/advsync/MoreThanOneValue-15CPU-noresp.fig
new file mode 100644
index 0000000..f513bc9
--- /dev/null
+++ b/advsync/MoreThanOneValue-15CPU-noresp.fig
@@ -0,0 +1,489 @@
+#FIG 3.2
+Landscape
+Center
+Metric
+A4
+100.00
+Single
+-2
+1200 2
+6 650 0 9000 4150
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 0 880 0 880 270 700 270 700 0
+2 2 0 1 0 1 50 0 32 0.000 0 0 -1 0 0 5
+	880 0 2050 0 2050 270 880 270 880 0
+2 2 0 0 0 1 50 0 28 0.000 0 0 -1 0 0 5
+	895 200 2040 200 2040 260 895 260 895 200
+4 1 0 50 0 18 9 0.0000 4 90 150 1465 200 1\001
+2 2 0 1 0 1 50 0 37 0.000 0 0 -1 0 0 5
+	2050 0 2905 0 2905 270 2050 270 2050 0
+2 2 0 0 0 1 50 0 33 0.000 0 0 -1 0 0 5
+	2065 200 2895 200 2895 260 2065 260 2065 200
+4 1 0 50 0 18 9 0.0000 4 90 150 2470 200 6\001
+2 2 0 1 0 1 50 0 35 0.000 0 0 -1 0 0 5
+	2905 0 4075 0 4075 270 2905 270 2905 0
+2 2 0 0 0 1 50 0 31 0.000 0 0 -1 0 0 5
+	2920 200 4065 200 4065 260 2920 260 2920 200
+4 1 0 50 0 18 9 0.0000 4 90 150 3490 200 4\001
+2 2 0 1 0 4 50 0 37 0.000 0 0 -1 0 0 5
+	4075 0 5365 0 5365 270 4075 270 4075 0
+2 2 0 0 0 4 50 0 33 0.000 0 0 -1 0 0 5
+	4090 200 5355 200 5355 260 4090 260 4090 200
+4 1 0 50 0 18 9 0.0000 4 90 150 4720 200 10\001
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5365 0 7330 0 7330 270 5365 270 5365 0
+2 2 0 0 0 4 50 0 28 0.000 0 0 -1 0 0 5
+	5380 200 7320 200 7320 260 5380 260 5380 200
+4 1 0 50 0 18 9 0.0000 4 90 150 6340 200 15\001
+2 2 0 1 0 1 50 0 34 0.000 0 0 -1 0 0 5
+	7330 0 8425 0 8425 270 7330 270 7330 0
+2 2 0 0 0 1 50 0 30 0.000 0 0 -1 0 0 5
+	7345 200 8415 200 8415 260 7345 260 7345 200
+4 1 0 50 0 18 9 0.0000 4 90 150 7870 200 3\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	8425 0 8950 0 8950 270 8425 270 8425 0
+4 1 0 50 0 18 9 0.0000 4 90 150 8680 200 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 270 940 270 940 540 700 540 700 270
+2 2 0 1 0 1 50 0 33 0.000 0 0 -1 0 0 5
+	940 270 7315 270 7315 540 940 540 940 270
+2 2 0 0 0 1 50 0 29 0.000 0 0 -1 0 0 5
+	955 470 7305 470 7305 530 955 530 955 470
+4 1 0 50 0 18 9 0.0000 4 90 150 4120 470 2\001
+2 2 0 1 0 1 50 0 34 0.000 0 0 -1 0 0 5
+	7315 270 8350 270 8350 540 7315 540 7315 270
+2 2 0 0 0 1 50 0 30 0.000 0 0 -1 0 0 5
+	7345 470 8340 470 8340 530 7345 530 7345 470
+4 1 0 50 0 18 9 0.0000 4 90 150 7825 470 3\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	8350 270 8950 270 8950 540 8350 540 8350 270
+4 1 0 50 0 18 9 0.0000 4 90 150 8650 470 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 540 955 540 955 810 700 810 700 540
+2 2 0 1 0 1 50 0 34 0.000 0 0 -1 0 0 5
+	955 540 8365 540 8365 810 955 810 955 540
+2 2 0 0 0 1 50 0 30 0.000 0 0 -1 0 0 5
+	985 740 8355 740 8355 800 985 800 985 740
+4 1 0 50 0 18 9 0.0000 4 90 150 4660 740 3\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	8365 540 8950 540 8950 810 8365 810 8365 540
+4 1 0 50 0 18 9 0.0000 4 90 150 8650 740 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 810 925 810 925 1080 700 1080 700 810
+2 2 0 1 0 1 50 0 35 0.000 0 0 -1 0 0 5
+	925 810 3880 810 3880 1080 925 1080 925 810
+2 2 0 0 0 1 50 0 31 0.000 0 0 -1 0 0 5
+	940 1010 3870 1010 3870 1070 940 1070 940 1010
+4 1 0 50 0 18 9 0.0000 4 90 150 2395 1010 4\001
+2 2 0 1 0 4 50 0 37 0.000 0 0 -1 0 0 5
+	3880 810 5110 810 5110 1080 3880 1080 3880 810
+4 1 0 50 0 18 9 0.0000 4 90 150 4495 1010 10\001
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5110 810 6565 810 6565 1080 5110 1080 5110 810
+2 2 0 0 0 4 50 0 28 0.000 0 0 -1 0 0 5
+	5725 1010 6555 1010 6555 1070 5725 1070 5725 1010
+4 1 0 50 0 18 9 0.0000 4 90 150 5830 1010 15\001
+2 2 0 1 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6565 810 7825 810 7825 1080 6565 1080 6565 810
+2 2 0 0 0 4 50 0 31 0.000 0 0 -1 0 0 5
+	6700 1010 7815 1010 7815 1070 6700 1070 6700 1010
+4 1 0 50 0 18 9 0.0000 4 90 150 7195 1010 12\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	7825 810 8950 810 8950 1080 7825 1080 7825 810
+4 1 0 50 0 18 9 0.0000 4 90 150 8380 1010 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 1080 940 1080 940 1350 700 1350 700 1080
+2 2 0 1 0 1 50 0 36 0.000 0 0 -1 0 0 5
+	940 1080 3910 1080 3910 1350 940 1350 940 1080
+2 2 0 0 0 1 50 0 32 0.000 0 0 -1 0 0 5
+	955 1280 3900 1280 3900 1340 955 1340 955 1280
+4 1 0 50 0 18 9 0.0000 4 90 150 2425 1280 5\001
+2 2 0 1 0 4 50 0 37 0.000 0 0 -1 0 0 5
+	3910 1080 5155 1080 5155 1350 3910 1350 3910 1080
+2 2 0 0 0 4 50 0 33 0.000 0 0 -1 0 0 5
+	4090 1280 5145 1280 5145 1340 4090 1340 4090 1280
+4 1 0 50 0 18 9 0.0000 4 90 150 4525 1280 10\001
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5155 1080 6595 1080 6595 1350 5155 1350 5155 1080
+2 2 0 0 0 4 50 0 28 0.000 0 0 -1 0 0 5
+	5725 1280 6585 1280 6585 1340 5725 1340 5725 1280
+4 1 0 50 0 18 9 0.0000 4 90 150 5875 1280 15\001
+2 2 0 1 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6595 1080 7840 1080 7840 1350 6595 1350 6595 1080
+2 2 0 0 0 4 50 0 31 0.000 0 0 -1 0 0 5
+	6700 1280 7830 1280 7830 1340 6700 1340 6700 1280
+4 1 0 50 0 18 9 0.0000 4 90 150 7210 1280 12\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	7840 1080 8950 1080 8950 1350 7840 1350 7840 1080
+4 1 0 50 0 18 9 0.0000 4 90 150 8395 1280 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 1350 955 1350 955 1620 700 1620 700 1350
+2 2 0 1 0 1 50 0 37 0.000 0 0 -1 0 0 5
+	955 1350 3295 1350 3295 1620 955 1620 955 1350
+2 2 0 0 0 1 50 0 33 0.000 0 0 -1 0 0 5
+	970 1550 3285 1550 3285 1610 970 1610 970 1550
+4 1 0 50 0 18 9 0.0000 4 90 150 2125 1550 6\001
+2 2 0 1 0 1 50 0 33 0.000 0 0 -1 0 0 5
+	3295 1350 5695 1350 5695 1620 3295 1620 3295 1350
+2 2 0 0 0 1 50 0 29 0.000 0 0 -1 0 0 5
+	3310 1550 5685 1550 5685 1610 3310 1610 3310 1550
+4 1 0 50 0 18 9 0.0000 4 90 150 4495 1550 2\001
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5695 1350 8200 1350 8200 1620 5695 1620 5695 1350
+2 2 0 0 0 4 50 0 28 0.000 0 0 -1 0 0 5
+	5725 1550 8190 1550 8190 1610 5725 1610 5725 1550
+4 1 0 50 0 18 9 0.0000 4 90 150 6940 1550 15\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	8200 1350 8950 1350 8950 1620 8200 1620 8200 1350
+4 1 0 50 0 18 9 0.0000 4 90 150 8575 1550 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 1620 970 1620 970 1890 700 1890 700 1620
+2 2 0 1 0 1 50 0 38 0.000 0 0 -1 0 0 5
+	970 1620 3280 1620 3280 1890 970 1890 970 1620
+2 2 0 0 0 1 50 0 34 0.000 0 0 -1 0 0 5
+	985 1820 3270 1820 3270 1880 985 1880 985 1820
+4 1 0 50 0 18 9 0.0000 4 90 150 2125 1820 7\001
+2 2 0 1 0 1 50 0 33 0.000 0 0 -1 0 0 5
+	3280 1620 5710 1620 5710 1890 3280 1890 3280 1620
+2 2 0 0 0 1 50 0 29 0.000 0 0 -1 0 0 5
+	3295 1820 5700 1820 5700 1880 3295 1880 3295 1820
+4 1 0 50 0 18 9 0.0000 4 90 150 4495 1820 2\001
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5710 1620 8185 1620 8185 1890 5710 1890 5710 1620
+2 2 0 0 0 4 50 0 28 0.000 0 0 -1 0 0 5
+	5725 1820 8175 1820 8175 1880 5725 1880 5725 1820
+4 1 0 50 0 18 9 0.0000 4 90 150 6940 1820 15\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	8185 1620 8950 1620 8950 1890 8185 1890 8185 1620
+4 1 0 50 0 18 9 0.0000 4 90 150 8560 1820 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 1890 925 1890 925 2160 700 2160 700 1890
+2 2 0 1 0 7 50 0 20 0.000 0 0 -1 0 0 5
+	925 1890 1075 1890 1075 2160 925 2160 925 1890
+2 2 0 0 0 7 50 0 15 0.000 0 0 -1 0 0 5
+	940 2090 1065 2090 1065 2150 940 2150 940 2090
+4 1 0 50 0 18 9 0.0000 4 90 150 1000 2090 8\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	1075 1890 8950 1890 8950 2160 1075 2160 1075 1890
+4 1 0 50 0 18 9 0.0000 4 90 150 5005 2090 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 2160 955 2160 955 2430 700 2430 700 2160
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	955 2160 8950 2160 8950 2430 955 2430 955 2160
+4 1 0 50 0 18 9 0.0000 4 90 150 4945 2360 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 2430 1015 2430 1015 2700 700 2700 700 2430
+2 2 0 1 0 4 50 0 37 0.000 0 0 -1 0 0 5
+	1015 2430 5320 2430 5320 2700 1015 2700 1015 2430
+2 2 0 0 0 4 50 0 33 0.000 0 0 -1 0 0 5
+	4090 2630 5310 2630 5310 2690 4090 2690 4090 2630
+4 1 0 50 0 18 9 0.0000 4 90 150 3160 2630 10\001
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5320 2430 6655 2430 6655 2700 5320 2700 5320 2430
+2 2 0 0 0 4 50 0 28 0.000 0 0 -1 0 0 5
+	5725 2630 6645 2630 6645 2690 5725 2690 5725 2630
+4 1 0 50 0 18 9 0.0000 4 90 150 5980 2630 15\001
+2 2 0 1 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6655 2430 7780 2430 7780 2700 6655 2700 6655 2430
+2 2 0 0 0 4 50 0 31 0.000 0 0 -1 0 0 5
+	6700 2630 7770 2630 7770 2690 6700 2690 6700 2630
+4 1 0 50 0 18 9 0.0000 4 90 150 7210 2630 12\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	7780 2430 8950 2430 8950 2700 7780 2700 7780 2430
+4 1 0 50 0 18 9 0.0000 4 90 150 8365 2630 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 2700 1000 2700 1000 2970 700 2970 700 2700
+2 2 0 1 0 4 50 0 36 0.000 0 0 -1 0 0 5
+	1000 2700 1870 2700 1870 2970 1000 2970 1000 2700
+2 2 0 0 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	1015 2900 1860 2900 1860 2960 1015 2960 1015 2900
+4 1 0 50 0 18 9 0.0000 4 90 150 1435 2900 11\001
+2 2 0 1 0 4 50 0 37 0.000 0 0 -1 0 0 5
+	1870 2700 5335 2700 5335 2970 1870 2970 1870 2700
+2 2 0 0 0 4 50 0 33 0.000 0 0 -1 0 0 5
+	4090 2900 5325 2900 5325 2960 4090 2960 4090 2900
+4 1 0 50 0 18 9 0.0000 4 90 150 3595 2900 10\001
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5335 2700 6685 2700 6685 2970 5335 2970 5335 2700
+2 2 0 0 0 4 50 0 28 0.000 0 0 -1 0 0 5
+	5725 2900 6675 2900 6675 2960 5725 2960 5725 2900
+4 1 0 50 0 18 9 0.0000 4 90 150 6010 2900 15\001
+2 2 0 1 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6685 2700 7795 2700 7795 2970 6685 2970 6685 2700
+2 2 0 0 0 4 50 0 31 0.000 0 0 -1 0 0 5
+	6700 2900 7785 2900 7785 2960 6700 2960 6700 2900
+4 1 0 50 0 18 9 0.0000 4 90 150 7240 2900 12\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	7795 2700 8950 2700 8950 2970 7795 2970 7795 2700
+4 1 0 50 0 18 9 0.0000 4 90 150 8365 2900 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 2970 895 2970 895 3240 700 3240 700 2970
+2 2 0 1 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	895 2970 8575 2970 8575 3240 895 3240 895 2970
+2 2 0 0 0 4 50 0 31 0.000 0 0 -1 0 0 5
+	6700 3170 8565 3170 8565 3230 6700 3230 6700 3170
+4 1 0 50 0 18 9 0.0000 4 90 150 4735 3170 12\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	8575 2970 8950 2970 8950 3240 8575 3240 8575 2970
+4 1 0 50 0 18 9 0.0000 4 90 150 8755 3170 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 3240 880 3240 880 3510 700 3510 700 3240
+2 2 0 1 0 4 50 0 34 0.000 0 0 -1 0 0 5
+	880 3240 1555 3240 1555 3510 880 3510 880 3240
+2 2 0 0 0 4 50 0 30 0.000 0 0 -1 0 0 5
+	895 3440 1545 3440 1545 3500 895 3500 895 3440
+4 1 0 50 0 18 9 0.0000 4 90 150 1210 3440 13\001
+2 2 0 1 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	1555 3240 8545 3240 8545 3510 1555 3510 1555 3240
+2 2 0 0 0 4 50 0 31 0.000 0 0 -1 0 0 5
+	6700 3440 8535 3440 8535 3500 6700 3500 6700 3440
+4 1 0 50 0 18 9 0.0000 4 90 150 5050 3440 12\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	8545 3240 8950 3240 8950 3510 8545 3510 8545 3240
+4 1 0 50 0 18 9 0.0000 4 90 150 8740 3440 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 3510 895 3510 895 3780 700 3780 700 3510
+2 2 0 1 0 4 50 0 33 0.000 0 0 -1 0 0 5
+	895 3510 1000 3510 1000 3780 895 3780 895 3510
+2 2 0 0 0 4 50 0 29 0.000 0 0 -1 0 0 5
+	910 3710 990 3710 990 3770 910 3770 910 3710
+4 1 0 50 0 18 9 0.0000 4 90 150 940 3710 14\001
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	1000 3510 6385 3510 6385 3780 1000 3780 1000 3510
+4 1 0 50 0 18 9 0.0000 4 90 150 3685 3710 15\001
+2 2 0 1 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6385 3510 8620 3510 8620 3780 6385 3780 6385 3510
+2 2 0 0 0 4 50 0 31 0.000 0 0 -1 0 0 5
+	6700 3710 8610 3710 8610 3770 6700 3770 6700 3710
+4 1 0 50 0 18 9 0.0000 4 90 150 7495 3710 12\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	8620 3510 8950 3510 8950 3780 8620 3780 8620 3510
+4 1 0 50 0 18 9 0.0000 4 90 150 8785 3710 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 3780 940 3780 940 4050 700 4050 700 3780
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	940 3780 6415 3780 6415 4050 940 4050 940 3780
+2 2 0 0 0 4 50 0 28 0.000 0 0 -1 0 0 5
+	1090 3980 6405 3980 6405 4040 1090 4040 1090 3980
+4 1 0 50 0 18 9 0.0000 4 90 150 3670 3980 15\001
+2 2 0 1 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6415 3780 8635 3780 8635 4050 6415 4050 6415 3780
+2 2 0 0 0 4 50 0 31 0.000 0 0 -1 0 0 5
+	6700 3980 8625 3980 8625 4040 6700 4040 6700 3980
+4 1 0 50 0 18 9 0.0000 4 90 150 7525 3980 12\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	8635 3780 8950 3780 8950 4050 8635 4050 8635 3780
+4 1 0 50 0 18 9 0.0000 4 90 150 8785 3980 9\001
+2 1 0 2 0 7 50 0 -1 0.000 0 0 -1 1 0 2
+	1 1 1.00 60.00 120.00
+	 700 4250 8950 4250
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 700 4200 700 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 700 4450 0\001
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 1450 4200 1450 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 1450 4450 50\001
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 2200 4200 2200 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 2200 4450 100\001
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 2950 4200 2950 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 2950 4450 150\001
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 3700 4200 3700 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 3700 4450 200\001
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 4450 4200 4450 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 4450 4450 250\001
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 5200 4200 5200 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 5200 4450 300\001
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 5950 4200 5950 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 5950 4450 350\001
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 6700 4200 6700 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 6700 4450 400\001
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 7450 4200 7450 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 7450 4450 450\001
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 8200 4200 8200 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 8200 4450 500\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 200 CPU  1\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 470 CPU  2\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 740 CPU  3\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 1010 CPU  4\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 1280 CPU  5\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 1550 CPU  6\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 1820 CPU  7\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 2090 CPU  8\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 2360 CPU  9\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 2630 CPU 10\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 2900 CPU 11\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 3170 CPU 12\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 3440 CPU 13\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 3710 CPU 14\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 3980 CPU 15\001
+-6
+6 650 4860 8045 9315
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 4860 2500 4860 2500 5130 700 5130 700 4860
+2 2 0 1 0 1 50 0 32 0.000 0 0 -1 0 0 5
+	2500 4860 8200 4860 8200 5130 2500 5130 2500 4860
+2 2 0 0 0 1 50 0 28 0.000 0 0 -1 0 0 5
+	2650 5060 8190 5060 8190 5120 2650 5120 2650 5060
+4 1 0 50 0 18 9 0.0000 4 90 150 5350 5060 1\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 5130 3100 5130 3100 5400 700 5400 700 5130
+2 2 0 1 0 1 50 0 33 0.000 0 0 -1 0 0 5
+	3100 5130 8200 5130 8200 5400 3100 5400 3100 5130
+2 2 0 0 0 1 50 0 29 0.000 0 0 -1 0 0 5
+	3250 5330 8190 5330 8190 5390 3250 5390 3250 5330
+4 1 0 50 0 18 9 0.0000 4 90 150 5650 5330 2\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 5400 3250 5400 3250 5670 700 5670 700 5400
+2 2 0 1 0 1 50 0 34 0.000 0 0 -1 0 0 5
+	3250 5400 8200 5400 8200 5670 3250 5670 3250 5400
+2 2 0 0 0 1 50 0 30 0.000 0 0 -1 0 0 5
+	3550 5600 8190 5600 8190 5660 3550 5660 3550 5600
+4 1 0 50 0 18 9 0.0000 4 90 150 5650 5600 3\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 5670 2950 5670 2950 5940 700 5940 700 5670
+2 2 0 1 0 1 50 0 35 0.000 0 0 -1 0 0 5
+	2950 5670 8200 5670 8200 5940 2950 5940 2950 5670
+2 2 0 0 0 1 50 0 31 0.000 0 0 -1 0 0 5
+	3100 5870 8190 5870 8190 5930 3100 5930 3100 5870
+4 1 0 50 0 18 9 0.0000 4 90 150 5500 5870 4\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 5940 3100 5940 3100 6210 700 6210 700 5940
+2 2 0 1 0 1 50 0 36 0.000 0 0 -1 0 0 5
+	3100 5940 8200 5940 8200 6210 3100 6210 3100 5940
+2 2 0 0 0 1 50 0 32 0.000 0 0 -1 0 0 5
+	3250 6140 8190 6140 8190 6200 3250 6200 3250 6140
+4 1 0 50 0 18 9 0.0000 4 90 150 5650 6140 5\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 6210 3250 6210 3250 6480 700 6480 700 6210
+2 2 0 1 0 1 50 0 37 0.000 0 0 -1 0 0 5
+	3250 6210 8200 6210 8200 6480 3250 6480 3250 6210
+2 2 0 0 0 1 50 0 33 0.000 0 0 -1 0 0 5
+	3400 6410 8190 6410 8190 6470 3400 6470 3400 6410
+4 1 0 50 0 18 9 0.0000 4 90 150 5650 6410 6\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 6480 3400 6480 3400 6750 700 6750 700 6480
+2 2 0 1 0 1 50 0 38 0.000 0 0 -1 0 0 5
+	3400 6480 8200 6480 8200 6750 3400 6750 3400 6480
+2 2 0 0 0 1 50 0 34 0.000 0 0 -1 0 0 5
+	3550 6680 8190 6680 8190 6740 3550 6740 3550 6680
+4 1 0 50 0 18 9 0.0000 4 90 150 5800 6680 7\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 6750 2950 6750 2950 7020 700 7020 700 6750
+2 2 0 1 0 7 50 0 20 0.000 0 0 -1 0 0 5
+	2950 6750 4450 6750 4450 7020 2950 7020 2950 6750
+2 2 0 0 0 7 50 0 15 0.000 0 0 -1 0 0 5
+	3100 6950 4440 6950 4440 7010 3100 7010 3100 6950
+4 1 0 50 0 18 9 0.0000 4 90 150 3700 6950 8\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	4450 6750 8200 6750 8200 7020 4450 7020 4450 6750
+4 1 0 50 0 18 9 0.0000 4 90 150 6250 6950 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 7020 3250 7020 3250 7290 700 7290 700 7020
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	3250 7020 8200 7020 8200 7290 3250 7290 3250 7020
+4 1 0 50 0 18 9 0.0000 4 90 150 5650 7220 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 7290 3850 7290 3850 7560 700 7560 700 7290
+2 2 0 1 0 4 50 0 37 0.000 0 0 -1 0 0 5
+	3850 7290 8200 7290 8200 7560 3850 7560 3850 7290
+4 1 0 50 0 18 9 0.0000 4 90 150 5950 7490 10\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 7560 3700 7560 3700 7830 700 7830 700 7560
+2 2 0 1 0 4 50 0 36 0.000 0 0 -1 0 0 5
+	3700 7560 8200 7560 8200 7830 3700 7830 3700 7560
+2 2 0 0 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	3850 7760 8190 7760 8190 7820 3850 7820 3850 7760
+4 1 0 50 0 18 9 0.0000 4 90 150 5950 7760 11\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 7830 2650 7830 2650 8100 700 8100 700 7830
+2 2 0 1 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	2650 7830 8200 7830 8200 8100 2650 8100 2650 7830
+4 1 0 50 0 18 9 0.0000 4 90 150 5350 8030 12\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 8100 2500 8100 2500 8370 700 8370 700 8100
+2 2 0 1 0 4 50 0 34 0.000 0 0 -1 0 0 5
+	2500 8100 8200 8100 8200 8370 2500 8370 2500 8100
+2 2 0 0 0 4 50 0 30 0.000 0 0 -1 0 0 5
+	2650 8300 8190 8300 8190 8360 2650 8360 2650 8300
+4 1 0 50 0 18 9 0.0000 4 90 150 5350 8300 13\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 8370 2650 8370 2650 8640 700 8640 700 8370
+2 2 0 1 0 4 50 0 33 0.000 0 0 -1 0 0 5
+	2650 8370 3700 8370 3700 8640 2650 8640 2650 8370
+2 2 0 0 0 4 50 0 29 0.000 0 0 -1 0 0 5
+	2800 8570 3690 8570 3690 8630 2800 8630 2800 8570
+4 1 0 50 0 18 9 0.0000 4 90 150 3100 8570 14\001
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	3700 8370 8200 8370 8200 8640 3700 8640 3700 8370
+4 1 0 50 0 18 9 0.0000 4 90 150 5950 8570 15\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 8640 3100 8640 3100 8910 700 8910 700 8640
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	3100 8640 8200 8640 8200 8910 3100 8910 3100 8640
+2 2 0 0 0 4 50 0 28 0.000 0 0 -1 0 0 5
+	4600 8840 8190 8840 8190 8900 4600 8900 4600 8840
+4 1 0 50 0 18 9 0.0000 4 90 150 5650 8840 15\001
+2 1 0 2 0 7 50 0 -1 0.000 0 0 -1 1 0 2
+	1 1 1.00 60.00 120.00
+	 700 9110 8200 9110
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 700 9060 700 9160
+4 1 0 50 0 16 9 0.0000 4 90 375 700 9310 0\001
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 1450 9060 1450 9160
+4 1 0 50 0 16 9 0.0000 4 90 375 1450 9310 5\001
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 2200 9060 2200 9160
+4 1 0 50 0 16 9 0.0000 4 90 375 2200 9310 10\001
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 2950 9060 2950 9160
+4 1 0 50 0 16 9 0.0000 4 90 375 2950 9310 15\001
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 3700 9060 3700 9160
+4 1 0 50 0 16 9 0.0000 4 90 375 3700 9310 20\001
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 4450 9060 4450 9160
+4 1 0 50 0 16 9 0.0000 4 90 375 4450 9310 25\001
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 5200 9060 5200 9160
+4 1 0 50 0 16 9 0.0000 4 90 375 5200 9310 30\001
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 5950 9060 5950 9160
+4 1 0 50 0 16 9 0.0000 4 90 375 5950 9310 35\001
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 6700 9060 6700 9160
+4 1 0 50 0 16 9 0.0000 4 90 375 6700 9310 40\001
+2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
+	 7450 9060 7450 9160
+4 1 0 50 0 16 9 0.0000 4 90 375 7450 9310 45\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 5060 CPU  1\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 5330 CPU  2\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 5600 CPU  3\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 5870 CPU  4\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 6140 CPU  5\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 6410 CPU  6\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 6680 CPU  7\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 6950 CPU  8\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 7220 CPU  9\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 7490 CPU 10\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 7760 CPU 11\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 8030 CPU 12\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 8300 CPU 13\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 8570 CPU 14\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 8840 CPU 15\001
+-6
+2 1 1 1 0 7 50 -1 -1 4.000 0 0 -1 0 0 2
+	700 4250 700 4860
+2 1 1 1 0 7 50 -1 -1 4.000 0 0 -1 0 0 2
+	1450 4250 8200 4860
+2 1 0 1 0 7 50 -1 -1 4.000 0 0 -1 0 0 2
+	3900 4725 3900 9270
diff --git a/advsync/MoreThanOneValue-15CPU.eps b/advsync/MoreThanOneValue-15CPU.eps
index 91552d4..0429a34 100644
--- a/advsync/MoreThanOneValue-15CPU.eps
+++ b/advsync/MoreThanOneValue-15CPU.eps
@@ -1,15 +1,15 @@
 %!PS-Adobe-2.0
 %%Creator: dvips(k) 5.993 Copyright 2013 Radical Eye Software
 %%Title: job-001.dvi
-%%CreationDate: Sat Apr 30 10:38:23 2016
+%%CreationDate: Tue May  3 20:13:25 2016
 %%Pages: 1
 %%PageOrder: Ascend
-%%BoundingBox: 162 2640 716 3230
+%%BoundingBox: 156 2640 708 3230
 %%EndComments
 %DVIPSWebPage: (www.radicaleye.com)
 %DVIPSCommandLine: dvips job-001.dvi -o job-001.dvips.ps
 %DVIPSParameters: dpi=600
-%DVIPSSource:  TeX output 2016.04.30:1038
+%DVIPSSource:  TeX output 2016.05.03:2013
 %%BeginProcSet: tex.pro 0 0
 %!
 /TeXDict 300 dict def TeXDict begin/N{def}def/B{bind def}N/S{exch}N/X{S
@@ -176,13 +176,13 @@ TeXDict begin
 %%EndSetup
 %%Page: 1 1
 TeXDict begin 1 0 bop Black Black 706 5483 a @beginspecial
-0 @llx 0 @lly 559 @urx 589 @ury 5590 @rwi @setspecial
+0 @llx 0 @lly 552 @urx 589 @ury 5520 @rwi @setspecial
 %%BeginDocument: job-001.fig2dev.ps
 %!PS-Adobe-3.0 EPSF-3.0
 %%Title: job-001.fig
 %%Creator: fig2dev Version 3.2 Patchlevel 5e
-%%CreationDate: Sat Apr 30 10:38:23 2016
-%%BoundingBox: 162 2640 716 3230
+%%CreationDate: Tue May  3 20:13:25 2016
+%%BoundingBox: 156 2640 708 3230
 %Magnification: 1.0000
 %%EndComments
 %%BeginProlog
@@ -261,8 +261,8 @@ end

 /pageheader {
 save
-newpath 0 589 moveto 0 0 lineto 559 0 lineto 559 589 lineto closepath clip newpath
--6.4 587.4 translate
+newpath 0 589 moveto 0 0 lineto 552 0 lineto 552 589 lineto closepath clip newpath
+-14.1 587.4 translate
 1 -1 scale
 $F2psBegin
 10 setmiterlimit
@@ -285,211 +285,396 @@ pageheader
 0 slc
 7.500 slw
 n 700 0 m 880 0 l 880 270 l 700 270 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 880 0 m 2050 0 l 2050 270 l 880 270 l
- cp gs col4 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.60 tnt ef gr gs col0 s gr 
 % Polyline
+0.000 slw
+n 895 200 m 2040 200 l 2040 260 l 895 260 l
+ cp gs col1 0.60 tnt ef gr 
+% Polyline
+7.500 slw
 n 2050 0 m 2905 0 l 2905 270 l 2050 270 l
- cp gs col3 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.85 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 2065 200 m 2895 200 l 2895 260 l 2065 260 l
+ cp gs col1 0.85 tnt ef gr 
 % Polyline
+7.500 slw
 n 2905 0 m 4075 0 l 4075 270 l 2905 270 l
- cp gs col14 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 2920 200 m 4065 200 l 4065 260 l 2920 260 l
+ cp gs col1 0.75 tnt ef gr 
 % Polyline
+7.500 slw
 n 4075 0 m 5365 0 l 5365 270 l 4075 270 l
- cp gs col5 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.85 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 4090 200 m 5355 200 l 5355 260 l 4090 260 l
+ cp gs col4 0.85 tnt ef gr 
 % Polyline
+7.500 slw
 n 5365 0 m 7330 0 l 7330 270 l 5365 270 l
- cp gs col12 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
 % Polyline
+0.000 slw
+n 5380 200 m 7320 200 l 7320 260 l 5380 260 l
+ cp gs col4 0.60 tnt ef gr 
+% Polyline
+7.500 slw
 n 7330 0 m 8425 0 l 8425 270 l 7330 270 l
- cp gs col31 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.70 tnt ef gr gs col0 s gr 
 % Polyline
+0.000 slw
+n 7345 200 m 8415 200 l 8415 260 l 7345 260 l
+ cp gs col1 0.70 tnt ef gr 
+% Polyline
+7.500 slw
 n 8425 0 m 8950 0 l 8950 270 l 8425 270 l
- cp gs col7 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
 % Polyline
 n 700 270 m 940 270 l 940 540 l 700 540 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 940 270 m 7315 270 l 7315 540 l 940 540 l
- cp gs col6 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.65 tnt ef gr gs col0 s gr 
 % Polyline
+0.000 slw
+n 955 470 m 7305 470 l 7305 530 l 955 530 l
+ cp gs col1 0.65 tnt ef gr 
+% Polyline
+7.500 slw
 n 7315 270 m 8350 270 l 8350 540 l 7315 540 l
- cp gs col31 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.70 tnt ef gr gs col0 s gr 
 % Polyline
+0.000 slw
+n 7345 470 m 8340 470 l 8340 530 l 7345 530 l
+ cp gs col1 0.70 tnt ef gr 
+% Polyline
+7.500 slw
 n 8350 270 m 8950 270 l 8950 540 l 8350 540 l
- cp gs col7 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
 % Polyline
 n 700 540 m 955 540 l 955 810 l 700 810 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 955 540 m 8365 540 l 8365 810 l 955 810 l
- cp gs col31 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.70 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 985 740 m 8355 740 l 8355 800 l 985 800 l
+ cp gs col1 0.70 tnt ef gr 
 % Polyline
+7.500 slw
 n 8365 540 m 8950 540 l 8950 810 l 8365 810 l
- cp gs col7 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
 % Polyline
 n 700 810 m 925 810 l 925 1080 l 700 1080 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 925 810 m 3880 810 l 3880 1080 l 925 1080 l
- cp gs col14 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 940 1010 m 3870 1010 l 3870 1070 l 940 1070 l
+ cp gs col1 0.75 tnt ef gr 
 % Polyline
+7.500 slw
 n 3880 810 m 5110 810 l 5110 1080 l 3880 1080 l
- cp gs col5 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.85 tnt ef gr gs col0 s gr 
 % Polyline
 n 5110 810 m 6565 810 l 6565 1080 l 5110 1080 l
- cp gs col12 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 5725 1010 m 6555 1010 l 6555 1070 l 5725 1070 l
+ cp gs col4 0.60 tnt ef gr 
 % Polyline
+7.500 slw
 n 6565 810 m 7825 810 l 7825 1080 l 6565 1080 l
- cp gs col22 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 6700 1010 m 7815 1010 l 7815 1070 l 6700 1070 l
+ cp gs col4 0.75 tnt ef gr 
 % Polyline
+7.500 slw
 n 7825 810 m 8950 810 l 8950 1080 l 7825 1080 l
- cp gs col7 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
 % Polyline
 n 700 1080 m 940 1080 l 940 1350 l 700 1350 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 940 1080 m 3910 1080 l 3910 1350 l 940 1350 l
- cp gs col2 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.80 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 955 1280 m 3900 1280 l 3900 1340 l 955 1340 l
+ cp gs col1 0.80 tnt ef gr 
 % Polyline
+7.500 slw
 n 3910 1080 m 5155 1080 l 5155 1350 l 3910 1350 l
- cp gs col5 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.85 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 4090 1280 m 5145 1280 l 5145 1340 l 4090 1340 l
+ cp gs col4 0.85 tnt ef gr 
 % Polyline
+7.500 slw
 n 5155 1080 m 6595 1080 l 6595 1350 l 5155 1350 l
- cp gs col12 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
 % Polyline
+0.000 slw
+n 5725 1280 m 6585 1280 l 6585 1340 l 5725 1340 l
+ cp gs col4 0.60 tnt ef gr 
+% Polyline
+7.500 slw
 n 6595 1080 m 7840 1080 l 7840 1350 l 6595 1350 l
- cp gs col22 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.75 tnt ef gr gs col0 s gr 
 % Polyline
+0.000 slw
+n 6700 1280 m 7830 1280 l 7830 1340 l 6700 1340 l
+ cp gs col4 0.75 tnt ef gr 
+% Polyline
+7.500 slw
 n 7840 1080 m 8950 1080 l 8950 1350 l 7840 1350 l
- cp gs col7 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
 % Polyline
 n 700 1350 m 955 1350 l 955 1620 l 700 1620 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 955 1350 m 3295 1350 l 3295 1620 l 955 1620 l
- cp gs col3 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.85 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 970 1550 m 3285 1550 l 3285 1610 l 970 1610 l
+ cp gs col1 0.85 tnt ef gr 
 % Polyline
+7.500 slw
 n 3295 1350 m 5695 1350 l 5695 1620 l 3295 1620 l
- cp gs col6 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.65 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 3310 1550 m 5685 1550 l 5685 1610 l 3310 1610 l
+ cp gs col1 0.65 tnt ef gr 
 % Polyline
+7.500 slw
 n 5695 1350 m 8200 1350 l 8200 1620 l 5695 1620 l
- cp gs col12 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
 % Polyline
+0.000 slw
+n 5725 1550 m 8190 1550 l 8190 1610 l 5725 1610 l
+ cp gs col4 0.60 tnt ef gr 
+% Polyline
+7.500 slw
 n 8200 1350 m 8950 1350 l 8950 1620 l 8200 1620 l
- cp gs col7 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
 % Polyline
 n 700 1620 m 970 1620 l 970 1890 l 700 1890 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 970 1620 m 3280 1620 l 3280 1890 l 970 1890 l
- cp gs col16 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 985 1820 m 3270 1820 l 3270 1880 l 985 1880 l
+ cp gs col1 0.90 tnt ef gr 
 % Polyline
+7.500 slw
 n 3280 1620 m 5710 1620 l 5710 1890 l 3280 1890 l
- cp gs col6 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.65 tnt ef gr gs col0 s gr 
 % Polyline
+0.000 slw
+n 3295 1820 m 5700 1820 l 5700 1880 l 3295 1880 l
+ cp gs col1 0.65 tnt ef gr 
+% Polyline
+7.500 slw
 n 5710 1620 m 8185 1620 l 8185 1890 l 5710 1890 l
- cp gs col12 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
 % Polyline
+0.000 slw
+n 5725 1820 m 8175 1820 l 8175 1880 l 5725 1880 l
+ cp gs col4 0.60 tnt ef gr 
+% Polyline
+7.500 slw
 n 8185 1620 m 8950 1620 l 8950 1890 l 8185 1890 l
- cp gs col7 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
 % Polyline
 n 700 1890 m 925 1890 l 925 2160 l 700 2160 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 925 1890 m 1075 1890 l 1075 2160 l 925 2160 l
- cp gs col27 1.00 shd ef gr gs col0 s gr 
+ cp gs col7 1.00 shd ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 940 2090 m 1065 2090 l 1065 2150 l 940 2150 l
+ cp gs col7 1.00 shd ef gr 
 % Polyline
+7.500 slw
 n 1075 1890 m 8950 1890 l 8950 2160 l 1075 2160 l
- cp gs col7 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
 % Polyline
 n 700 2160 m 955 2160 l 955 2430 l 700 2430 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 955 2160 m 8950 2160 l 8950 2430 l 955 2430 l
- cp gs col7 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
 % Polyline
 n 700 2430 m 1015 2430 l 1015 2700 l 700 2700 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 1015 2430 m 5320 2430 l 5320 2700 l 1015 2700 l
- cp gs col5 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.85 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 4090 2630 m 5310 2630 l 5310 2690 l 4090 2690 l
+ cp gs col4 0.85 tnt ef gr 
 % Polyline
+7.500 slw
 n 5320 2430 m 6655 2430 l 6655 2700 l 5320 2700 l
- cp gs col12 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 5725 2630 m 6645 2630 l 6645 2690 l 5725 2690 l
+ cp gs col4 0.60 tnt ef gr 
 % Polyline
+7.500 slw
 n 6655 2430 m 7780 2430 l 7780 2700 l 6655 2700 l
- cp gs col22 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.75 tnt ef gr gs col0 s gr 
 % Polyline
+0.000 slw
+n 6700 2630 m 7770 2630 l 7770 2690 l 6700 2690 l
+ cp gs col4 0.75 tnt ef gr 
+% Polyline
+7.500 slw
 n 7780 2430 m 8950 2430 l 8950 2700 l 7780 2700 l
- cp gs col7 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
 % Polyline
 n 700 2700 m 1000 2700 l 1000 2970 l 700 2970 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 1000 2700 m 1870 2700 l 1870 2970 l 1000 2970 l
- cp gs col29 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.80 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 1015 2900 m 1860 2900 l 1860 2960 l 1015 2960 l
+ cp gs col4 0.80 tnt ef gr 
 % Polyline
+7.500 slw
 n 1870 2700 m 5335 2700 l 5335 2970 l 1870 2970 l
- cp gs col5 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.85 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 4090 2900 m 5325 2900 l 5325 2960 l 4090 2960 l
+ cp gs col4 0.85 tnt ef gr 
 % Polyline
+7.500 slw
 n 5335 2700 m 6685 2700 l 6685 2970 l 5335 2970 l
- cp gs col12 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 5725 2900 m 6675 2900 l 6675 2960 l 5725 2960 l
+ cp gs col4 0.60 tnt ef gr 
 % Polyline
+7.500 slw
 n 6685 2700 m 7795 2700 l 7795 2970 l 6685 2970 l
- cp gs col22 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.75 tnt ef gr gs col0 s gr 
 % Polyline
+0.000 slw
+n 6700 2900 m 7785 2900 l 7785 2960 l 6700 2960 l
+ cp gs col4 0.75 tnt ef gr 
+% Polyline
+7.500 slw
 n 7795 2700 m 8950 2700 l 8950 2970 l 7795 2970 l
- cp gs col7 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
 % Polyline
 n 700 2970 m 895 2970 l 895 3240 l 700 3240 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 895 2970 m 8575 2970 l 8575 3240 l 895 3240 l
- cp gs col22 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 6700 3170 m 8565 3170 l 8565 3230 l 6700 3230 l
+ cp gs col4 0.75 tnt ef gr 
 % Polyline
+7.500 slw
 n 8575 2970 m 8950 2970 l 8950 3240 l 8575 3240 l
- cp gs col7 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
 % Polyline
 n 700 3240 m 880 3240 l 880 3510 l 700 3510 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 880 3240 m 1555 3240 l 1555 3510 l 880 3510 l
- cp gs col20 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.70 tnt ef gr gs col0 s gr 
 % Polyline
+0.000 slw
+n 895 3440 m 1545 3440 l 1545 3500 l 895 3500 l
+ cp gs col4 0.70 tnt ef gr 
+% Polyline
+7.500 slw
 n 1555 3240 m 8545 3240 l 8545 3510 l 1555 3510 l
- cp gs col22 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 6700 3440 m 8535 3440 l 8535 3500 l 6700 3500 l
+ cp gs col4 0.75 tnt ef gr 
 % Polyline
+7.500 slw
 n 8545 3240 m 8950 3240 l 8950 3510 l 8545 3510 l
- cp gs col7 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
 % Polyline
 n 700 3510 m 895 3510 l 895 3780 l 700 3780 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 895 3510 m 1000 3510 l 1000 3780 l 895 3780 l
- cp gs col28 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.65 tnt ef gr gs col0 s gr 
 % Polyline
+0.000 slw
+n 910 3710 m 990 3710 l 990 3770 l 910 3770 l
+ cp gs col4 0.65 tnt ef gr 
+% Polyline
+7.500 slw
 n 1000 3510 m 6385 3510 l 6385 3780 l 1000 3780 l
- cp gs col12 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
 % Polyline
 n 6385 3510 m 8620 3510 l 8620 3780 l 6385 3780 l
- cp gs col22 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 6700 3710 m 8610 3710 l 8610 3770 l 6700 3770 l
+ cp gs col4 0.75 tnt ef gr 
 % Polyline
+7.500 slw
 n 8620 3510 m 8950 3510 l 8950 3780 l 8620 3780 l
- cp gs col7 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
 % Polyline
 n 700 3780 m 940 3780 l 940 4050 l 700 4050 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 940 3780 m 6415 3780 l 6415 4050 l 940 4050 l
- cp gs col12 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
 % Polyline
+0.000 slw
+n 1090 3980 m 6405 3980 l 6405 4040 l 1090 4040 l
+ cp gs col4 0.60 tnt ef gr 
+% Polyline
+7.500 slw
 n 6415 3780 m 8635 3780 l 8635 4050 l 6415 4050 l
- cp gs col22 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 6700 3980 m 8625 3980 l 8625 4040 l 6700 4040 l
+ cp gs col4 0.75 tnt ef gr 
 % Polyline
+7.500 slw
 n 8635 3780 m 8950 3780 l 8950 4050 l 8635 4050 l
- cp gs col7 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
 % Polyline
 15.000 slw
 gs  clippath
@@ -536,100 +721,159 @@ n 8200 4200 m
  8200 4300 l gs col0 s gr 
 % Polyline
 n 700 4860 m 2500 4860 l 2500 5130 l 700 5130 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 2500 4860 m 8200 4860 l 8200 5130 l 2500 5130 l
- cp gs col4 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.60 tnt ef gr gs col0 s gr 
 % Polyline
+0.000 slw
+n 2650 5060 m 8190 5060 l 8190 5120 l 2650 5120 l
+ cp gs col1 0.60 tnt ef gr 
+% Polyline
+7.500 slw
 n 700 5130 m 3100 5130 l 3100 5400 l 700 5400 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 3100 5130 m 8200 5130 l 8200 5400 l 3100 5400 l
- cp gs col6 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.65 tnt ef gr gs col0 s gr 
 % Polyline
+0.000 slw
+n 3250 5330 m 8190 5330 l 8190 5390 l 3250 5390 l
+ cp gs col1 0.65 tnt ef gr 
+% Polyline
+7.500 slw
 n 700 5400 m 3250 5400 l 3250 5670 l 700 5670 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 3250 5400 m 8200 5400 l 8200 5670 l 3250 5670 l
- cp gs col31 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.70 tnt ef gr gs col0 s gr 
 % Polyline
+0.000 slw
+n 3550 5600 m 8190 5600 l 8190 5660 l 3550 5660 l
+ cp gs col1 0.70 tnt ef gr 
+% Polyline
+7.500 slw
 n 700 5670 m 2950 5670 l 2950 5940 l 700 5940 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 2950 5670 m 8200 5670 l 8200 5940 l 2950 5940 l
- cp gs col14 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.75 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 3100 5870 m 8190 5870 l 8190 5930 l 3100 5930 l
+ cp gs col1 0.75 tnt ef gr 
 % Polyline
+7.500 slw
 n 700 5940 m 3100 5940 l 3100 6210 l 700 6210 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 3100 5940 m 8200 5940 l 8200 6210 l 3100 6210 l
- cp gs col2 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.80 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 3250 6140 m 8190 6140 l 8190 6200 l 3250 6200 l
+ cp gs col1 0.80 tnt ef gr 
 % Polyline
+7.500 slw
 n 700 6210 m 3250 6210 l 3250 6480 l 700 6480 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 3250 6210 m 8200 6210 l 8200 6480 l 3250 6480 l
- cp gs col3 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.85 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 3400 6410 m 8190 6410 l 8190 6470 l 3400 6470 l
+ cp gs col1 0.85 tnt ef gr 
 % Polyline
+7.500 slw
 n 700 6480 m 3400 6480 l 3400 6750 l 700 6750 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 3400 6480 m 8200 6480 l 8200 6750 l 3400 6750 l
- cp gs col16 1.00 shd ef gr gs col0 s gr 
+ cp gs col1 0.90 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 3550 6680 m 8190 6680 l 8190 6740 l 3550 6740 l
+ cp gs col1 0.90 tnt ef gr 
 % Polyline
+7.500 slw
 n 700 6750 m 2950 6750 l 2950 7020 l 700 7020 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 2950 6750 m 4450 6750 l 4450 7020 l 2950 7020 l
- cp gs col27 1.00 shd ef gr gs col0 s gr 
+ cp gs col7 1.00 shd ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 3100 6950 m 4440 6950 l 4440 7010 l 3100 7010 l
+ cp gs col7 1.00 shd ef gr 
 % Polyline
+7.500 slw
 n 4450 6750 m 8200 6750 l 8200 7020 l 4450 7020 l
- cp gs col7 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
 % Polyline
 n 700 7020 m 3250 7020 l 3250 7290 l 700 7290 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 3250 7020 m 8200 7020 l 8200 7290 l 3250 7290 l
- cp gs col7 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.90 tnt ef gr gs col0 s gr 
 % Polyline
 n 700 7290 m 3850 7290 l 3850 7560 l 700 7560 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 3850 7290 m 8200 7290 l 8200 7560 l 3850 7560 l
- cp gs col5 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.85 tnt ef gr gs col0 s gr 
 % Polyline
 n 700 7560 m 3700 7560 l 3700 7830 l 700 7830 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 3700 7560 m 8200 7560 l 8200 7830 l 3700 7830 l
- cp gs col29 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.80 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 3850 7760 m 8190 7760 l 8190 7820 l 3850 7820 l
+ cp gs col4 0.80 tnt ef gr 
 % Polyline
+7.500 slw
 n 700 7830 m 2650 7830 l 2650 8100 l 700 8100 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 2650 7830 m 8200 7830 l 8200 8100 l 2650 8100 l
- cp gs col22 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.75 tnt ef gr gs col0 s gr 
 % Polyline
 n 700 8100 m 2500 8100 l 2500 8370 l 700 8370 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 2500 8100 m 8200 8100 l 8200 8370 l 2500 8370 l
- cp gs col20 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.70 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 2650 8300 m 8190 8300 l 8190 8360 l 2650 8360 l
+ cp gs col4 0.70 tnt ef gr 
 % Polyline
+7.500 slw
 n 700 8370 m 2650 8370 l 2650 8640 l 700 8640 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 2650 8370 m 3700 8370 l 3700 8640 l 2650 8640 l
- cp gs col28 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.65 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 2800 8570 m 3690 8570 l 3690 8630 l 2800 8630 l
+ cp gs col4 0.65 tnt ef gr 
 % Polyline
+7.500 slw
 n 3700 8370 m 8200 8370 l 8200 8640 l 3700 8640 l
- cp gs col12 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
 % Polyline
 n 700 8640 m 3100 8640 l 3100 8910 l 700 8910 l
- cp gs 0.25 setgray ef gr gs col0 s gr 
+ cp gs 0.40 setgray ef gr gs col0 s gr 
 % Polyline
 n 3100 8640 m 8200 8640 l 8200 8910 l 3100 8910 l
- cp gs col12 1.00 shd ef gr gs col0 s gr 
+ cp gs col4 0.60 tnt ef gr gs col0 s gr 
+% Polyline
+0.000 slw
+n 4600 8840 m 8190 8840 l 8190 8900 l 4600 8900 l
+ cp gs col4 0.60 tnt ef gr 
 % Polyline
 15.000 slw
 gs  clippath
@@ -673,15 +917,15 @@ n 7450 9060 m
  7450 9160 l gs col0 s gr 
 % Polyline
  [60] 0 sd
-n 1485 4275 m
- 8190 4860 l gs col0 s gr  [] 0 sd
-% Polyline
-n 3915 4725 m
- 3915 9270 l gs col0 s gr 
+n 700 4250 m
+ 700 4860 l gs col0 s gr  [] 0 sd
 % Polyline
  [60] 0 sd
-n 720 4275 m
- 720 4860 l gs col0 s gr  [] 0 sd
+n 1450 4250 m
+ 8200 4860 l gs col0 s gr  [] 0 sd
+% Polyline
+n 3900 4725 m
+ 3900 9270 l gs col0 s gr 
 /NimbusSanL-Bold ff 135.00 scf sf
 1465 200 m
 gs 1 -1 sc (1) dup sw pop 2 div neg 0 rm  col0 sh gr
@@ -877,49 +1121,49 @@ gs 1 -1 sc (450) dup sw pop 2 div neg 0 rm  col0 sh gr
 /NimbusSanL-Regu ff 135.00 scf sf
 8200 4450 m
 gs 1 -1 sc (500) dup sw pop 2 div neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 200 m
 gs 1 -1 sc (CPU  1) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 470 m
 gs 1 -1 sc (CPU  2) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 740 m
 gs 1 -1 sc (CPU  3) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 1010 m
 gs 1 -1 sc (CPU  4) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 1280 m
 gs 1 -1 sc (CPU  5) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 1550 m
 gs 1 -1 sc (CPU  6) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 1820 m
 gs 1 -1 sc (CPU  7) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 2090 m
 gs 1 -1 sc (CPU  8) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 2360 m
 gs 1 -1 sc (CPU  9) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 2630 m
 gs 1 -1 sc (CPU 10) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 2900 m
 gs 1 -1 sc (CPU 11) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 3170 m
 gs 1 -1 sc (CPU 12) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 3440 m
 gs 1 -1 sc (CPU 13) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 3710 m
 gs 1 -1 sc (CPU 14) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 3980 m
 gs 1 -1 sc (CPU 15) dup sw pop neg 0 rm  col0 sh gr
 /NimbusSanL-Bold ff 135.00 scf sf
@@ -1003,49 +1247,49 @@ gs 1 -1 sc (40) dup sw pop 2 div neg 0 rm  col0 sh gr
 /NimbusSanL-Regu ff 135.00 scf sf
 7450 9310 m
 gs 1 -1 sc (45) dup sw pop 2 div neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 5060 m
 gs 1 -1 sc (CPU  1) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 5330 m
 gs 1 -1 sc (CPU  2) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 5600 m
 gs 1 -1 sc (CPU  3) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 5870 m
 gs 1 -1 sc (CPU  4) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 6140 m
 gs 1 -1 sc (CPU  5) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 6410 m
 gs 1 -1 sc (CPU  6) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 6680 m
 gs 1 -1 sc (CPU  7) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 6950 m
 gs 1 -1 sc (CPU  8) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 7220 m
 gs 1 -1 sc (CPU  9) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 7490 m
 gs 1 -1 sc (CPU 10) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 7760 m
 gs 1 -1 sc (CPU 11) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 8030 m
 gs 1 -1 sc (CPU 12) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 8300 m
 gs 1 -1 sc (CPU 13) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 8570 m
 gs 1 -1 sc (CPU 14) dup sw pop neg 0 rm  col0 sh gr
-/NimbusSanL-Regu ff 135.00 scf sf
+/NimbusSanL-Regu ff 127.50 scf sf
 670 8840 m
 gs 1 -1 sc (CPU 15) dup sw pop neg 0 rm  col0 sh gr
 % here ends figure;
diff --git a/advsync/MoreThanOneValue-15CPU.fig b/advsync/MoreThanOneValue-15CPU.fig
index fc75e7a..3171197 100644
--- a/advsync/MoreThanOneValue-15CPU.fig
+++ b/advsync/MoreThanOneValue-15CPU.fig
@@ -1,391 +1,489 @@
-#FIG 3.2  Produced by xfig version 3.2.5c
+#FIG 3.2
 Landscape
 Center
 Metric
-A4      
+A4
 100.00
 Single
 -2
 1200 2
 6 650 0 9000 4150
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 0 880 0 880 270 700 270 700 0
-2 2 0 1 0 4 50 0 20 0.000 0 0 -1 0 0 5
-	 880 0 2050 0 2050 270 880 270 880 0
-2 2 0 1 0 3 50 0 20 0.000 0 0 -1 0 0 5
-	 2050 0 2905 0 2905 270 2050 270 2050 0
-2 2 0 1 0 14 50 0 20 0.000 0 0 -1 0 0 5
-	 2905 0 4075 0 4075 270 2905 270 2905 0
-2 2 0 1 0 5 50 0 20 0.000 0 0 -1 0 0 5
-	 4075 0 5365 0 5365 270 4075 270 4075 0
-2 2 0 1 0 12 50 0 20 0.000 0 0 -1 0 0 5
-	 5365 0 7330 0 7330 270 5365 270 5365 0
-2 2 0 1 0 31 50 0 20 0.000 0 0 -1 0 0 5
-	 7330 0 8425 0 8425 270 7330 270 7330 0
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 0 880 0 880 270 700 270 700 0
+2 2 0 1 0 1 50 0 32 0.000 0 0 -1 0 0 5
+	880 0 2050 0 2050 270 880 270 880 0
+2 2 0 0 0 1 50 0 32 0.000 0 0 -1 0 0 5
+	895 200 2040 200 2040 260 895 260 895 200
+4 1 0 50 0 18 9 0.0000 4 90 150 1465 200 1\001
+2 2 0 1 0 1 50 0 37 0.000 0 0 -1 0 0 5
+	2050 0 2905 0 2905 270 2050 270 2050 0
+2 2 0 0 0 1 50 0 37 0.000 0 0 -1 0 0 5
+	2065 200 2895 200 2895 260 2065 260 2065 200
+4 1 0 50 0 18 9 0.0000 4 90 150 2470 200 6\001
+2 2 0 1 0 1 50 0 35 0.000 0 0 -1 0 0 5
+	2905 0 4075 0 4075 270 2905 270 2905 0
+2 2 0 0 0 1 50 0 35 0.000 0 0 -1 0 0 5
+	2920 200 4065 200 4065 260 2920 260 2920 200
+4 1 0 50 0 18 9 0.0000 4 90 150 3490 200 4\001
+2 2 0 1 0 4 50 0 37 0.000 0 0 -1 0 0 5
+	4075 0 5365 0 5365 270 4075 270 4075 0
+2 2 0 0 0 4 50 0 37 0.000 0 0 -1 0 0 5
+	4090 200 5355 200 5355 260 4090 260 4090 200
+4 1 0 50 0 18 9 0.0000 4 90 150 4720 200 10\001
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5365 0 7330 0 7330 270 5365 270 5365 0
+2 2 0 0 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5380 200 7320 200 7320 260 5380 260 5380 200
+4 1 0 50 0 18 9 0.0000 4 90 150 6340 200 15\001
+2 2 0 1 0 1 50 0 34 0.000 0 0 -1 0 0 5
+	7330 0 8425 0 8425 270 7330 270 7330 0
+2 2 0 0 0 1 50 0 34 0.000 0 0 -1 0 0 5
+	7345 200 8415 200 8415 260 7345 260 7345 200
+4 1 0 50 0 18 9 0.0000 4 90 150 7870 200 3\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	8425 0 8950 0 8950 270 8425 270 8425 0
+4 1 0 50 0 18 9 0.0000 4 90 150 8680 200 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 270 940 270 940 540 700 540 700 270
+2 2 0 1 0 1 50 0 33 0.000 0 0 -1 0 0 5
+	940 270 7315 270 7315 540 940 540 940 270
+2 2 0 0 0 1 50 0 33 0.000 0 0 -1 0 0 5
+	955 470 7305 470 7305 530 955 530 955 470
+4 1 0 50 0 18 9 0.0000 4 90 150 4120 470 2\001
+2 2 0 1 0 1 50 0 34 0.000 0 0 -1 0 0 5
+	7315 270 8350 270 8350 540 7315 540 7315 270
+2 2 0 0 0 1 50 0 34 0.000 0 0 -1 0 0 5
+	7345 470 8340 470 8340 530 7345 530 7345 470
+4 1 0 50 0 18 9 0.0000 4 90 150 7825 470 3\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	8350 270 8950 270 8950 540 8350 540 8350 270
+4 1 0 50 0 18 9 0.0000 4 90 150 8650 470 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 540 955 540 955 810 700 810 700 540
+2 2 0 1 0 1 50 0 34 0.000 0 0 -1 0 0 5
+	955 540 8365 540 8365 810 955 810 955 540
+2 2 0 0 0 1 50 0 34 0.000 0 0 -1 0 0 5
+	985 740 8355 740 8355 800 985 800 985 740
+4 1 0 50 0 18 9 0.0000 4 90 150 4660 740 3\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	8365 540 8950 540 8950 810 8365 810 8365 540
+4 1 0 50 0 18 9 0.0000 4 90 150 8650 740 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 810 925 810 925 1080 700 1080 700 810
+2 2 0 1 0 1 50 0 35 0.000 0 0 -1 0 0 5
+	925 810 3880 810 3880 1080 925 1080 925 810
+2 2 0 0 0 1 50 0 35 0.000 0 0 -1 0 0 5
+	940 1010 3870 1010 3870 1070 940 1070 940 1010
+4 1 0 50 0 18 9 0.0000 4 90 150 2395 1010 4\001
+2 2 0 1 0 4 50 0 37 0.000 0 0 -1 0 0 5
+	3880 810 5110 810 5110 1080 3880 1080 3880 810
+4 1 0 50 0 18 9 0.0000 4 90 150 4495 1010 10\001
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5110 810 6565 810 6565 1080 5110 1080 5110 810
+2 2 0 0 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5725 1010 6555 1010 6555 1070 5725 1070 5725 1010
+4 1 0 50 0 18 9 0.0000 4 90 150 5830 1010 15\001
+2 2 0 1 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6565 810 7825 810 7825 1080 6565 1080 6565 810
+2 2 0 0 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6700 1010 7815 1010 7815 1070 6700 1070 6700 1010
+4 1 0 50 0 18 9 0.0000 4 90 150 7195 1010 12\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	7825 810 8950 810 8950 1080 7825 1080 7825 810
+4 1 0 50 0 18 9 0.0000 4 90 150 8380 1010 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 1080 940 1080 940 1350 700 1350 700 1080
+2 2 0 1 0 1 50 0 36 0.000 0 0 -1 0 0 5
+	940 1080 3910 1080 3910 1350 940 1350 940 1080
+2 2 0 0 0 1 50 0 36 0.000 0 0 -1 0 0 5
+	955 1280 3900 1280 3900 1340 955 1340 955 1280
+4 1 0 50 0 18 9 0.0000 4 90 150 2425 1280 5\001
+2 2 0 1 0 4 50 0 37 0.000 0 0 -1 0 0 5
+	3910 1080 5155 1080 5155 1350 3910 1350 3910 1080
+2 2 0 0 0 4 50 0 37 0.000 0 0 -1 0 0 5
+	4090 1280 5145 1280 5145 1340 4090 1340 4090 1280
+4 1 0 50 0 18 9 0.0000 4 90 150 4525 1280 10\001
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5155 1080 6595 1080 6595 1350 5155 1350 5155 1080
+2 2 0 0 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5725 1280 6585 1280 6585 1340 5725 1340 5725 1280
+4 1 0 50 0 18 9 0.0000 4 90 150 5875 1280 15\001
+2 2 0 1 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6595 1080 7840 1080 7840 1350 6595 1350 6595 1080
+2 2 0 0 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6700 1280 7830 1280 7830 1340 6700 1340 6700 1280
+4 1 0 50 0 18 9 0.0000 4 90 150 7210 1280 12\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	7840 1080 8950 1080 8950 1350 7840 1350 7840 1080
+4 1 0 50 0 18 9 0.0000 4 90 150 8395 1280 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 1350 955 1350 955 1620 700 1620 700 1350
+2 2 0 1 0 1 50 0 37 0.000 0 0 -1 0 0 5
+	955 1350 3295 1350 3295 1620 955 1620 955 1350
+2 2 0 0 0 1 50 0 37 0.000 0 0 -1 0 0 5
+	970 1550 3285 1550 3285 1610 970 1610 970 1550
+4 1 0 50 0 18 9 0.0000 4 90 150 2125 1550 6\001
+2 2 0 1 0 1 50 0 33 0.000 0 0 -1 0 0 5
+	3295 1350 5695 1350 5695 1620 3295 1620 3295 1350
+2 2 0 0 0 1 50 0 33 0.000 0 0 -1 0 0 5
+	3310 1550 5685 1550 5685 1610 3310 1610 3310 1550
+4 1 0 50 0 18 9 0.0000 4 90 150 4495 1550 2\001
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5695 1350 8200 1350 8200 1620 5695 1620 5695 1350
+2 2 0 0 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5725 1550 8190 1550 8190 1610 5725 1610 5725 1550
+4 1 0 50 0 18 9 0.0000 4 90 150 6940 1550 15\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	8200 1350 8950 1350 8950 1620 8200 1620 8200 1350
+4 1 0 50 0 18 9 0.0000 4 90 150 8575 1550 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 1620 970 1620 970 1890 700 1890 700 1620
+2 2 0 1 0 1 50 0 38 0.000 0 0 -1 0 0 5
+	970 1620 3280 1620 3280 1890 970 1890 970 1620
+2 2 0 0 0 1 50 0 38 0.000 0 0 -1 0 0 5
+	985 1820 3270 1820 3270 1880 985 1880 985 1820
+4 1 0 50 0 18 9 0.0000 4 90 150 2125 1820 7\001
+2 2 0 1 0 1 50 0 33 0.000 0 0 -1 0 0 5
+	3280 1620 5710 1620 5710 1890 3280 1890 3280 1620
+2 2 0 0 0 1 50 0 33 0.000 0 0 -1 0 0 5
+	3295 1820 5700 1820 5700 1880 3295 1880 3295 1820
+4 1 0 50 0 18 9 0.0000 4 90 150 4495 1820 2\001
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5710 1620 8185 1620 8185 1890 5710 1890 5710 1620
+2 2 0 0 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5725 1820 8175 1820 8175 1880 5725 1880 5725 1820
+4 1 0 50 0 18 9 0.0000 4 90 150 6940 1820 15\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	8185 1620 8950 1620 8950 1890 8185 1890 8185 1620
+4 1 0 50 0 18 9 0.0000 4 90 150 8560 1820 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 1890 925 1890 925 2160 700 2160 700 1890
 2 2 0 1 0 7 50 0 20 0.000 0 0 -1 0 0 5
-	 8425 0 8950 0 8950 270 8425 270 8425 0
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 270 940 270 940 540 700 540 700 270
-2 2 0 1 0 6 50 0 20 0.000 0 0 -1 0 0 5
-	 940 270 7315 270 7315 540 940 540 940 270
-2 2 0 1 0 31 50 0 20 0.000 0 0 -1 0 0 5
-	 7315 270 8350 270 8350 540 7315 540 7315 270
-2 2 0 1 0 7 50 0 20 0.000 0 0 -1 0 0 5
-	 8350 270 8950 270 8950 540 8350 540 8350 270
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 540 955 540 955 810 700 810 700 540
-2 2 0 1 0 31 50 0 20 0.000 0 0 -1 0 0 5
-	 955 540 8365 540 8365 810 955 810 955 540
-2 2 0 1 0 7 50 0 20 0.000 0 0 -1 0 0 5
-	 8365 540 8950 540 8950 810 8365 810 8365 540
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 810 925 810 925 1080 700 1080 700 810
-2 2 0 1 0 14 50 0 20 0.000 0 0 -1 0 0 5
-	 925 810 3880 810 3880 1080 925 1080 925 810
-2 2 0 1 0 5 50 0 20 0.000 0 0 -1 0 0 5
-	 3880 810 5110 810 5110 1080 3880 1080 3880 810
-2 2 0 1 0 12 50 0 20 0.000 0 0 -1 0 0 5
-	 5110 810 6565 810 6565 1080 5110 1080 5110 810
-2 2 0 1 0 22 50 0 20 0.000 0 0 -1 0 0 5
-	 6565 810 7825 810 7825 1080 6565 1080 6565 810
-2 2 0 1 0 7 50 0 20 0.000 0 0 -1 0 0 5
-	 7825 810 8950 810 8950 1080 7825 1080 7825 810
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 1080 940 1080 940 1350 700 1350 700 1080
-2 2 0 1 0 2 50 0 20 0.000 0 0 -1 0 0 5
-	 940 1080 3910 1080 3910 1350 940 1350 940 1080
-2 2 0 1 0 5 50 0 20 0.000 0 0 -1 0 0 5
-	 3910 1080 5155 1080 5155 1350 3910 1350 3910 1080
-2 2 0 1 0 12 50 0 20 0.000 0 0 -1 0 0 5
-	 5155 1080 6595 1080 6595 1350 5155 1350 5155 1080
-2 2 0 1 0 22 50 0 20 0.000 0 0 -1 0 0 5
-	 6595 1080 7840 1080 7840 1350 6595 1350 6595 1080
-2 2 0 1 0 7 50 0 20 0.000 0 0 -1 0 0 5
-	 7840 1080 8950 1080 8950 1350 7840 1350 7840 1080
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 1350 955 1350 955 1620 700 1620 700 1350
-2 2 0 1 0 3 50 0 20 0.000 0 0 -1 0 0 5
-	 955 1350 3295 1350 3295 1620 955 1620 955 1350
-2 2 0 1 0 6 50 0 20 0.000 0 0 -1 0 0 5
-	 3295 1350 5695 1350 5695 1620 3295 1620 3295 1350
-2 2 0 1 0 12 50 0 20 0.000 0 0 -1 0 0 5
-	 5695 1350 8200 1350 8200 1620 5695 1620 5695 1350
-2 2 0 1 0 7 50 0 20 0.000 0 0 -1 0 0 5
-	 8200 1350 8950 1350 8950 1620 8200 1620 8200 1350
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 1620 970 1620 970 1890 700 1890 700 1620
-2 2 0 1 0 16 50 0 20 0.000 0 0 -1 0 0 5
-	 970 1620 3280 1620 3280 1890 970 1890 970 1620
-2 2 0 1 0 6 50 0 20 0.000 0 0 -1 0 0 5
-	 3280 1620 5710 1620 5710 1890 3280 1890 3280 1620
-2 2 0 1 0 12 50 0 20 0.000 0 0 -1 0 0 5
-	 5710 1620 8185 1620 8185 1890 5710 1890 5710 1620
-2 2 0 1 0 7 50 0 20 0.000 0 0 -1 0 0 5
-	 8185 1620 8950 1620 8950 1890 8185 1890 8185 1620
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 1890 925 1890 925 2160 700 2160 700 1890
-2 2 0 1 0 27 50 0 20 0.000 0 0 -1 0 0 5
-	 925 1890 1075 1890 1075 2160 925 2160 925 1890
-2 2 0 1 0 7 50 0 20 0.000 0 0 -1 0 0 5
-	 1075 1890 8950 1890 8950 2160 1075 2160 1075 1890
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 2160 955 2160 955 2430 700 2430 700 2160
-2 2 0 1 0 7 50 0 20 0.000 0 0 -1 0 0 5
-	 955 2160 8950 2160 8950 2430 955 2430 955 2160
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 2430 1015 2430 1015 2700 700 2700 700 2430
-2 2 0 1 0 5 50 0 20 0.000 0 0 -1 0 0 5
-	 1015 2430 5320 2430 5320 2700 1015 2700 1015 2430
-2 2 0 1 0 12 50 0 20 0.000 0 0 -1 0 0 5
-	 5320 2430 6655 2430 6655 2700 5320 2700 5320 2430
-2 2 0 1 0 22 50 0 20 0.000 0 0 -1 0 0 5
-	 6655 2430 7780 2430 7780 2700 6655 2700 6655 2430
-2 2 0 1 0 7 50 0 20 0.000 0 0 -1 0 0 5
-	 7780 2430 8950 2430 8950 2700 7780 2700 7780 2430
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 2700 1000 2700 1000 2970 700 2970 700 2700
-2 2 0 1 0 29 50 0 20 0.000 0 0 -1 0 0 5
-	 1000 2700 1870 2700 1870 2970 1000 2970 1000 2700
-2 2 0 1 0 5 50 0 20 0.000 0 0 -1 0 0 5
-	 1870 2700 5335 2700 5335 2970 1870 2970 1870 2700
-2 2 0 1 0 12 50 0 20 0.000 0 0 -1 0 0 5
-	 5335 2700 6685 2700 6685 2970 5335 2970 5335 2700
-2 2 0 1 0 22 50 0 20 0.000 0 0 -1 0 0 5
-	 6685 2700 7795 2700 7795 2970 6685 2970 6685 2700
-2 2 0 1 0 7 50 0 20 0.000 0 0 -1 0 0 5
-	 7795 2700 8950 2700 8950 2970 7795 2970 7795 2700
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 2970 895 2970 895 3240 700 3240 700 2970
-2 2 0 1 0 22 50 0 20 0.000 0 0 -1 0 0 5
-	 895 2970 8575 2970 8575 3240 895 3240 895 2970
-2 2 0 1 0 7 50 0 20 0.000 0 0 -1 0 0 5
-	 8575 2970 8950 2970 8950 3240 8575 3240 8575 2970
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 3240 880 3240 880 3510 700 3510 700 3240
-2 2 0 1 0 20 50 0 20 0.000 0 0 -1 0 0 5
-	 880 3240 1555 3240 1555 3510 880 3510 880 3240
-2 2 0 1 0 22 50 0 20 0.000 0 0 -1 0 0 5
-	 1555 3240 8545 3240 8545 3510 1555 3510 1555 3240
-2 2 0 1 0 7 50 0 20 0.000 0 0 -1 0 0 5
-	 8545 3240 8950 3240 8950 3510 8545 3510 8545 3240
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 3510 895 3510 895 3780 700 3780 700 3510
-2 2 0 1 0 28 50 0 20 0.000 0 0 -1 0 0 5
-	 895 3510 1000 3510 1000 3780 895 3780 895 3510
-2 2 0 1 0 12 50 0 20 0.000 0 0 -1 0 0 5
-	 1000 3510 6385 3510 6385 3780 1000 3780 1000 3510
-2 2 0 1 0 22 50 0 20 0.000 0 0 -1 0 0 5
-	 6385 3510 8620 3510 8620 3780 6385 3780 6385 3510
-2 2 0 1 0 7 50 0 20 0.000 0 0 -1 0 0 5
-	 8620 3510 8950 3510 8950 3780 8620 3780 8620 3510
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 3780 940 3780 940 4050 700 4050 700 3780
-2 2 0 1 0 12 50 0 20 0.000 0 0 -1 0 0 5
-	 940 3780 6415 3780 6415 4050 940 4050 940 3780
-2 2 0 1 0 22 50 0 20 0.000 0 0 -1 0 0 5
-	 6415 3780 8635 3780 8635 4050 6415 4050 6415 3780
-2 2 0 1 0 7 50 0 20 0.000 0 0 -1 0 0 5
-	 8635 3780 8950 3780 8950 4050 8635 4050 8635 3780
+	925 1890 1075 1890 1075 2160 925 2160 925 1890
+2 2 0 0 0 7 50 0 20 0.000 0 0 -1 0 0 5
+	940 2090 1065 2090 1065 2150 940 2150 940 2090
+4 1 0 50 0 18 9 0.0000 4 90 150 1000 2090 8\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	1075 1890 8950 1890 8950 2160 1075 2160 1075 1890
+4 1 0 50 0 18 9 0.0000 4 90 150 5005 2090 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 2160 955 2160 955 2430 700 2430 700 2160
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	955 2160 8950 2160 8950 2430 955 2430 955 2160
+4 1 0 50 0 18 9 0.0000 4 90 150 4945 2360 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 2430 1015 2430 1015 2700 700 2700 700 2430
+2 2 0 1 0 4 50 0 37 0.000 0 0 -1 0 0 5
+	1015 2430 5320 2430 5320 2700 1015 2700 1015 2430
+2 2 0 0 0 4 50 0 37 0.000 0 0 -1 0 0 5
+	4090 2630 5310 2630 5310 2690 4090 2690 4090 2630
+4 1 0 50 0 18 9 0.0000 4 90 150 3160 2630 10\001
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5320 2430 6655 2430 6655 2700 5320 2700 5320 2430
+2 2 0 0 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5725 2630 6645 2630 6645 2690 5725 2690 5725 2630
+4 1 0 50 0 18 9 0.0000 4 90 150 5980 2630 15\001
+2 2 0 1 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6655 2430 7780 2430 7780 2700 6655 2700 6655 2430
+2 2 0 0 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6700 2630 7770 2630 7770 2690 6700 2690 6700 2630
+4 1 0 50 0 18 9 0.0000 4 90 150 7210 2630 12\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	7780 2430 8950 2430 8950 2700 7780 2700 7780 2430
+4 1 0 50 0 18 9 0.0000 4 90 150 8365 2630 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 2700 1000 2700 1000 2970 700 2970 700 2700
+2 2 0 1 0 4 50 0 36 0.000 0 0 -1 0 0 5
+	1000 2700 1870 2700 1870 2970 1000 2970 1000 2700
+2 2 0 0 0 4 50 0 36 0.000 0 0 -1 0 0 5
+	1015 2900 1860 2900 1860 2960 1015 2960 1015 2900
+4 1 0 50 0 18 9 0.0000 4 90 150 1435 2900 11\001
+2 2 0 1 0 4 50 0 37 0.000 0 0 -1 0 0 5
+	1870 2700 5335 2700 5335 2970 1870 2970 1870 2700
+2 2 0 0 0 4 50 0 37 0.000 0 0 -1 0 0 5
+	4090 2900 5325 2900 5325 2960 4090 2960 4090 2900
+4 1 0 50 0 18 9 0.0000 4 90 150 3595 2900 10\001
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5335 2700 6685 2700 6685 2970 5335 2970 5335 2700
+2 2 0 0 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	5725 2900 6675 2900 6675 2960 5725 2960 5725 2900
+4 1 0 50 0 18 9 0.0000 4 90 150 6010 2900 15\001
+2 2 0 1 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6685 2700 7795 2700 7795 2970 6685 2970 6685 2700
+2 2 0 0 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6700 2900 7785 2900 7785 2960 6700 2960 6700 2900
+4 1 0 50 0 18 9 0.0000 4 90 150 7240 2900 12\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	7795 2700 8950 2700 8950 2970 7795 2970 7795 2700
+4 1 0 50 0 18 9 0.0000 4 90 150 8365 2900 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 2970 895 2970 895 3240 700 3240 700 2970
+2 2 0 1 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	895 2970 8575 2970 8575 3240 895 3240 895 2970
+2 2 0 0 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6700 3170 8565 3170 8565 3230 6700 3230 6700 3170
+4 1 0 50 0 18 9 0.0000 4 90 150 4735 3170 12\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	8575 2970 8950 2970 8950 3240 8575 3240 8575 2970
+4 1 0 50 0 18 9 0.0000 4 90 150 8755 3170 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 3240 880 3240 880 3510 700 3510 700 3240
+2 2 0 1 0 4 50 0 34 0.000 0 0 -1 0 0 5
+	880 3240 1555 3240 1555 3510 880 3510 880 3240
+2 2 0 0 0 4 50 0 34 0.000 0 0 -1 0 0 5
+	895 3440 1545 3440 1545 3500 895 3500 895 3440
+4 1 0 50 0 18 9 0.0000 4 90 150 1210 3440 13\001
+2 2 0 1 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	1555 3240 8545 3240 8545 3510 1555 3510 1555 3240
+2 2 0 0 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6700 3440 8535 3440 8535 3500 6700 3500 6700 3440
+4 1 0 50 0 18 9 0.0000 4 90 150 5050 3440 12\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	8545 3240 8950 3240 8950 3510 8545 3510 8545 3240
+4 1 0 50 0 18 9 0.0000 4 90 150 8740 3440 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 3510 895 3510 895 3780 700 3780 700 3510
+2 2 0 1 0 4 50 0 33 0.000 0 0 -1 0 0 5
+	895 3510 1000 3510 1000 3780 895 3780 895 3510
+2 2 0 0 0 4 50 0 33 0.000 0 0 -1 0 0 5
+	910 3710 990 3710 990 3770 910 3770 910 3710
+4 1 0 50 0 18 9 0.0000 4 90 150 940 3710 14\001
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	1000 3510 6385 3510 6385 3780 1000 3780 1000 3510
+4 1 0 50 0 18 9 0.0000 4 90 150 3685 3710 15\001
+2 2 0 1 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6385 3510 8620 3510 8620 3780 6385 3780 6385 3510
+2 2 0 0 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6700 3710 8610 3710 8610 3770 6700 3770 6700 3710
+4 1 0 50 0 18 9 0.0000 4 90 150 7495 3710 12\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	8620 3510 8950 3510 8950 3780 8620 3780 8620 3510
+4 1 0 50 0 18 9 0.0000 4 90 150 8785 3710 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 3780 940 3780 940 4050 700 4050 700 3780
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	940 3780 6415 3780 6415 4050 940 4050 940 3780
+2 2 0 0 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	1090 3980 6405 3980 6405 4040 1090 4040 1090 3980
+4 1 0 50 0 18 9 0.0000 4 90 150 3670 3980 15\001
+2 2 0 1 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6415 3780 8635 3780 8635 4050 6415 4050 6415 3780
+2 2 0 0 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	6700 3980 8625 3980 8625 4040 6700 4040 6700 3980
+4 1 0 50 0 18 9 0.0000 4 90 150 7525 3980 12\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	8635 3780 8950 3780 8950 4050 8635 4050 8635 3780
+4 1 0 50 0 18 9 0.0000 4 90 150 8785 3980 9\001
 2 1 0 2 0 7 50 0 -1 0.000 0 0 -1 1 0 2
 	1 1 1.00 60.00 120.00
 	 700 4250 8950 4250
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 700 4200 700 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 700 4450 0\001
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 1450 4200 1450 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 1450 4450 50\001
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 2200 4200 2200 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 2200 4450 100\001
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 2950 4200 2950 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 2950 4450 150\001
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 3700 4200 3700 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 3700 4450 200\001
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 4450 4200 4450 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 4450 4450 250\001
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 5200 4200 5200 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 5200 4450 300\001
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 5950 4200 5950 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 5950 4450 350\001
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 6700 4200 6700 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 6700 4450 400\001
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 7450 4200 7450 4300
+4 1 0 50 0 16 9 0.0000 4 90 375 7450 4450 450\001
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 8200 4200 8200 4300
-4 1 0 50 0 18 9 0.0000 4 135 90 1465 200 1\001
-4 1 0 50 0 18 9 0.0000 4 135 90 2470 200 6\001
-4 1 0 50 0 18 9 0.0000 4 135 90 3490 200 4\001
-4 1 0 50 0 18 9 0.0000 4 135 180 4720 200 10\001
-4 1 0 50 0 18 9 0.0000 4 135 180 6340 200 15\001
-4 1 0 50 0 18 9 0.0000 4 135 90 7870 200 3\001
-4 1 0 50 0 18 9 0.0000 4 135 90 8680 200 9\001
-4 1 0 50 0 18 9 0.0000 4 135 90 4120 470 2\001
-4 1 0 50 0 18 9 0.0000 4 135 90 7825 470 3\001
-4 1 0 50 0 18 9 0.0000 4 135 90 8650 470 9\001
-4 1 0 50 0 18 9 0.0000 4 135 90 4660 740 3\001
-4 1 0 50 0 18 9 0.0000 4 135 90 8650 740 9\001
-4 1 0 50 0 18 9 0.0000 4 135 90 2395 1010 4\001
-4 1 0 50 0 18 9 0.0000 4 135 180 4495 1010 10\001
-4 1 0 50 0 18 9 0.0000 4 135 180 5830 1010 15\001
-4 1 0 50 0 18 9 0.0000 4 135 180 7195 1010 12\001
-4 1 0 50 0 18 9 0.0000 4 135 90 8380 1010 9\001
-4 1 0 50 0 18 9 0.0000 4 135 90 2425 1280 5\001
-4 1 0 50 0 18 9 0.0000 4 135 180 4525 1280 10\001
-4 1 0 50 0 18 9 0.0000 4 135 180 5875 1280 15\001
-4 1 0 50 0 18 9 0.0000 4 135 180 7210 1280 12\001
-4 1 0 50 0 18 9 0.0000 4 135 90 8395 1280 9\001
-4 1 0 50 0 18 9 0.0000 4 135 90 2125 1550 6\001
-4 1 0 50 0 18 9 0.0000 4 135 90 4495 1550 2\001
-4 1 0 50 0 18 9 0.0000 4 135 180 6940 1550 15\001
-4 1 0 50 0 18 9 0.0000 4 135 90 8575 1550 9\001
-4 1 0 50 0 18 9 0.0000 4 135 90 2125 1820 7\001
-4 1 0 50 0 18 9 0.0000 4 135 90 4495 1820 2\001
-4 1 0 50 0 18 9 0.0000 4 135 180 6940 1820 15\001
-4 1 0 50 0 18 9 0.0000 4 135 90 8560 1820 9\001
-4 1 0 50 0 18 9 0.0000 4 135 90 1000 2090 8\001
-4 1 0 50 0 18 9 0.0000 4 135 90 5005 2090 9\001
-4 1 0 50 0 18 9 0.0000 4 135 90 4945 2360 9\001
-4 1 0 50 0 18 9 0.0000 4 135 180 3160 2630 10\001
-4 1 0 50 0 18 9 0.0000 4 135 180 5980 2630 15\001
-4 1 0 50 0 18 9 0.0000 4 135 180 7210 2630 12\001
-4 1 0 50 0 18 9 0.0000 4 135 90 8365 2630 9\001
-4 1 0 50 0 18 9 0.0000 4 135 180 1435 2900 11\001
-4 1 0 50 0 18 9 0.0000 4 135 180 3595 2900 10\001
-4 1 0 50 0 18 9 0.0000 4 135 180 6010 2900 15\001
-4 1 0 50 0 18 9 0.0000 4 135 180 7240 2900 12\001
-4 1 0 50 0 18 9 0.0000 4 135 90 8365 2900 9\001
-4 1 0 50 0 18 9 0.0000 4 135 180 4735 3170 12\001
-4 1 0 50 0 18 9 0.0000 4 135 90 8755 3170 9\001
-4 1 0 50 0 18 9 0.0000 4 135 180 1210 3440 13\001
-4 1 0 50 0 18 9 0.0000 4 135 180 5050 3440 12\001
-4 1 0 50 0 18 9 0.0000 4 135 90 8740 3440 9\001
-4 1 0 50 0 18 9 0.0000 4 135 180 940 3710 14\001
-4 1 0 50 0 18 9 0.0000 4 135 180 3685 3710 15\001
-4 1 0 50 0 18 9 0.0000 4 135 180 7495 3710 12\001
-4 1 0 50 0 18 9 0.0000 4 135 90 8785 3710 9\001
-4 1 0 50 0 18 9 0.0000 4 135 180 3670 3980 15\001
-4 1 0 50 0 18 9 0.0000 4 135 180 7525 3980 12\001
-4 1 0 50 0 18 9 0.0000 4 135 90 8785 3980 9\001
-4 1 0 50 0 16 9 0.0000 4 135 90 700 4450 0\001
-4 1 0 50 0 16 9 0.0000 4 135 180 1450 4450 50\001
-4 1 0 50 0 16 9 0.0000 4 135 270 2200 4450 100\001
-4 1 0 50 0 16 9 0.0000 4 135 270 2950 4450 150\001
-4 1 0 50 0 16 9 0.0000 4 135 270 3700 4450 200\001
-4 1 0 50 0 16 9 0.0000 4 135 270 4450 4450 250\001
-4 1 0 50 0 16 9 0.0000 4 135 270 5200 4450 300\001
-4 1 0 50 0 16 9 0.0000 4 135 270 5950 4450 350\001
-4 1 0 50 0 16 9 0.0000 4 135 270 6700 4450 400\001
-4 1 0 50 0 16 9 0.0000 4 135 270 7450 4450 450\001
-4 1 0 50 0 16 9 0.0000 4 135 270 8200 4450 500\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 200 CPU  1\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 470 CPU  2\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 740 CPU  3\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 1010 CPU  4\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 1280 CPU  5\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 1550 CPU  6\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 1820 CPU  7\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 2090 CPU  8\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 2360 CPU  9\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 2630 CPU 10\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 2900 CPU 11\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 3170 CPU 12\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 3440 CPU 13\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 3710 CPU 14\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 3980 CPU 15\001
+4 1 0 50 0 16 9 0.0000 4 90 375 8200 4450 500\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 200 CPU  1\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 470 CPU  2\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 740 CPU  3\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 1010 CPU  4\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 1280 CPU  5\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 1550 CPU  6\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 1820 CPU  7\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 2090 CPU  8\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 2360 CPU  9\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 2630 CPU 10\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 2900 CPU 11\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 3170 CPU 12\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 3440 CPU 13\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 3710 CPU 14\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 3980 CPU 15\001
 -6
-6 90 4860 8235 9315
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 4860 2500 4860 2500 5130 700 5130 700 4860
-2 2 0 1 0 4 50 0 20 0.000 0 0 -1 0 0 5
-	 2500 4860 8200 4860 8200 5130 2500 5130 2500 4860
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 5130 3100 5130 3100 5400 700 5400 700 5130
-2 2 0 1 0 6 50 0 20 0.000 0 0 -1 0 0 5
-	 3100 5130 8200 5130 8200 5400 3100 5400 3100 5130
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 5400 3250 5400 3250 5670 700 5670 700 5400
-2 2 0 1 0 31 50 0 20 0.000 0 0 -1 0 0 5
-	 3250 5400 8200 5400 8200 5670 3250 5670 3250 5400
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 5670 2950 5670 2950 5940 700 5940 700 5670
-2 2 0 1 0 14 50 0 20 0.000 0 0 -1 0 0 5
-	 2950 5670 8200 5670 8200 5940 2950 5940 2950 5670
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 5940 3100 5940 3100 6210 700 6210 700 5940
-2 2 0 1 0 2 50 0 20 0.000 0 0 -1 0 0 5
-	 3100 5940 8200 5940 8200 6210 3100 6210 3100 5940
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 6210 3250 6210 3250 6480 700 6480 700 6210
-2 2 0 1 0 3 50 0 20 0.000 0 0 -1 0 0 5
-	 3250 6210 8200 6210 8200 6480 3250 6480 3250 6210
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 6480 3400 6480 3400 6750 700 6750 700 6480
-2 2 0 1 0 16 50 0 20 0.000 0 0 -1 0 0 5
-	 3400 6480 8200 6480 8200 6750 3400 6750 3400 6480
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 6750 2950 6750 2950 7020 700 7020 700 6750
-2 2 0 1 0 27 50 0 20 0.000 0 0 -1 0 0 5
-	 2950 6750 4450 6750 4450 7020 2950 7020 2950 6750
-2 2 0 1 0 7 50 0 20 0.000 0 0 -1 0 0 5
-	 4450 6750 8200 6750 8200 7020 4450 7020 4450 6750
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 7020 3250 7020 3250 7290 700 7290 700 7020
+6 650 4860 8045 9315
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 4860 2500 4860 2500 5130 700 5130 700 4860
+2 2 0 1 0 1 50 0 32 0.000 0 0 -1 0 0 5
+	2500 4860 8200 4860 8200 5130 2500 5130 2500 4860
+2 2 0 0 0 1 50 0 32 0.000 0 0 -1 0 0 5
+	2650 5060 8190 5060 8190 5120 2650 5120 2650 5060
+4 1 0 50 0 18 9 0.0000 4 90 150 5350 5060 1\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 5130 3100 5130 3100 5400 700 5400 700 5130
+2 2 0 1 0 1 50 0 33 0.000 0 0 -1 0 0 5
+	3100 5130 8200 5130 8200 5400 3100 5400 3100 5130
+2 2 0 0 0 1 50 0 33 0.000 0 0 -1 0 0 5
+	3250 5330 8190 5330 8190 5390 3250 5390 3250 5330
+4 1 0 50 0 18 9 0.0000 4 90 150 5650 5330 2\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 5400 3250 5400 3250 5670 700 5670 700 5400
+2 2 0 1 0 1 50 0 34 0.000 0 0 -1 0 0 5
+	3250 5400 8200 5400 8200 5670 3250 5670 3250 5400
+2 2 0 0 0 1 50 0 34 0.000 0 0 -1 0 0 5
+	3550 5600 8190 5600 8190 5660 3550 5660 3550 5600
+4 1 0 50 0 18 9 0.0000 4 90 150 5650 5600 3\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 5670 2950 5670 2950 5940 700 5940 700 5670
+2 2 0 1 0 1 50 0 35 0.000 0 0 -1 0 0 5
+	2950 5670 8200 5670 8200 5940 2950 5940 2950 5670
+2 2 0 0 0 1 50 0 35 0.000 0 0 -1 0 0 5
+	3100 5870 8190 5870 8190 5930 3100 5930 3100 5870
+4 1 0 50 0 18 9 0.0000 4 90 150 5500 5870 4\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 5940 3100 5940 3100 6210 700 6210 700 5940
+2 2 0 1 0 1 50 0 36 0.000 0 0 -1 0 0 5
+	3100 5940 8200 5940 8200 6210 3100 6210 3100 5940
+2 2 0 0 0 1 50 0 36 0.000 0 0 -1 0 0 5
+	3250 6140 8190 6140 8190 6200 3250 6200 3250 6140
+4 1 0 50 0 18 9 0.0000 4 90 150 5650 6140 5\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 6210 3250 6210 3250 6480 700 6480 700 6210
+2 2 0 1 0 1 50 0 37 0.000 0 0 -1 0 0 5
+	3250 6210 8200 6210 8200 6480 3250 6480 3250 6210
+2 2 0 0 0 1 50 0 37 0.000 0 0 -1 0 0 5
+	3400 6410 8190 6410 8190 6470 3400 6470 3400 6410
+4 1 0 50 0 18 9 0.0000 4 90 150 5650 6410 6\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 6480 3400 6480 3400 6750 700 6750 700 6480
+2 2 0 1 0 1 50 0 38 0.000 0 0 -1 0 0 5
+	3400 6480 8200 6480 8200 6750 3400 6750 3400 6480
+2 2 0 0 0 1 50 0 38 0.000 0 0 -1 0 0 5
+	3550 6680 8190 6680 8190 6740 3550 6740 3550 6680
+4 1 0 50 0 18 9 0.0000 4 90 150 5800 6680 7\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 6750 2950 6750 2950 7020 700 7020 700 6750
 2 2 0 1 0 7 50 0 20 0.000 0 0 -1 0 0 5
-	 3250 7020 8200 7020 8200 7290 3250 7290 3250 7020
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 7290 3850 7290 3850 7560 700 7560 700 7290
-2 2 0 1 0 5 50 0 20 0.000 0 0 -1 0 0 5
-	 3850 7290 8200 7290 8200 7560 3850 7560 3850 7290
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 7560 3700 7560 3700 7830 700 7830 700 7560
-2 2 0 1 0 29 50 0 20 0.000 0 0 -1 0 0 5
-	 3700 7560 8200 7560 8200 7830 3700 7830 3700 7560
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 7830 2650 7830 2650 8100 700 8100 700 7830
-2 2 0 1 0 22 50 0 20 0.000 0 0 -1 0 0 5
-	 2650 7830 8200 7830 8200 8100 2650 8100 2650 7830
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 8100 2500 8100 2500 8370 700 8370 700 8100
-2 2 0 1 0 20 50 0 20 0.000 0 0 -1 0 0 5
-	 2500 8100 8200 8100 8200 8370 2500 8370 2500 8100
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 8370 2650 8370 2650 8640 700 8640 700 8370
-2 2 0 1 0 28 50 0 20 0.000 0 0 -1 0 0 5
-	 2650 8370 3700 8370 3700 8640 2650 8640 2650 8370
-2 2 0 1 0 12 50 0 20 0.000 0 0 -1 0 0 5
-	 3700 8370 8200 8370 8200 8640 3700 8640 3700 8370
-2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5
-	 700 8640 3100 8640 3100 8910 700 8910 700 8640
-2 2 0 1 0 12 50 0 20 0.000 0 0 -1 0 0 5
-	 3100 8640 8200 8640 8200 8910 3100 8910 3100 8640
+	2950 6750 4450 6750 4450 7020 2950 7020 2950 6750
+2 2 0 0 0 7 50 0 20 0.000 0 0 -1 0 0 5
+	3100 6950 4440 6950 4440 7010 3100 7010 3100 6950
+4 1 0 50 0 18 9 0.0000 4 90 150 3700 6950 8\001
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	4450 6750 8200 6750 8200 7020 4450 7020 4450 6750
+4 1 0 50 0 18 9 0.0000 4 90 150 6250 6950 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 7020 3250 7020 3250 7290 700 7290 700 7020
+2 2 0 1 0 4 50 0 38 0.000 0 0 -1 0 0 5
+	3250 7020 8200 7020 8200 7290 3250 7290 3250 7020
+4 1 0 50 0 18 9 0.0000 4 90 150 5650 7220 9\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 7290 3850 7290 3850 7560 700 7560 700 7290
+2 2 0 1 0 4 50 0 37 0.000 0 0 -1 0 0 5
+	3850 7290 8200 7290 8200 7560 3850 7560 3850 7290
+4 1 0 50 0 18 9 0.0000 4 90 150 5950 7490 10\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 7560 3700 7560 3700 7830 700 7830 700 7560
+2 2 0 1 0 4 50 0 36 0.000 0 0 -1 0 0 5
+	3700 7560 8200 7560 8200 7830 3700 7830 3700 7560
+2 2 0 0 0 4 50 0 36 0.000 0 0 -1 0 0 5
+	3850 7760 8190 7760 8190 7820 3850 7820 3850 7760
+4 1 0 50 0 18 9 0.0000 4 90 150 5950 7760 11\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 7830 2650 7830 2650 8100 700 8100 700 7830
+2 2 0 1 0 4 50 0 35 0.000 0 0 -1 0 0 5
+	2650 7830 8200 7830 8200 8100 2650 8100 2650 7830
+4 1 0 50 0 18 9 0.0000 4 90 150 5350 8030 12\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 8100 2500 8100 2500 8370 700 8370 700 8100
+2 2 0 1 0 4 50 0 34 0.000 0 0 -1 0 0 5
+	2500 8100 8200 8100 8200 8370 2500 8370 2500 8100
+2 2 0 0 0 4 50 0 34 0.000 0 0 -1 0 0 5
+	2650 8300 8190 8300 8190 8360 2650 8360 2650 8300
+4 1 0 50 0 18 9 0.0000 4 90 150 5350 8300 13\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 8370 2650 8370 2650 8640 700 8640 700 8370
+2 2 0 1 0 4 50 0 33 0.000 0 0 -1 0 0 5
+	2650 8370 3700 8370 3700 8640 2650 8640 2650 8370
+2 2 0 0 0 4 50 0 33 0.000 0 0 -1 0 0 5
+	2800 8570 3690 8570 3690 8630 2800 8630 2800 8570
+4 1 0 50 0 18 9 0.0000 4 90 150 3100 8570 14\001
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	3700 8370 8200 8370 8200 8640 3700 8640 3700 8370
+4 1 0 50 0 18 9 0.0000 4 90 150 5950 8570 15\001
+2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5
+	700 8640 3100 8640 3100 8910 700 8910 700 8640
+2 2 0 1 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	3100 8640 8200 8640 8200 8910 3100 8910 3100 8640
+2 2 0 0 0 4 50 0 32 0.000 0 0 -1 0 0 5
+	4600 8840 8190 8840 8190 8900 4600 8900 4600 8840
+4 1 0 50 0 18 9 0.0000 4 90 150 5650 8840 15\001
 2 1 0 2 0 7 50 0 -1 0.000 0 0 -1 1 0 2
 	1 1 1.00 60.00 120.00
 	 700 9110 8200 9110
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 700 9060 700 9160
+4 1 0 50 0 16 9 0.0000 4 90 375 700 9310 0\001
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 1450 9060 1450 9160
+4 1 0 50 0 16 9 0.0000 4 90 375 1450 9310 5\001
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 2200 9060 2200 9160
+4 1 0 50 0 16 9 0.0000 4 90 375 2200 9310 10\001
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 2950 9060 2950 9160
+4 1 0 50 0 16 9 0.0000 4 90 375 2950 9310 15\001
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 3700 9060 3700 9160
+4 1 0 50 0 16 9 0.0000 4 90 375 3700 9310 20\001
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 4450 9060 4450 9160
+4 1 0 50 0 16 9 0.0000 4 90 375 4450 9310 25\001
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 5200 9060 5200 9160
+4 1 0 50 0 16 9 0.0000 4 90 375 5200 9310 30\001
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 5950 9060 5950 9160
+4 1 0 50 0 16 9 0.0000 4 90 375 5950 9310 35\001
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 6700 9060 6700 9160
+4 1 0 50 0 16 9 0.0000 4 90 375 6700 9310 40\001
 2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2
 	 7450 9060 7450 9160
-4 1 0 50 0 18 9 0.0000 4 135 90 5350 5060 1\001
-4 1 0 50 0 18 9 0.0000 4 135 90 5650 5330 2\001
-4 1 0 50 0 18 9 0.0000 4 135 90 5650 5600 3\001
-4 1 0 50 0 18 9 0.0000 4 135 90 5500 5870 4\001
-4 1 0 50 0 18 9 0.0000 4 135 90 5650 6140 5\001
-4 1 0 50 0 18 9 0.0000 4 135 90 5650 6410 6\001
-4 1 0 50 0 18 9 0.0000 4 135 90 5800 6680 7\001
-4 1 0 50 0 18 9 0.0000 4 135 90 3700 6950 8\001
-4 1 0 50 0 18 9 0.0000 4 135 90 6250 6950 9\001
-4 1 0 50 0 18 9 0.0000 4 135 90 5650 7220 9\001
-4 1 0 50 0 18 9 0.0000 4 135 180 5950 7490 10\001
-4 1 0 50 0 18 9 0.0000 4 135 180 5950 7760 11\001
-4 1 0 50 0 18 9 0.0000 4 135 180 5350 8030 12\001
-4 1 0 50 0 18 9 0.0000 4 135 180 5350 8300 13\001
-4 1 0 50 0 18 9 0.0000 4 135 180 3100 8570 14\001
-4 1 0 50 0 18 9 0.0000 4 135 180 5950 8570 15\001
-4 1 0 50 0 18 9 0.0000 4 135 180 5650 8840 15\001
-4 1 0 50 0 16 9 0.0000 4 135 90 700 9310 0\001
-4 1 0 50 0 16 9 0.0000 4 135 90 1450 9310 5\001
-4 1 0 50 0 16 9 0.0000 4 135 180 2200 9310 10\001
-4 1 0 50 0 16 9 0.0000 4 135 180 2950 9310 15\001
-4 1 0 50 0 16 9 0.0000 4 135 180 3700 9310 20\001
-4 1 0 50 0 16 9 0.0000 4 135 180 4450 9310 25\001
-4 1 0 50 0 16 9 0.0000 4 135 180 5200 9310 30\001
-4 1 0 50 0 16 9 0.0000 4 135 180 5950 9310 35\001
-4 1 0 50 0 16 9 0.0000 4 135 180 6700 9310 40\001
-4 1 0 50 0 16 9 0.0000 4 135 180 7450 9310 45\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 5060 CPU  1\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 5330 CPU  2\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 5600 CPU  3\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 5870 CPU  4\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 6140 CPU  5\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 6410 CPU  6\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 6680 CPU  7\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 6950 CPU  8\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 7220 CPU  9\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 7490 CPU 10\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 7760 CPU 11\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 8030 CPU 12\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 8300 CPU 13\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 8570 CPU 14\001
-4 2 0 50 0 16 9 0.0000 4 135 540 670 8840 CPU 15\001
+4 1 0 50 0 16 9 0.0000 4 90 375 7450 9310 45\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 5060 CPU  1\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 5330 CPU  2\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 5600 CPU  3\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 5870 CPU  4\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 6140 CPU  5\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 6410 CPU  6\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 6680 CPU  7\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 6950 CPU  8\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 7220 CPU  9\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 7490 CPU 10\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 7760 CPU 11\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 8030 CPU 12\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 8300 CPU 13\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 8570 CPU 14\001
+4 2 0 50 0 16 8.5 0.0000 4 105 420 670 8840 CPU 15\001
 -6
 2 1 1 1 0 7 50 -1 -1 4.000 0 0 -1 0 0 2
-	 1485 4275 8190 4860
-2 1 0 1 0 7 50 -1 -1 4.000 0 0 -1 0 0 2
-	 3915 4725 3915 9270
+	700 4250 700 4860
 2 1 1 1 0 7 50 -1 -1 4.000 0 0 -1 0 0 2
-	 720 4275 720 4860
+	1450 4250 8200 4860
+2 1 0 1 0 7 50 -1 -1 4.000 0 0 -1 0 0 2
+	3900 4725 3900 9270
diff --git a/advsync/MoreThanOneValue-15CPU.input b/advsync/MoreThanOneValue-15CPU.input
index 075a235..58c3773 100644
--- a/advsync/MoreThanOneValue-15CPU.input
+++ b/advsync/MoreThanOneValue-15CPU.input
@@ -1,16 +1,27 @@
 0
-12 1 90 6 147 4 225 10 311 15 442 3 515 9 0 0 13 89 91 146 148 224 226 310 312 441 443 514 0 0
-16 2 441 3 510 9 0 0 17 440 443 509 0 0
-17 3 511 9 0 0 19 510 0 0
-15 4 212 10 294 15 391 12 475 9 0 0 16 211 335 390 400 474 0 0
-16 5 214 10 297 15 393 12 476 9 0 0 17 213 226 296 335 392 400 475 0 0
-17 6 173 2 333 15 500 9 0 0 18 172 174 332 335 499 0 0
-18 7 172 2 334 15 499 9 0 0 19 171 173 333 335 498 0 0
-15 8 25 9 0 0 16 24 0 0
+2
+ 1  1  1  1  1  1  1  7  4  4  4  4  4  4  4
+32 33 34 35 36 37 38 20 38 37 36 35 34 33 32
+ 1  1  1  1  1  1  1  7  4  4  4  4  4  4  4
+32 33 34 35 36 37 38 20 38 37 36 35 34 33 32
+999
+ 1  1  1  1  1  1  1  7  4  4  4  4  4  4  4
+32 33 34 35 36 37 38 20 38 37 36 35 34 33 32
+ 1  1  1  1  1  1  1  7  4  4  4  4  4  4  4
+28 29 30 31 32 33 34 15 34 33 32 31 30 29 28
+999
+12 1 90 6 147 4 225 10 311 15 442 3 515 9 0 0 13 90 91 147 148 225 226 311 312 442 443 515 0 0
+16 2 441 3 510 9 0 0 17 441 443 510 0 0
+17 3 511 9 0 0 19 511 0 0
+15 4 212 10 294 15 391 12 475 9 0 0 16 212 335 391 400 475 0 0
+16 5 214 10 297 15 393 12 476 9 0 0 17 214 226 297 335 393 400 476 0 0
+17 6 173 2 333 15 500 9 0 0 18 173 174 333 335 500 0 0
+18 7 172 2 334 15 499 9 0 0 19 172 173 334 335 499 0 0
+15 8 25 9 0 0 16 25 0 0
 17 9 0 0 0 0
-21 10 308 15 397 12 472 9 0 0 226 307 335 396 400 471 0 0
-20 11 78 10 309 15 399 12 473 9 0 0 21 77 226 308 335 398 400 472 0 0
-13 12 525 9 0 0 400 524 0 0
-12 13 57 12 523 9 0 0 13 56 400 522 0 0
-13 14 20 15 379 12 528 9 0 0 14 19 400 527 0 0
-16 15 381 12 529 9 0 0 26 380 400 528 0 0
+21 10 308 15 397 12 472 9 0 0 226 308 335 397 400 472 0 0
+20 11 78 10 309 15 399 12 473 9 0 0 21 78 226 309 335 399 400 473 0 0
+13 12 525 9 0 0 400 525 0 0
+12 13 57 12 523 9 0 0 13 57 400 523 0 0
+13 14 20 15 379 12 528 9 0 0 14 20 400 528 0 0
+16 15 381 12 529 9 0 0 26 381 400 529 0 0
diff --git a/utilities/MoreThanOneValue-15CPU.c b/utilities/MoreThanOneValue-15CPU.c
index fa4e717..d9fbc75 100644
--- a/utilities/MoreThanOneValue-15CPU.c
+++ b/utilities/MoreThanOneValue-15CPU.c
@@ -1,5 +1,6 @@
 /*
  * MoreThanOneValue-15CPU.c: Convert memory order 15 CPU result into .fig
+ *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation; either version 2 of the License, or
@@ -18,25 +19,37 @@
  */

 #include <stdio.h>
+#include <stdlib.h>

 #define CPU_NUM (15)
 #define MAX_CHANGE (15)
-#define TIM_WIDTH (15)
-#define MAX_TIME (550)
-#define RULER_TICK (50 * TIM_WIDTH)
-
-/* length unit is pixel in 1200 dpi */
-static const int fig_base = 700;
-static const int max_time = MAX_TIME;
-static const int fig_width = MAX_TIME * TIM_WIDTH;
-static const int bar_height = 270;
+#define TIM_WIDTH_UPPER (15)
+#define TIM_WIDTH_LOWER (150)
+#define MAX_TIME_UPPER (550)
+#define MAX_TIME_LOWER (50)
+#define RULER_TICK_UPPER (50)
+#define RULER_TICK_LOWER (5)
+#define DIAGRAM_NUM (2)

-/* array for color selection for each value */
-static const int color[CPU_NUM] = {
-    4, 6, 31, 14, 2, 3, 16, 27, 7, 5, 29, 22, 20, 28, 12
+const struct diagram_param_s {
+    int fig_base;
+    int tim_width;
+    int max_time;
+    int fig_width;
+    int bar_height;
+    int ruler_tick;
+} diag_param[DIAGRAM_NUM] = {
+    {700, TIM_WIDTH_UPPER, MAX_TIME_UPPER, MAX_TIME_UPPER * TIM_WIDTH_UPPER,
+     270, RULER_TICK_UPPER * TIM_WIDTH_UPPER},
+    {700, TIM_WIDTH_LOWER, MAX_TIME_LOWER, MAX_TIME_LOWER * TIM_WIDTH_LOWER,
+     270, RULER_TICK_LOWER * TIM_WIDTH_LOWER}
 };
-static const int area_fill[CPU_NUM] = {
-    25, 25, 25, 25, 25, 25, 25, 25, 15, 25, 25, 25, 25, 25, 25
+
+struct color_table_s {
+    int col[CPU_NUM];
+    int fill[CPU_NUM];
+    int col_norsp[CPU_NUM];
+    int fill_norsp[CPU_NUM];
 };

 /* local storage for value change */
@@ -45,20 +58,159 @@ static int chg_val[CPU_NUM][MAX_CHANGE];
 static int unresp_time_b[CPU_NUM][MAX_CHANGE];
 static int unresp_time_e[CPU_NUM][MAX_CHANGE];

+int draw_diagram(int n, int m, const struct color_table_s *col_table, int y_offset)
+{
+    int fig_base = diag_param[n].fig_base;
+    int max_time = diag_param[n].max_time;
+    int tim_width = diag_param[n].tim_width;
+    int fig_width = diag_param[n].fig_width;
+    int bar_height = diag_param[n].bar_height;
+    int ruler_tick = diag_param[n].ruler_tick;
+    int i, j, k;
+    int next_time;
+    int unresp_end;
+
+    /* output boxes for each CPU */
+    for (i = 0; i < CPU_NUM; i++) {
+	printf("2 2 0 1 0 0 50 0 12 0.000 0 0 -1 0 0 5\n");
+	printf("\t%d %d %d %d %d %d %d %d %d %d\n",
+	       fig_base, bar_height * i + y_offset,
+	       fig_base + chg_time[i][0] * tim_width, bar_height * i + y_offset,
+	       fig_base + chg_time[i][0] * tim_width, bar_height * (i + 1) + y_offset,
+	       fig_base, bar_height * (i + 1) + y_offset,
+	       fig_base, bar_height * i + y_offset
+	       );
+	for (j = 0; j < MAX_CHANGE; j++) {
+	    next_time = chg_time[i][j+1];
+	    if (next_time == 0 || next_time >= max_time)
+		next_time = max_time;
+	    printf("2 2 0 1 0 %d 50 0 %d 0.000 0 0 -1 0 0 5\n",
+		   col_table[m].col[chg_val[i][j]-1], col_table[m].fill[chg_val[i][j]-1]);
+	    printf("\t%d %d %d %d %d %d %d %d %d %d\n",
+		   fig_base + chg_time[i][j] * tim_width, bar_height * i + y_offset,
+		   fig_base + next_time * tim_width, bar_height * i + y_offset,
+		   fig_base + next_time * tim_width, bar_height * (i + 1) + y_offset,
+		   fig_base + chg_time[i][j] * tim_width, bar_height * (i + 1) + y_offset,
+		   fig_base + chg_time[i][j] * tim_width, bar_height * i + y_offset
+		);
+
+	    for (k = 0; k < MAX_CHANGE; k++) {
+		if (unresp_time_b[i][k] == 0 || unresp_time_e[i][k] == 0)
+		    break;
+		if (unresp_time_b[i][k] > chg_time[i][j] &&
+		    unresp_time_b[i][k] < next_time) {
+		    /* let's draw */
+		    unresp_end = unresp_time_e[i][k];
+		    if (unresp_end >= max_time)
+			unresp_end = max_time;
+		    printf("2 2 0 0 0 %d 50 0 %d 0.000 0 0 -1 0 0 5\n",
+			   col_table[m].col_norsp[chg_val[i][j]-1],
+			   col_table[m].fill_norsp[chg_val[i][j]-1]
+			);
+		    printf("\t%d %d %d %d %d %d %d %d %d %d\n",
+			   fig_base + unresp_time_b[i][k] * tim_width,
+			   bar_height * i + 200 + y_offset,
+			   fig_base + unresp_end * tim_width - 10,
+			   bar_height * i + 200 + y_offset,
+			   fig_base + unresp_end * tim_width - 10,
+			   bar_height * (i + 1) - 10 + y_offset,
+			   fig_base + unresp_time_b[i][k] * tim_width,
+			   bar_height * (i + 1) - 10 + y_offset,
+			   fig_base + unresp_time_b[i][k] * tim_width,
+			   bar_height * i + 200 + y_offset
+			);
+		}
+	    }
+
+	    printf("4 1 0 50 0 18 9 0.0000 4 90 150 %d %d %d\\001\n",
+		   fig_base + (chg_time[i][j] + next_time) / 2 * tim_width,
+		   bar_height * i + 200 + y_offset, chg_val[i][j]);
+	    if (chg_time[i][j+1] == 0 || chg_time[i][j+1] >= max_time) break;
+	}
+    }
+    /* output ruler */
+    /* horiz line */
+    printf("2 1 0 2 0 7 50 0 -1 0.000 0 0 -1 1 0 2\n");
+    printf("\t1 1 1.00 60.00 120.00\n");
+    printf("\t %d %d %d %d\n", fig_base, bar_height * CPU_NUM + 200 + y_offset,
+	   fig_base + max_time * tim_width, bar_height * CPU_NUM + 200 + y_offset);
+    /* ruler ticks */
+    i = 0;
+    do {
+	printf("2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2\n");
+	printf("\t %d %d %d %d\n",
+	       fig_base + ruler_tick * i, bar_height * CPU_NUM + 150 + y_offset,
+	       fig_base + ruler_tick * i, bar_height * CPU_NUM + 250 + y_offset);
+	printf("4 1 0 50 0 16 9 0.0000 4 90 375 %d %d %d\\001\n",
+	       fig_base + ruler_tick * i, bar_height * CPU_NUM + 400 + y_offset,
+	       (ruler_tick * i)/tim_width);
+	i++;
+    } while (ruler_tick * i < fig_width);
+    /* label CPU */
+    for (i = 0; i < CPU_NUM; i++) {
+	printf("4 2 0 50 0 16 8.5 0.0000 4 105 420 %d %d CPU %2d\\001\n",
+	       fig_base - 30, bar_height * i + 200 + y_offset, i + 1);
+    }
+    return 0;
+}
+
 int main(void)
 {
     int i, j, k;
     int ret;
-    int next_time;
     int mode;
-    int unresp_end;
+    int mode_num;
+    int fig_base;
+    int fig_width;
+    int bar_height;
+    struct color_table_s *color_table;

     /* read mode */
     ret = scanf("%d ", &mode);
     if (EOF == ret)
 	goto err_exit;
-    if (mode != 0 && mode != 1)
+    ret = scanf("%d ", &mode_num);
+    if (EOF == ret)
 	goto err_exit;
+    if (mode >= mode_num)
+	goto err_exit;
+    /* read color selection data for given mode_num */
+    /* first, allocate memory */
+    color_table = calloc(mode_num, sizeof(struct color_table_s));
+    if (NULL == color_table) {
+	fprintf(stderr, "memory allocation failed for color_table\n");
+	return 1;
+    }
+    /* read color param */
+    for (i = 0; i < mode_num; i++) {
+	for (j = 0; j < CPU_NUM; j++) {
+	    ret = scanf("%d ", &color_table[i].col[j]);
+	    if (EOF == ret)
+		goto err_exit;
+	}
+	for (j = 0; j < CPU_NUM; j++) {
+	    ret = scanf("%d ", &color_table[i].fill[j]);
+	    if (EOF == ret)
+		goto err_exit;
+	}
+	for (j = 0; j < CPU_NUM; j++) {
+	    ret = scanf("%d ", &color_table[i].col_norsp[j]);
+	    if (EOF == ret)
+		goto err_exit;	
+	}
+	for (j = 0; j < CPU_NUM; j++) {
+	    ret = scanf("%d ", &color_table[i].fill_norsp[j]);
+	    if (EOF == ret)
+		goto err_exit;
+	}
+	ret = scanf("%d ", &k);
+	if (EOF == ret)
+	    goto err_exit;
+	if (999 != k) {
+	    fprintf(stderr, "read: %d, expeced 999\n", k);
+	    goto err_exit;
+	}
+    }
     /* read value change data from stdin */
     for (i = 0; i < CPU_NUM; i++) {
 	for (j = 0; j < MAX_CHANGE; j++) {
@@ -92,91 +244,34 @@ int main(void)
     printf("Single\n");
     printf("-2\n");
     printf("1200 2\n");
+    /* draw upper diagram */
+    fig_base = diag_param[0].fig_base;
+    fig_width = diag_param[0].fig_width;
+    bar_height = diag_param[0].bar_height;
     printf("6 %d 0 %d %d\n", fig_base - 50, fig_base + fig_width + 50,
 	   (bar_height * CPU_NUM) + 100);
-
-    /* output boxes for each CPU */
-    for (i = 0; i < CPU_NUM; i++) {
-	printf("2 2 0 1 0 0 50 0 15 0.000 0 0 -1 0 0 5\n");
-	printf("\t%d %d %d %d %d %d %d %d %d %d\n",
-	       fig_base, bar_height * i,
-	       fig_base + chg_time[i][0] * TIM_WIDTH, bar_height * i,
-	       fig_base + chg_time[i][0] * TIM_WIDTH, bar_height * (i + 1),
-	       fig_base, bar_height * (i + 1),
-	       fig_base, bar_height * i
-	       );
-	for (j = 0; j < MAX_CHANGE; j++) {
-	    next_time = chg_time[i][j+1];
-	    if (next_time == 0 || next_time >= MAX_TIME)
-		next_time = max_time;
-	    printf("2 2 0 1 0 %d 50 0 20 0.000 0 0 -1 0 0 5\n", color[chg_val[i][j]-1]);
-	    printf("\t%d %d %d %d %d %d %d %d %d %d\n",
-		   fig_base + chg_time[i][j] * TIM_WIDTH, bar_height * i,
-		   fig_base + next_time * TIM_WIDTH, bar_height * i,
-		   fig_base + next_time * TIM_WIDTH, bar_height * (i + 1),
-		   fig_base + chg_time[i][j] * TIM_WIDTH, bar_height * (i + 1),
-		   fig_base + chg_time[i][j] * TIM_WIDTH, bar_height * i
-		   );
-	    /* if mode == 1, draw box for unresponsive state if there is */
-	    if (mode == 1) {
-		for (k = 0; k < MAX_CHANGE; k++) {
-		    if (unresp_time_b[i][k] == 0 || unresp_time_e[i][k] == 0)
-			break;
-		    if (unresp_time_b[i][k] > chg_time[i][j] &&
-			unresp_time_b[i][k] < next_time) {
-			/* let's draw */
-			unresp_end = unresp_time_e[i][k];
-			if (unresp_end >= MAX_TIME)
-			    unresp_end = max_time;
-			printf("2 2 0 0 0 %d 50 0 %d 0.000 0 0 -1 0 0 5\n",
-			       color[chg_val[i][j]-1],
-			       area_fill[chg_val[i][j]-1]
-			    );
-			printf("\t%d %d %d %d %d %d %d %d %d %d\n",
-			       fig_base + unresp_time_b[i][k] * TIM_WIDTH,
-			       bar_height * i + 10,
-			       fig_base + unresp_end * TIM_WIDTH,
-			       bar_height * i + 10,
-			       fig_base + unresp_end * TIM_WIDTH,
-			       bar_height * (i + 1) - 10,
-			       fig_base + unresp_time_b[i][k] * TIM_WIDTH,
-			       bar_height * (i + 1) - 10,
-			       fig_base + unresp_time_b[i][k] * TIM_WIDTH,
-			       bar_height * i + 10
-			    );
-		    }
-		}
-	    }
-	    printf("4 1 0 50 0 18 9 0.0000 4 90 150 %d %d %d\\001\n",
-		   fig_base + (chg_time[i][j] + next_time) / 2 * TIM_WIDTH,
-		   bar_height * i + 200, chg_val[i][j]);
-	    if (chg_time[i][j+1] == 0 || chg_time[i][j+1] >= MAX_TIME) break;
-	}
-    }
-    /* output ruler */
-    /* horiz line */
-    printf("2 1 0 2 0 7 50 0 -1 0.000 0 0 -1 1 0 2\n");
-    printf("\t1 1 1.00 60.00 120.00\n");
-    printf("\t %d %d %d %d\n", fig_base, bar_height * CPU_NUM + 200,
-	   fig_base + max_time * TIM_WIDTH, bar_height * CPU_NUM + 200);
-    /* ruler ticks */
-    i = 0;
-    do {
-	printf("2 1 0 1 0 7 50 0 -1 0.000 0 0 -1 0 0 2\n");
-	printf("\t %d %d %d %d\n",
-	       fig_base + RULER_TICK * i, bar_height * CPU_NUM + 150,
-	       fig_base + RULER_TICK * i, bar_height * CPU_NUM + 250);
-	printf("4 1 0 50 0 16 9 0.0000 4 90 375 %d %d %d\\001\n",
-	       fig_base + RULER_TICK * i, bar_height * CPU_NUM + 400,
-	       (RULER_TICK * i)/TIM_WIDTH);
-	i++;
-    } while (RULER_TICK * i < fig_width);
-    /* label CPU */
-    for (i = 0; i < CPU_NUM; i++) {
-	printf("4 2 0 50 0 16 8.5 0.0000 4 105 420 %d %d CPU %2d\\001\n",
-	       fig_base - 30, bar_height * i + 200, i + 1);
-    }
+    ret = draw_diagram(0, mode, color_table, 0);
+    printf("-6\n");
+    if (ret != 0)
+	goto err_exit;
+    /* draw lower diagrem */
+    fig_base = diag_param[1].fig_base;
+    fig_width = diag_param[1].fig_width;
+    bar_height = diag_param[1].bar_height;
+    printf("6 %d 4860 %d %d\n", fig_base - 50, fig_base + fig_width + 50 -205,
+	   (bar_height * CPU_NUM) + 100 + 5165);
+    ret = draw_diagram(1, mode, color_table, 4860);
     printf("-6\n");
+    if (ret != 0)
+	goto err_exit;
+    /* draw some lines */
+    printf("2 1 1 1 0 7 50 -1 -1 4.000 0 0 -1 0 0 2\n");
+    printf("\t%d %d %d %d\n", fig_base, 4250, fig_base, 4860);
+    printf("2 1 1 1 0 7 50 -1 -1 4.000 0 0 -1 0 0 2\n");
+    printf("\t%d %d %d %d\n", fig_base + 750, 4250, 8200, 4860);
+    printf("2 1 0 1 0 7 50 -1 -1 4.000 0 0 -1 0 0 2\n");
+    printf("\t%d %d %d %d\n", 3900, 4725, 3900, 9270);
+
     return 0;

 err_exit:
-- 
1.9.1


