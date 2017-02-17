Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to; bh=z4cqhoAxfy3+84sM1tH602UeEhWtFJ5nVu0uWDh9UyU=;
 b=PtnYB6nLgrw8Q1KsPdG157Xalpq0AS49DIySG6SPgqhkDSL7vfdVX9qepzdzjaxO5I
 hWqQSeeI9t/Aom3osMppBJTJIJKhFHBnfbsEJ//MuA9G80HbTyfIa7SWwHEn/DXb229t
 rgjkecRH5CvpTjaIQa3U9lXgfkA+dh/Fl5zkdAOgdvxctc7xyi3YMsvKDVFmjvj/iqz5
 LPU53GnETEh/XTD8YtKBD8jG8g1jEBp3vmL7vrKVZULs8yucPr8ODSdAyqM7PwrwVsa5
 9tMSVLau/lH/THHWCOz8SXG5BVm0NCWxJxFscovVcSStJ5Cw+0QPK/DBmpIH2CIfsGW+ LzRA==
Subject: Re: build fail on ubuntu 16.04 LTS
References: <b8c743ec-4415-86d3-a580-def8b4051a5d@gmail.com>
 <6e48f846-88fb-631f-05ba-6d72fcb63ca6@gmail.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Message-ID: <20c285a2-4dd3-2902-42a8-c35836cbc5a2@gmail.com>
Date: Fri, 17 Feb 2017 23:40:13 +0800
MIME-Version: 1.0
In-Reply-To: <6e48f846-88fb-631f-05ba-6d72fcb63ca6@gmail.com>
Content-Type: multipart/mixed; boundary="------------6F62C0EFF8B48F960B76ADAD"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@linux.vnet.ibm.com, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

This is a multi-part message in MIME format.
--------------6F62C0EFF8B48F960B76ADAD
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On 2017年02月17日 23:13, Akira Yokosawa wrote:
> On 2017/02/17 22:45:04 +0800, Yubin Ruan wrote:
>> The build script fail with
>>
>>     pdflatex 1 for perfbook.pdf
>>     ----- Fatal latex error, see perfbook.log for details. -----
>>     Makefile:83: recipe for target 'perfbook.aux' failed
>>     make: *** [perfbook.aux] Error 1
>>
>> I have attached the `perfbook.log' file.
> 
> Hi Rubin,
> 
> The build failed because LaTeX style file "couriers.sty" is not found
> in your TeX Live environment. It is logged near the end of the log file.
> 
>> ! LaTeX Error: File `couriers.sty' not found.
> 
> Please refer to item 5 in FAQ-BUILD.txt for necessary packages on Ubuntu.
> It mentions Trusty, but the same packages will do on Xenial.
> 
>>
>> In addition, it keep complaining like
>>   "WARNING: Refer to utilities/mpostcheck.sh for texmf config fix."
>> What is going on?
> 
> Well, as the message says, instruction to plug the potential vulnerability
> in TeX configuration can be found in the header of utilities/mpostcheck.sh.
> 
> Hope this would help you.
> 
>                                Thanks, Akira
>>

I have install all the packages mentioned at item 5 of FAQ-BUILD.txt
But there are still build errors. I have attached the log file

--------------6F62C0EFF8B48F960B76ADAD
Content-Type: text/x-log;
 name="perfbook.log"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="perfbook.log"

This is pdfTeX, Version 3.14159265-2.6-1.40.16 (TeX Live 2015/Debian) (preloaded format=pdflatex 2017.2.17)  17 FEB 2017 23:35
entering extended mode
 restricted \write18 enabled.
 %&-line parsing enabled.
**perfbook
(./perfbook.tex
LaTeX2e <2016/02/01>
Babel <3.9q> and hyphenation patterns for 3 language(s) loaded.
(./book.cls
Document Class: book 2014/09/29 v1.4h-pem-ay Standard LaTeX document class
(/usr/share/texlive/texmf-dist/tex/latex/base/bk10.clo
File: bk10.clo 2014/09/29 v1.4h Standard LaTeX file (size option)
)
\c@part=\count79
\c@chapter=\count80
\c@section=\count81
\c@subsection=\count82
\c@subsubsection=\count83
\c@paragraph=\count84
\c@subparagraph=\count85
\c@figure=\count86
\c@table=\count87
\abovecaptionskip=\skip41
\belowcaptionskip=\skip42
\bibindent=\dimen102
)
(/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
Package: fontenc 2005/09/27 v1.99g Standard LaTeX package

(/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def
File: t1enc.def 2005/09/27 v1.99g Standard LaTeX file
LaTeX Font Info:    Redeclaring font encoding T1 on input line 48.
))
(/usr/share/texlive/texmf-dist/tex/latex/base/textcomp.sty
Package: textcomp 2005/09/27 v1.99g Standard LaTeX package
Package textcomp Info: Sub-encoding information:
(textcomp)               5 = only ISO-Adobe without \textcurrency
(textcomp)               4 = 5 + \texteuro
(textcomp)               3 = 4 + \textohm
(textcomp)               2 = 3 + \textestimated + \textcurrency
(textcomp)               1 = TS1 - \textcircled - \t
(textcomp)               0 = TS1 (full)
(textcomp)             Font families with sub-encoding setting implement
(textcomp)             only a restricted character set as indicated.
(textcomp)             Family '?' is the default used for unknown fonts.
(textcomp)             See the documentation for details.
Package textcomp Info: Setting ? sub-encoding to TS1/1 on input line 79.

(/usr/share/texlive/texmf-dist/tex/latex/base/ts1enc.def
File: ts1enc.def 2001/06/05 v3.0e (jk/car/fm) Standard LaTeX file
)
LaTeX Info: Redefining \oldstylenums on input line 334.
Package textcomp Info: Setting cmr sub-encoding to TS1/0 on input line 349.
Package textcomp Info: Setting cmss sub-encoding to TS1/0 on input line 350.
Package textcomp Info: Setting cmtt sub-encoding to TS1/0 on input line 351.
Package textcomp Info: Setting cmvtt sub-encoding to TS1/0 on input line 352.
Package textcomp Info: Setting cmbr sub-encoding to TS1/0 on input line 353.
Package textcomp Info: Setting cmtl sub-encoding to TS1/0 on input line 354.
Package textcomp Info: Setting ccr sub-encoding to TS1/0 on input line 355.
Package textcomp Info: Setting ptm sub-encoding to TS1/4 on input line 356.
Package textcomp Info: Setting pcr sub-encoding to TS1/4 on input line 357.
Package textcomp Info: Setting phv sub-encoding to TS1/4 on input line 358.
Package textcomp Info: Setting ppl sub-encoding to TS1/3 on input line 359.
Package textcomp Info: Setting pag sub-encoding to TS1/4 on input line 360.
Package textcomp Info: Setting pbk sub-encoding to TS1/4 on input line 361.
Package textcomp Info: Setting pnc sub-encoding to TS1/4 on input line 362.
Package textcomp Info: Setting pzc sub-encoding to TS1/4 on input line 363.
Package textcomp Info: Setting bch sub-encoding to TS1/4 on input line 364.
Package textcomp Info: Setting put sub-encoding to TS1/5 on input line 365.
Package textcomp Info: Setting uag sub-encoding to TS1/5 on input line 366.
Package textcomp Info: Setting ugq sub-encoding to TS1/5 on input line 367.
Package textcomp Info: Setting ul8 sub-encoding to TS1/4 on input line 368.
Package textcomp Info: Setting ul9 sub-encoding to TS1/4 on input line 369.
Package textcomp Info: Setting augie sub-encoding to TS1/5 on input line 370.
Package textcomp Info: Setting dayrom sub-encoding to TS1/3 on input line 371.
Package textcomp Info: Setting dayroms sub-encoding to TS1/3 on input line 372.

Package textcomp Info: Setting pxr sub-encoding to TS1/0 on input line 373.
Package textcomp Info: Setting pxss sub-encoding to TS1/0 on input line 374.
Package textcomp Info: Setting pxtt sub-encoding to TS1/0 on input line 375.
Package textcomp Info: Setting txr sub-encoding to TS1/0 on input line 376.
Package textcomp Info: Setting txss sub-encoding to TS1/0 on input line 377.
Package textcomp Info: Setting txtt sub-encoding to TS1/0 on input line 378.
Package textcomp Info: Setting lmr sub-encoding to TS1/0 on input line 379.
Package textcomp Info: Setting lmdh sub-encoding to TS1/0 on input line 380.
Package textcomp Info: Setting lmss sub-encoding to TS1/0 on input line 381.
Package textcomp Info: Setting lmssq sub-encoding to TS1/0 on input line 382.
Package textcomp Info: Setting lmvtt sub-encoding to TS1/0 on input line 383.
Package textcomp Info: Setting lmtt sub-encoding to TS1/0 on input line 384.
Package textcomp Info: Setting qhv sub-encoding to TS1/0 on input line 385.
Package textcomp Info: Setting qag sub-encoding to TS1/0 on input line 386.
Package textcomp Info: Setting qbk sub-encoding to TS1/0 on input line 387.
Package textcomp Info: Setting qcr sub-encoding to TS1/0 on input line 388.
Package textcomp Info: Setting qcs sub-encoding to TS1/0 on input line 389.
Package textcomp Info: Setting qpl sub-encoding to TS1/0 on input line 390.
Package textcomp Info: Setting qtm sub-encoding to TS1/0 on input line 391.
Package textcomp Info: Setting qzc sub-encoding to TS1/0 on input line 392.
Package textcomp Info: Setting qhvc sub-encoding to TS1/0 on input line 393.
Package textcomp Info: Setting futs sub-encoding to TS1/4 on input line 394.
Package textcomp Info: Setting futx sub-encoding to TS1/4 on input line 395.
Package textcomp Info: Setting futj sub-encoding to TS1/4 on input line 396.
Package textcomp Info: Setting hlh sub-encoding to TS1/3 on input line 397.
Package textcomp Info: Setting hls sub-encoding to TS1/3 on input line 398.
Package textcomp Info: Setting hlst sub-encoding to TS1/3 on input line 399.
Package textcomp Info: Setting hlct sub-encoding to TS1/5 on input line 400.
Package textcomp Info: Setting hlx sub-encoding to TS1/5 on input line 401.
Package textcomp Info: Setting hlce sub-encoding to TS1/5 on input line 402.
Package textcomp Info: Setting hlcn sub-encoding to TS1/5 on input line 403.
Package textcomp Info: Setting hlcw sub-encoding to TS1/5 on input line 404.
Package textcomp Info: Setting hlcf sub-encoding to TS1/5 on input line 405.
Package textcomp Info: Setting pplx sub-encoding to TS1/3 on input line 406.
Package textcomp Info: Setting pplj sub-encoding to TS1/3 on input line 407.
Package textcomp Info: Setting ptmx sub-encoding to TS1/4 on input line 408.
Package textcomp Info: Setting ptmj sub-encoding to TS1/4 on input line 409.
)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/mathptmx.sty
Package: mathptmx 2005/04/12 PSNFSS-v9.2a Times w/ Math, improved (SPQR, WaS) 
LaTeX Font Info:    Redeclaring symbol font `operators' on input line 28.
LaTeX Font Info:    Overwriting symbol font `operators' in version `normal'
(Font)                  OT1/cmr/m/n --> OT1/ztmcm/m/n on input line 28.
LaTeX Font Info:    Overwriting symbol font `operators' in version `bold'
(Font)                  OT1/cmr/bx/n --> OT1/ztmcm/m/n on input line 28.
LaTeX Font Info:    Redeclaring symbol font `letters' on input line 29.
LaTeX Font Info:    Overwriting symbol font `letters' in version `normal'
(Font)                  OML/cmm/m/it --> OML/ztmcm/m/it on input line 29.
LaTeX Font Info:    Overwriting symbol font `letters' in version `bold'
(Font)                  OML/cmm/b/it --> OML/ztmcm/m/it on input line 29.
LaTeX Font Info:    Redeclaring symbol font `symbols' on input line 30.
LaTeX Font Info:    Overwriting symbol font `symbols' in version `normal'
(Font)                  OMS/cmsy/m/n --> OMS/ztmcm/m/n on input line 30.
LaTeX Font Info:    Overwriting symbol font `symbols' in version `bold'
(Font)                  OMS/cmsy/b/n --> OMS/ztmcm/m/n on input line 30.
LaTeX Font Info:    Redeclaring symbol font `largesymbols' on input line 31.
LaTeX Font Info:    Overwriting symbol font `largesymbols' in version `normal'
(Font)                  OMX/cmex/m/n --> OMX/ztmcm/m/n on input line 31.
LaTeX Font Info:    Overwriting symbol font `largesymbols' in version `bold'
(Font)                  OMX/cmex/m/n --> OMX/ztmcm/m/n on input line 31.
\symbold=\mathgroup4
\symitalic=\mathgroup5
LaTeX Font Info:    Redeclaring math alphabet \mathbf on input line 34.
LaTeX Font Info:    Overwriting math alphabet `\mathbf' in version `normal'
(Font)                  OT1/cmr/bx/n --> OT1/ptm/bx/n on input line 34.
LaTeX Font Info:    Overwriting math alphabet `\mathbf' in version `bold'
(Font)                  OT1/cmr/bx/n --> OT1/ptm/bx/n on input line 34.
LaTeX Font Info:    Redeclaring math alphabet \mathit on input line 35.
LaTeX Font Info:    Overwriting math alphabet `\mathit' in version `normal'
(Font)                  OT1/cmr/m/it --> OT1/ptm/m/it on input line 35.
LaTeX Font Info:    Overwriting math alphabet `\mathit' in version `bold'
(Font)                  OT1/cmr/bx/it --> OT1/ptm/m/it on input line 35.
LaTeX Info: Redefining \hbar on input line 50.
)
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty
Package: helvet 2005/04/12 PSNFSS-v9.2a (WaS) 

(/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty
Package: keyval 2014/10/28 v1.15 key=value parser (DPC)
\KV@toks@=\toks14
))
(/usr/share/texlive/texmf-dist/tex/latex/courier-scaled/couriers.sty
Package: couriers 2004/07/10 Scaled Courier (HS) 
)
(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
Package: microtype 2013/05/23 v2.5a Micro-typographical refinements (RS)
\MT@toks=\toks15
\MT@count=\count88
LaTeX Info: Redefining \textls on input line 766.
\MT@outer@kern=\dimen103
LaTeX Info: Redefining \textmicrotypecontext on input line 1285.
\MT@listname@count=\count89

(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def
File: microtype-pdftex.def 2013/05/23 v2.5a Definitions specific to pdftex (RS)

LaTeX Info: Redefining \lsstyle on input line 915.
LaTeX Info: Redefining \lslig on input line 915.
\MT@outer@space=\skip43
)
Package microtype Info: Loading configuration file microtype.cfg.

(/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg
File: microtype.cfg 2013/05/23 v2.5a microtype main configuration file (RS)
))
(/usr/share/texlive/texmf-dist/tex/latex/etoolbox/etoolbox.sty
Package: etoolbox 2015/08/02 v2.2a e-TeX tools for LaTeX (JAW)
\etb@tempcnta=\count90
)
(/usr/share/texlive/texmf-dist/tex/latex/graphics/lscape.sty
Package: lscape 2000/10/22 v3.01 Landscape Pages (DPC)

(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
Package: graphics 2016/01/03 v1.0q Standard LaTeX Graphics (DPC,SPQR)

(/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty
Package: trig 2016/01/03 v1.10 sin cos tan (DPC)
)
(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg
File: graphics.cfg 2010/04/23 v1.9 graphics configuration of TeX Live
)
Package graphics Info: Driver file: pdftex.def on input line 95.

(/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
File: pdftex.def 2011/05/27 v0.06d Graphics/color for pdfTeX

(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty
Package: infwarerr 2010/04/08 v1.3 Providing info/warning/error messages (HO)
)
(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty
Package: ltxcmds 2011/11/09 v1.22 LaTeX kernel commands for general use (HO)
)
\Gread@gobject=\count91
)))
(/usr/share/texlive/texmf-dist/tex/latex/graphics/epsfig.sty
Package: epsfig 1999/02/16 v1.7a (e)psfig emulation (SPQR)

(/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
Package: graphicx 2014/10/28 v1.0g Enhanced LaTeX Graphics (DPC,SPQR)
\Gin@req@height=\dimen104
\Gin@req@width=\dimen105
)
\epsfxsize=\dimen106
\epsfysize=\dimen107
)
(/usr/share/texlive/texmf-dist/tex/latex/subfigure/subfigure.sty
Package: subfigure 2002/03/15 v2.1.5 subfigure package
\subfigtopskip=\skip44
\subfigcapskip=\skip45
\subfigcaptopadj=\dimen108
\subfigbottomskip=\skip46
\subfigcapmargin=\dimen109
\subfiglabelskip=\skip47
\c@subfigure=\count92
\c@lofdepth=\count93
\c@subtable=\count94
\c@lotdepth=\count95

****************************************
* Local config file subfigure.cfg used *
****************************************
(/usr/share/texlive/texmf-dist/tex/latex/subfigure/subfigure.cfg)
\subfig@top=\skip48
\subfig@bottom=\skip49
)
(/usr/share/texlive/texmf-dist/tex/latex/rotating/rotating.sty
Package: rotating 2009/03/28 v2.16a rotated objects in LaTeX

(/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty
Package: ifthen 2014/09/29 v1.1c Standard LaTeX ifthen package (DPC)
)
\c@r@tfl@t=\count96
\rotFPtop=\skip50
\rotFPbot=\skip51
\rot@float@box=\box26
\rot@mess@toks=\toks16
)
(/usr/share/texlive/texmf-dist/tex/latex/tools/enumerate.sty
Package: enumerate 2015/07/23 v3.00 enumerate extensions (DPC)
\@enLab=\toks17
)
(/usr/share/texlive/texmf-dist/tex/latex/xcolor/xcolor.sty
Package: xcolor 2007/01/21 v2.11 LaTeX color extensions (UK)

(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/color.cfg
File: color.cfg 2007/01/18 v1.5 color configuration of teTeX/TeXLive
)
Package xcolor Info: Driver file: pdftex.def on input line 225.
Package xcolor Info: Model `cmy' substituted by `cmy0' on input line 1337.
Package xcolor Info: Model `hsb' substituted by `rgb' on input line 1341.
Package xcolor Info: Model `RGB' extended on input line 1353.
Package xcolor Info: Model `HTML' substituted by `rgb' on input line 1355.
Package xcolor Info: Model `Hsb' substituted by `hsb' on input line 1356.
Package xcolor Info: Model `tHsb' substituted by `hsb' on input line 1357.
Package xcolor Info: Model `HSB' substituted by `hsb' on input line 1358.
Package xcolor Info: Model `Gray' substituted by `gray' on input line 1359.
Package xcolor Info: Model `wave' substituted by `hsb' on input line 1360.
)
(/usr/share/texlive/texmf-dist/tex/latex/ncctools/extdash.sty
Package: extdash 2005/01/29 v1.2 Extended Dash Package (NCC)
)
(/usr/share/texlive/texmf-dist/tex/latex/changepage/changepage.sty
Package: changepage 2009/10/20 v1.0c check page and change page layout
\c@cp@cntr=\count97
\cp@tempcnt=\count98
)
(/usr/share/texlive/texmf-dist/tex/latex/listings/listings.sty
\lst@mode=\count99
\lst@gtempboxa=\box27
\lst@token=\toks18
\lst@length=\count100
\lst@currlwidth=\dimen110
\lst@column=\count101
\lst@pos=\count102
\lst@lostspace=\dimen111
\lst@width=\dimen112
\lst@newlines=\count103
\lst@lineno=\count104
\lst@maxwidth=\dimen113

(/usr/share/texlive/texmf-dist/tex/latex/listings/lstmisc.sty
File: lstmisc.sty 2015/06/04 1.6 (Carsten Heinz)
\c@lstnumber=\count105
\lst@skipnumbers=\count106
\lst@framebox=\box28
)
(/usr/share/texlive/texmf-dist/tex/latex/listings/listings.cfg
File: listings.cfg 2015/06/04 1.6 listings configuration
))
Package: listings 2015/06/04 1.6 (Carsten Heinz)

(/usr/share/texlive/texmf-dist/tex/latex/psnfss/pifont.sty
Package: pifont 2005/04/12 PSNFSS-v9.2a Pi font support (SPQR) 
LaTeX Font Info:    Try loading font information for U+pzd on input line 63.

(/usr/share/texlive/texmf-dist/tex/latex/psnfss/upzd.fd
File: upzd.fd 2001/06/04 font definitions for U/pzd.
)
LaTeX Font Info:    Try loading font information for U+psy on input line 64.

(/usr/share/texlive/texmf-dist/tex/latex/psnfss/upsy.fd
File: upsy.fd 2001/06/04 font definitions for U/psy.
))
(/usr/share/texlive/texmf-dist/tex/latex/verbatimbox/verbatimbox.sty
Package: verbatimbox 2014/03/12 v3.13 Routines for placing verbatim text into b
oxes, useful in places where the verbatim environment is inaccessible. Secondar
ily, for adding vertical buffer around an object.

(/usr/share/texlive/texmf-dist/tex/latex/tools/verbatim.sty
Package: verbatim 2014/10/28 v1.5q LaTeX2e package for verbatim enhancements
\every@verbatim=\toks19
\verbatim@line=\toks20
\verbatim@in@stream=\read1
)
(/usr/share/texlive/texmf-dist/tex/latex/readarray/readarray.sty
Package: readarray 2013/05/09 v1.2 Routines for inputting array data and recall
ing it on an element-by-element basis. Currently supports 2-D and 3-D array

(/usr/share/texlive/texmf-dist/tex/latex/ifnextok/ifnextok.sty
Package: ifnextok 2011/06/27 v0.3 test next token (UL)
)
\c@@index=\count107
\c@@plane=\count108
\c@@row=\count109
\c@@col=\count110
\c@use@args=\count111
\c@@record=\count112
\c@arg@index=\count113
\c@break@count=\count114
)
\savedverbbox=\box29
\c@VerbboxLineNo=\count115
\boxtopsep=\dimen114
\boxbottomsep=\dimen115
\ps@tempdima=\dimen116
\ps@tempboxa=\box30
\boxtop@sep=\skip52
\boxbottom@sep=\skip53
)
(/usr/share/texlive/texmf-dist/tex/latex/footmisc/footmisc.sty
Package: footmisc 2011/06/06 v5.5b a miscellany of footnote facilities
\FN@temptoken=\toks21
\footnotemargin=\dimen117
\c@pp@next@reset=\count116
Package footmisc Info: Declaring symbol style bringhurst on input line 855.
Package footmisc Info: Declaring symbol style chicago on input line 863.
Package footmisc Info: Declaring symbol style wiley on input line 872.
Package footmisc Info: Declaring symbol style lamport-robust on input line 883.

Package footmisc Info: Declaring symbol style lamport* on input line 903.
Package footmisc Info: Declaring symbol style lamport*-robust on input line 924
.
)
(/usr/share/texlive/texmf-dist/tex/latex/tabulary/tabulary.sty
Package: tabulary 2014/06/11 v0.10 tabulary package (DPC)

(/usr/share/texlive/texmf-dist/tex/latex/tools/array.sty
Package: array 2014/10/28 v2.4c Tabular extension package (FMi)
\col@sep=\dimen118
\extrarowheight=\dimen119
\NC@list=\toks22
\extratabsurround=\skip54
\backup@length=\skip55
)
\TY@count=\count117
\TY@linewidth=\dimen120
\tymin=\dimen121
\tymax=\dimen122
\TY@tablewidth=\dimen123
)
(/usr/share/texlive/texmf-dist/tex/latex/url/url.sty
\Urlmuskip=\muskip10
Package: url 2013/09/16  ver 3.4  Verb mode for urls, etc.
)
(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
Package: hyperref 2012/11/06 v6.83m Hypertext links for LaTeX

(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
Package: hobsub-hyperref 2012/05/28 v1.13 Bundle oberdiek, subset hyperref (HO)


(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty
Package: hobsub-generic 2012/05/28 v1.13 Bundle oberdiek, subset generic (HO)
Package: hobsub 2012/05/28 v1.13 Construct package bundles (HO)
Package hobsub Info: Skipping package `infwarerr' (already loaded).
Package hobsub Info: Skipping package `ltxcmds' (already loaded).
Package: ifluatex 2010/03/01 v1.3 Provides the ifluatex switch (HO)
Package ifluatex Info: LuaTeX not detected.
Package: ifvtex 2010/03/01 v1.5 Detect VTeX and its facilities (HO)
Package ifvtex Info: VTeX not detected.
Package: intcalc 2007/09/27 v1.1 Expandable calculations with integers (HO)
Package: ifpdf 2011/01/30 v2.3 Provides the ifpdf switch (HO)
Package ifpdf Info: pdfTeX in PDF mode is detected.
Package: etexcmds 2011/02/16 v1.5 Avoid name clashes with e-TeX commands (HO)
Package etexcmds Info: Could not find \expanded.
(etexcmds)             That can mean that you are not using pdfTeX 1.50 or
(etexcmds)             that some package has redefined \expanded.
(etexcmds)             In the latter case, load this package earlier.
Package: kvsetkeys 2012/04/25 v1.16 Key value parser (HO)
Package: kvdefinekeys 2011/04/07 v1.3 Define keys (HO)
Package: pdftexcmds 2011/11/29 v0.20 Utility functions of pdfTeX for LuaTeX (HO
)
Package pdftexcmds Info: LuaTeX not detected.
Package pdftexcmds Info: \pdf@primitive is available.
Package pdftexcmds Info: \pdf@ifprimitive is available.
Package pdftexcmds Info: \pdfdraftmode found.
Package: pdfescape 2011/11/25 v1.13 Implements pdfTeX's escape features (HO)
Package: bigintcalc 2012/04/08 v1.3 Expandable calculations on big integers (HO
)
Package: bitset 2011/01/30 v1.1 Handle bit-vector datatype (HO)
Package: uniquecounter 2011/01/30 v1.2 Provide unlimited unique counter (HO)
)
Package hobsub Info: Skipping package `hobsub' (already loaded).
Package: letltxmacro 2010/09/02 v1.4 Let assignment for LaTeX macros (HO)
Package: hopatch 2012/05/28 v1.2 Wrapper for package hooks (HO)
Package: xcolor-patch 2011/01/30 xcolor patch
Package: atveryend 2011/06/30 v1.8 Hooks at the very end of document (HO)
Package: atbegshi 2011/10/05 v1.16 At begin shipout hook (HO)
Package: refcount 2011/10/16 v3.4 Data extraction from label references (HO)
Package: hycolor 2011/01/30 v1.7 Color options for hyperref/bookmark (HO)
)
(/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty
Package: ifxetex 2010/09/12 v0.6 Provides ifxetex conditional
)
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty
Package: auxhook 2011/03/04 v1.3 Hooks for auxiliary files (HO)
)
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
Package: kvoptions 2011/06/30 v3.11 Key value format for package options (HO)
)
\@linkdim=\dimen124
\Hy@linkcounter=\count118
\Hy@pagecounter=\count119

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def
File: pd1enc.def 2012/11/06 v6.83m Hyperref: PDFDocEncoding definition (HO)
)
\Hy@SavedSpaceFactor=\count120

(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg
File: hyperref.cfg 2002/06/06 v1.2 hyperref configuration of TeXLive
)
Package hyperref Info: Option `bookmarks' set `true' on input line 4319.
Package hyperref Info: Option `bookmarksnumbered' set `true' on input line 4319
.
Package hyperref Info: Hyper figures OFF on input line 4443.
Package hyperref Info: Link nesting OFF on input line 4448.
Package hyperref Info: Hyper index ON on input line 4451.
Package hyperref Info: Plain pages OFF on input line 4458.
Package hyperref Info: Backreferencing OFF on input line 4463.
Package hyperref Info: Implicit mode ON; LaTeX internals redefined.
Package hyperref Info: Bookmarks ON on input line 4688.
\c@Hy@tempcnt=\count121
LaTeX Info: Redefining \url on input line 5041.
\XeTeXLinkMargin=\dimen125
\Fld@menulength=\count122
\Field@Width=\dimen126
\Fld@charsize=\dimen127
Package hyperref Info: Hyper figures OFF on input line 6295.
Package hyperref Info: Link nesting OFF on input line 6300.
Package hyperref Info: Hyper index ON on input line 6303.
Package hyperref Info: backreferencing OFF on input line 6310.
Package hyperref Info: Link coloring OFF on input line 6315.
Package hyperref Info: Link coloring with OCG OFF on input line 6320.
Package hyperref Info: PDF/A mode OFF on input line 6325.
LaTeX Info: Redefining \ref on input line 6365.
LaTeX Info: Redefining \pageref on input line 6369.
\Hy@abspage=\count123
\c@Item=\count124
\c@Hfootnote=\count125
)

Package hyperref Message: Driver (autodetected): hpdftex.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
File: hpdftex.def 2012/11/06 v6.83m Hyperref driver for pdfTeX
\Fld@listcount=\count126
\c@bookmark@seq@number=\count127

(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty
Package: rerunfilecheck 2011/04/15 v1.7 Rerun checks for auxiliary files (HO)
Package uniquecounter Info: New unique counter `rerunfilecheck' on input line 2
82.
)
\Hy@SectionHShift=\skip56
)
(/usr/share/texlive/texmf-dist/tex/latex/footnotebackref/footnotebackref.sty
Package: footnotebackref 2012/07/01 v1.0 Backreferences for footnotes (Holger L
ange)
\c@BackrefHyperFootnoteCounter=\count128
)
(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/hypcap.sty
Package: hypcap 2011/02/16 v1.11 Adjusting the anchors of captions (HO)
)
(/usr/share/texlive/texmf-dist/tex/latex/epigraph/epigraph.sty
Package: epigraph 2009/09/02 v1.5c typesetting epigraphs
\beforeepigraphskip=\skip57
\afterepigraphskip=\skip58
\epigraphwidth=\skip59
\epigraphrule=\skip60
)
(/usr/share/texlive/texmf-dist/tex/latex/ellipsis/ellipsis.sty
Package: ellipsis 2004/9/28 v1.6 ellipsis: fixes spacing around \protect \globa
l \let \T1\textellipsis .\kern \fontdimen 3\font .\kern \fontdimen 3\font .\ker
n \fontdimen 3\font \T1\textellipsis 

(/usr/share/texlive/texmf-dist/tex/latex/tools/xspace.sty
Package: xspace 2014/10/28 v1.13 Space after command names (DPC,MH)
)) (./qqz.sty
\c@quickquizctr=\count129
\c@quickquizctrE=\count130
\c@quickquizctrC=\count131
)
(./origpub.sty) (./perfbook.aux (./appendix/questions/questions.aux)
(./appendix/whymb/whymemorybarriers.aux) (./appendix/ack/ack.aux))
\openout1 = `perfbook.aux'.

LaTeX Font Info:    Checking defaults for OML/cmm/m/it on input line 76.
LaTeX Font Info:    ... okay on input line 76.
LaTeX Font Info:    Checking defaults for T1/cmr/m/n on input line 76.
LaTeX Font Info:    ... okay on input line 76.
LaTeX Font Info:    Checking defaults for OT1/cmr/m/n on input line 76.
LaTeX Font Info:    ... okay on input line 76.
LaTeX Font Info:    Checking defaults for OMS/cmsy/m/n on input line 76.
LaTeX Font Info:    ... okay on input line 76.
LaTeX Font Info:    Checking defaults for OMX/cmex/m/n on input line 76.
LaTeX Font Info:    ... okay on input line 76.
LaTeX Font Info:    Checking defaults for U/cmr/m/n on input line 76.
LaTeX Font Info:    ... okay on input line 76.
LaTeX Font Info:    Checking defaults for TS1/cmr/m/n on input line 76.
LaTeX Font Info:    Try loading font information for TS1+cmr on input line 76.

(/usr/share/texlive/texmf-dist/tex/latex/base/ts1cmr.fd
File: ts1cmr.fd 2014/09/29 v2.5h Standard LaTeX font definitions
)
LaTeX Font Info:    ... okay on input line 76.
LaTeX Font Info:    Checking defaults for PD1/pdf/m/n on input line 76.
LaTeX Font Info:    ... okay on input line 76.
LaTeX Font Info:    Try loading font information for T1+ptm on input line 76.

(/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1ptm.fd
File: t1ptm.fd 2001/06/04 font definitions for T1/ptm.
)
\big@size=\dimen128
LaTeX Info: Redefining \microtypecontext on input line 76.
Package microtype Info: Generating PDF output.
Package microtype Info: Character protrusion enabled (level 2).
Package microtype Info: Using default protrusion set `alltext'.
Package microtype Info: Automatic font expansion enabled (level 2),
(microtype)             stretch: 20, shrink: 20, step: 1, non-selected.
Package microtype Info: Using default expansion set `basictext'.
Package microtype Info: No adjustment of tracking.
Package microtype Info: No adjustment of interword spacing.
Package microtype Info: No adjustment of character kerning.

(/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-ptm.cfg
File: mt-ptm.cfg 2006/04/20 v1.7 microtype config. file: Times (RS)
)
(/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
[Loading MPS to PDF converter (version 2006.09.02).]
\scratchcounter=\count132
\scratchdimen=\dimen129
\scratchbox=\box31
\nofMPsegments=\count133
\nofMParguments=\count134
\everyMPshowfont=\toks23
\MPscratchCnt=\count135
\MPscratchDim=\dimen130
\MPnumerator=\count136
\makeMPintoPDFobject=\count137
\everyMPtoPDFconversion=\toks24
) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
Package: epstopdf-base 2010/02/09 v2.5 Base part for package epstopdf

(/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty
Package: grfext 2010/08/19 v1.1 Manage graphics extensions (HO)
)
Package grfext Info: Graphics extension search list:
(grfext)             [.png,.pdf,.jpg,.mps,.jpeg,.jbig2,.jb2,.PNG,.PDF,.JPG,.JPE
G,.JBIG2,.JB2,.eps]
(grfext)             \AppendGraphicsExtensions on input line 452.

(/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg
File: epstopdf-sys.cfg 2010/07/13 v1.3 Configuration of (r)epstopdf for TeX Liv
e
))
\c@lstlisting=\count138
\AtBeginShipoutBox=\box32
Package hyperref Info: Link coloring OFF on input line 76.

(/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
Package: nameref 2012/10/27 v2.43 Cross-referencing by name of section

(/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty
Package: gettitlestring 2010/12/03 v1.4 Cleanup title references (HO)
)
\c@section@level=\count139
)
LaTeX Info: Redefining \ref on input line 76.
LaTeX Info: Redefining \pageref on input line 76.
LaTeX Info: Redefining \nameref on input line 76.

(./perfbook.out) (./perfbook.out)
\@outlinefile=\write3
\openout3 = `perfbook.out'.

LaTeX Info: Redefining \dots on input line 76.
 (./ushyphex.tex) (./pfhyphex.tex)
(./autodate.tex)
LaTeX Font Info:    Try loading font information for OT1+ztmcm on input line 15
8.
 (/usr/share/texlive/texmf-dist/tex/latex/psnfss/ot1ztmcm.fd
File: ot1ztmcm.fd 2000/01/03 Fontinst v1.801 font definitions for OT1/ztmcm.
)
Package microtype Info: Loading generic settings for font family
(microtype)             `ztmcm' (encoding: OT1).
(microtype)             For optimal results, create family-specific settings.
(microtype)             See the microtype manual for details.
LaTeX Font Info:    Try loading font information for OML+ztmcm on input line 15
8.

(/usr/share/texlive/texmf-dist/tex/latex/psnfss/omlztmcm.fd
File: omlztmcm.fd 2000/01/03 Fontinst v1.801 font definitions for OML/ztmcm.
)
LaTeX Font Info:    Try loading font information for OMS+ztmcm on input line 15
8.

(/usr/share/texlive/texmf-dist/tex/latex/psnfss/omsztmcm.fd
File: omsztmcm.fd 2000/01/03 Fontinst v1.801 font definitions for OMS/ztmcm.
)
LaTeX Font Info:    Try loading font information for OMX+ztmcm on input line 15
8.

(/usr/share/texlive/texmf-dist/tex/latex/psnfss/omxztmcm.fd
File: omxztmcm.fd 2000/01/03 Fontinst v1.801 font definitions for OMX/ztmcm.
)
LaTeX Font Info:    Try loading font information for OT1+ptm on input line 158.


(/usr/share/texlive/texmf-dist/tex/latex/psnfss/ot1ptm.fd
File: ot1ptm.fd 2001/06/04 font definitions for OT1/ptm.
)
LaTeX Font Info:    Font shape `OT1/ptm/bx/n' in size <12> not available
(Font)              Font shape `OT1/ptm/b/n' tried instead on input line 158.
LaTeX Font Info:    Font shape `OT1/ptm/bx/n' in size <9> not available
(Font)              Font shape `OT1/ptm/b/n' tried instead on input line 158.
LaTeX Font Info:    Font shape `OT1/ptm/bx/n' in size <7> not available
(Font)              Font shape `OT1/ptm/b/n' tried instead on input line 158.
 [1




{;5/var/lib/texmf/fonts/map/pdftex/updmap/pdftex.map}] (./legal.tex
LaTeX Font Info:    Font shape `T1/ptm/bx/n' in size <14.4> not available
(Font)              Font shape `T1/ptm/b/n' tried instead on input line 4.

Underfull \hbox (badness 10000) in paragraph at lines 6--10

 []

LaTeX Font Info:    Try loading font information for TS1+ptm on input line 11.
(/usr/share/texlive/texmf-dist/tex/latex/psnfss/ts1ptm.fd
File: ts1ptm.fd 2001/06/04 font definitions for TS1/ptm.
)
LaTeX Font Info:    Font shape `OT1/ptm/bx/n' in size <10> not available
(Font)              Font shape `OT1/ptm/b/n' tried instead on input line 24.
LaTeX Font Info:    Font shape `OT1/ptm/bx/n' in size <7.4> not available
(Font)              Font shape `OT1/ptm/b/n' tried instead on input line 24.
LaTeX Font Info:    Font shape `OT1/ptm/bx/n' in size <6> not available
(Font)              Font shape `OT1/ptm/b/n' tried instead on input line 24.
LaTeX Font Info:    Font shape `OT1/ptm/bx/n' in size <8> not available
(Font)              Font shape `OT1/ptm/b/n' tried instead on input line 24.
LaTeX Font Info:    Font shape `OT1/ptm/bx/n' in size <5> not available
(Font)              Font shape `OT1/ptm/b/n' tried instead on input line 24.
LaTeX Font Info:    Try loading font information for T1+pcrs on input line 24.
G
(/usr/share/texlive/texmf-dist/tex/latex/courier-scaled/t1pcrs.fd
File: t1pcrs.fd 2004/07/09 scalable font definitions for T1/pcrs.
)
LaTeX Font Info:    Font shape `T1/pcrs/m/n' will be
(Font)              scaled to size 7.52002pt on input line 24.
Package microtype Info: Loading generic settings for font family
(microtype)             `pcrs' (encoding: T1).
(microtype)             For optimal results, create family-specific settings.
(microtype)             See the microtype manual for details.
) [2


]
LaTeX Font Info:    Font shape `T1/ptm/bx/n' in size <24.88> not available
(Font)              Font shape `T1/ptm/b/n' tried instead on input line 163.

(./perfbook.toc)
\tf@toc=\write4
\openout4 = `perfbook.toc'.

 [3

] [4


] (./howto/howto.tex
Chapter 1.
LaTeX Font Info:    Font shape `T1/ptm/bx/n' in size <20.74> not available
(Font)              Font shape `T1/ptm/b/n' tried instead on input line 3.
LaTeX Font Info:    Font shape `T1/ptm/bx/n' in size <10> not available
(Font)              Font shape `T1/ptm/b/n' tried instead on input line 70.

LaTeX Warning: Citation `Dijkstra:1968:LEG:362929.362947' on page 1 undefined o
n input line 70.


LaTeX Warning: Citation `PaulEMcKenney2012HOTPARsuboptimal' on page 1 undefined
 on input line 72.


Underfull \vbox (badness 1259) has occurred while \output is active []

 [1

]

LaTeX Warning: Hyper reference `QQA.1.1' on page 2 undefined on input line 139.



LaTeX Warning: Hyper reference `QQA.1.1' on page 2 undefined on input line 146.



LaTeX Warning: Hyper reference `QQA.1.2' on page 2 undefined on input line 148.



LaTeX Warning: Hyper reference `QQA.1.2' on page 2 undefined on input line 172.



LaTeX Warning: Hyper reference `QQA.1.3' on page 2 undefined on input line 174.



LaTeX Warning: Hyper reference `QQA.1.3' on page 2 undefined on input line 218.



LaTeX Warning: Citation `HerlihyShavit2008Textbook' on page 2 undefined on inpu
t line 260.


LaTeX Warning: Citation `MichaelScott2013Textbook' on page 2 undefined on input
 line 267.


LaTeX Warning: Citation `MichaelScott2006Textbook' on page 2 undefined on input
 line 275.


LaTeX Warning: Citation `SchmidtStalRohnertBuschmann2000v2Textbook' on page 2 u
ndefined on input line 281.


LaTeX Warning: Citation `BuschmannHenneySchmidt2007v4Textbook' on page 2 undefi
ned on input line 281.

[2]

LaTeX Warning: Citation `CorbetRubiniKroahHartman' on page 3 undefined on input
 line 291.

LaTeX Font Info:    Font shape `T1/pcrs/m/n' will be
(Font)              scaled to size 9.40002pt on input line 293.

LaTeX Warning: Citation `Mattson2005Textbook' on page 3 undefined on input line
 299.


LaTeX Warning: Citation `NormMatloff2013ParProcBook' on page 3 undefined on inp
ut line 306.


LaTeX Warning: Citation `AMD2017OpenCL' on page 3 undefined on input line 308.


LaTeX Warning: Citation `NVidia2017GPGPU' on page 3 undefined on input line 308
.


LaTeX Warning: Citation `NVidia2017GPGPU-university' on page 3 undefined on inp
ut line 308.


LaTeX Warning: Citation `Butenhof1997pthreads' on page 3 undefined on input lin
e 310.


LaTeX Warning: Citation `WRichardStevens1992' on page 3 undefined on input line
 312.


LaTeX Warning: Citation `StewartWeiss2013UNIX' on page 3 undefined on input lin
e 314.


LaTeX Warning: Citation `AnthonyWilliams2012' on page 3 undefined on input line
 319.


LaTeX Warning: Citation `HerbSutter2008EffectiveConcurrency' on page 3 undefine
d on input line 323.


LaTeX Warning: Citation `Reinders2007Textbook' on page 3 undefined on input lin
e 327.


LaTeX Warning: Citation `Schimmel:1994:USM:175689' on page 3 undefined on input
 line 333.


LaTeX Warning: Citation `DougLea1997Textbook' on page 3 undefined on input line
 335.


LaTeX Warning: Citation `Goetz2007Textbook' on page 3 undefined on input line 3
35.

LaTeX Font Info:    Font shape `T1/pcrs/m/n' will be
(Font)              scaled to size 6.58002pt on input line 351.

Underfull \hbox (badness 3428) in paragraph at lines 408--416
[]\T1/ptm/m/n/10 (+20) To cre-ate patches or [][][][][][] re-quests, you
 []


Underfull \hbox (badness 3482) in paragraph at lines 408--416
\T1/ptm/m/n/10 (+20) will need the L[]T[]X source to the book, which
 []


Underfull \hbox (badness 4156) in paragraph at lines 408--416
\T1/ptm/m/n/10 (+20) is at []$\T1/pcrs/m/n/10 git : / / git . kernel . org / pu
b / scm / linux /
 []

[3]
Underfull \hbox (badness 10000) in paragraph at lines 432--436
\T1/pcrs/m/n/10 / / kernel . org / pub / linux / kernel / people /
 []


Underfull \hbox (badness 10000) in paragraph at lines 450--452
[]\T1/ptm/m/n/10 (+20) Please see []$\T1/pcrs/m/n/10 http : / / lkml . org / lk
ml / 2007 /
 []


Underfull \hbox (badness 10000) in paragraph at lines 450--452
\T1/pcrs/m/n/10 1 / 15 / 219$[] \T1/ptm/m/n/10 (+20) for an ex-am-ple patch con
-tain-ing a
 []

) (./intro/intro.tex [4] [5

] [6

]
Chapter 2.

LaTeX Warning: Citation `DouglasEngelbart1968' on page 7 undefined on input lin
e 40.


LaTeX Warning: Citation `ScottGriffen2000' on page 7 undefined on input line 42
.


Underfull \vbox (badness 5832) has occurred while \output is active []



LaTeX Warning: Citation `Olukotun96' on page 7 undefined on input line 78.

[7]

LaTeX Warning: Citation `Torvalds2.6kernel' on page 8 undefined on input line 1
05.


LaTeX Warning: Citation `PostgreSQL2008' on page 8 undefined on input line 106.



LaTeX Warning: Citation `MySQL2008' on page 8 undefined on input line 106.


LaTeX Warning: Citation `OpenMPI2008' on page 8 undefined on input line 107.


LaTeX Warning: Citation `BOINC2008' on page 8 undefined on input line 107.


LaTeX Warning: Citation `BryanGardiner2007' on page 8 undefined on input line 1
24.


LaTeX Warning: Citation `GordonMoore03a' on page 8 undefined on input line 124.



LaTeX Warning: Hyper reference `QQA.2.1' on page 8 undefined on input line 132.



LaTeX Warning: Hyper reference `QQA.2.1' on page 8 undefined on input line 190.



LaTeX Warning: Hyper reference `QQA.2.2' on page 8 undefined on input line 196.



LaTeX Warning: Hyper reference `QQA.2.2' on page 8 undefined on input line 223.



LaTeX Warning: Hyper reference `QQA.2.3' on page 8 undefined on input line 250.



LaTeX Warning: Hyper reference `QQA.2.3' on page 8 undefined on input line 258.



LaTeX Warning: Hyper reference `QQA.2.4' on page 8 undefined on input line 260.



LaTeX Warning: Hyper reference `QQA.2.4' on page 8 undefined on input line 270.



LaTeX Warning: Hyper reference `QQA.2.5' on page 8 undefined on input line 272.



LaTeX Warning: Hyper reference `QQA.2.5' on page 8 undefined on input line 282.



LaTeX Warning: Hyper reference `QQA.2.6' on page 8 undefined on input line 284.



LaTeX Warning: Hyper reference `QQA.2.6' on page 8 undefined on input line 290.


LaTeX Font Info:    Font shape `T1/ptm/bx/n' in size <12> not available
(Font)              Font shape `T1/ptm/b/n' tried instead on input line 294.

LaTeX Warning: Hyper reference `QQA.2.7' on page 8 undefined on input line 303.



LaTeX Warning: Hyper reference `QQA.2.7' on page 8 undefined on input line 319.


[8] <SMPdesign/clockfreq.pdf, id=1480, 233.55858pt x 213.38315pt>
File: SMPdesign/clockfreq.pdf Graphic file (type pdf)

<use SMPdesign/clockfreq.pdf>
Package pdftex.def Info: SMPdesign/clockfreq.pdf used on input line 327.
(pdftex.def)             Requested size: 233.558pt x 213.38261pt.


LaTeX Warning: Citation `LinusTorvalds2001a' on page 9 undefined on input line 
361.


LaTeX Warning: Hyper reference `QQA.2.8' on page 9 undefined on input line 391.



LaTeX Warning: Hyper reference `QQA.2.8' on page 9 undefined on input line 410.



LaTeX Warning: Citation `CSIRACMuseumVictoria' on page 9 undefined on input lin
e 422.


LaTeX Warning: Citation `CSIRACUniversityMelbourne' on page 9 undefined on inpu
t line 422.


LaTeX Warning: Citation `z80Wikipedia' on page 9 undefined on input line 434.

[9 <./SMPdesign/clockfreq.pdf>]
<SMPdesign/mipsperbuck.pdf, id=1504, 233.55858pt x 207.37273pt>
File: SMPdesign/mipsperbuck.pdf Graphic file (type pdf)

<use SMPdesign/mipsperbuck.pdf>
Package pdftex.def Info: SMPdesign/mipsperbuck.pdf used on input line 443.
(pdftex.def)             Requested size: 233.558pt x 207.37221pt.


LaTeX Warning: Hyper reference `QQA.2.9' on page 10 undefined on input line 468
.


LaTeX Warning: Hyper reference `QQA.2.9' on page 10 undefined on input line 502
.


Underfull \vbox (badness 1147) has occurred while \output is active []



LaTeX Warning: Citation `OpenGroup1997pthreads' on page 10 undefined on input l
ine 528.


Underfull \hbox (badness 10000) in paragraph at lines 527--534
[]\T1/ptm/m/n/10 (+20) : This cat-e-gory,
 []


Underfull \hbox (badness 1383) in paragraph at lines 527--534
\T1/ptm/m/n/10 (+20) which in-cludes POSIX Threads (pthreads) [[]],
 []


LaTeX Warning: Citation `MPIForum2008' on page 10 undefined on input line 540.


LaTeX Warning: Citation `DIS9075SQL92' on page 10 undefined on input line 552.


LaTeX Warning: Citation `TPC' on page 10 undefined on input line 556.

[10 <./SMPdesign/mipsperbuck.pdf>]
<intro/PPGrelation.pdf, id=1521, 129.48978pt x 91.9736pt>
File: intro/PPGrelation.pdf Graphic file (type pdf)

<use intro/PPGrelation.pdf>
Package pdftex.def Info: intro/PPGrelation.pdf used on input line 565.
(pdftex.def)             Requested size: 129.48946pt x 91.97336pt.

<intro/Generality.pdf, id=1523, 227.75383pt x 176.55661pt>
File: intro/Generality.pdf Graphic file (type pdf)

<use intro/Generality.pdf>
Package pdftex.def Info: intro/Generality.pdf used on input line 595.
(pdftex.def)             Requested size: 227.75327pt x 176.55617pt.


LaTeX Warning: Hyper reference `QQA.2.10' on page 11 undefined on input line 61
5.


LaTeX Warning: Hyper reference `QQA.2.10' on page 11 undefined on input line 63
4.

[11 <./intro/PPGrelation.pdf> <./intro/Generality.pdf>]
Underfull \hbox (badness 4805) in paragraph at lines 665--665
[]\T1/ptm/b/n/14.4 Alternatives to Par-al-lel Pro-
 []


Underfull \hbox (badness 1062) in paragraph at lines 691--691
[]\T1/ptm/b/n/12 Multiple In-stances of a Se-quen-tial
 []


LaTeX Warning: Citation `Date82' on page 12 undefined on input line 722.


LaTeX Warning: Hyper reference `QQA.2.11' on page 12 undefined on input line 74
3.


LaTeX Warning: Hyper reference `QQA.2.11' on page 12 undefined on input line 75
3.

[12]

LaTeX Warning: Hyper reference `QQA.2.12' on page 13 undefined on input line 80
2.


LaTeX Warning: Hyper reference `QQA.2.12' on page 13 undefined on input line 82
6.


LaTeX Warning: Citation `RyanEccles2005HPCSNovice' on page 13 undefined on inpu
t line 861.


LaTeX Warning: Citation `RyanEccles2006HPCSNoviceNeeds' on page 13 undefined on
 input line 861.


LaTeX Warning: Citation `LorinHochstein2005SC' on page 13 undefined on input li
ne 861.


LaTeX Warning: Citation `DuaneSzafron1994PEMPDS' on page 13 undefined on input 
line 861.

<intro/FourTaskCategories.pdf, id=1553, 217.26154pt x 135.9549pt>
File: intro/FourTaskCategories.pdf Graphic file (type pdf)

<use intro/FourTaskCategories.pdf>
Package pdftex.def Info: intro/FourTaskCategories.pdf used on input line 876.
(pdftex.def)             Requested size: 217.26099pt x 135.95456pt.


LaTeX Warning: Citation `GeneAmdahl1967AmdahlsLaw' on page 13 undefined on inpu
t line 897.


Underfull \vbox (badness 10000) has occurred while \output is active []

 [13 <./intro/FourTaskCategories.pdf>]

LaTeX Warning: Hyper reference `QQA.2.13' on page 14 undefined on input line 92
3.


LaTeX Warning: Hyper reference `QQA.2.13' on page 14 undefined on input line 95
0.


LaTeX Warning: Citation `OpenGroup1997pthreads' on page 14 undefined on input l
ine 985.


LaTeX Warning: Citation `DIS9075SQL92' on page 14 undefined on input line 986.


LaTeX Warning: Citation `ElGhazawi2003UPC' on page 14 undefined on input line 9
88.


LaTeX Warning: Citation `MPIForum2008' on page 14 undefined on input line 990.


LaTeX Warning: Citation `McKenney2007PLOSTM' on page 14 undefined on input line
 1006.


Underfull \hbox (badness 1052) in paragraph at lines 1013--1013
[]\T1/ptm/b/n/12 Resource Par-ti-tion-ing and Repli-ca-
 []


LaTeX Warning: Citation `Beck85' on page 14 undefined on input line 1025.

[14] <intro/FourTaskOrder.pdf, id=1579, 217.26154pt x 135.9549pt>
File: intro/FourTaskOrder.pdf Graphic file (type pdf)

<use intro/FourTaskOrder.pdf>
Package pdftex.def Info: intro/FourTaskOrder.pdf used on input line 1063.
(pdftex.def)             Requested size: 217.26099pt x 135.95456pt.


LaTeX Warning: Citation `PanagiotisMetaxas1999PDCS' on page 15 undefined on inp
ut line 1084.


Underfull \hbox (badness 2582) in paragraph at lines 1086--1086
[]\T1/ptm/b/n/12 How Do Lan-guages and En-vi-ron-
 []


LaTeX Warning: Hyper reference `QQA.2.14' on page 15 undefined on input line 11
02.


LaTeX Warning: Hyper reference `QQA.2.14' on page 15 undefined on input line 11
68.


LaTeX Warning: Citation `SQNTParallel' on page 15 undefined on input line 1180.



LaTeX Warning: Citation `AndrewDBirrell1989Threads' on page 15 undefined on inp
ut line 1180.


LaTeX Warning: Citation `Beck85' on page 15 undefined on input line 1180.


LaTeX Warning: Citation `Inman85' on page 15 undefined on input line 1180.


LaTeX Warning: Citation `AndrewDBirrell1989Threads' on page 15 undefined on inp
ut line 1182.

[15 <./intro/FourTaskOrder.pdf>]) (./cpu/cpu.tex [16

]
Chapter 3.

LaTeX Warning: Citation `Hennessy2011' on page 17 undefined on input line 19.


LaTeX Warning: Citation `Hennessy95a' on page 17 undefined on input line 19.


LaTeX Warning: Hyper reference `QQA.3.1' on page 17 undefined on input line 21.



LaTeX Warning: Hyper reference `QQA.3.1' on page 17 undefined on input line 43.


(./cpu/overview.tex
<cartoons/r-2014-CPU-track-meet.pdf, id=1600, 470.71323pt x 390.22197pt>
File: cartoons/r-2014-CPU-track-meet.pdf Graphic file (type pdf)

<use cartoons/r-2014-CPU-track-meet.pdf>
Package pdftex.def Info: cartoons/r-2014-CPU-track-meet.pdf used on input line 
13.
(pdftex.def)             Requested size: 470.71208pt x 390.22101pt.

<cartoons/r-2014-Old-man-and-Brat.pdf, id=1602, 478.98454pt x 318.60663pt>
File: cartoons/r-2014-Old-man-and-Brat.pdf Graphic file (type pdf)

<use cartoons/r-2014-Old-man-and-Brat.pdf>
Package pdftex.def Info: cartoons/r-2014-Old-man-and-Brat.pdf used on input lin
e 31.
(pdftex.def)             Requested size: 478.98337pt x 318.60585pt.

<cartoons/r-2014-branch-error.pdf, id=1604, 421.29546pt x 361.68835pt>
File: cartoons/r-2014-branch-error.pdf Graphic file (type pdf)

<use cartoons/r-2014-branch-error.pdf>
Package pdftex.def Info: cartoons/r-2014-branch-error.pdf used on input line 55
.
(pdftex.def)             Requested size: 421.29442pt x 361.68747pt.
 [17

 <./cartoons/r-2014-CPU-track-meet.pdf>] <cartoons/r-2014-memory-reference.pdf,
 id=1624, 311.99965pt x 318.2517pt>
File: cartoons/r-2014-memory-reference.pdf Graphic file (type pdf)

<use cartoons/r-2014-memory-reference.pdf>
Package pdftex.def Info: cartoons/r-2014-memory-reference.pdf used on input lin
e 107.
(pdftex.def)             Requested size: 311.99889pt x 318.25092pt.
 [18 <./cartoons/r-2014-Old-man-and-Brat.pdf> <./cartoons/r-2014-branch-error.p
df

pdfTeX warning: pdflatex (file ./cartoons/r-2014-branch-error.pdf): PDF inclusi
on: multiple pdfs with page group included in a single page
> <./cartoons/r-2014-memory-reference.pdf

pdfTeX warning: pdflatex (file ./cartoons/r-2014-memory-reference.pdf): PDF inc
lusion: multiple pdfs with page group included in a single page
>] <cartoons/r-2014-Atomic-reference.pdf, id=1813, 352.8064pt x 253.83916pt>
File: cartoons/r-2014-Atomic-reference.pdf Graphic file (type pdf)

<use cartoons/r-2014-Atomic-reference.pdf>
Package pdftex.def Info: cartoons/r-2014-Atomic-reference.pdf used on input lin
e 153.
(pdftex.def)             Requested size: 352.80553pt x 253.83853pt.


LaTeX Warning: Hyper reference `QQA.3.2' on page 19 undefined on input line 174
.


LaTeX Warning: Hyper reference `QQA.3.2' on page 19 undefined on input line 195
.

LaTeX Font Info:    Font shape `T1/pcrs/m/n' will be
(Font)              scaled to size 8.46002pt on input line 209.

Overfull \hbox (10.00002pt too wide) in paragraph at lines 207--216
[][]
 []

<cartoons/r-2014-Memory-barrier.pdf, id=1817, 338.61507pt x 330.18358pt>
File: cartoons/r-2014-Memory-barrier.pdf Graphic file (type pdf)

<use cartoons/r-2014-Memory-barrier.pdf>
Package pdftex.def Info: cartoons/r-2014-Memory-barrier.pdf used on input line 
219.
(pdftex.def)             Requested size: 338.61423pt x 330.18277pt.

<cartoons/r-2014-CPU-track-meet-cache-miss-toll-booth.pdf, id=1819, 478.88432pt
 x 398.58098pt>
File: cartoons/r-2014-CPU-track-meet-cache-miss-toll-booth.pdf Graphic file (ty
pe pdf)
 <use cartoons/r-2014-CPU-track-meet-cache-miss-toll-booth.pdf>
Package pdftex.def Info: cartoons/r-2014-CPU-track-meet-cache-miss-toll-booth.p
df used on input line 243.
(pdftex.def)             Requested size: 478.88315pt x 398.58pt.

[19 <./cartoons/r-2014-Atomic-reference.pdf>]

LaTeX Warning: Hyper reference `QQA.3.3' on page 20 undefined on input line 263
.


LaTeX Warning: Hyper reference `QQA.3.3' on page 20 undefined on input line 274
.


<cartoons/r-2014-CPU-track-meet-phone-booth.pdf, id=1862, 541.42645pt x 438.285
32pt>
File: cartoons/r-2014-CPU-track-meet-phone-booth.pdf Graphic file (type pdf)
 <use cartoons/r-2014-CPU-track-meet-phone-booth.pdf>
Package pdftex.def Info: cartoons/r-2014-CPU-track-meet-phone-booth.pdf used on
 input line 281.
(pdftex.def)             Requested size: 541.42513pt x 438.28426pt.
)
(./cpu/overheads.tex [20 <./cartoons/r-2014-Memory-barrier.pdf> <./cartoons/r-2
014-CPU-track-meet-cache-miss-toll-booth.pdf

pdfTeX warning: pdflatex (file ./cartoons/r-2014-CPU-track-meet-cache-miss-toll
-booth.pdf): PDF inclusion: multiple pdfs with page group included in a single 
page
> <./cartoons/r-2014-CPU-track-meet-phone-booth.pdf

pdfTeX warning: pdflatex (file ./cartoons/r-2014-CPU-track-meet-phone-booth.pdf
): PDF inclusion: multiple pdfs with page group included in a single page
>] <cpu/SystemArch.pdf, id=1901, 217.26154pt x 185.96477pt>
File: cpu/SystemArch.pdf Graphic file (type pdf)

<use cpu/SystemArch.pdf>
Package pdftex.def Info: cpu/SystemArch.pdf used on input line 17.
(pdftex.def)             Requested size: 217.26099pt x 185.9643pt.


LaTeX Warning: Hyper reference `QQA.3.4' on page 21 undefined on input line 63.



LaTeX Warning: Hyper reference `QQA.3.4' on page 21 undefined on input line 93.



LaTeX Warning: Hyper reference `QQA.3.5' on page 21 undefined on input line 95.



LaTeX Warning: Hyper reference `QQA.3.5' on page 21 undefined on input line 104
.


LaTeX Warning: Citation `Hennessy95a' on page 21 undefined on input line 107.


LaTeX Warning: Citation `DavidECuller1999' on page 21 undefined on input line 1
07.


LaTeX Warning: Citation `MiloMKMartin2012scale' on page 21 undefined on input l
ine 107.


LaTeX Warning: Citation `DanielJSorin2011MemModel' on page 21 undefined on inpu
t line 107.

[21 <./cpu/SystemArch.pdf>]

LaTeX Warning: Hyper reference `QQA.3.6' on page 22 undefined on input line 182
.


LaTeX Warning: Hyper reference `QQA.3.6' on page 22 undefined on input line 263
.


Underfull \vbox (badness 1087) has occurred while \output is active []



LaTeX Warning: Hyper reference `QQA.3.7' on page 22 undefined on input line 282
.


LaTeX Warning: Hyper reference `QQA.3.7' on page 22 undefined on input line 301
.

<cartoons/Data-chasing-light-wave.pdf, id=1928, 859.29025pt x 491.47812pt>
File: cartoons/Data-chasing-light-wave.pdf Graphic file (type pdf)

<use cartoons/Data-chasing-light-wave.pdf>
Package pdftex.def Info: cartoons/Data-chasing-light-wave.pdf used on input lin
e 305.
(pdftex.def)             Requested size: 859.28815pt x 491.47691pt.
) (./cpu/hwfreelunch.tex

LaTeX Warning: Citation `HerbSutter2008EffectiveConcurrency' on page 22 undefin
ed on input line 10.

[22 <./cartoons/Data-chasing-light-wave.pdf>]

LaTeX Warning: Hyper reference `QQA.3.8' on page 23 undefined on input line 39.



LaTeX Warning: Hyper reference `QQA.3.8' on page 23 undefined on input line 103
.


LaTeX Warning: Citation `JohnKnickerbocker2008:3DI' on page 23 undefined on inp
ut line 124.

<cpu/3DI.pdf, id=1946, 217.26154pt x 95.25287pt>
File: cpu/3DI.pdf Graphic file (type pdf)
 <use cpu/3DI.pdf>
Package pdftex.def Info: cpu/3DI.pdf used on input line 128.
(pdftex.def)             Requested size: 217.26099pt x 95.25262pt.


LaTeX Warning: Citation `JimGray2002SmokingHairyGolfBalls' on page 23 undefined
 on input line 156.


LaTeX Warning: Citation `BryanGardiner2007' on page 23 undefined on input line 
163.

[23 <./cpu/3DI.pdf>]) (./cpu/swdesign.tex [24]

LaTeX Warning: Hyper reference `QQA.3.9' on page 25 undefined on input line 31.



LaTeX Warning: Hyper reference `QQA.3.9' on page 25 undefined on input line 65.



LaTeX Warning: Hyper reference `QQA.3.10' on page 25 undefined on input line 95
.


LaTeX Warning: Hyper reference `QQA.3.10' on page 25 undefined on input line 10
7.

)) (./toolsoftrade/toolsoftrade.tex [25] [26

]
Chapter 4.

LaTeX Warning: Hyper reference `QQA.4.1' on page 27 undefined on input line 21.



LaTeX Warning: Hyper reference `QQA.4.1' on page 27 undefined on input line 29.



Overfull \hbox (10.00002pt too wide) in paragraph at lines 46--57
[][]
 []

<toolsoftrade/shellparallel.pdf, id=1998, 217.26154pt x 158.5081pt>
File: toolsoftrade/shellparallel.pdf Graphic file (type pdf)

<use toolsoftrade/shellparallel.pdf>
Package pdftex.def Info: toolsoftrade/shellparallel.pdf used on input line 60.
(pdftex.def)             Requested size: 217.26099pt x 158.5077pt.


LaTeX Warning: Hyper reference `QQA.4.2' on page 27 undefined on input line 78.



LaTeX Warning: Hyper reference `QQA.4.2' on page 27 undefined on input line 90.



LaTeX Warning: Hyper reference `QQA.4.3' on page 27 undefined on input line 92.



LaTeX Warning: Hyper reference `QQA.4.3' on page 27 undefined on input line 112
.


LaTeX Warning: Hyper reference `QQA.4.4' on page 27 undefined on input line 123
.


LaTeX Warning: Hyper reference `QQA.4.4' on page 27 undefined on input line 153
.


LaTeX Warning: Citation `OpenGroup1997pthreads' on page 27 undefined on input l
ine 159.


Underfull \vbox (badness 1052) has occurred while \output is active []

 [27 <./toolsoftrade/shellparallel.pdf>]
Underfull \hbox (badness 2961) in paragraph at lines 171--171
[]\T1/ptm/b/n/12 POSIX Pro-cess Cre-ation and De-
 []


LaTeX Warning: Citation `WRichardStevens1992' on page 28 undefined on input lin
e 190.


LaTeX Warning: Citation `StewartWeiss2013UNIX' on page 28 undefined on input li
ne 190.


LaTeX Warning: Hyper reference `QQA.4.5' on page 28 undefined on input line 277
.


LaTeX Warning: Hyper reference `QQA.4.5' on page 28 undefined on input line 291
.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 331--339
[][]
 []


LaTeX Warning: Hyper reference `QQA.4.6' on page 28 undefined on input line 340
.


LaTeX Warning: Hyper reference `QQA.4.6' on page 28 undefined on input line 365
.

[28]
Underfull \hbox (badness 3229) in paragraph at lines 373--373
[]\T1/ptm/b/n/12 POSIX Thread Cre-ation and De-
 []


LaTeX Warning: Hyper reference `QQA.4.7' on page 29 undefined on input line 428
.


LaTeX Warning: Hyper reference `QQA.4.7' on page 29 undefined on input line 439
.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 458--466
[][]
 []


LaTeX Warning: Hyper reference `QQA.4.8' on page 29 undefined on input line 477
.


LaTeX Warning: Hyper reference `QQA.4.8' on page 29 undefined on input line 499
.

[29]

LaTeX Warning: Citation `Hoare74' on page 30 undefined on input line 523.


Overfull \hbox (1.12828pt too wide) in paragraph at lines 514--524
\T1/ptm/m/n/10 (-20) ``releases'' the specified lock. Because these are ``exclu
sive''
 []


LaTeX Warning: Hyper reference `QQA.4.9' on page 30 undefined on input line 525
.


LaTeX Warning: Hyper reference `QQA.4.9' on page 30 undefined on input line 542
.


LaTeX Warning: Hyper reference `QQA.4.10' on page 30 undefined on input line 61
8.


LaTeX Warning: Hyper reference `QQA.4.10' on page 30 undefined on input line 62
9.


LaTeX Warning: Hyper reference `QQA.4.11' on page 30 undefined on input line 64
2.


LaTeX Warning: Hyper reference `QQA.4.11' on page 30 undefined on input line 65
3.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 706--714
[][]
 []


Underfull \vbox (badness 3536) has occurred while \output is active []

 [30]

LaTeX Warning: Hyper reference `QQA.4.12' on page 31 undefined on input line 71
9.


LaTeX Warning: Hyper reference `QQA.4.12' on page 31 undefined on input line 73
6.


Overfull \hbox (3.14014pt too wide) in paragraph at lines 765--765
 [][] 
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 776--787
[][]
 []


LaTeX Warning: Hyper reference `QQA.4.13' on page 31 undefined on input line 79
3.


LaTeX Warning: Hyper reference `QQA.4.13' on page 31 undefined on input line 81
0.


LaTeX Warning: Hyper reference `QQA.4.14' on page 31 undefined on input line 81
2.


LaTeX Warning: Hyper reference `QQA.4.14' on page 31 undefined on input line 82
4.


LaTeX Warning: Hyper reference `QQA.4.15' on page 31 undefined on input line 82
6.


LaTeX Warning: Hyper reference `QQA.4.15' on page 31 undefined on input line 84
2.


Underfull \hbox (badness 10000) in paragraph at lines 852--865
[]\T1/pcrs/m/n/10 _[]_[][][]\T1/ptm/m/n/10 (+20) , []\T1/pcrs/m/n/10 _[]_[][][]
 \T1/ptm/m/n/10 (+20) may
 []


Underfull \hbox (badness 10000) in paragraph at lines 852--865
\T1/ptm/m/n/10 (+20) be stat-i-cally ini-tial-ized via []\T1/pcrs/m/n/10 _[]_
 []


Underfull \hbox (badness 4479) in paragraph at lines 852--865
[][][] \T1/ptm/m/n/10 (+20) or dy-nam-i-cally ini-tial-ized via the
 []


Underfull \hbox (badness 10000) in paragraph at lines 852--865
[]\T1/pcrs/m/n/10 _[][][][] \T1/ptm/m/n/10 (+20) prim-i-tive read-acquires the
 []


Underfull \hbox (badness 10000) in paragraph at lines 852--865
\T1/ptm/m/n/10 (+20) spec-i-fied []\T1/pcrs/m/n/10 _[]_[][][]\T1/ptm/m/n/10 (+2
0) , the []\T1/pcrs/m/n/10 _
 []

[31]
Underfull \hbox (badness 6428) in paragraph at lines 947--954
[]\T1/ptm/m/n/10 (+20) Lines 12-41 de-fine [][][][], which is the
 []


Underfull \hbox (badness 1205) in paragraph at lines 947--954
\T1/ptm/m/n/10 (+20) reader thread. Line 18 atom-i-cally in-cre-ments the
 []


LaTeX Warning: Hyper reference `QQA.4.16' on page 32 undefined on input line 95
5.


LaTeX Warning: Hyper reference `QQA.4.16' on page 32 undefined on input line 97
3.


LaTeX Warning: Hyper reference `QQA.4.17' on page 32 undefined on input line 97
5.


LaTeX Warning: Hyper reference `QQA.4.17' on page 32 undefined on input line 99
7.


LaTeX Warning: Hyper reference `QQA.4.18' on page 32 undefined on input line 99
9.


LaTeX Warning: Hyper reference `QQA.4.18' on page 32 undefined on input line 10
18.


<CodeSamples/toolsoftrade/rwlockscale.pdf, id=2091, 341.42549pt x 318.87332pt>
File: CodeSamples/toolsoftrade/rwlockscale.pdf Graphic file (type pdf)

<use CodeSamples/toolsoftrade/rwlockscale.pdf>
Package pdftex.def Info: CodeSamples/toolsoftrade/rwlockscale.pdf used on input
 line 1033.
(pdftex.def)             Requested size: 341.42465pt x 318.87254pt.
 [32 <./CodeSamples/toolsoftrade/rwlockscale.pdf>]

LaTeX Warning: Hyper reference `QQA.4.19' on page 33 undefined on input line 10
68.


LaTeX Warning: Hyper reference `QQA.4.19' on page 33 undefined on input line 10
75.


LaTeX Warning: Hyper reference `QQA.4.20' on page 33 undefined on input line 10
77.


LaTeX Warning: Hyper reference `QQA.4.20' on page 33 undefined on input line 10
99.


LaTeX Warning: Hyper reference `QQA.4.21' on page 33 undefined on input line 11
01.


LaTeX Warning: Hyper reference `QQA.4.21' on page 33 undefined on input line 11
35.


LaTeX Warning: Hyper reference `QQA.4.22' on page 33 undefined on input line 11
37.


LaTeX Warning: Hyper reference `QQA.4.22' on page 33 undefined on input line 11
50.

LaTeX Font Info:    Try loading font information for T1+phv on input line 1176.

(/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd
File: t1phv.fd 2001/06/04 scalable font definitions for T1/phv.
)
LaTeX Font Info:    Font shape `T1/phv/m/n' will be
(Font)              scaled to size 9.19998pt on input line 1176.
Package microtype Info: Loading generic settings for font family
(microtype)             `phv' (encoding: T1).
(microtype)             For optimal results, create family-specific settings.
(microtype)             See the microtype manual for details.

Underfull \hbox (badness 4353) in paragraph at lines 1176--1189
\T1/ptm/m/n/10 (+20) op-er-a-tions, in-clud-ing \T1/pcrs/m/n/10 __[]_[]_[]_[][]
[][]\T1/ptm/m/n/10 (+20) ,
 []


Underfull \hbox (badness 5274) in paragraph at lines 1176--1189
\T1/pcrs/m/n/10 __[]_[]_[]_[][][][]\T1/ptm/m/n/10 (+20) , \T1/pcrs/m/n/10 __[]_
[]_[]_
 []


Underfull \hbox (badness 10000) in paragraph at lines 1176--1189
\T1/pcrs/m/n/10 __[]_[]_[]_[][][][]\T1/ptm/m/n/10 (+20) , \T1/pcrs/m/n/10 __[]_
[]_[]_
 []


Underfull \hbox (badness 10000) in paragraph at lines 1176--1189
[][][][]\T1/ptm/m/n/10 (+20) , \T1/pcrs/m/n/10 __[]_[]_[]_[][][][]\T1/ptm/m/n/1
0 (+20) , \T1/pcrs/m/n/10 __[]_
 []


Underfull \hbox (badness 10000) in paragraph at lines 1176--1189
[]\T1/pcrs/m/n/10 _[]_[][][][]\T1/ptm/m/n/10 (+20) , \T1/pcrs/m/n/10 __[]_[]_[]
_[][][][]\T1/ptm/m/n/10 (+20) ,
 []


LaTeX Warning: Hyper reference `QQA.4.23' on page 33 undefined on input line 11
90.


LaTeX Warning: Hyper reference `QQA.4.23' on page 33 undefined on input line 12
16.


LaTeX Warning: Citation `MauriceHerlihy90a' on page 33 undefined on input line 
1235.


Underfull \hbox (badness 1831) in paragraph at lines 1218--1236
[][][][] \T1/ptm/m/n/10 (+20) and \T1/pcrs/m/n/10 __[]_[]_[]_[]_[][][][]\T1/ptm
/m/n/10 (+20) .
 []


Underfull \vbox (badness 1668) has occurred while \output is active []

 [33]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 1255--1265
[][]
 []


LaTeX Warning: Hyper reference `QQA.4.24' on page 34 undefined on input line 12
66.


LaTeX Warning: Hyper reference `QQA.4.24' on page 34 undefined on input line 12
74.


Underfull \hbox (badness 5036) in paragraph at lines 1279--1304
\T1/ptm/m/n/10 (+20) mem-ory bar-ri-ers ([]\T1/pcrs/m/n/10 _[]_[][][][] \T1/ptm
/m/n/10 (+20) and
 []


Underfull \hbox (badness 10000) in paragraph at lines 1279--1304
[]\T1/pcrs/m/n/10 _[]_[][][][]\T1/ptm/m/n/10 (+20) ), and read-modify-
 []


Underfull \hbox (badness 7504) in paragraph at lines 1279--1304
\T1/ptm/m/n/10 (+20) write atom-ics. The read-modify-write atom-ics
 []


Underfull \hbox (badness 7116) in paragraph at lines 1279--1304
\T1/ptm/m/n/10 (+20) in-clude []\T1/pcrs/m/n/10 _[]_[][][][]\T1/ptm/m/n/10 (+20
) , []\T1/pcrs/m/n/10 _[]_
 []


Underfull \hbox (badness 4416) in paragraph at lines 1279--1304
[][][][]\T1/ptm/m/n/10 (+20) , []\T1/pcrs/m/n/10 _[]_[][][][]\T1/ptm/m/n/10 (+2
0) , []\T1/pcrs/m/n/10 _[]_
 []


Underfull \hbox (badness 10000) in paragraph at lines 1279--1304
[]\T1/pcrs/m/n/10 _[][][][]\T1/ptm/m/n/10 (+20) , and []\T1/pcrs/m/n/10 _[]_
 []


Underfull \hbox (badness 1142) in paragraph at lines 1279--1304
\T1/ptm/m/n/10 (+20) ar-gu-ments per-mit weaker or-der-ings. For ex-am-ple,
 []


Underfull \hbox (badness 10000) in paragraph at lines 1279--1304
\T1/ptm/m/n/10 (+20) ``[]\T1/pcrs/m/n/10 _[]_[][][][][][][]_[]_
 []


Underfull \hbox (badness 10000) in paragraph at lines 1305--1314
\T1/pcrs/m/n/10 __[]_[]_[][][][]\T1/ptm/m/n/10 (+20) , \T1/pcrs/m/n/10 __[]_[][
][][]\T1/ptm/m/n/10 (+20) , \T1/pcrs/m/n/10 __
 []


Underfull \vbox (badness 3612) has occurred while \output is active []

 [34]
Underfull \hbox (badness 1057) in paragraph at lines 1429--1438
\T1/ptm/m/n/10 (+20) start-ing the new thread's ex-e-cu-tion at the func-tion
 []


Underfull \hbox (badness 1005) in paragraph at lines 1448--1455
[][][][] \T1/ptm/m/n/10 (+20) is system-dependent, the []\T1/pcrs/m/n/10 _[]_
 []


Underfull \hbox (badness 3138) in paragraph at lines 1465--1469
\T1/ptm/m/n/10 (+20) The []\T1/pcrs/m/n/10 _[]_[]_[][][][] \T1/ptm/m/n/10 (+20)
 macro loops
 []

[35]

LaTeX Warning: Hyper reference `QQA.4.25' on page 36 undefined on input line 15
61.


LaTeX Warning: Hyper reference `QQA.4.25' on page 36 undefined on input line 15
69.


Underfull \vbox (badness 5077) has occurred while \output is active []

 [36]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 1631--1640
[][]
 []


LaTeX Warning: Hyper reference `QQA.4.26' on page 37 undefined on input line 16
41.


LaTeX Warning: Hyper reference `QQA.4.26' on page 37 undefined on input line 16
64.


Underfull \hbox (badness 1199) in paragraph at lines 1673--1679
\T1/ptm/m/n/10 (+20) vide a good start. Nor-mal non-tearing reads and
 []


Underfull \hbox (badness 1769) in paragraph at lines 1680--1692
[][][][]\T1/ptm/m/n/10 (+20) , and []\T1/pcrs/m/n/10 _[][][][]\T1/ptm/m/n/10 (+
20) , among oth-ers. An
 []


Underfull \hbox (badness 2027) in paragraph at lines 1680--1692
\T1/ptm/m/n/10 (+20) and []\T1/pcrs/m/n/10 _[]_[]_[][][][]\T1/ptm/m/n/10 (+20) 
. An atomic add
 []


LaTeX Warning: Hyper reference `QQA.4.27' on page 37 undefined on input line 17
36.


LaTeX Warning: Hyper reference `QQA.4.27' on page 37 undefined on input line 17
54.

[37]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 1797--1804
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1808--1815
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1819--1826
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1832--1840
[][]
 []


Underfull \hbox (badness 1838) in paragraph at lines 1867--1867
[]\T1/ptm/b/n/14.4 The Right Tool for the Job:
 []


LaTeX Warning: Hyper reference `QQA.4.28' on page 38 undefined on input line 18
87.


LaTeX Warning: Hyper reference `QQA.4.28' on page 38 undefined on input line 18
96.


LaTeX Warning: Citation `DeadlockEmpire2016' on page 38 undefined on input line
 1904.

) (./count/count.tex [38]
Chapter 5.

LaTeX Warning: Hyper reference `QQA.5.1' on page 39 undefined on input line 22.



LaTeX Warning: Hyper reference `QQA.5.1' on page 39 undefined on input line 32.



LaTeX Warning: Hyper reference `QQA.5.2' on page 39 undefined on input line 34.



LaTeX Warning: Hyper reference `QQA.5.2' on page 39 undefined on input line 62.



LaTeX Warning: Hyper reference `QQA.5.3' on page 39 undefined on input line 66.



LaTeX Warning: Hyper reference `QQA.5.3' on page 39 undefined on input line 84.



LaTeX Warning: Hyper reference `QQA.5.4' on page 39 undefined on input line 88.



LaTeX Warning: Hyper reference `QQA.5.4' on page 39 undefined on input line 111
.


LaTeX Warning: Hyper reference `QQA.5.5' on page 39 undefined on input line 115
.


LaTeX Warning: Hyper reference `QQA.5.5' on page 39 undefined on input line 141
.


Underfull \vbox (badness 10000) has occurred while \output is active []

 [39

]

LaTeX Warning: Hyper reference `QQA.5.6' on page 40 undefined on input line 209
.


LaTeX Warning: Hyper reference `QQA.5.6' on page 40 undefined on input line 220
.


LaTeX Warning: Hyper reference `QQA.5.7' on page 40 undefined on input line 222
.


LaTeX Warning: Hyper reference `QQA.5.7' on page 40 undefined on input line 243
.

<CodeSamples/count/atomic.pdf, id=2244, 234.66669pt x 217.78561pt>
File: CodeSamples/count/atomic.pdf Graphic file (type pdf)

<use CodeSamples/count/atomic.pdf>
Package pdftex.def Info: CodeSamples/count/atomic.pdf used on input line 269.
(pdftex.def)             Requested size: 234.6661pt x 217.78506pt.
LaTeX Font Info:    Font shape `T1/ptm/bx/n' in size <8> not available
(Font)              Font shape `T1/ptm/b/n' tried instead on input line 293.


LaTeX Warning: Citation `Andrews91textbook' on page 40 undefined on input line 
293.


LaTeX Warning: Citation `Arcangeli03' on page 40 undefined on input line 293.


LaTeX Warning: Citation `DavidUngar2011unsync' on page 40 undefined on input li
ne 293.


LaTeX Warning: Hyper reference `QQA.5.8' on page 40 undefined on input line 308
.


LaTeX Warning: Hyper reference `QQA.5.8' on page 40 undefined on input line 321
.


LaTeX Warning: Hyper reference `QQA.5.9' on page 40 undefined on input line 323
.


LaTeX Warning: Hyper reference `QQA.5.9' on page 40 undefined on input line 345
.

<count/GlobalInc.pdf, id=2250, 217.26154pt x 140.47148pt>
File: count/GlobalInc.pdf Graphic file (type pdf)

<use count/GlobalInc.pdf>
Package pdftex.def Info: count/GlobalInc.pdf used on input line 349.
(pdftex.def)             Requested size: 217.26099pt x 140.47113pt.

<cartoons/r-2014-One-one-thousand.pdf, id=2251, 564.82208pt x 406.94405pt>
File: cartoons/r-2014-One-one-thousand.pdf Graphic file (type pdf)

<use cartoons/r-2014-One-one-thousand.pdf>
Package pdftex.def Info: cartoons/r-2014-One-one-thousand.pdf used on input lin
e 356.
(pdftex.def)             Requested size: 564.8207pt x 406.94304pt.
 [40 <./CodeSamples/count/atomic.pdf>]
Underfull \hbox (badness 1609) in paragraph at lines 372--374
[]\T1/ptm/m/n/10 (+20) The fol-low-ing sec-tions dis-cuss high-performance
 []


LaTeX Warning: Hyper reference `QQA.5.10' on page 41 undefined on input line 37
5.


LaTeX Warning: Hyper reference `QQA.5.10' on page 41 undefined on input line 43
1.


Underfull \vbox (badness 10000) has occurred while \output is active []



LaTeX Warning: Hyper reference `QQA.5.11' on page 41 undefined on input line 45
3.


LaTeX Warning: Hyper reference `QQA.5.11' on page 41 undefined on input line 47
3.


LaTeX Warning: Hyper reference `QQA.5.12' on page 41 undefined on input line 48
2.


LaTeX Warning: Hyper reference `QQA.5.12' on page 41 undefined on input line 49
2.

[41 <./count/GlobalInc.pdf> <./cartoons/r-2014-One-one-thousand.pdf>]

LaTeX Warning: Hyper reference `QQA.5.13' on page 42 undefined on input line 54
1.


LaTeX Warning: Hyper reference `QQA.5.13' on page 42 undefined on input line 55
8.


LaTeX Warning: Hyper reference `QQA.5.14' on page 42 undefined on input line 56
0.


LaTeX Warning: Hyper reference `QQA.5.14' on page 42 undefined on input line 57
2.


LaTeX Warning: Hyper reference `QQA.5.15' on page 42 undefined on input line 57
4.


LaTeX Warning: Hyper reference `QQA.5.15' on page 42 undefined on input line 58
2.

<count/PerThreadInc.pdf, id=2308, 217.26154pt x 140.47148pt>
File: count/PerThreadInc.pdf Graphic file (type pdf)

<use count/PerThreadInc.pdf>
Package pdftex.def Info: count/PerThreadInc.pdf used on input line 586.
(pdftex.def)             Requested size: 217.26099pt x 140.47113pt.


LaTeX Warning: Hyper reference `QQA.5.16' on page 42 undefined on input line 60
0.


LaTeX Warning: Hyper reference `QQA.5.16' on page 42 undefined on input line 71
5.


Underfull \hbox (badness 2564) in paragraph at lines 722--722
[]\T1/ptm/b/n/12 Eventually Con-sis-tent Im-ple-men-ta-
 []


LaTeX Warning: Citation `WernerVogels:2009:EventuallyConsistent' on page 42 und
efined on input line 731.


LaTeX Warning: Hyper reference `QQA.5.17' on page 42 undefined on input line 83
4.


LaTeX Warning: Hyper reference `QQA.5.17' on page 42 undefined on input line 87
0.

[42 <./count/PerThreadInc.pdf>]

LaTeX Warning: Hyper reference `QQA.5.18' on page 43 undefined on input line 87
2.


LaTeX Warning: Hyper reference `QQA.5.18' on page 43 undefined on input line 88
1.


LaTeX Warning: Hyper reference `QQA.5.19' on page 43 undefined on input line 88
3.


LaTeX Warning: Hyper reference `QQA.5.19' on page 43 undefined on input line 89
5.


LaTeX Warning: Hyper reference `QQA.5.20' on page 43 undefined on input line 89
7.


LaTeX Warning: Hyper reference `QQA.5.20' on page 43 undefined on input line 93
1.


Underfull \hbox (badness 10000) in paragraph at lines 933--933
[]\T1/ptm/b/n/12 Per-Thread-Variable-Based Im-ple-
 []

[43]

LaTeX Warning: Hyper reference `QQA.5.21' on page 44 undefined on input line 10
04.


LaTeX Warning: Hyper reference `QQA.5.21' on page 44 undefined on input line 10
45.


LaTeX Warning: Hyper reference `QQA.5.22' on page 44 undefined on input line 10
58.


LaTeX Warning: Hyper reference `QQA.5.22' on page 44 undefined on input line 10
71.


LaTeX Warning: Hyper reference `QQA.5.23' on page 44 undefined on input line 10
73.


LaTeX Warning: Hyper reference `QQA.5.23' on page 44 undefined on input line 10
97.


LaTeX Warning: Hyper reference `QQA.5.24' on page 44 undefined on input line 11
04.


LaTeX Warning: Hyper reference `QQA.5.24' on page 44 undefined on input line 11
18.


Underfull \hbox (badness 10000) in paragraph at lines 1120--1132
[]\T1/ptm/m/n/10 (+20) Lines 34-42 show the []\T1/pcrs/m/n/10 _[]_
 []


Underfull \hbox (badness 1057) in paragraph at lines 1120--1132
\T1/ptm/m/n/10 (+20) exit by each thread that pre-vi-ously called []\T1/pcrs/m/
n/10 _
 []


Underfull \hbox (badness 1383) in paragraph at lines 1120--1132
[]\T1/pcrs/m/n/10 _[][][][] \T1/ptm/m/n/10 (+20) as well as other calls to []\T
1/pcrs/m/n/10 _
 []


LaTeX Warning: Hyper reference `QQA.5.25' on page 44 undefined on input line 11
43.


LaTeX Warning: Hyper reference `QQA.5.25' on page 44 undefined on input line 12
12.


LaTeX Warning: Hyper reference `QQA.5.26' on page 44 undefined on input line 12
20.


LaTeX Warning: Hyper reference `QQA.5.26' on page 44 undefined on input line 12
52.


LaTeX Warning: Hyper reference `QQA.5.27' on page 44 undefined on input line 12
54.


LaTeX Warning: Hyper reference `QQA.5.27' on page 44 undefined on input line 12
71.


LaTeX Warning: Citation `McKenney93' on page 44 undefined on input line 1300.

[44] <count/count_lim.pdf, id=2380, 190.16028pt x 217.25865pt>
File: count/count_lim.pdf Graphic file (type pdf)

<use count/count_lim.pdf>
Package pdftex.def Info: count/count_lim.pdf used on input line 1410.
(pdftex.def)             Requested size: 190.1598pt x 217.2581pt.
 [45]
Underfull \hbox (badness 10000) in paragraph at lines 1506--1509
[]\T1/ptm/m/n/10 (+20) Figure []5.12[] shows the []\T1/pcrs/m/n/10 _[][][][]\T1
/ptm/m/n/10 (+20) , []\T1/pcrs/m/n/10 _
 []


Underfull \hbox (badness 10000) in paragraph at lines 1506--1509
[][][][]\T1/ptm/m/n/10 (+20) , and []\T1/pcrs/m/n/10 _[][][][] \T1/ptm/m/n/10 (
+20) func-tions
 []


LaTeX Warning: Hyper reference `QQA.5.28' on page 46 undefined on input line 15
11.


LaTeX Warning: Hyper reference `QQA.5.28' on page 46 undefined on input line 15
22.

[46 <./count/count_lim.pdf>]

LaTeX Warning: Hyper reference `QQA.5.29' on page 47 undefined on input line 15
31.


LaTeX Warning: Hyper reference `QQA.5.29' on page 47 undefined on input line 15
62.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1537--1563
[][]
 []


LaTeX Warning: Hyper reference `QQA.5.30' on page 47 undefined on input line 15
91.


LaTeX Warning: Hyper reference `QQA.5.30' on page 47 undefined on input line 16
02.


LaTeX Warning: Hyper reference `QQA.5.31' on page 47 undefined on input line 16
25.


LaTeX Warning: Hyper reference `QQA.5.31' on page 47 undefined on input line 16
39.


Underfull \hbox (badness 1472) in paragraph at lines 1625--1640
[]\T1/ptm/b/n/10 Quick Quiz 5.31:[] \T1/ptm/m/n/10 (+20) Given that [][][]
 []


LaTeX Warning: Hyper reference `QQA.5.32' on page 47 undefined on input line 16
41.


LaTeX Warning: Hyper reference `QQA.5.32' on page 47 undefined on input line 16
54.


LaTeX Warning: Hyper reference `QQA.5.33' on page 47 undefined on input line 16
65.


LaTeX Warning: Hyper reference `QQA.5.33' on page 47 undefined on input line 16
76.

[47]
Underfull \hbox (badness 2119) in paragraph at lines 1755--1768
[]\T1/ptm/m/n/10 (+20) Lines 9-19 show []\T1/pcrs/m/n/10 _[][][][]\T1/ptm/m/n/1
0 (+20) , which is
 []


Underfull \hbox (badness 2359) in paragraph at lines 1755--1768
\T1/ptm/m/n/10 (+20) This func-tion's job is to set the cur-rent thread's
 []


Underfull \hbox (badness 1122) in paragraph at lines 1769--1781
\T1/ptm/m/n/10 (+20) tion of [][][] that is not al-ready cov-
 []


Underfull \hbox (badness 1205) in paragraph at lines 1769--1781
\T1/ptm/m/n/10 (+20) ered by ei-ther [][][] or [][][],
 []


Underfull \hbox (badness 1694) in paragraph at lines 1769--1781
\T1/ptm/m/n/10 (+20) and as-sign the com-puted quan-tity to this thread's
 []


Underfull \hbox (badness 1960) in paragraph at lines 1769--1781
\T1/ptm/m/n/10 (+20) just-ment to [][][]. Line 15 sets this
 []


LaTeX Warning: Hyper reference `QQA.5.34' on page 48 undefined on input line 17
82.


LaTeX Warning: Hyper reference `QQA.5.34' on page 48 undefined on input line 17
97.


Underfull \hbox (badness 10000) in paragraph at lines 1782--1798
[]\T1/ptm/b/n/10 Quick Quiz 5.34:[] \T1/ptm/m/n/10 (+20) Why set [][][] to
 []

<count/globbal.pdf, id=2445, 383.25679pt x 262.19957pt>
File: count/globbal.pdf Graphic file (type pdf)

<use count/globbal.pdf>
Package pdftex.def Info: count/globbal.pdf used on input line 1801.
(pdftex.def)             Requested size: 383.25586pt x 262.19893pt.


LaTeX Warning: Hyper reference `QQA.5.35' on page 48 undefined on input line 18
45.


LaTeX Warning: Hyper reference `QQA.5.35' on page 48 undefined on input line 18
66.


Underfull \vbox (badness 1668) has occurred while \output is active []

 [48]
Underfull \hbox (badness 1400) in paragraph at lines 1875--1881
[]\T1/ptm/m/n/10 (+20) Finally, lines 30-38 show []\T1/pcrs/m/n/10 _[]_
 []


Underfull \vbox (badness 10000) has occurred while \output is active []

 [49 <./count/globbal.pdf>]

LaTeX Warning: Hyper reference `QQA.5.36' on page 50 undefined on input line 20
03.


LaTeX Warning: Hyper reference `QQA.5.36' on page 50 undefined on input line 20
38.


Underfull \hbox (badness 2080) in paragraph at lines 2095--2103
[][][]\T1/ptm/m/n/10 (+20) , [][][], [][][], and
 []

[50]

LaTeX Warning: Hyper reference `QQA.5.37' on page 51 undefined on input line 21
04.


LaTeX Warning: Hyper reference `QQA.5.37' on page 51 undefined on input line 21
16.


Underfull \hbox (badness 1924) in paragraph at lines 2118--2126
\T1/ptm/m/n/10 (+20) the []\T1/pcrs/m/n/10 _[][][][][][] \T1/ptm/m/n/10 (+20) v
ari-able, splits it into
 []


LaTeX Warning: Hyper reference `QQA.5.38' on page 51 undefined on input line 21
33.


LaTeX Warning: Hyper reference `QQA.5.38' on page 51 undefined on input line 21
41.


LaTeX Warning: Hyper reference `QQA.5.39' on page 51 undefined on input line 21
49.


LaTeX Warning: Hyper reference `QQA.5.39' on page 51 undefined on input line 21
57.


Underfull \hbox (badness 1077) in paragraph at lines 2233--2235
[]\T1/ptm/m/n/10 (+20) Figure []5.18[] shows the []\T1/pcrs/m/n/10 _[][][][] \T
1/ptm/m/n/10 (+20) and []\T1/pcrs/m/n/10 _
 []

[51]

LaTeX Warning: Hyper reference `QQA.5.40' on page 52 undefined on input line 22
55.


LaTeX Warning: Hyper reference `QQA.5.40' on page 52 undefined on input line 22
69.


LaTeX Warning: Hyper reference `QQA.5.41' on page 52 undefined on input line 22
71.


LaTeX Warning: Hyper reference `QQA.5.41' on page 52 undefined on input line 22
83.


Underfull \hbox (badness 4084) in paragraph at lines 2271--2284
[]\T1/ptm/b/n/10 Quick Quiz 5.41:[] \T1/ptm/m/n/10 (+20) Why would the []\T1/pc
rs/m/n/10 _
 []


Underfull \hbox (badness 10000) in paragraph at lines 2445--2458
[]\T1/pcrs/m/n/10 _[][][][]\T1/ptm/m/n/10 (+20) , []\T1/pcrs/m/n/10 _[]_[][][][
]\T1/ptm/m/n/10 (+20) ,
 []


Underfull \hbox (badness 2096) in paragraph at lines 2445--2458
[]\T1/pcrs/m/n/10 _[][][][]\T1/ptm/m/n/10 (+20) , []\T1/pcrs/m/n/10 _[]_[][][][
]\T1/ptm/m/n/10 (+20) ,
 []


Underfull \hbox (badness 1389) in paragraph at lines 2445--2458
[]\T1/pcrs/m/n/10 _[][][][] \T1/ptm/m/n/10 (+20) is shown on lines 1-12, of
 []

[52]

LaTeX Warning: Hyper reference `QQA.5.42' on page 53 undefined on input line 24
75.


LaTeX Warning: Hyper reference `QQA.5.42' on page 53 undefined on input line 24
89.


LaTeX Warning: Hyper reference `QQA.5.43' on page 53 undefined on input line 24
91.


LaTeX Warning: Hyper reference `QQA.5.43' on page 53 undefined on input line 25
19.


Underfull \hbox (badness 2495) in paragraph at lines 2521--2531
[]\T1/ptm/m/n/10 (+20) Lines 1-22 on Fig-ure []5.21[] show the code for
 []


LaTeX Warning: Hyper reference `QQA.5.44' on page 53 undefined on input line 25
32.


LaTeX Warning: Hyper reference `QQA.5.44' on page 53 undefined on input line 25
43.


LaTeX Warning: Hyper reference `QQA.5.45' on page 53 undefined on input line 25
60.


LaTeX Warning: Hyper reference `QQA.5.45' on page 53 undefined on input line 25
71.

<count/sig-theft.pdf, id=2526, 174.37007pt x 233.87361pt>
File: count/sig-theft.pdf Graphic file (type pdf)

<use count/sig-theft.pdf>
Package pdftex.def Info: count/sig-theft.pdf used on input line 2578.
(pdftex.def)             Requested size: 174.36963pt x 233.87302pt.
 [53]

LaTeX Warning: Hyper reference `QQA.5.46' on page 54 undefined on input line 26
15.


LaTeX Warning: Hyper reference `QQA.5.46' on page 54 undefined on input line 26
23.


LaTeX Warning: Hyper reference `QQA.5.47' on page 54 undefined on input line 26
25.


LaTeX Warning: Hyper reference `QQA.5.47' on page 54 undefined on input line 26
65.


Underfull \hbox (badness 1558) in paragraph at lines 2667--2667
[]\T1/ptm/b/n/12 Signal-Theft Limit Counter Im-ple-
 []


LaTeX Warning: Hyper reference `QQA.5.48' on page 54 undefined on input line 27
97.


LaTeX Warning: Hyper reference `QQA.5.48' on page 54 undefined on input line 28
23.


Underfull \hbox (badness 10000) in paragraph at lines 2797--2824
[]\T1/pcrs/m/n/10 _[]_[][][][]\T1/ptm/m/n/10 (+20) , why are there []\T1/pcrs/m
/n/10 _
 []


Underfull \hbox (badness 2237) in paragraph at lines 2797--2824
[][][][] \T1/ptm/m/n/10 (+20) wrap-pers around the uses of the [][][]
 []


LaTeX Warning: Hyper reference `QQA.5.49' on page 54 undefined on input line 28
36.


LaTeX Warning: Hyper reference `QQA.5.49' on page 54 undefined on input line 28
48.


LaTeX Warning: Hyper reference `QQA.5.50' on page 54 undefined on input line 28
50.


LaTeX Warning: Hyper reference `QQA.5.50' on page 54 undefined on input line 28
59.


Underfull \vbox (badness 1226) has occurred while \output is active []

 [54 <./count/sig-theft.pdf>]

LaTeX Warning: Hyper reference `QQA.5.51' on page 55 undefined on input line 28
61.


LaTeX Warning: Hyper reference `QQA.5.51' on page 55 undefined on input line 28
70.


LaTeX Warning: Hyper reference `QQA.5.52' on page 55 undefined on input line 28
83.


LaTeX Warning: Hyper reference `QQA.5.52' on page 55 undefined on input line 28
94.

[55]
Underfull \vbox (badness 2644) has occurred while \output is active []


Underfull \hbox (badness 1072) in paragraph at lines 3097--3106
\T1/ptm/m/n/10 (+20) which set up []\T1/pcrs/m/n/10 _[]_[]_[][][][] \T1/ptm/m/n
/10 (+20) as the
 []


LaTeX Warning: Hyper reference `QQA.5.53' on page 56 undefined on input line 31
22.


LaTeX Warning: Hyper reference `QQA.5.53' on page 56 undefined on input line 31
35.

[56]

LaTeX Warning: Hyper reference `QQA.5.54' on page 57 undefined on input line 31
41.


LaTeX Warning: Hyper reference `QQA.5.54' on page 57 undefined on input line 31
50.


Underfull \hbox (badness 2799) in paragraph at lines 3152--3152
[]\T1/ptm/b/n/14.4 Applying Spe-cial-ized Par-al-lel
 []


LaTeX Warning: Hyper reference `QQA.5.55' on page 57 undefined on input line 31
77.


LaTeX Warning: Hyper reference `QQA.5.55' on page 57 undefined on input line 31
84.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 3199--3215
[][]
 []


LaTeX Warning: Hyper reference `QQA.5.56' on page 57 undefined on input line 32
23.


LaTeX Warning: Hyper reference `QQA.5.56' on page 57 undefined on input line 32
32.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 3237--3251
[][]
 []

[57]

LaTeX Warning: Hyper reference `QQA.5.57' on page 58 undefined on input line 32
58.


LaTeX Warning: Hyper reference `QQA.5.57' on page 58 undefined on input line 32
87.


LaTeX Warning: Hyper reference `QQA.5.58' on page 58 undefined on input line 33
53.


LaTeX Warning: Hyper reference `QQA.5.58' on page 58 undefined on input line 33
68.


LaTeX Warning: Hyper reference `QQA.5.59' on page 58 undefined on input line 33
70.


LaTeX Warning: Hyper reference `QQA.5.59' on page 58 undefined on input line 33
92.


LaTeX Warning: Hyper reference `QQA.5.60' on page 58 undefined on input line 34
24.


LaTeX Warning: Hyper reference `QQA.5.60' on page 58 undefined on input line 34
43.


LaTeX Warning: Hyper reference `QQA.5.61' on page 58 undefined on input line 34
45.


LaTeX Warning: Hyper reference `QQA.5.61' on page 58 undefined on input line 34
58.


LaTeX Warning: Hyper reference `QQA.5.62' on page 58 undefined on input line 34
85.


LaTeX Warning: Hyper reference `QQA.5.62' on page 58 undefined on input line 34
93.

[58]

LaTeX Warning: Citation `Appavoo03a' on page 59 undefined on input line 3525.


LaTeX Warning: Citation `Soules03a' on page 59 undefined on input line 3525.


Underfull \vbox (badness 10000) has occurred while \output is active []



LaTeX Warning: Hyper reference `QQA.5.63' on page 59 undefined on input line 35
64.


LaTeX Warning: Hyper reference `QQA.5.63' on page 59 undefined on input line 35
91.

[59] <count/FourTaskOrderOpt.pdf, id=2677, 216.81pt x 137.313pt>
File: count/FourTaskOrderOpt.pdf Graphic file (type pdf)

<use count/FourTaskOrderOpt.pdf>
Package pdftex.def Info: count/FourTaskOrderOpt.pdf used on input line 3669.
(pdftex.def)             Requested size: 216.80946pt x 137.31265pt.

Underfull \hbox (badness 2334) in paragraph at lines 3670--3670
[]\T1/ptm/m/n/10 (+20) Figure 5.29: Op-ti-miza-tion and the Four Parallel-
 []

) (./SMPdesign/SMPdesign.tex [60 <./count/FourTaskOrderOpt.pdf>]
Chapter 6.

LaTeX Warning: Citation `Alexander79' on page 61 undefined on input line 10.


LaTeX Warning: Citation `GOF95' on page 61 undefined on input line 10.


LaTeX Warning: Citation `SchmidtStalRohnertBuschmann2000v2Textbook' on page 61 
undefined on input line 10.

(./SMPdesign/partexercises.tex
<SMPdesign/DiningPhilosopher5.pdf, id=2714, 256.3152pt x 247.5388pt>
File: SMPdesign/DiningPhilosopher5.pdf Graphic file (type pdf)

<use SMPdesign/DiningPhilosopher5.pdf>
Package pdftex.def Info: SMPdesign/DiningPhilosopher5.pdf used on input line 14
.
(pdftex.def)             Requested size: 179.4194pt x 173.27596pt.


LaTeX Warning: Citation `Dijkstra1971HOoSP' on page 61 undefined on input line 
20.

<cartoons/Dining-philosophers.pdf, id=2718, 1114.66437pt x 462.56815pt>
File: cartoons/Dining-philosophers.pdf Graphic file (type pdf)

<use cartoons/Dining-philosophers.pdf>
Package pdftex.def Info: cartoons/Dining-philosophers.pdf used on input line 32
.
(pdftex.def)             Requested size: 1114.66165pt x 462.567pt.

<SMPdesign/DiningPhilosopher5TB.pdf, id=2720, 256.3152pt x 247.5388pt>
File: SMPdesign/DiningPhilosopher5TB.pdf Graphic file (type pdf)

<use SMPdesign/DiningPhilosopher5TB.pdf>
Package pdftex.def Info: SMPdesign/DiningPhilosopher5TB.pdf used on input line 
51.
(pdftex.def)             Requested size: 179.4194pt x 173.27596pt.
 [61

 <./SMPdesign/DiningPhilosopher5.pdf>] [62 <./cartoons/Dining-philosophers.pdf>
 <./SMPdesign/DiningPhilosopher5TB.pdf>] [63

] [64

]
<SMPdesign/DiningPhilosopher4part-b.pdf, id=2768, 267.45593pt x 267.45584pt>
File: SMPdesign/DiningPhilosopher4part-b.pdf Graphic file (type pdf)

<use SMPdesign/DiningPhilosopher4part-b.pdf>
Package pdftex.def Info: SMPdesign/DiningPhilosopher4part-b.pdf used on input l
ine 106.
(pdftex.def)             Requested size: 187.21786pt x 187.2178pt.


LaTeX Warning: Hyper reference `QQA.6.1' on page 65 undefined on input line 123
.


LaTeX Warning: Hyper reference `QQA.6.1' on page 65 undefined on input line 146
.


LaTeX Warning: Citation `Inman85' on page 65 undefined on input line 148.


LaTeX Warning: Hyper reference `QQA.6.2' on page 65 undefined on input line 155
.


LaTeX Warning: Hyper reference `QQA.6.2' on page 65 undefined on input line 169
.


LaTeX Warning: Citation `Knuth73' on page 65 undefined on input line 175.


LaTeX Warning: Citation `DanGrossman2007TMGCAnalogy' on page 65 undefined on in
put line 178.

<SMPdesign/lockdeq.pdf, id=2770, 281.64085pt x 295.07658pt>
File: SMPdesign/lockdeq.pdf Graphic file (type pdf)

<use SMPdesign/lockdeq.pdf>
Package pdftex.def Info: SMPdesign/lockdeq.pdf used on input line 188.
(pdftex.def)             Requested size: 281.64015pt x 295.07585pt.

<SMPdesign/lockdeqpair.pdf, id=2772, 216.62439pt x 36.58365pt>
File: SMPdesign/lockdeqpair.pdf Graphic file (type pdf)

<use SMPdesign/lockdeqpair.pdf>
Package pdftex.def Info: SMPdesign/lockdeqpair.pdf used on input line 220.
(pdftex.def)             Requested size: 216.62386pt x 36.58356pt.

Underfull \vbox (badness 3792) has occurred while \output is active []

 [65 <./SMPdesign/DiningPhilosopher4part-b.pdf> <./SMPdesign/lockdeq.pdf>]

LaTeX Warning: Hyper reference `QQA.6.3' on page 66 undefined on input line 250
.


LaTeX Warning: Hyper reference `QQA.6.3' on page 66 undefined on input line 257
.

<SMPdesign/lockdeqhash.pdf, id=2826, 217.26149pt x 99.83298pt>
File: SMPdesign/lockdeqhash.pdf Graphic file (type pdf)

<use SMPdesign/lockdeqhash.pdf>
Package pdftex.def Info: SMPdesign/lockdeqhash.pdf used on input line 286.
(pdftex.def)             Requested size: 217.26094pt x 99.83272pt.

<SMPdesign/lockdeqhash1R.pdf, id=2828, 217.26149pt x 397.93367pt>
File: SMPdesign/lockdeqhash1R.pdf Graphic file (type pdf)

<use SMPdesign/lockdeqhash1R.pdf>
Package pdftex.def Info: SMPdesign/lockdeqhash1R.pdf used on input line 301.
(pdftex.def)             Requested size: 217.26094pt x 397.9327pt.

<SMPdesign/lockdeqhashlots.pdf, id=2832, 108.85654pt x 72.71866pt>
File: SMPdesign/lockdeqhashlots.pdf Graphic file (type pdf)

<use SMPdesign/lockdeqhashlots.pdf>
Package pdftex.def Info: SMPdesign/lockdeqhashlots.pdf used on input line 333.
(pdftex.def)             Requested size: 108.85626pt x 72.71846pt.
 [66 <./SMPdesign/lockdeqpair.pdf> <./SMPdesign/lockdeqhash.pdf>]
Underfull \hbox (badness 1048) in paragraph at lines 443--451
[]\T1/ptm/m/n/10 (+20) Lines 1-13 show []\T1/pcrs/m/n/10 _[]_[][][][]\T1/ptm/m/
n/10 (+20) , which left[]de-
 []


LaTeX Warning: Hyper reference `QQA.6.4' on page 67 undefined on input line 464
.


LaTeX Warning: Hyper reference `QQA.6.4' on page 67 undefined on input line 484
.

[67 <./SMPdesign/lockdeqhash1R.pdf> <./SMPdesign/lockdeqhashlots.pdf>] [68]

LaTeX Warning: Hyper reference `QQA.6.5' on page 69 undefined on input line 493
.


LaTeX Warning: Hyper reference `QQA.6.5' on page 69 undefined on input line 506
.


LaTeX Warning: Hyper reference `QQA.6.6' on page 69 undefined on input line 586
.


LaTeX Warning: Hyper reference `QQA.6.6' on page 69 undefined on input line 594
.


LaTeX Warning: Hyper reference `QQA.6.7' on page 69 undefined on input line 626
.


LaTeX Warning: Hyper reference `QQA.6.7' on page 69 undefined on input line 635
.


LaTeX Warning: Hyper reference `QQA.6.8' on page 69 undefined on input line 637
.


LaTeX Warning: Hyper reference `QQA.6.8' on page 69 undefined on input line 649
.


LaTeX Warning: Citation `LukeDalessandro:2011:ASPLOS:HybridNOrecSTM:deque' on p
age 69 undefined on input line 669.


LaTeX Warning: Citation `DavidDice:2010:SCA:HTM:deque' on page 69 undefined on 
input line 671.


LaTeX Warning: Citation `DBLP:conf/europar/Michael03' on page 69 undefined on i
nput line 677.


LaTeX Warning: Hyper reference `QQA.6.9' on page 69 undefined on input line 684
.


LaTeX Warning: Hyper reference `QQA.6.9' on page 69 undefined on input line 691
.


LaTeX Warning: Citation `DavidDice:2010:SCA:HTM:deque' on page 69 undefined on 
input line 693.


LaTeX Warning: Citation `Herlihy:1990:LCC:78969.78972' on page 69 undefined on 
input line 704.


LaTeX Warning: Citation `AndreasHaas2012FIFOisnt' on page 69 undefined on input
 line 714.


LaTeX Warning: Citation `ChristophMKirsch2012FIFOisntTR' on page 69 undefined o
n input line 718.


LaTeX Warning: Citation `Shavit:2011:DSM:1897852.1897873' on page 69 undefined 
on input line 725.

[69] [70]

LaTeX Warning: Hyper reference `QQA.6.10' on page 71 undefined on input line 74
6.


LaTeX Warning: Hyper reference `QQA.6.10' on page 71 undefined on input line 76
4.


LaTeX Warning: Hyper reference `QQA.6.11' on page 71 undefined on input line 76
6.


LaTeX Warning: Hyper reference `QQA.6.11' on page 71 undefined on input line 80
4.

) (./SMPdesign/criteria.tex

LaTeX Warning: Citation `Alexander79' on page 71 undefined on input line 30.


LaTeX Warning: Citation `GOF95' on page 71 undefined on input line 30.

[71]

LaTeX Warning: Citation `GeneAmdahl1967AmdahlsLaw' on page 72 undefined on inpu
t line 129.


LaTeX Warning: Citation `PaulMcKenney2005h' on page 72 undefined on input line 
169.


LaTeX Warning: Hyper reference `QQA.6.12' on page 72 undefined on input line 17
2.


LaTeX Warning: Citation `MauriceHerlihy90a' on page 72 undefined on input line 
175.


LaTeX Warning: Hyper reference `QQA.6.12' on page 72 undefined on input line 18
6.

) <SMPdesign/LockGranularity.pdf, id=2947, 108.87476pt x 199.19115pt>
File: SMPdesign/LockGranularity.pdf Graphic file (type pdf)

<use SMPdesign/LockGranularity.pdf>
Package pdftex.def Info: SMPdesign/LockGranularity.pdf used on input line 48.
(pdftex.def)             Requested size: 108.87448pt x 199.19066pt.
 [72]
File: SMPdesign/clockfreq.pdf Graphic file (type pdf)
 <use SMPdesign/clockfreq.pdf>
Package pdftex.def Info: SMPdesign/clockfreq.pdf used on input line 96.
(pdftex.def)             Requested size: 233.558pt x 213.38261pt.

<SMPdesign/CPUvsEnet.pdf, id=2967, 233.55858pt x 207.37273pt>
File: SMPdesign/CPUvsEnet.pdf Graphic file (type pdf)

<use SMPdesign/CPUvsEnet.pdf>
Package pdftex.def Info: SMPdesign/CPUvsEnet.pdf used on input line 103.
(pdftex.def)             Requested size: 233.558pt x 207.37221pt.


LaTeX Warning: Citation `ThomasEHart2006a' on page 73 undefined on input line 1
18.

[73 <./SMPdesign/LockGranularity.pdf>]
<cartoons/r-2014-Data-one-fighting.pdf, id=2995, 230.16312pt x 235.63832pt>
File: cartoons/r-2014-Data-one-fighting.pdf Graphic file (type pdf)

<use cartoons/r-2014-Data-one-fighting.pdf>
Package pdftex.def Info: cartoons/r-2014-Data-one-fighting.pdf used on input li
ne 271.
(pdftex.def)             Requested size: 230.16255pt x 235.63773pt.
 [74 <./SMPdesign/CPUvsEnet.pdf>]

LaTeX Warning: Citation `Beck85' on page 75 undefined on input line 351.


LaTeX Warning: Citation `Inman85' on page 75 undefined on input line 351.


LaTeX Warning: Citation `Garg90' on page 75 undefined on input line 351.


LaTeX Warning: Citation `Dove90' on page 75 undefined on input line 351.


LaTeX Warning: Citation `McKenney92b' on page 75 undefined on input line 351.


LaTeX Warning: Citation `McKenney92a' on page 75 undefined on input line 351.


LaTeX Warning: Citation `McKenney93' on page 75 undefined on input line 351.

<cartoons/r-2014-Data-many-happy.pdf, id=3009, 234.22989pt x 256.42438pt>
File: cartoons/r-2014-Data-many-happy.pdf Graphic file (type pdf)

<use cartoons/r-2014-Data-many-happy.pdf>
Package pdftex.def Info: cartoons/r-2014-Data-many-happy.pdf used on input line
 355.
(pdftex.def)             Requested size: 234.22931pt x 256.42375pt.

<cartoons/r-2014-Data-many-fighting.pdf, id=3011, 351.71025pt x 264.44618pt>
File: cartoons/r-2014-Data-many-fighting.pdf Graphic file (type pdf)

<use cartoons/r-2014-Data-many-fighting.pdf>
Package pdftex.def Info: cartoons/r-2014-Data-many-fighting.pdf used on input l
ine 390.
(pdftex.def)             Requested size: 351.70938pt x 264.44553pt.


LaTeX Warning: Citation `McKenney04a' on page 75 undefined on input line 397.


LaTeX Warning: Hyper reference `QQA.6.13' on page 75 undefined on input line 41
6.


LaTeX Warning: Hyper reference `QQA.6.13' on page 75 undefined on input line 48
6.

[75 <./cartoons/r-2014-Data-one-fighting.pdf>]

LaTeX Warning: Citation `BOINC2008' on page 76 undefined on input line 516.


Underfull \hbox (badness 7869) in paragraph at lines 555--555
[]\T1/ptm/b/n/12 Locking Gran-u-lar-ity and Per-for-
 []

[76 <./cartoons/r-2014-Data-many-happy.pdf> <./cartoons/r-2014-Data-many-fighti
ng.pdf

pdfTeX warning: pdflatex (file ./cartoons/r-2014-Data-many-fighting.pdf): PDF i
nclusion: multiple pdfs with page group included in a single page
>]
Underfull \hbox (badness 1215) in paragraph at lines 605--609
[]\T1/ptm/m/n/10 (+20) where $\OML/ztmcm/m/it/10 n$ \T1/ptm/m/n/10 (+20) is the
 num-ber of CPUs and $\OML/ztmcm/m/it/10 ^^U[]$ \T1/ptm/m/n/10 (+20) is the
 []

<SMPdesign/synceff.pdf, id=3060, 229.5461pt x 219.70079pt>
File: SMPdesign/synceff.pdf Graphic file (type pdf)

<use SMPdesign/synceff.pdf>
Package pdftex.def Info: SMPdesign/synceff.pdf used on input line 649.
(pdftex.def)             Requested size: 229.54553pt x 219.70024pt.
 [77 <./SMPdesign/synceff.pdf>]
<SMPdesign/matmuleff.pdf, id=3082, 235.00586pt x 203.69301pt>
File: SMPdesign/matmuleff.pdf Graphic file (type pdf)

<use SMPdesign/matmuleff.pdf>
Package pdftex.def Info: SMPdesign/matmuleff.pdf used on input line 686.
(pdftex.def)             Requested size: 235.00528pt x 203.6925pt.


LaTeX Warning: Hyper reference `QQA.6.14' on page 78 undefined on input line 70
3.


LaTeX Warning: Hyper reference `QQA.6.14' on page 78 undefined on input line 71
6.


LaTeX Warning: Hyper reference `QQA.6.15' on page 78 undefined on input line 72
4.


LaTeX Warning: Hyper reference `QQA.6.15' on page 78 undefined on input line 74
8.


LaTeX Warning: Citation `Knuth73' on page 78 undefined on input line 756.

<SMPdesign/ParallelFastpath.pdf, id=3087, 199.19403pt x 199.19115pt>
File: SMPdesign/ParallelFastpath.pdf Graphic file (type pdf)

<use SMPdesign/ParallelFastpath.pdf>
Package pdftex.def Info: SMPdesign/ParallelFastpath.pdf used on input line 776.

(pdftex.def)             Requested size: 199.19353pt x 199.19066pt.


LaTeX Warning: Citation `McKenney95b' on page 78 undefined on input line 788.


LaTeX Warning: Citation `McKenney95b' on page 78 undefined on input line 790.


LaTeX Warning: Citation `McKenney93' on page 78 undefined on input line 790.

[78 <./SMPdesign/matmuleff.pdf>]

LaTeX Warning: Citation `Snaman87' on page 79 undefined on input line 852.


LaTeX Warning: Hyper reference `QQA.6.16' on page 79 undefined on input line 92
2.


LaTeX Warning: Hyper reference `QQA.6.16' on page 79 undefined on input line 93
1.


LaTeX Warning: Citation `McKenney92a' on page 79 undefined on input line 939.


LaTeX Warning: Citation `McKenney93' on page 79 undefined on input line 939.


LaTeX Warning: Citation `Bonwick01slab' on page 79 undefined on input line 939.



LaTeX Warning: Citation `McKenney01e' on page 79 undefined on input line 939.


LaTeX Warning: Citation `Torvalds2.6kernel' on page 79 undefined on input line 
940.


Underfull \vbox (badness 2103) has occurred while \output is active []



LaTeX Warning: Citation `McKenney93' on page 79 undefined on input line 962.

[79 <./SMPdesign/ParallelFastpath.pdf>]
<SMPdesign/allocatorcache.pdf, id=3129, 217.26154pt x 199.15404pt>
File: SMPdesign/allocatorcache.pdf Graphic file (type pdf)

<use SMPdesign/allocatorcache.pdf>
Package pdftex.def Info: SMPdesign/allocatorcache.pdf used on input line 981.
(pdftex.def)             Requested size: 217.26099pt x 199.15355pt.
 [80 <./SMPdesign/allocatorcache.pdf>]
<SMPdesign/AllocatorPool.pdf, id=3149, 216.45154pt x 181.12366pt>
File: SMPdesign/AllocatorPool.pdf Graphic file (type pdf)

<use SMPdesign/AllocatorPool.pdf>
Package pdftex.def Info: SMPdesign/AllocatorPool.pdf used on input line 1048.
(pdftex.def)             Requested size: 216.451pt x 181.1232pt.

Overfull \hbox (3.14014pt too wide) in paragraph at lines 1146--1146
 [][] 
 []

[81 <./SMPdesign/AllocatorPool.pdf>]
<SMPdesign/smpalloc.pdf, id=3174, 237.45705pt x 223.82019pt>
File: SMPdesign/smpalloc.pdf Graphic file (type pdf)

<use SMPdesign/smpalloc.pdf>
Package pdftex.def Info: SMPdesign/smpalloc.pdf used on input line 1175.
(pdftex.def)             Requested size: 237.45647pt x 223.81964pt.


LaTeX Warning: Citation `McKenney01e' on page 82 undefined on input line 1186.


LaTeX Warning: Hyper reference `QQA.6.17' on page 82 undefined on input line 11
98.


LaTeX Warning: Hyper reference `QQA.6.17' on page 82 undefined on input line 12
09.


LaTeX Warning: Hyper reference `QQA.6.18' on page 82 undefined on input line 12
11.


LaTeX Warning: Hyper reference `QQA.6.18' on page 82 undefined on input line 13
11.


LaTeX Warning: Citation `McKusick88' on page 82 undefined on input line 1323.


LaTeX Warning: Citation `McKenney93' on page 82 undefined on input line 1331.


LaTeX Warning: Citation `McKenney01e' on page 82 undefined on input line 1341.

(./SMPdesign/beyond.tex
Underfull \vbox (badness 7851) has occurred while \output is active []

 [82 <./SMPdesign/smpalloc.pdf>]

LaTeX Warning: Citation `WikipediaLabyrinth' on page 83 undefined on input line
 24.


LaTeX Warning: Citation `AndrewAdamatzky2011SlimeMold' on page 83 undefined on 
input line 27.


LaTeX Warning: Citation `ChristerEricson2008GPUMaze' on page 83 undefined on in
put line 28.


LaTeX Warning: Citation `MIT:TRMag:MemristorMazes' on page 83 undefined on inpu
t line 29.


LaTeX Warning: Citation `ETHZurich:FS2011maze' on page 83 undefined on input li
ne 31.


LaTeX Warning: Citation `UMD:CMSC433maze' on page 83 undefined on input line 31
.


LaTeX Warning: Citation `RonFosner2010maze' on page 83 undefined on input line 
33.


LaTeX Warning: Citation `ETHZurich:FS2011maze' on page 83 undefined on input li
ne 36.


LaTeX Warning: Citation `RonFosner2010maze' on page 83 undefined on input line 
36.


Overfull \hbox (11.03613pt too wide) in paragraph at lines 137--137
 [][] 
 []


Underfull \hbox (badness 10000) in paragraph at lines 153--163
[]\T1/ptm/m/n/10 (+20) The pseu-docode for []\T1/pcrs/m/n/10 _[]_[]_[]_
 []


Underfull \hbox (badness 1997) in paragraph at lines 153--163
[][][][] \T1/ptm/m/n/10 (+20) is shown on lines 14-28 of Fig-ure []6.34[]
 []


Underfull \hbox (badness 1616) in paragraph at lines 153--163
\T1/ptm/m/n/10 (+20) true if the cor-re-spond-ing cell is a can-di-date next
 []


Underfull \hbox (badness 1383) in paragraph at lines 153--163
\T1/ptm/m/n/10 (+20) cell. The [][][][], [][][][], [][][][],
 []

<SMPdesign/MazeNumberPath.pdf, id=3202, 218.6166pt x 218.61473pt>
File: SMPdesign/MazeNumberPath.pdf Graphic file (type pdf)

<use SMPdesign/MazeNumberPath.pdf>
Package pdftex.def Info: SMPdesign/MazeNumberPath.pdf used on input line 166.
(pdftex.def)             Requested size: 218.61604pt x 218.61418pt.
 [83]
<SMPdesign/500-ms_seq_fg-cdf.pdf, id=3211, 241.12073pt x 220.8029pt>
File: SMPdesign/500-ms_seq_fg-cdf.pdf Graphic file (type pdf)

<use SMPdesign/500-ms_seq_fg-cdf.pdf>
Package pdftex.def Info: SMPdesign/500-ms_seq_fg-cdf.pdf used on input line 181
.
(pdftex.def)             Requested size: 241.12013pt x 220.80235pt.


LaTeX Warning: Citation `UMD:CMSC433maze' on page 84 undefined on input line 22
0.


LaTeX Warning: Citation `Beck85' on page 84 undefined on input line 224.


LaTeX Warning: Citation `Inman85' on page 84 undefined on input line 224.


LaTeX Warning: Citation `DavidAPatterson2010TroubleMulticore' on page 84 undefi
ned on input line 225.


Overfull \hbox (3.14014pt too wide) in paragraph at lines 262--262
 [][] 
 []


LaTeX Warning: Citation `PeteBecker2011N3242' on page 84 undefined on input lin
e 287.

[84 <./SMPdesign/MazeNumberPath.pdf> <./SMPdesign/500-ms_seq_fg-cdf.pdf>]
Overfull \hbox (3.14014pt too wide) in paragraph at lines 323--323
 [][] 
 []


Underfull \hbox (badness 10000) in paragraph at lines 327--341
[]\T1/ptm/m/n/10 (+20) The pseu-docode for []\T1/pcrs/m/n/10 _[]_[]_[]_
 []

<SMPdesign/500-ms_seq_fg_part-cdf.pdf, id=3237, 241.12073pt x 220.8029pt>
File: SMPdesign/500-ms_seq_fg_part-cdf.pdf Graphic file (type pdf)

<use SMPdesign/500-ms_seq_fg_part-cdf.pdf>
Package pdftex.def Info: SMPdesign/500-ms_seq_fg_part-cdf.pdf used on input lin
e 344.
(pdftex.def)             Requested size: 241.12013pt x 220.80235pt.

<SMPdesign/500-ms_seqVfg_part-cdf.pdf, id=3239, 241.12073pt x 220.8029pt>
File: SMPdesign/500-ms_seqVfg_part-cdf.pdf Graphic file (type pdf)

<use SMPdesign/500-ms_seqVfg_part-cdf.pdf>
Package pdftex.def Info: SMPdesign/500-ms_seqVfg_part-cdf.pdf used on input lin
e 361.
(pdftex.def)             Requested size: 241.12013pt x 220.80235pt.
 [85 <./SMPdesign/500-ms_seq_fg_part-cdf.pdf>] <SMPdesign/maze_in_way10a.pdf, i
d=3254, 585.38701pt x 585.38701pt>
File: SMPdesign/maze_in_way10a.pdf Graphic file (type pdf)

<use SMPdesign/maze_in_way10a.pdf>
Package pdftex.def Info: SMPdesign/maze_in_way10a.pdf used on input line 391.
(pdftex.def)             Requested size: 585.38557pt x 585.38557pt.

<SMPdesign/500-pctVms_seq_part-sct.pdf, id=3255, 243.28883pt x 220.8029pt>
File: SMPdesign/500-pctVms_seq_part-sct.pdf Graphic file (type pdf)

<use SMPdesign/500-pctVms_seq_part-sct.pdf>
Package pdftex.def Info: SMPdesign/500-pctVms_seq_part-sct.pdf used on input li
ne 398.
(pdftex.def)             Requested size: 243.28824pt x 220.80235pt.

<SMPdesign/maze_PWQ_vs_PART.pdf, id=3258, 585.38701pt x 585.38701pt>
File: SMPdesign/maze_PWQ_vs_PART.pdf Graphic file (type pdf)

<use SMPdesign/maze_PWQ_vs_PART.pdf>
Package pdftex.def Info: SMPdesign/maze_PWQ_vs_PART.pdf used on input line 434.

(pdftex.def)             Requested size: 585.38557pt x 585.38557pt.

<SMPdesign/500-ms_seqVfg_part_seqO3-cdf.pdf, id=3260, 241.12073pt x 220.8029pt>
File: SMPdesign/500-ms_seqVfg_part_seqO3-cdf.pdf Graphic file (type pdf)
<use SMPdesign/500-ms_seqVfg_part_seqO3-cdf.pdf>
Package pdftex.def Info: SMPdesign/500-ms_seqVfg_part_seqO3-cdf.pdf used on inp
ut line 454.
(pdftex.def)             Requested size: 241.12013pt x 220.80235pt.


LaTeX Warning: Citation `GeneAmdahl1967AmdahlsLaw' on page 86 undefined on inpu
t line 468.

[86 <./SMPdesign/500-ms_seqVfg_part-cdf.pdf> <./SMPdesign/maze_in_way10a.pdf> <
./SMPdesign/500-pctVms_seq_part-sct.pdf> <./SMPdesign/maze_PWQ_vs_PART.pdf

pdfTeX warning: pdflatex (file ./SMPdesign/maze_PWQ_vs_PART.pdf): PDF inclusion
: multiple pdfs with page group included in a single page
>]
<SMPdesign/500-ms_seqO3V2seqO3_fgO3_partO3-cdf.pdf, id=3282, 241.12073pt x 220.
8029pt>
File: SMPdesign/500-ms_seqO3V2seqO3_fgO3_partO3-cdf.pdf Graphic file (type pdf)

 <use SMPdesign/500-ms_seqO3V2seqO3_fgO3_partO3-cdf.pdf>
Package pdftex.def Info: SMPdesign/500-ms_seqO3V2seqO3_fgO3_partO3-cdf.pdf used
 on input line 495.
(pdftex.def)             Requested size: 241.12013pt x 220.80235pt.

<SMPdesign/500-ms_seqO3VfgO3_partO3-median.pdf, id=3285, 246.07925pt x 226.8194
pt>
File: SMPdesign/500-ms_seqO3VfgO3_partO3-median.pdf Graphic file (type pdf)
 <use SMPdesign/500-ms_seqO3VfgO3_partO3-median.pdf>
Package pdftex.def Info: SMPdesign/500-ms_seqO3VfgO3_partO3-median.pdf used on 
input line 519.
(pdftex.def)             Requested size: 246.07864pt x 226.81883pt.

<SMPdesign/500-ms_2seqO3VfgO3_partO3-median.pdf, id=3286, 246.07925pt x 220.802
9pt>
File: SMPdesign/500-ms_2seqO3VfgO3_partO3-median.pdf Graphic file (type pdf)
 <use SMPdesign/500-ms_2seqO3VfgO3_partO3-median.pdf>
Package pdftex.def Info: SMPdesign/500-ms_2seqO3VfgO3_partO3-median.pdf used on
 input line 526.
(pdftex.def)             Requested size: 246.07864pt x 220.80235pt.


LaTeX Warning: Citation `TrevorMudge2000Power' on page 87 undefined on input li
ne 541.

[87 <./SMPdesign/500-ms_seqVfg_part_seqO3-cdf.pdf> <./SMPdesign/500-ms_seqO3V2s
eqO3_fgO3_partO3-cdf.pdf> <./SMPdesign/500-ms_seqO3VfgO3_partO3-median.pdf>]
<SMPdesign/1000-ms_2seqO3VfgO3_partO3-mean.pdf, id=3311, 237.70802pt x 220.8029
pt>
File: SMPdesign/1000-ms_2seqO3VfgO3_partO3-mean.pdf Graphic file (type pdf)
 <use SMPdesign/1000-ms_2seqO3VfgO3_partO3-mean.pdf>
Package pdftex.def Info: SMPdesign/1000-ms_2seqO3VfgO3_partO3-mean.pdf used on 
input line 551.
(pdftex.def)             Requested size: 237.70743pt x 220.80235pt.


LaTeX Warning: Citation `BERT-87' on page 88 undefined on input line 561.


Underfull \hbox (badness 1127) in paragraph at lines 626--626
[]\T1/ptm/b/n/14.4 Partitioning, Par-al-lel-ism, and
 []


Underfull \vbox (badness 1436) has occurred while \output is active []

 [88 <./SMPdesign/500-ms_2seqO3VfgO3_partO3-median.pdf> <./SMPdesign/1000-ms_2s
eqO3VfgO3_partO3-mean.pdf>])) (./locking/locking.tex [89

] [90

]
Chapter 7.

LaTeX Warning: Citation `JonathanCorbet2006lockdep' on page 91 undefined on inp
ut line 31.


LaTeX Warning: Hyper reference `QQA.7.1' on page 91 undefined on input line 67.



LaTeX Warning: Hyper reference `QQA.7.1' on page 91 undefined on input line 75.


<cartoons/r-2014-Locking-the-Slob.pdf, id=3346, 259.76534pt x 357.59917pt>
File: cartoons/r-2014-Locking-the-Slob.pdf Graphic file (type pdf)

<use cartoons/r-2014-Locking-the-Slob.pdf>
Package pdftex.def Info: cartoons/r-2014-Locking-the-Slob.pdf used on input lin
e 82.
(pdftex.def)             Requested size: 259.7647pt x 357.5983pt.

<cartoons/r-2014-Locking-the-Hero.pdf, id=3347, 238.81445pt x 280.35895pt>
File: cartoons/r-2014-Locking-the-Hero.pdf Graphic file (type pdf)

<use cartoons/r-2014-Locking-the-Hero.pdf>
Package pdftex.def Info: cartoons/r-2014-Locking-the-Hero.pdf used on input lin
e 89.
(pdftex.def)             Requested size: 238.81386pt x 280.35826pt.

<locking/DeadlockCycle.pdf, id=3348, 113.37341pt x 158.53899pt>
File: locking/DeadlockCycle.pdf Graphic file (type pdf)

<use locking/DeadlockCycle.pdf>
Package pdftex.def Info: locking/DeadlockCycle.pdf used on input line 118.
(pdftex.def)             Requested size: 113.37312pt x 158.53857pt.
 [91]

LaTeX Warning: Hyper reference `QQA.7.2' on page 92 undefined on input line 135
.


LaTeX Warning: Hyper reference `QQA.7.2' on page 92 undefined on input line 159
.


Underfull \vbox (badness 2359) has occurred while \output is active []

 [92 <./cartoons/r-2014-Locking-the-Slob.pdf> <./cartoons/r-2014-Locking-the-He
ro.pdf

pdfTeX warning: pdflatex (file ./cartoons/r-2014-Locking-the-Hero.pdf): PDF inc
lusion: multiple pdfs with page group included in a single page
> <./locking/DeadlockCycle.pdf>]

LaTeX Warning: Citation `JonathanCorbet2006lockdep' on page 93 undefined on inp
ut line 209.


LaTeX Warning: Hyper reference `QQA.7.3' on page 93 undefined on input line 226
.


LaTeX Warning: Hyper reference `QQA.7.3' on page 93 undefined on input line 260
.


LaTeX Warning: Hyper reference `QQA.7.4' on page 93 undefined on input line 276
.


LaTeX Warning: Hyper reference `QQA.7.4' on page 93 undefined on input line 286
.

<locking/NonLocalLockHierarchy.pdf, id=3455, 212.74466pt x 172.0899pt>
File: locking/NonLocalLockHierarchy.pdf Graphic file (type pdf)

<use locking/NonLocalLockHierarchy.pdf>
Package pdftex.def Info: locking/NonLocalLockHierarchy.pdf used on input line 2
90.
(pdftex.def)             Requested size: 212.74413pt x 172.08946pt.

<locking/LocalLockHierarchy.pdf, id=3456, 212.74466pt x 172.0899pt>
File: locking/LocalLockHierarchy.pdf Graphic file (type pdf)

<use locking/LocalLockHierarchy.pdf>
Package pdftex.def Info: locking/LocalLockHierarchy.pdf used on input line 297.

(pdftex.def)             Requested size: 212.74413pt x 172.08946pt.

Underfull \vbox (badness 1097) has occurred while \output is active []

 [93 <./locking/NonLocalLockHierarchy.pdf> <./locking/LocalLockHierarchy.pdf>]
<locking/LayeredLockHierarchy.pdf, id=3480, 217.26154pt x 257.91023pt>
File: locking/LayeredLockHierarchy.pdf Graphic file (type pdf)

<use locking/LayeredLockHierarchy.pdf>
Package pdftex.def Info: locking/LayeredLockHierarchy.pdf used on input line 34
4.
(pdftex.def)             Requested size: 217.26099pt x 257.90959pt.
 [94 <./locking/LayeredLockHierarchy.pdf>]

LaTeX Warning: Hyper reference `QQA.7.5' on page 95 undefined on input line 478
.


LaTeX Warning: Hyper reference `QQA.7.5' on page 95 undefined on input line 483
.


LaTeX Warning: Hyper reference `QQA.7.6' on page 95 undefined on input line 492
.


LaTeX Warning: Hyper reference `QQA.7.6' on page 95 undefined on input line 505
.

[95]

LaTeX Warning: Hyper reference `QQA.7.7' on page 96 undefined on input line 598
.


LaTeX Warning: Hyper reference `QQA.7.7' on page 96 undefined on input line 612
.


LaTeX Warning: Hyper reference `QQA.7.8' on page 96 undefined on input line 614
.


LaTeX Warning: Hyper reference `QQA.7.8' on page 96 undefined on input line 627
.


LaTeX Warning: Hyper reference `QQA.7.9' on page 96 undefined on input line 644
.


LaTeX Warning: Hyper reference `QQA.7.9' on page 96 undefined on input line 654
.


LaTeX Warning: Citation `PhilipABernstein1987' on page 96 undefined on input li
ne 656.


LaTeX Warning: Citation `OpenGroup1997pthreads' on page 96 undefined on input l
ine 697.


LaTeX Warning: Hyper reference `QQA.7.10' on page 96 undefined on input line 71
1.


LaTeX Warning: Hyper reference `QQA.7.10' on page 96 undefined on input line 72
8.


LaTeX Warning: Hyper reference `QQA.7.11' on page 96 undefined on input line 73
5.


LaTeX Warning: Hyper reference `QQA.7.11' on page 96 undefined on input line 74
1.


LaTeX Warning: Hyper reference `QQA.7.12' on page 96 undefined on input line 75
3.


LaTeX Warning: Hyper reference `QQA.7.12' on page 96 undefined on input line 76
6.

[96]

LaTeX Warning: Hyper reference `QQA.7.13' on page 97 undefined on input line 77
8.


LaTeX Warning: Hyper reference `QQA.7.13' on page 97 undefined on input line 83
1.


Underfull \hbox (badness 2922) in paragraph at lines 877--883
\T1/ptm/m/n/10 (+20) Although con-di-tional lock-ing can be an ef-fec-tive
 []


LaTeX Warning: Hyper reference `QQA.7.14' on page 97 undefined on input line 90
0.


LaTeX Warning: Hyper reference `QQA.7.14' on page 97 undefined on input line 92
3.


LaTeX Warning: Hyper reference `QQA.7.15' on page 97 undefined on input line 98
6.


LaTeX Warning: Hyper reference `QQA.7.15' on page 97 undefined on input line 10
01.


LaTeX Warning: Citation `Anderson90' on page 97 undefined on input line 1005.

File: cpu/SystemArch.pdf Graphic file (type pdf)
<use cpu/SystemArch.pdf>
Package pdftex.def Info: cpu/SystemArch.pdf used on input line 1015.
(pdftex.def)             Requested size: 217.26099pt x 185.9643pt.
 [97]

LaTeX Warning: Hyper reference `QQA.7.16' on page 98 undefined on input line 10
34.


LaTeX Warning: Hyper reference `QQA.7.16' on page 98 undefined on input line 10
54.


LaTeX Warning: Hyper reference `QQA.7.17' on page 98 undefined on input line 10
82.


LaTeX Warning: Hyper reference `QQA.7.17' on page 98 undefined on input line 11
00.


LaTeX Warning: Hyper reference `QQA.7.18' on page 98 undefined on input line 11
27.


LaTeX Warning: Hyper reference `QQA.7.18' on page 98 undefined on input line 12
65.

[98]

LaTeX Warning: Citation `Courtois71' on page 99 undefined on input line 1272.


LaTeX Warning: Citation `WilsonCHsieh92a' on page 99 undefined on input line 12
96.


LaTeX Warning: Citation `Snaman87' on page 99 undefined on input line 1362.

[99]

LaTeX Warning: Hyper reference `QQA.7.19' on page 100 undefined on input line 1
410.


LaTeX Warning: Hyper reference `QQA.7.19' on page 100 undefined on input line 1
421.


LaTeX Warning: Citation `MargaretAEllis1990Cplusplus' on page 100 undefined on 
input line 1443.

<locking/rnplock.pdf, id=3605, 217.26147pt x 208.07007pt>
File: locking/rnplock.pdf Graphic file (type pdf)

<use locking/rnplock.pdf>
Package pdftex.def Info: locking/rnplock.pdf used on input line 1484.
(pdftex.def)             Requested size: 217.26093pt x 208.06955pt.
 [100 <./locking/rnplock.pdf>]
Underfull \vbox (badness 1490) has occurred while \output is active []



LaTeX Warning: Hyper reference `QQA.7.20' on page 101 undefined on input line 1
579.


LaTeX Warning: Hyper reference `QQA.7.20' on page 101 undefined on input line 1
591.


LaTeX Warning: Hyper reference `QQA.7.21' on page 101 undefined on input line 1
593.


LaTeX Warning: Hyper reference `QQA.7.21' on page 101 undefined on input line 1
604.


LaTeX Warning: Citation `OpenGroup1997pthreads' on page 101 undefined on input 
line 1618.


LaTeX Warning: Citation `Butenhof1997pthreads' on page 101 undefined on input l
ine 1618.


Underfull \hbox (badness 10000) in paragraph at lines 1623--1623
[]\T1/ptm/b/n/12 Sample Exclusive-Locking Im-ple-
 []


Underfull \hbox (badness 6641) in paragraph at lines 1623--1623
\T1/ptm/b/n/12 men-ta-tion Based on Atomic Ex-
 []

[101]

LaTeX Warning: Hyper reference `QQA.7.22' on page 102 undefined on input line 1
659.


LaTeX Warning: Hyper reference `QQA.7.22' on page 102 undefined on input line 1
667.


LaTeX Warning: Hyper reference `QQA.7.23' on page 102 undefined on input line 1
679.


LaTeX Warning: Hyper reference `QQA.7.23' on page 102 undefined on input line 1
694.


LaTeX Warning: Hyper reference `QQA.7.24' on page 102 undefined on input line 1
701.


LaTeX Warning: Hyper reference `QQA.7.24' on page 102 undefined on input line 1
712.


LaTeX Warning: Citation `Segall84' on page 102 undefined on input line 1714.


LaTeX Warning: Citation `MellorCrummey91a' on page 102 undefined on input line 
1723.


LaTeX Warning: Citation `McKenney96a' on page 102 undefined on input line 1725.



LaTeX Warning: Citation `MellorCrummey91a' on page 102 undefined on input line 
1734.


LaTeX Warning: Citation `Anderson90' on page 102 undefined on input line 1768.


LaTeX Warning: Citation `Graunke90' on page 102 undefined on input line 1768.


LaTeX Warning: Citation `MellorCrummey91a' on page 102 undefined on input line 
1768.


LaTeX Warning: Citation `Wisniewski94' on page 102 undefined on input line 1768
.


LaTeX Warning: Citation `Craig93' on page 102 undefined on input line 1768.


LaTeX Warning: Citation `Magnusson94' on page 102 undefined on input line 1768.



LaTeX Warning: Citation `Takada93' on page 102 undefined on input line 1768.


LaTeX Warning: Citation `McKenney02e' on page 102 undefined on input line 1782.



LaTeX Warning: Citation `radovic03hierarchical' on page 102 undefined on input 
line 1782.


LaTeX Warning: Citation `radovic02efficient' on page 102 undefined on input lin
e 1782.


LaTeX Warning: Citation `BenJackson02' on page 102 undefined on input line 1782
.


LaTeX Warning: Citation `McKenney02d' on page 102 undefined on input line 1782.



LaTeX Warning: Citation `BengHongLim94' on page 102 undefined on input line 179
2.


LaTeX Warning: Citation `LukeBrowning2005SimpleLockNUMAAware' on page 102 undef
ined on input line 1798.

[102]

LaTeX Warning: Citation `Lampson1980Mesa' on page 103 undefined on input line 1
810.


LaTeX Warning: Citation `Sha1990IEEETransComp' on page 103 undefined on input l
ine 1812.


LaTeX Warning: Citation `JonathanCorbet2006PriorityInheritance' on page 103 und
efined on input line 1812.


LaTeX Warning: Citation `Yodaiken2004FSM' on page 103 undefined on input line 1
814.


LaTeX Warning: Citation `DougLocke2002a' on page 103 undefined on input line 18
14.


LaTeX Warning: Citation `Kontothanassis97a' on page 103 undefined on input line
 1820.


LaTeX Warning: Citation `HubertusFrancke2002Futex' on page 103 undefined on inp
ut line 1829.


LaTeX Warning: Citation `IngoMolnar2006RobustFutexes' on page 103 undefined on 
input line 1829.


LaTeX Warning: Citation `StevenRostedt2006piFutexes' on page 103 undefined on i
nput line 1829.


LaTeX Warning: Citation `UlrichDrepper2011Futexes' on page 103 undefined on inp
ut line 1829.


LaTeX Warning: Citation `Dijkstra65a' on page 103 undefined on input line 1832.



LaTeX Warning: Citation `Lamport74a' on page 103 undefined on input line 1832.


LaTeX Warning: Citation `HerlihyShavit2008Textbook' on page 103 undefined on in
put line 1835.


Underfull \hbox (badness 1264) in paragraph at lines 1831--1841
[]\T1/ptm/m/n/10 (+20) Interestingly enough, atomic in-struc-tions are not
 []


LaTeX Warning: Citation `Gamsa99' on page 103 undefined on input line 1842.


LaTeX Warning: Hyper reference `QQA.7.25' on page 103 undefined on input line 1
866.


LaTeX Warning: Hyper reference `QQA.7.25' on page 103 undefined on input line 1
900.


LaTeX Warning: Hyper reference `QQA.7.26' on page 103 undefined on input line 1
902.


LaTeX Warning: Hyper reference `QQA.7.26' on page 103 undefined on input line 1
908.


LaTeX Warning: Citation `Gamsa99' on page 103 undefined on input line 1915.


LaTeX Warning: Citation `McKenney93' on page 103 undefined on input line 1918.

(./locking/locking-existence.tex

LaTeX Warning: Citation `Gamsa99' on page 103 undefined on input line 33.

[103]

LaTeX Warning: Hyper reference `QQA.7.27' on page 104 undefined on input line 5
5.


LaTeX Warning: Hyper reference `QQA.7.27' on page 104 undefined on input line 7
7.


LaTeX Warning: Hyper reference `QQA.7.28' on page 104 undefined on input line 1
00.


LaTeX Warning: Hyper reference `QQA.7.28' on page 104 undefined on input line 1
09.


LaTeX Warning: Hyper reference `QQA.7.29' on page 104 undefined on input line 1
11.


LaTeX Warning: Hyper reference `QQA.7.29' on page 104 undefined on input line 1
35.


LaTeX Warning: Citation `Shavit95' on page 104 undefined on input line 179.


LaTeX Warning: Citation `DaveDice2006DISC' on page 104 undefined on input line 
179.

) [104]

LaTeX Warning: Citation `JonathanCorbet2006lockdep' on page 105 undefined on in
put line 1971.


LaTeX Warning: Citation `JonathanCorbet2004sparse' on page 105 undefined on inp
ut line 1972.


LaTeX Warning: Citation `ValgrindHomePage' on page 105 undefined on input line 
1973.


LaTeX Warning: Citation `LinuxKernelPerfWiki' on page 105 undefined on input li
ne 1974.


LaTeX Warning: Citation `OProfileHomePage' on page 105 undefined on input line 
1974.


LaTeX Warning: Citation `TheOpenGroup1997SUS' on page 105 undefined on input li
ne 2056.

[105]
Underfull \hbox (badness 2042) in paragraph at lines 2066--2069
\T1/ptm/m/n/10 (+20) syn-chro-niza-tion, as will be dis-cussed in Sec-
 []


LaTeX Warning: Citation `ChristophMKirsch2012FIFOisntTR' on page 106 undefined 
on input line 2079.


LaTeX Warning: Citation `MathieuDesnoyers2009URCU' on page 106 undefined on inp
ut line 2079.


LaTeX Warning: Citation `MichaelScott96' on page 106 undefined on input line 20
79.


Underfull \vbox (badness 1087) has occurred while \output is active []

 [106]

LaTeX Warning: Citation `JonathanCorbet2006lockdep' on page 107 undefined on in
put line 2172.


LaTeX Warning: Citation `StevenRostedt2011locdepCryptic' on page 107 undefined 
on input line 2174.

[107]

LaTeX Warning: Citation `HagitAttiya2011LawsOfOrder' on page 108 undefined on i
nput line 2287.


LaTeX Warning: Citation `Attiya:2011:LOE:1925844.1926442' on page 108 undefined
 on input line 2287.


LaTeX Warning: Citation `PaulEMcKenney2011SNC' on page 108 undefined on input l
ine 2287.

[108]) (./owned/owned.tex [109

] [110

]
Chapter 8.

LaTeX Warning: Hyper reference `QQA.8.1' on page 111 undefined on input line 26
.


LaTeX Warning: Hyper reference `QQA.8.1' on page 111 undefined on input line 34
.


Underfull \vbox (badness 10000) has occurred while \output is active []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 61--72
[][]
 []


LaTeX Warning: Hyper reference `QQA.8.2' on page 111 undefined on input line 81
.


LaTeX Warning: Hyper reference `QQA.8.2' on page 111 undefined on input line 11
1.


LaTeX Warning: Hyper reference `QQA.8.3' on page 111 undefined on input line 11
3.


LaTeX Warning: Hyper reference `QQA.8.3' on page 111 undefined on input line 13
2.


Underfull \hbox (badness 2753) in paragraph at lines 141--141
[]\T1/ptm/b/n/14.4 Partial Data Own-er-ship and
 []

[111]

LaTeX Warning: Hyper reference `QQA.8.4' on page 112 undefined on input line 16
0.


LaTeX Warning: Hyper reference `QQA.8.4' on page 112 undefined on input line 17
3.


Underfull \hbox (badness 1540) in paragraph at lines 202--216
[]\T1/ptm/m/n/10 (+20) The []\T1/pcrs/m/n/10 _[]_[]_[][][][] \T1/ptm/m/n/10 (+2
0) func-tion is a
 []


Underfull \hbox (badness 3612) in paragraph at lines 202--216
\T1/ptm/m/n/10 (+20) sig-nal han-dler that acts as the shipped func-tion.
 []


LaTeX Warning: Hyper reference `QQA.8.5' on page 112 undefined on input line 21
7.


LaTeX Warning: Hyper reference `QQA.8.5' on page 112 undefined on input line 23
5.


LaTeX Warning: Hyper reference `QQA.8.6' on page 112 undefined on input line 25
4.


LaTeX Warning: Hyper reference `QQA.8.6' on page 112 undefined on input line 27
5.


Underfull \hbox (badness 1533) in paragraph at lines 254--276
[]\T1/ptm/b/n/10 Quick Quiz 8.6:[] \T1/ptm/m/n/10 (+20) But none of the data in
 the
 []


LaTeX Warning: Hyper reference `QQA.8.7' on page 112 undefined on input line 31
1.


LaTeX Warning: Hyper reference `QQA.8.7' on page 112 undefined on input line 32
9.


Underfull \vbox (badness 5231) has occurred while \output is active []

 [112]

LaTeX Warning: Citation `MPIForum2008' on page 113 undefined on input line 347.



LaTeX Warning: Citation `BOINC2008' on page 113 undefined on input line 348.


LaTeX Warning: Citation `MapReduce2008MIT' on page 113 undefined on input line 
349.


LaTeX Warning: Citation `NormMatloff2013ParProcBook' on page 113 undefined on i
nput line 361.


LaTeX Warning: Citation `AMD2017OpenCL' on page 113 undefined on input line 361
.


LaTeX Warning: Citation `NVidia2017GPGPU' on page 113 undefined on input line 3
61.


LaTeX Warning: Citation `NVidia2017GPGPU-university' on page 113 undefined on i
nput line 361.

) (./defer/defer.tex [113

] [114

]
Chapter 9.

LaTeX Warning: Citation `Kung80' on page 115 undefined on input line 12.


LaTeX Warning: Citation `HMassalinPhD' on page 115 undefined on input line 12.


LaTeX Warning: Citation `VanJacobson88' on page 115 undefined on input line 38.


<defer/RouteList.pdf, id=3866, 187.45035pt x 89.17328pt>
File: defer/RouteList.pdf Graphic file (type pdf)

<use defer/RouteList.pdf>
Package pdftex.def Info: defer/RouteList.pdf used on input line 66.
(pdftex.def)             Requested size: 187.44987pt x 89.17305pt.
 [115 <./defer/RouteList.pdf>] (./defer/refcnt.tex

LaTeX Warning: Citation `Weizenbaum:1963:SLP:367593.367617' on page 116 undefin
ed on input line 124.


Underfull \vbox (badness 10000) has occurred while \output is active []

 [116]

LaTeX Warning: Hyper reference `QQA.9.1' on page 117 undefined on input line 15
9.


LaTeX Warning: Hyper reference `QQA.9.1' on page 117 undefined on input line 17
5.


LaTeX Warning: Hyper reference `QQA.9.2' on page 117 undefined on input line 18
4.


LaTeX Warning: Hyper reference `QQA.9.2' on page 117 undefined on input line 19
2.

<CodeSamples/defer/perf-refcnt.pdf, id=3901, 237.68994pt x 202.71736pt>
File: CodeSamples/defer/perf-refcnt.pdf Graphic file (type pdf)

<use CodeSamples/defer/perf-refcnt.pdf>
Package pdftex.def Info: CodeSamples/defer/perf-refcnt.pdf used on input line 1
96.
(pdftex.def)             Requested size: 237.68935pt x 202.71686pt.


LaTeX Warning: Hyper reference `QQA.9.3' on page 117 undefined on input line 21
9.


LaTeX Warning: Hyper reference `QQA.9.3' on page 117 undefined on input line 23
4.


LaTeX Warning: Hyper reference `QQA.9.4' on page 117 undefined on input line 23
6.


LaTeX Warning: Hyper reference `QQA.9.4' on page 117 undefined on input line 24
6.

[117 <./CodeSamples/defer/perf-refcnt.pdf>]
Underfull \hbox (badness 10000) in paragraph at lines 275--279
[]\T1/ptm/m/n/10 (+20) Thread A con-tin-ues ex-e-cu-tion of []\T1/pcrs/m/n/10 _

 []


LaTeX Warning: Citation `Gamsa99' on page 118 undefined on input line 285.


LaTeX Warning: Citation `Valois95a' on page 118 undefined on input line 290.


LaTeX Warning: Citation `MagedMichael95a' on page 118 undefined on input line 2
91.


LaTeX Warning: Citation `ThomasEHart2007a' on page 118 undefined on input line 
292.


LaTeX Warning: Hyper reference `QQA.9.5' on page 118 undefined on input line 29
7.


LaTeX Warning: Hyper reference `QQA.9.5' on page 118 undefined on input line 31
0.

) (./defer/hazptr.tex

LaTeX Warning: Citation `MagedMichael04a' on page 118 undefined on input line 1
3.


LaTeX Warning: Citation `HerlihyLM02' on page 118 undefined on input line 14.


LaTeX Warning: Hyper reference `QQA.9.6' on page 118 undefined on input line 74
.


LaTeX Warning: Hyper reference `QQA.9.6' on page 118 undefined on input line 84
.

[118]

LaTeX Warning: Hyper reference `QQA.9.7' on page 119 undefined on input line 86
.


LaTeX Warning: Hyper reference `QQA.9.7' on page 119 undefined on input line 13
1.


LaTeX Warning: Hyper reference `QQA.9.8' on page 119 undefined on input line 13
3.


LaTeX Warning: Hyper reference `QQA.9.8' on page 119 undefined on input line 15
1.


LaTeX Warning: Hyper reference `QQA.9.9' on page 119 undefined on input line 15
8.


LaTeX Warning: Hyper reference `QQA.9.9' on page 119 undefined on input line 16
4.


LaTeX Warning: Citation `ThomasEHart2007a' on page 119 undefined on input line 
179.


LaTeX Warning: Citation `McKenney:2013:SDS:2483852.2483867' on page 119 undefin
ed on input line 179.


LaTeX Warning: Citation `MagedMichael04a' on page 119 undefined on input line 1
79.

<CodeSamples/defer/perf-hazptr.pdf, id=3957, 237.68994pt x 202.71736pt>
File: CodeSamples/defer/perf-hazptr.pdf Graphic file (type pdf)

<use CodeSamples/defer/perf-hazptr.pdf>
Package pdftex.def Info: CodeSamples/defer/perf-hazptr.pdf used on input line 3
15.
(pdftex.def)             Requested size: 237.68935pt x 202.71686pt.


LaTeX Warning: Hyper reference `QQA.9.10' on page 119 undefined on input line 3
33.


LaTeX Warning: Citation `McKenney:2013:SDS:2483852.2483867' on page 119 undefin
ed on input line 335.


LaTeX Warning: Hyper reference `QQA.9.10' on page 119 undefined on input line 3
61.

) (./defer/seqlock.tex
<cartoons/r-2014-Start-over.pdf, id=3961, 461.66576pt x 363.1824pt>
File: cartoons/r-2014-Start-over.pdf Graphic file (type pdf)

<use cartoons/r-2014-Start-over.pdf>
Package pdftex.def Info: cartoons/r-2014-Start-over.pdf used on input line 8.
(pdftex.def)             Requested size: 461.66461pt x 363.18152pt.

Underfull \vbox (badness 10000) has occurred while \output is active []

 [119]

LaTeX Warning: Hyper reference `QQA.9.11' on page 120 undefined on input line 2
3.


LaTeX Warning: Hyper reference `QQA.9.11' on page 120 undefined on input line 4
8.

[120 <./CodeSamples/defer/perf-hazptr.pdf> <./cartoons/r-2014-Start-over.pdf>]

LaTeX Warning: Hyper reference `QQA.9.12' on page 121 undefined on input line 1
71.


LaTeX Warning: Hyper reference `QQA.9.12' on page 121 undefined on input line 1
84.


LaTeX Warning: Hyper reference `QQA.9.13' on page 121 undefined on input line 1
94.


LaTeX Warning: Hyper reference `QQA.9.13' on page 121 undefined on input line 2
05.


LaTeX Warning: Hyper reference `QQA.9.14' on page 121 undefined on input line 2
07.


LaTeX Warning: Hyper reference `QQA.9.14' on page 121 undefined on input line 2
20.


LaTeX Warning: Hyper reference `QQA.9.15' on page 121 undefined on input line 2
22.


LaTeX Warning: Hyper reference `QQA.9.15' on page 121 undefined on input line 2
31.


LaTeX Warning: Hyper reference `QQA.9.16' on page 121 undefined on input line 2
40.


LaTeX Warning: Hyper reference `QQA.9.16' on page 121 undefined on input line 2
46.


LaTeX Warning: Hyper reference `QQA.9.17' on page 121 undefined on input line 2
48.


LaTeX Warning: Hyper reference `QQA.9.17' on page 121 undefined on input line 2
88.


Underfull \hbox (badness 1596) in paragraph at lines 389--397
\T1/ptm/m/n/10 (+20) shows []\T1/pcrs/m/n/10 _[][][][] \T1/ptm/m/n/10 (+20) and
 []\T1/pcrs/m/n/10 _[][][][] \T1/ptm/m/n/10 (+20) ($\T1/pcrs/m/n/10 route _
 []

[121] <CodeSamples/defer/perf-seqlock.pdf, id=4033, 237.68994pt x 202.71736pt>
File: CodeSamples/defer/perf-seqlock.pdf Graphic file (type pdf)

<use CodeSamples/defer/perf-seqlock.pdf>
Package pdftex.def Info: CodeSamples/defer/perf-seqlock.pdf used on input line 
414.
(pdftex.def)             Requested size: 237.68935pt x 202.71686pt.


LaTeX Warning: Hyper reference `QQA.9.18' on page 122 undefined on input line 4
28.


LaTeX Warning: Hyper reference `QQA.9.18' on page 122 undefined on input line 4
65.

) (./defer/rcu.tex [122] (./defer/rcuintro.tex
<defer/RCUListInsertClassic.pdf, id=4052, 202.35599pt x 281.85301pt>
File: defer/RCUListInsertClassic.pdf Graphic file (type pdf)

<use defer/RCUListInsertClassic.pdf>
Package pdftex.def Info: defer/RCUListInsertClassic.pdf used on input line 20.
(pdftex.def)             Requested size: 202.35548pt x 281.85233pt.
 [123 <./CodeSamples/defer/perf-seqlock.pdf> <./defer/RCUListInsertClassic.pdf>
]
<defer/RCUListDeleteClassic.pdf, id=4084, 205.9153pt x 259.17828pt>
File: defer/RCUListDeleteClassic.pdf Graphic file (type pdf)

<use defer/RCUListDeleteClassic.pdf>
Package pdftex.def Info: defer/RCUListDeleteClassic.pdf used on input line 54.
(pdftex.def)             Requested size: 205.91478pt x 259.17764pt.

<defer/QSBRGracePeriod.pdf, id=4095, 204.1808pt x 206.94313pt>
File: defer/QSBRGracePeriod.pdf Graphic file (type pdf)

<use defer/QSBRGracePeriod.pdf>
Package pdftex.def Info: defer/QSBRGracePeriod.pdf used on input line 135.
(pdftex.def)             Requested size: 204.18028pt x 206.94261pt.
 [124 <./defer/RCUListDeleteClassic.pdf>]

LaTeX Warning: Citation `ThomasEHart2006a' on page 125 undefined on input line 
141.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 150--158
[][]
 []

) (./defer/rcufundamental.tex

LaTeX Warning: Hyper reference `QQA.9.19' on page 125 undefined on input line 2
9.


LaTeX Warning: Hyper reference `QQA.9.19' on page 125 undefined on input line 4
4.


Underfull \vbox (badness 1057) has occurred while \output is active []

 [125 <./defer/QSBRGracePeriod.pdf>]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 120--130
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 141--151
[][]
 []


LaTeX Warning: Citation `PaulMcKenney2005i' on page 126 undefined on input line
 154.


LaTeX Warning: Citation `PaulMcKenney2005j' on page 126 undefined on input line
 154.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 181--193
[][]
 []

<defer/Linux_list.pdf, id=4143, 226.3135pt x 59.18733pt>
File: defer/Linux_list.pdf Graphic file (type pdf)

<use defer/Linux_list.pdf>
Package pdftex.def Info: defer/Linux_list.pdf used on input line 211.
(pdftex.def)             Requested size: 226.31294pt x 59.18718pt.

<defer/Linux_list_abbr.pdf, id=4144, 135.95778pt x 13.99898pt>
File: defer/Linux_list_abbr.pdf Graphic file (type pdf)

<use defer/Linux_list_abbr.pdf>
Package pdftex.def Info: defer/Linux_list_abbr.pdf used on input line 218.
(pdftex.def)             Requested size: 135.95744pt x 13.99893pt.

Underfull \hbox (badness 10000) in paragraph at lines 223--241
[]\T1/ptm/m/n/10 (+20) Although []\T1/pcrs/m/n/10 _[]_[][][][] \T1/ptm/m/n/10 (
+20) and []\T1/pcrs/m/n/10 _
 []


Underfull \hbox (badness 3219) in paragraph at lines 223--241
\T1/ptm/m/n/10 (+20) any con-ceiv-able RCU-protected data struc-ture, in
 []


Underfull \hbox (badness 4569) in paragraph at lines 223--241
[][][][] \T1/ptm/m/n/10 (+20) prim-i-tives have been em-bed-ded
 []

[126 <./defer/Linux_list.pdf>]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 281--292
[][]
 []


LaTeX Warning: Hyper reference `QQA.9.20' on page 127 undefined on input line 2
98.


LaTeX Warning: Hyper reference `QQA.9.20' on page 127 undefined on input line 3
13.

<defer/Linux_hlist.pdf, id=4160, 190.16028pt x 41.10023pt>
File: defer/Linux_hlist.pdf Graphic file (type pdf)

<use defer/Linux_hlist.pdf>
Package pdftex.def Info: defer/Linux_hlist.pdf used on input line 317.
(pdftex.def)             Requested size: 190.1598pt x 41.10013pt.

Overfull \hbox (10.00002pt too wide) in paragraph at lines 370--381
[][]
 []

[127 <./defer/Linux_list_abbr.pdf> <./defer/Linux_hlist.pdf>]

LaTeX Warning: Citation `PaulEMcKenney2006c' on page 128 undefined on input lin
e 446.


LaTeX Warning: Citation `PaulEMcKenney2007whatisRCU' on page 128 undefined on i
nput line 453.


LaTeX Warning: Citation `PaulEMcKenney2007PreemptibleRCU' on page 128 undefined
 on input line 453.

<defer/GracePeriodGood.pdf, id=4183, 217.26147pt x 131.38786pt>
File: defer/GracePeriodGood.pdf Graphic file (type pdf)

<use defer/GracePeriodGood.pdf>
Package pdftex.def Info: defer/GracePeriodGood.pdf used on input line 457.
(pdftex.def)             Requested size: 217.26093pt x 131.38753pt.
 [128 <./defer/GracePeriodGood.pdf>]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 567--579
[][]
 []

<defer/RCUDeletion.pdf, id=4205, 217.26154pt x 246.1697pt>
File: defer/RCUDeletion.pdf Graphic file (type pdf)

<use defer/RCUDeletion.pdf>
Package pdftex.def Info: defer/RCUDeletion.pdf used on input line 582.
(pdftex.def)             Requested size: 217.26099pt x 246.16908pt.

Underfull \vbox (badness 1406) has occurred while \output is active []

 [129 <./defer/RCUDeletion.pdf>]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 647--660
[][]
 []

<defer/RCUReplacement.pdf, id=4222, 217.26154pt x 556.02444pt>
File: defer/RCUReplacement.pdf Graphic file (type pdf)

<use defer/RCUReplacement.pdf>
Package pdftex.def Info: defer/RCUReplacement.pdf used on input line 663.
(pdftex.def)             Requested size: 217.26099pt x 556.02309pt.
 [130 <./defer/RCUReplacement.pdf>]

LaTeX Warning: Hyper reference `QQA.9.21' on page 131 undefined on input line 7
43.


LaTeX Warning: Hyper reference `QQA.9.21' on page 131 undefined on input line 7
73.


LaTeX Warning: Hyper reference `QQA.9.22' on page 131 undefined on input line 7
75.


LaTeX Warning: Hyper reference `QQA.9.22' on page 131 undefined on input line 8
25.


LaTeX Warning: Citation `PaulEdwardMcKenneyPhD' on page 131 undefined on input 
line 831.


LaTeX Warning: Hyper reference `QQA.9.23' on page 131 undefined on input line 8
49.


LaTeX Warning: Hyper reference `QQA.9.23' on page 131 undefined on input line 8
62.

) (./defer/rcuusage.tex [131]
<CodeSamples/defer/perf-rcu.pdf, id=4281, 237.68994pt x 202.71736pt>
File: CodeSamples/defer/perf-rcu.pdf Graphic file (type pdf)

<use CodeSamples/defer/perf-rcu.pdf>
Package pdftex.def Info: CodeSamples/defer/perf-rcu.pdf used on input line 159.

(pdftex.def)             Requested size: 237.68935pt x 202.71686pt.


LaTeX Warning: Citation `MathieuDesnoyers2009URCU' on page 132 undefined on inp
ut line 169.


LaTeX Warning: Citation `PaulMcKenney2013LWNURCU' on page 132 undefined on inpu
t line 169.


LaTeX Warning: Hyper reference `QQA.9.24' on page 132 undefined on input line 1
86.


LaTeX Warning: Hyper reference `QQA.9.24' on page 132 undefined on input line 2
04.


LaTeX Warning: Hyper reference `QQA.9.25' on page 132 undefined on input line 2
06.


LaTeX Warning: Hyper reference `QQA.9.25' on page 132 undefined on input line 2
17.

<CodeSamples/defer/perf-rcu-qsbr.pdf, id=4286, 237.68994pt x 202.71736pt>
File: CodeSamples/defer/perf-rcu-qsbr.pdf Graphic file (type pdf)

<use CodeSamples/defer/perf-rcu-qsbr.pdf>
Package pdftex.def Info: CodeSamples/defer/perf-rcu-qsbr.pdf used on input line
 221.
(pdftex.def)             Requested size: 237.68935pt x 202.71686pt.


LaTeX Warning: Citation `WilsonCHsieh92a' on page 132 undefined on input line 2
33.

[132] <defer/rwlockRCUperf.pdf, id=4301, 238.67166pt x 207.75818pt>
File: defer/rwlockRCUperf.pdf Graphic file (type pdf)

<use defer/rwlockRCUperf.pdf>
Package pdftex.def Info: defer/rwlockRCUperf.pdf used on input line 262.
(pdftex.def)             Requested size: 238.67107pt x 207.75766pt.


LaTeX Warning: Hyper reference `QQA.9.26' on page 133 undefined on input line 2
71.


LaTeX Warning: Hyper reference `QQA.9.26' on page 133 undefined on input line 3
29.

<defer/rwlockRCUperfPREEMPT.pdf, id=4303, 238.67166pt x 207.75818pt>
File: defer/rwlockRCUperfPREEMPT.pdf Graphic file (type pdf)

<use defer/rwlockRCUperfPREEMPT.pdf>
Package pdftex.def Info: defer/rwlockRCUperfPREEMPT.pdf used on input line 340.

(pdftex.def)             Requested size: 238.67107pt x 207.75766pt.

<defer/rwlockRCUperfwtPREEMPT.pdf, id=4305, 238.61748pt x 207.75818pt>
File: defer/rwlockRCUperfwtPREEMPT.pdf Graphic file (type pdf)

<use defer/rwlockRCUperfwtPREEMPT.pdf>
Package pdftex.def Info: defer/rwlockRCUperfwtPREEMPT.pdf used on input line 35
4.
(pdftex.def)             Requested size: 238.61688pt x 207.75766pt.
 [133 <./CodeSamples/defer/perf-rcu.pdf> <./CodeSamples/defer/perf-rcu-qsbr.pdf
> <./defer/rwlockRCUperf.pdf> <./defer/rwlockRCUperfPREEMPT.pdf>]

LaTeX Warning: Hyper reference `QQA.9.27' on page 134 undefined on input line 3
69.


LaTeX Warning: Hyper reference `QQA.9.27' on page 134 undefined on input line 3
78.


Underfull \hbox (badness 1275) in paragraph at lines 384--386
[]\T1/ptm/m/n/10 (+20) In ad-di-tion, as is dis-cussed in the next sec-tion,
 []


LaTeX Warning: Hyper reference `QQA.9.28' on page 134 undefined on input line 4
00.


LaTeX Warning: Hyper reference `QQA.9.28' on page 134 undefined on input line 4
37.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 447--463
[][]
 []


LaTeX Warning: Hyper reference `QQA.9.29' on page 134 undefined on input line 4
74.


LaTeX Warning: Hyper reference `QQA.9.29' on page 134 undefined on input line 4
81.


LaTeX Warning: Citation `PaulEMcKenney2007BoostRCU' on page 134 undefined on in
put line 496.


LaTeX Warning: Citation `DinakarGuniguntala2008IBMSysJ' on page 134 undefined o
n input line 496.

<defer/rwlockRCUupdate.pdf, id=4333, 452.59068pt x 310.68636pt>
File: defer/rwlockRCUupdate.pdf Graphic file (type pdf)

<use defer/rwlockRCUupdate.pdf>
Package pdftex.def Info: defer/rwlockRCUupdate.pdf used on input line 509.
(pdftex.def)             Requested size: 452.58957pt x 310.68558pt.
 [134 <./defer/rwlockRCUperfwtPREEMPT.pdf>]
Underfull \vbox (badness 1226) has occurred while \output is active []



LaTeX Warning: Citation `PaulEdwardMcKenneyPhD' on page 135 undefined on input 
line 563.


LaTeX Warning: Citation `Arcangeli03' on page 135 undefined on input line 563.


LaTeX Warning: Citation `DinakarGuniguntala2008IBMSysJ' on page 135 undefined o
n input line 569.


LaTeX Warning: Citation `PaulEMcKenney2006c' on page 135 undefined on input lin
e 570.


LaTeX Warning: Citation `PaulEMcKenney2007QRCUspin' on page 135 undefined on in
put line 571.


LaTeX Warning: Citation `PaulEMcKenney2007BoostRCU' on page 135 undefined on in
put line 578.


LaTeX Warning: Citation `DinakarGuniguntala2008IBMSysJ' on page 135 undefined o
n input line 578.


Underfull \hbox (badness 1331) in paragraph at lines 569--582
\T1/ptm/b/n/10 Re-claimers[] \T1/ptm/m/n/10 (+20) In Re-al-time RCU [[]], SRCU 
[[]], or
 []


LaTeX Warning: Citation `WikipediaRCU' on page 135 undefined on input line 604.



Underfull \hbox (badness 1635) in paragraph at lines 683--683
[]\T1/ptm/b/n/10 RCU is a Re-stricted Reference-Counting
 []

[135 <./defer/rwlockRCUupdate.pdf>] [136]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 693--703
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 718--731
[][]
 []


LaTeX Warning: Hyper reference `QQA.9.30' on page 137 undefined on input line 7
36.


LaTeX Warning: Hyper reference `QQA.9.30' on page 137 undefined on input line 7
54.

<defer/refRCUperfPREEMPT.pdf, id=4381, 238.67166pt x 207.75818pt>
File: defer/refRCUperfPREEMPT.pdf Graphic file (type pdf)

<use defer/refRCUperfPREEMPT.pdf>
Package pdftex.def Info: defer/refRCUperfPREEMPT.pdf used on input line 762.
(pdftex.def)             Requested size: 238.67107pt x 207.75766pt.


LaTeX Warning: Hyper reference `QQA.9.31' on page 137 undefined on input line 7
72.


LaTeX Warning: Hyper reference `QQA.9.31' on page 137 undefined on input line 7
81.

<defer/refRCUperfwtPREEMPT.pdf, id=4383, 238.61748pt x 207.75818pt>
File: defer/refRCUperfwtPREEMPT.pdf Graphic file (type pdf)

<use defer/refRCUperfwtPREEMPT.pdf>
Package pdftex.def Info: defer/refRCUperfwtPREEMPT.pdf used on input line 785.
(pdftex.def)             Requested size: 238.61688pt x 207.75766pt.


LaTeX Warning: Citation `PaulEMcKenney2006c' on page 137 undefined on input lin
e 822.

[137 <./defer/refRCUperfPREEMPT.pdf> <./defer/refRCUperfwtPREEMPT.pdf>]

LaTeX Warning: Citation `Gamsa99' on page 138 undefined on input line 865.


LaTeX Warning: Hyper reference `QQA.9.32' on page 138 undefined on input line 9
24.


LaTeX Warning: Hyper reference `QQA.9.32' on page 138 undefined on input line 9
35.


LaTeX Warning: Hyper reference `QQA.9.33' on page 138 undefined on input line 9
48.


LaTeX Warning: Hyper reference `QQA.9.33' on page 138 undefined on input line 9
71.

[138]

LaTeX Warning: Hyper reference `QQA.9.34' on page 139 undefined on input line 9
73.


LaTeX Warning: Hyper reference `QQA.9.34' on page 139 undefined on input line 1
007.


LaTeX Warning: Citation `Cheriton96a' on page 139 undefined on input line 1028.



LaTeX Warning: Hyper reference `QQA.9.35' on page 139 undefined on input line 1
039.


LaTeX Warning: Hyper reference `QQA.9.35' on page 139 undefined on input line 1
068.


LaTeX Warning: Citation `LaninShasha1986TSM' on page 139 undefined on input lin
e 1072.


LaTeX Warning: Citation `PaulEdwardMcKenneyPhD' on page 139 undefined on input 
line 1103.

[139]

LaTeX Warning: Hyper reference `QQA.9.36' on page 140 undefined on input line 1
207.


LaTeX Warning: Hyper reference `QQA.9.36' on page 140 undefined on input line 1
263.

<defer/RCUApplicability.pdf, id=4433, 874.57796pt x 536.57556pt>
File: defer/RCUApplicability.pdf Graphic file (type pdf)

<use defer/RCUApplicability.pdf>
Package pdftex.def Info: defer/RCUApplicability.pdf used on input line 1292.
(pdftex.def)             Requested size: 874.57582pt x 536.57423pt.
 [140 <./defer/RCUApplicability.pdf>]

LaTeX Warning: Citation `MathieuDesnoyers2012URCU' on page 141 undefined on inp
ut line 1350.


Underfull \vbox (badness 1668) has occurred while \output is active []

)
(./defer/rcuapi.tex
Overfull \hbox (2.28922pt too wide) in paragraph at lines 121--121
[]\T1/pcrs/m/n/7 SLAB_DESTROY_BY_RCU|  
 []


Overfull \hbox (2.28922pt too wide) in paragraph at lines 121--121
[]\T1/pcrs/m/n/7 SLAB_DESTROY_BY_RCU|  
 []


LaTeX Warning: Hyper reference `QQA.9.37' on page 141 undefined on input line 1
49.


LaTeX Warning: Hyper reference `QQA.9.37' on page 141 undefined on input line 1
60.


LaTeX Warning: Citation `PaulEMcKenney2007rcubarrier' on page 141 undefined on 
input line 180.


LaTeX Warning: Citation `PaulEMcKenney2008HierarchicalRCU' on page 141 undefine
d on input line 183.


Underfull \hbox (badness 2189) in paragraph at lines 162--185
[]\T1/ptm/m/n/10 (+20) The ``RCU Clas-sic'' col-umn cor-re-sponds to the
 []


Underfull \hbox (badness 1424) in paragraph at lines 162--185
\T1/ptm/m/n/10 (+20) side crit-i-cal sec-tions are de-lim-ited by []\T1/pcrs/m/
n/10 _[]_
 []

[141] [142]

LaTeX Warning: Citation `Cheriton96a' on page 143 undefined on input line 187.


LaTeX Warning: Hyper reference `QQA.9.38' on page 143 undefined on input line 2
10.


LaTeX Warning: Hyper reference `QQA.9.38' on page 143 undefined on input line 2
22.


LaTeX Warning: Hyper reference `QQA.9.39' on page 143 undefined on input line 2
24.


LaTeX Warning: Hyper reference `QQA.9.39' on page 143 undefined on input line 2
34.


LaTeX Warning: Hyper reference `QQA.9.40' on page 143 undefined on input line 2
42.


LaTeX Warning: Hyper reference `QQA.9.40' on page 143 undefined on input line 2
63.


LaTeX Warning: Hyper reference `QQA.9.41' on page 143 undefined on input line 2
65.


LaTeX Warning: Hyper reference `QQA.9.41' on page 143 undefined on input line 2
75.


LaTeX Warning: Hyper reference `QQA.9.42' on page 143 undefined on input line 2
89.


LaTeX Warning: Hyper reference `QQA.9.42' on page 143 undefined on input line 3
08.


LaTeX Warning: Hyper reference `QQA.9.43' on page 143 undefined on input line 3
10.


LaTeX Warning: Hyper reference `QQA.9.43' on page 143 undefined on input line 3
26.


LaTeX Warning: Citation `PaulEMcKenney2007PreemptibleRCU' on page 143 undefined
 on input line 332.


LaTeX Warning: Citation `PaulEMcKenney2006c' on page 143 undefined on input lin
e 338.


LaTeX Warning: Hyper reference `QQA.9.44' on page 143 undefined on input line 3
52.


LaTeX Warning: Hyper reference `QQA.9.44' on page 143 undefined on input line 3
61.


LaTeX Warning: Hyper reference `QQA.9.45' on page 143 undefined on input line 3
63.


LaTeX Warning: Hyper reference `QQA.9.45' on page 143 undefined on input line 3
96.


Underfull \hbox (badness 2503) in paragraph at lines 363--397
[]\T1/ptm/b/n/10 Quick Quiz 9.45:[] \T1/ptm/m/n/10 (+20) Un-der what con-di-tio
ns can
 []

[143]
Underfull \hbox (badness 1354) in paragraph at lines 442--442
[]\T1/ptm/b/n/10 RCU has Publish-Subscribe and Version-
 []


LaTeX Warning: Citation `Spraul01' on page 144 undefined on input line 455.


Underfull \hbox (badness 1502) in paragraph at lines 532--556
[]\T1/pcrs/m/n/10 _[][][][]\T1/ptm/m/n/10 (+20) , []\T1/pcrs/m/n/10 _[]_[]_[][]
[][]\T1/ptm/m/n/10 (+20) , and []\T1/pcrs/m/n/10 _
 []


LaTeX Warning: Hyper reference `QQA.9.46' on page 144 undefined on input line 5
57.


LaTeX Warning: Hyper reference `QQA.9.46' on page 144 undefined on input line 5
65.


Underfull \hbox (badness 1028) in paragraph at lines 567--576
\T1/ptm/m/n/10 (+20) ad-van-tage of [][][][]\T1/pcrs/m/n/10 _[][][] \T1/ptm/m/n
/10 (+20) over [][]
 []


LaTeX Warning: Hyper reference `QQA.9.47' on page 144 undefined on input line 5
90.


LaTeX Warning: Hyper reference `QQA.9.47' on page 144 undefined on input line 6
09.


LaTeX Warning: Hyper reference `QQA.9.48' on page 144 undefined on input line 6
11.


LaTeX Warning: Hyper reference `QQA.9.48' on page 144 undefined on input line 6
44.


Underfull \vbox (badness 1668) has occurred while \output is active []

 [144]
<defer/RCUenvAPI.pdf, id=4513, 216.01503pt x 149.50523pt>
File: defer/RCUenvAPI.pdf Graphic file (type pdf)

<use defer/RCUenvAPI.pdf>
Package pdftex.def Info: defer/RCUenvAPI.pdf used on input line 651.
(pdftex.def)             Requested size: 216.0145pt x 149.50487pt.
LaTeX Font Info:    Font shape `T1/ptm/bx/it' in size <10> not available
(Font)              Font shape `T1/ptm/b/it' tried instead on input line 671.
) (./defer/toyrcu.tex

LaTeX Warning: Citation `MathieuDesnoyers2009URCU' on page 145 undefined on inp
ut line 9.

[145 <./defer/RCUenvAPI.pdf>]

LaTeX Warning: Hyper reference `QQA.9.49' on page 146 undefined on input line 8
9.


LaTeX Warning: Hyper reference `QQA.9.49' on page 146 undefined on input line 1
41.


LaTeX Warning: Hyper reference `QQA.9.50' on page 146 undefined on input line 1
43.


LaTeX Warning: Hyper reference `QQA.9.50' on page 146 undefined on input line 1
58.

[146]

LaTeX Warning: Hyper reference `QQA.9.51' on page 147 undefined on input line 2
24.


LaTeX Warning: Hyper reference `QQA.9.51' on page 147 undefined on input line 2
33.


LaTeX Warning: Hyper reference `QQA.9.52' on page 147 undefined on input line 2
35.


LaTeX Warning: Hyper reference `QQA.9.52' on page 147 undefined on input line 2
67.


LaTeX Warning: Hyper reference `QQA.9.53' on page 147 undefined on input line 2
69.


LaTeX Warning: Hyper reference `QQA.9.53' on page 147 undefined on input line 2
82.


LaTeX Warning: Citation `Molnar00a' on page 147 undefined on input line 286.


Underfull \hbox (badness 1331) in paragraph at lines 327--345
[]\T1/pcrs/m/n/10 _[][][][] \T1/ptm/m/n/10 (+20) prim-i-tive atom-i-cally in-cr
e-ments this
 []


Underfull \vbox (badness 10000) has occurred while \output is active []



LaTeX Warning: Hyper reference `QQA.9.54' on page 147 undefined on input line 3
55.


LaTeX Warning: Hyper reference `QQA.9.54' on page 147 undefined on input line 3
67.


Underfull \hbox (badness 1331) in paragraph at lines 369--381
[]\T1/pcrs/m/n/10 _[]_[][][][] \T1/ptm/m/n/10 (+20) and []\T1/pcrs/m/n/10 _[]_[
][][][] \T1/ptm/m/n/10 (+20) are
 []


LaTeX Warning: Hyper reference `QQA.9.55' on page 147 undefined on input line 3
82.


LaTeX Warning: Hyper reference `QQA.9.55' on page 147 undefined on input line 3
95.

[147]

LaTeX Warning: Hyper reference `QQA.9.56' on page 148 undefined on input line 4
11.


LaTeX Warning: Hyper reference `QQA.9.56' on page 148 undefined on input line 4
28.


Underfull \hbox (badness 5460) in paragraph at lines 547--557
\T1/ptm/m/n/10 (+20) atom-i-cally in-cre-ments the mem-ber of the []\T1/pcrs/m/
n/10 _
 []

[148]

LaTeX Warning: Hyper reference `QQA.9.57' on page 149 undefined on input line 6
31.


LaTeX Warning: Hyper reference `QQA.9.57' on page 149 undefined on input line 6
54.


LaTeX Warning: Hyper reference `QQA.9.58' on page 149 undefined on input line 6
56.


LaTeX Warning: Hyper reference `QQA.9.58' on page 149 undefined on input line 7
07.


LaTeX Warning: Hyper reference `QQA.9.59' on page 149 undefined on input line 7
49.


LaTeX Warning: Hyper reference `QQA.9.59' on page 149 undefined on input line 7
60.

[149]
Underfull \hbox (badness 4454) in paragraph at lines 825--825
[]\T1/ptm/m/n/10 (+20) Figure 9.54: RCU Read-Side Us-ing Per-Thread
 []


LaTeX Warning: Hyper reference `QQA.9.60' on page 150 undefined on input line 8
44.


LaTeX Warning: Hyper reference `QQA.9.60' on page 150 undefined on input line 8
60.

[150]

LaTeX Warning: Hyper reference `QQA.9.61' on page 151 undefined on input line 9
26.


LaTeX Warning: Hyper reference `QQA.9.61' on page 151 undefined on input line 9
48.


Underfull \hbox (badness 4454) in paragraph at lines 993--993
[]\T1/ptm/m/n/10 (+20) Figure 9.56: RCU Read-Side Us-ing Per-Thread
 []


Underfull \hbox (badness 4454) in paragraph at lines 1032--1032
[]\T1/ptm/m/n/10 (+20) Figure 9.57: RCU Read-Side Us-ing Per-Thread
 []

[151]

LaTeX Warning: Citation `PaulEMcKenney2007PreemptibleRCU' on page 152 undefined
 on input line 1150.


Underfull \hbox (badness 4229) in paragraph at lines 1167--1178
[]\T1/ptm/m/n/10 (+20) As with the im-ple-men-ta-tion de-scribed in Sec-
 []


LaTeX Warning: Hyper reference `QQA.9.62' on page 152 undefined on input line 1
179.


LaTeX Warning: Hyper reference `QQA.9.62' on page 152 undefined on input line 1
190.


Underfull \hbox (badness 2376) in paragraph at lines 1179--1191
[]\T1/ptm/b/n/10 Quick Quiz 9.62:[] \T1/ptm/m/n/10 (+20) All of these toy RCU i
m-
 []


Underfull \hbox (badness 10000) in paragraph at lines 1179--1191
\T1/ptm/m/n/10 (+20) ple-men-ta-tions have ei-ther atomic op-er-a-tions in
 []


Underfull \hbox (badness 1584) in paragraph at lines 1179--1191
[]\T1/pcrs/m/n/10 _[]_[][][][] \T1/ptm/m/n/10 (+20) and []\T1/pcrs/m/n/10 _[]_[
][][][]\T1/ptm/m/n/10 (+20) , or
 []


Underfull \hbox (badness 3118) in paragraph at lines 1179--1191
\T1/ptm/m/n/10 (+20) could an RCU im-ple-men-ta-tion en-joy light-weight
 []

[152]

LaTeX Warning: Hyper reference `QQA.9.63' on page 153 undefined on input line 1
286.


LaTeX Warning: Hyper reference `QQA.9.63' on page 153 undefined on input line 1
297.


LaTeX Warning: Hyper reference `QQA.9.64' on page 153 undefined on input line 1
326.


LaTeX Warning: Hyper reference `QQA.9.64' on page 153 undefined on input line 1
341.


LaTeX Warning: Hyper reference `QQA.9.65' on page 153 undefined on input line 1
350.


LaTeX Warning: Hyper reference `QQA.9.65' on page 153 undefined on input line 1
358.

[153]

LaTeX Warning: Hyper reference `QQA.9.66' on page 154 undefined on input line 1
374.


LaTeX Warning: Hyper reference `QQA.9.66' on page 154 undefined on input line 1
392.


Underfull \hbox (badness 6461) in paragraph at lines 1394--1394
[]\T1/ptm/b/n/10 Nestable RCU Based on Free-Running
 []


Overfull \hbox (11.03613pt too wide) in paragraph at lines 1410--1410
 [][] 
 []


Underfull \hbox (badness 1509) in paragraph at lines 1466--1491
\T1/ptm/m/n/10 (+20) this, []\T1/pcrs/m/n/10 _[]_[]_[]_[][][] \T1/ptm/m/n/10 (+
20) and []\T1/pcrs/m/n/10 _[]_[]_
 []

[154]
Underfull \hbox (badness 5274) in paragraph at lines 1519--1531
[]\T1/ptm/m/n/10 (+20) Interestingly enough, de-spite their []\T1/pcrs/m/n/10 _
[]_
 []


Underfull \hbox (badness 1490) in paragraph at lines 1532--1542
[]\T1/ptm/m/n/10 (+20) The im-ple-men-ta-tion of []\T1/pcrs/m/n/10 _[][][][] \T
1/ptm/m/n/10 (+20) is
 []


LaTeX Warning: Hyper reference `QQA.9.67' on page 155 undefined on input line 1
552.


LaTeX Warning: Hyper reference `QQA.9.67' on page 155 undefined on input line 1
565.


LaTeX Warning: Hyper reference `QQA.9.68' on page 155 undefined on input line 1
576.


LaTeX Warning: Hyper reference `QQA.9.68' on page 155 undefined on input line 1
586.


LaTeX Warning: Hyper reference `QQA.9.69' on page 155 undefined on input line 1
588.


LaTeX Warning: Hyper reference `QQA.9.69' on page 155 undefined on input line 1
675.


Underfull \hbox (badness 1024) in paragraph at lines 1760--1760
[][][] \T1/ptm/m/n/8 (+20) Al-though the code in the fig-ure is con-sis-tent wi
th []\T1/pcrs/m/n/8 _
 []

[155]

LaTeX Warning: Hyper reference `QQA.9.70' on page 156 undefined on input line 1
782.


LaTeX Warning: Hyper reference `QQA.9.70' on page 156 undefined on input line 1
797.


Underfull \hbox (badness 1077) in paragraph at lines 1799--1808
\T1/ptm/m/n/10 (+20) ally, but use it very heav-ily when they do use it.
 []


LaTeX Warning: Hyper reference `QQA.9.71' on page 156 undefined on input line 1
815.


LaTeX Warning: Hyper reference `QQA.9.71' on page 156 undefined on input line 1
827.


Underfull \hbox (badness 1292) in paragraph at lines 1867--1873
[]\T1/ptm/m/n/10 (+20) This im-ple-men-ta-tion has blaz-ingly fast read-side
 []


LaTeX Warning: Hyper reference `QQA.9.72' on page 156 undefined on input line 1
874.


LaTeX Warning: Hyper reference `QQA.9.72' on page 156 undefined on input line 1
887.


LaTeX Warning: Hyper reference `QQA.9.73' on page 156 undefined on input line 1
896.


LaTeX Warning: Hyper reference `QQA.9.73' on page 156 undefined on input line 1
911.


LaTeX Warning: Hyper reference `QQA.9.74' on page 156 undefined on input line 1
913.


LaTeX Warning: Hyper reference `QQA.9.74' on page 156 undefined on input line 1
932.

[156]

LaTeX Warning: Citation `MathieuDesnoyers2012URCU' on page 157 undefined on inp
ut line 1948.


LaTeX Warning: Citation `PaulEMcKenney2007PreemptibleRCU' on page 157 undefined
 on input line 1948.


LaTeX Warning: Citation `PaulEMcKenney2008HierarchicalRCU' on page 157 undefine
d on input line 1948.


LaTeX Warning: Citation `PaulEMcKenney2009BloatwatchRCU' on page 157 undefined 
on input line 1948.


LaTeX Warning: Hyper reference `QQA.9.75' on page 157 undefined on input line 1
996.


LaTeX Warning: Hyper reference `QQA.9.75' on page 157 undefined on input line 2
011.

)) (./defer/rcuexercises.tex
Underfull \hbox (badness 1527) in paragraph at lines 7--14
\T1/ptm/m/n/10 (+20) to a later sec-tion where the so-lu-tion is ex-plained
 []


Underfull \hbox (badness 2285) in paragraph at lines 7--14
\T1/ptm/m/n/10 (+20) at length. The []\T1/pcrs/m/n/10 _[]_[][][][]\T1/ptm/m/n/1
0 (+20) , []\T1/pcrs/m/n/10 _[]_
 []


Underfull \hbox (badness 4416) in paragraph at lines 7--14
[][][][]\T1/ptm/m/n/10 (+20) , []\T1/pcrs/m/n/10 _[][][][]\T1/ptm/m/n/10 (+20) 
, []\T1/pcrs/m/n/10 _[]_
 []


Underfull \hbox (badness 2096) in paragraph at lines 7--14
[][][][]\T1/ptm/m/n/10 (+20) , and []\T1/pcrs/m/n/10 _[][][][] \T1/ptm/m/n/10 (
+20) prim-i-tives
 []


LaTeX Warning: Hyper reference `QQA.9.76' on page 157 undefined on input line 1
5.


LaTeX Warning: Hyper reference `QQA.9.76' on page 157 undefined on input line 6
0.


LaTeX Warning: Hyper reference `QQA.9.77' on page 157 undefined on input line 6
3.


LaTeX Warning: Hyper reference `QQA.9.77' on page 157 undefined on input line 8
5.

) (./defer/whichtochoose.tex [157]
Overfull \hbox (1.73157pt too wide) in paragraph at lines 86--86
\T1/pcrs/m/n/8 smp_mb()|  
 []


Underfull \hbox (badness 1303) in paragraph at lines 114--127
[]\T1/ptm/m/n/10 (+20) The ``Con-tention Among Read-ers'', ``Reader Per-
 []

[158]

LaTeX Warning: Citation `MagedMichael04a' on page 159 undefined on input line 1
95.


LaTeX Warning: Citation `HerlihyLM02' on page 159 undefined on input line 195.


LaTeX Warning: Citation `MathieuDesnoyers2012URCU' on page 159 undefined on inp
ut line 203.


LaTeX Warning: Citation `Valois95a' on page 159 undefined on input line 214.


LaTeX Warning: Citation `MagedMichael95a' on page 159 undefined on input line 2
14.


Underfull \vbox (badness 1005) has occurred while \output is active []

)
(./defer/updates.tex

LaTeX Warning: Citation `SilasBoydWickizerPhD' on page 159 undefined on input l
ine 23.


LaTeX Warning: Citation `AdrianSutton2013LCA:Disruptor' on page 159 undefined o
n input line 28.

[159])) (./datastruct/datastruct.tex [160

]
Chapter 10.

LaTeX Warning: Citation `ThomasHCorman2001Algorithms' on page 161 undefined on 
input line 11.


Underfull \vbox (badness 2460) has occurred while \output is active []



LaTeX Warning: Citation `McKenney:2013:SDS:2483852.2483867' on page 161 undefin
ed on input line 62.

[161

]

LaTeX Warning: Hyper reference `QQA.10.1' on page 162 undefined on input line 1
21.


LaTeX Warning: Hyper reference `QQA.10.1' on page 162 undefined on input line 1
32.

<datastruct/hashdiagram.pdf, id=4811, 244.36278pt x 172.0899pt>
File: datastruct/hashdiagram.pdf Graphic file (type pdf)

<use datastruct/hashdiagram.pdf>
Package pdftex.def Info: datastruct/hashdiagram.pdf used on input line 170.
(pdftex.def)             Requested size: 244.36218pt x 172.08946pt.
 [162 <./datastruct/hashdiagram.pdf>]

LaTeX Warning: Hyper reference `QQA.10.2' on page 163 undefined on input line 2
86.


LaTeX Warning: Hyper reference `QQA.10.2' on page 163 undefined on input line 2
98.


Underfull \hbox (badness 10000) in paragraph at lines 325--328
[]\T1/ptm/m/n/10 (+20) Figure []10.5[] shows the []\T1/pcrs/m/n/10 _[][][][] \T
1/ptm/m/n/10 (+20) and
 []


Underfull \hbox (badness 10000) in paragraph at lines 374--385
[]\T1/ptm/m/n/10 (+20) Figure []10.6[] shows []\T1/pcrs/m/n/10 _[][][][] \T1/pt
m/m/n/10 (+20) and
 []


Underfull \hbox (badness 10000) in paragraph at lines 374--385
[]\T1/pcrs/m/n/10 _[][][][]\T1/ptm/m/n/10 (+20) , which do hash-table al-lo-ca-

 []

<datastruct/zoocpubktlin8.pdf, id=4839, 237.68994pt x 208.75186pt>
File: datastruct/zoocpubktlin8.pdf Graphic file (type pdf)

<use datastruct/zoocpubktlin8.pdf>
Package pdftex.def Info: datastruct/zoocpubktlin8.pdf used on input line 391.
(pdftex.def)             Requested size: 237.68935pt x 208.75134pt.

Underfull \hbox (badness 2884) in paragraph at lines 396--406
\T1/ptm/m/n/10 (+20) The per-for-mance re-sults for an eight-CPU 2GHz
 []

<datastruct/zoocpubktlin.pdf, id=4841, 240.48032pt x 208.75186pt>
File: datastruct/zoocpubktlin.pdf Graphic file (type pdf)

<use datastruct/zoocpubktlin.pdf>
Package pdftex.def Info: datastruct/zoocpubktlin.pdf used on input line 409.
(pdftex.def)             Requested size: 240.47972pt x 208.75134pt.
 [163]

LaTeX Warning: Hyper reference `QQA.10.3' on page 164 undefined on input line 4
29.


LaTeX Warning: Hyper reference `QQA.10.3' on page 164 undefined on input line 4
40.


Underfull \vbox (badness 5175) has occurred while \output is active []


<datastruct/zoocpubktsizelin.pdf, id=4852, 240.48032pt x 208.75186pt>
File: datastruct/zoocpubktsizelin.pdf Graphic file (type pdf)

<use datastruct/zoocpubktsizelin.pdf>
Package pdftex.def Info: datastruct/zoocpubktsizelin.pdf used on input line 445
.
(pdftex.def)             Requested size: 240.47972pt x 208.75134pt.


LaTeX Warning: Hyper reference `QQA.10.4' on page 164 undefined on input line 4
71.


LaTeX Warning: Hyper reference `QQA.10.4' on page 164 undefined on input line 4
88.

[164 <./datastruct/zoocpubktlin8.pdf> <./datastruct/zoocpubktlin.pdf> <./datast
ruct/zoocpubktsizelin.pdf>]

LaTeX Warning: Citation `MagedMichael04a' on page 165 undefined on input line 5
42.


LaTeX Warning: Citation `McKenney:2013:SDS:2483852.2483867' on page 165 undefin
ed on input line 544.


Underfull \vbox (badness 10000) has occurred while \output is active []



LaTeX Warning: Hyper reference `QQA.10.5' on page 165 undefined on input line 6
38.


LaTeX Warning: Hyper reference `QQA.10.5' on page 165 undefined on input line 6
52.


Underfull \vbox (badness 7981) has occurred while \output is active []

 [165]
<datastruct/zoocpu.pdf, id=4896, 243.27077pt x 202.71736pt>
File: datastruct/zoocpu.pdf Graphic file (type pdf)

<use datastruct/zoocpu.pdf>
Package pdftex.def Info: datastruct/zoocpu.pdf used on input line 704.
(pdftex.def)             Requested size: 243.27016pt x 202.71686pt.

<datastruct/zoocpulin.pdf, id=4898, 240.48032pt x 202.71736pt>
File: datastruct/zoocpulin.pdf Graphic file (type pdf)

<use datastruct/zoocpulin.pdf>
Package pdftex.def Info: datastruct/zoocpulin.pdf used on input line 721.
(pdftex.def)             Requested size: 240.47972pt x 202.71686pt.
 [166 <./datastruct/zoocpu.pdf> <./datastruct/zoocpulin.pdf>] <datastruct/zooca
tonly.pdf, id=4917, 256.79036pt x 202.71736pt>
File: datastruct/zoocatonly.pdf Graphic file (type pdf)

<use datastruct/zoocatonly.pdf>
Package pdftex.def Info: datastruct/zoocatonly.pdf used on input line 753.
(pdftex.def)             Requested size: 256.78972pt x 202.71686pt.


LaTeX Warning: Citation `ErwinSchroedinger1935Cat' on page 167 undefined on inp
ut line 759.

<datastruct/zooupdatelu.pdf, id=4919, 243.27077pt x 202.71736pt>
File: datastruct/zooupdatelu.pdf Graphic file (type pdf)

<use datastruct/zooupdatelu.pdf>
Package pdftex.def Info: datastruct/zooupdatelu.pdf used on input line 785.
(pdftex.def)             Requested size: 243.27016pt x 202.71686pt.

<datastruct/zooupdate.pdf, id=4921, 243.27077pt x 202.71736pt>
File: datastruct/zooupdate.pdf Graphic file (type pdf)

<use datastruct/zooupdate.pdf>
Package pdftex.def Info: datastruct/zooupdate.pdf used on input line 807.
(pdftex.def)             Requested size: 243.27016pt x 202.71686pt.
 [167 <./datastruct/zoocatonly.pdf> <./datastruct/zooupdatelu.pdf> <./datastruc
t/zooupdate.pdf>]

LaTeX Warning: Hyper reference `QQA.10.6' on page 168 undefined on input line 8
39.


LaTeX Warning: Hyper reference `QQA.10.6' on page 168 undefined on input line 8
49.

<cartoons/2013-08-is-it-dead.pdf, id=4944, 693.06927pt x 498.71819pt>
File: cartoons/2013-08-is-it-dead.pdf Graphic file (type pdf)

<use cartoons/2013-08-is-it-dead.pdf>
Package pdftex.def Info: cartoons/2013-08-is-it-dead.pdf used on input line 882
.
(pdftex.def)             Requested size: 693.06758pt x 498.71696pt.


LaTeX Warning: Citation `WeinerHeisenberg1927Uncertain' on page 168 undefined o
n input line 902.

<cartoons/2014_Hash-table-hydra.pdf, id=4948, 626.66267pt x 475.41696pt>
File: cartoons/2014_Hash-table-hydra.pdf Graphic file (type pdf)

<use cartoons/2014_Hash-table-hydra.pdf>
Package pdftex.def Info: cartoons/2014_Hash-table-hydra.pdf used on input line 
931.
(pdftex.def)             Requested size: 626.66113pt x 475.41579pt.

Underfull \vbox (badness 10000) has occurred while \output is active []

 [168 <./cartoons/2013-08-is-it-dead.pdf>]

LaTeX Warning: Citation `HerbertXu2010RCUResizeHash' on page 169 undefined on i
nput line 950.

<datastruct/hashxu-a.pdf, id=4961, 251.79785pt x 103.24286pt>
File: datastruct/hashxu-a.pdf Graphic file (type pdf)

<use datastruct/hashxu-a.pdf>
Package pdftex.def Info: datastruct/hashxu-a.pdf used on input line 964.
(pdftex.def)             Requested size: 251.79723pt x 103.2426pt.

<datastruct/hashxu-b.pdf, id=4962, 251.79785pt x 149.81685pt>
File: datastruct/hashxu-b.pdf Graphic file (type pdf)

<use datastruct/hashxu-b.pdf>
Package pdftex.def Info: datastruct/hashxu-b.pdf used on input line 971.
(pdftex.def)             Requested size: 251.79723pt x 149.81647pt.

Underfull \hbox (badness 1472) in paragraph at lines 976--988
[]\T1/ptm/m/n/10 (+20) The re-size op-er-a-tion pro-ceeds as shown in Fig-
 []

<datastruct/hashxu-c.pdf, id=4967, 251.79785pt x 149.81685pt>
File: datastruct/hashxu-c.pdf Graphic file (type pdf)

<use datastruct/hashxu-c.pdf>
Package pdftex.def Info: datastruct/hashxu-c.pdf used on input line 991.
(pdftex.def)             Requested size: 251.79723pt x 149.81647pt.

<datastruct/hashxu-d.pdf, id=4968, 251.79785pt x 100.03085pt>
File: datastruct/hashxu-d.pdf Graphic file (type pdf)

<use datastruct/hashxu-d.pdf>
Package pdftex.def Info: datastruct/hashxu-d.pdf used on input line 998.
(pdftex.def)             Requested size: 251.79723pt x 100.0306pt.
 [169 <./cartoons/2014_Hash-table-hydra.pdf> <./datastruct/hashxu-a.pdf> <./dat
astruct/hashxu-b.pdf

pdfTeX warning: pdflatex (file ./datastruct/hashxu-b.pdf): PDF inclusion: multi
ple pdfs with page group included in a single page
>]

LaTeX Warning: Citation `McKenney89c' on page 170 undefined on input line 1099.



LaTeX Warning: Citation `McKenney90' on page 170 undefined on input line 1099.


LaTeX Warning: Citation `McKenney91' on page 170 undefined on input line 1099.

[170 <./datastruct/hashxu-c.pdf> <./datastruct/hashxu-d.pdf

pdfTeX warning: pdflatex (file ./datastruct/hashxu-d.pdf): PDF inclusion: multi
ple pdfs with page group included in a single page
>]

LaTeX Warning: Hyper reference `QQA.10.7' on page 171 undefined on input line 1
180.


LaTeX Warning: Hyper reference `QQA.10.7' on page 171 undefined on input line 1
190.


LaTeX Warning: Hyper reference `QQA.10.8' on page 171 undefined on input line 1
196.


LaTeX Warning: Hyper reference `QQA.10.8' on page 171 undefined on input line 1
205.

[171]

LaTeX Warning: Hyper reference `QQA.10.9' on page 172 undefined on input line 1
286.


LaTeX Warning: Hyper reference `QQA.10.9' on page 172 undefined on input line 1
299.


LaTeX Warning: Hyper reference `QQA.10.10' on page 172 undefined on input line 
1310.


LaTeX Warning: Hyper reference `QQA.10.10' on page 172 undefined on input line 
1328.


Underfull \hbox (badness 1430) in paragraph at lines 1393--1398
[]\T1/ptm/m/n/10 (+20) Now that we have bucket se-lec-tion and con-cur-
 []


Underfull \hbox (badness 1838) in paragraph at lines 1393--1398
\T1/ptm/m/n/10 (+20) up-date our re-siz-able hash ta-ble. The []\T1/pcrs/m/n/10
 _
 []


LaTeX Warning: Hyper reference `QQA.10.11' on page 172 undefined on input line 
1413.


LaTeX Warning: Hyper reference `QQA.10.11' on page 172 undefined on input line 
1430.


Underfull \vbox (badness 10000) has occurred while \output is active []

 [172]

LaTeX Warning: Hyper reference `QQA.10.12' on page 173 undefined on input line 
1453.


LaTeX Warning: Hyper reference `QQA.10.12' on page 173 undefined on input line 
1473.


LaTeX Warning: Hyper reference `QQA.10.13' on page 173 undefined on input line 
1563.


LaTeX Warning: Hyper reference `QQA.10.13' on page 173 undefined on input line 
1581.

<datastruct/perftestresize.pdf, id=5055, 243.27077pt x 202.71736pt>
File: datastruct/perftestresize.pdf Graphic file (type pdf)

<use datastruct/perftestresize.pdf>
Package pdftex.def Info: datastruct/perftestresize.pdf used on input line 1601.

(pdftex.def)             Requested size: 243.27016pt x 202.71686pt.
 [173] [174]

LaTeX Warning: Citation `Triplett:2011:RPHash' on page 175 undefined on input l
ine 1688.

<datastruct/zipperhashshrink.pdf, id=5071, 234.99712pt x 341.33237pt>
File: datastruct/zipperhashshrink.pdf Graphic file (type pdf)

<use datastruct/zipperhashshrink.pdf>
Package pdftex.def Info: datastruct/zipperhashshrink.pdf used on input line 169
9.
(pdftex.def)             Requested size: 234.99652pt x 341.33153pt.

Underfull \vbox (badness 2150) has occurred while \output is active []

 [175 <./datastruct/perftestresize.pdf> <./datastruct/zipperhashshrink.pdf>]
<datastruct/zipperhashgrow.pdf, id=5090, 235.37039pt x 377.5498pt>
File: datastruct/zipperhashgrow.pdf Graphic file (type pdf)

<use datastruct/zipperhashgrow.pdf>
Package pdftex.def Info: datastruct/zipperhashgrow.pdf used on input line 1755.

(pdftex.def)             Requested size: 235.36981pt x 377.54887pt.


LaTeX Warning: Citation `OriShalev2006SplitOrderListHash' on page 176 undefined
 on input line 1805.


LaTeX Warning: Citation `MathieuDesnoyers2009URCU' on page 176 undefined on inp
ut line 1807.


LaTeX Warning: Citation `PaulMcKenney2013LWNURCUhash' on page 176 undefined on 
input line 1807.


LaTeX Warning: Citation `MathieuDesnoyers2009URCU' on page 176 undefined on inp
ut line 1819.


Underfull \vbox (badness 10000) has occurred while \output is active []

 [176 <./datastruct/zipperhashgrow.pdf>]

LaTeX Warning: Citation `RobertOlsson2006a' on page 177 undefined on input line
 1847.


LaTeX Warning: Citation `NickPiggin2006radixtree' on page 177 undefined on inpu
t line 1849.


LaTeX Warning: Citation `ThomasHCorman2001Algorithms' on page 177 undefined on 
input line 1859.


LaTeX Warning: Citation `Ellis80' on page 177 undefined on input line 1861.


LaTeX Warning: Citation `AleksandarDragovejic2011STMnotToy' on page 177 undefin
ed on input line 1867.


LaTeX Warning: Citation `PhilHoward2011RCUTMRBTree' on page 177 undefined on in
put line 1869.


LaTeX Warning: Citation `PhilipWHoward2013RCUrbtree' on page 177 undefined on i
nput line 1869.


LaTeX Warning: Citation `AustinClements2012RCULinux:mmapsem' on page 177 undefi
ned on input line 1874.


LaTeX Warning: Citation `Pugh90' on page 177 undefined on input line 1879.


LaTeX Warning: Citation `Treiber86' on page 177 undefined on input line 1883.


LaTeX Warning: Citation `PaulMcKenney2013LWNURCUqueuestack' on page 177 undefin
ed on input line 1886.


LaTeX Warning: Citation `Shavit:2011:DSM:1897852.1897873' on page 177 undefined
 on input line 1888.


LaTeX Warning: Citation `AndreasHaas2012FIFOisnt' on page 177 undefined on inpu
t line 1891.


LaTeX Warning: Citation `ChristophMKirsch2012FIFOisntTR' on page 177 undefined 
on input line 1891.


LaTeX Warning: Citation `AndreasHaas2013CFRelaxedQueues' on page 177 undefined 
on input line 1891.

[177]

LaTeX Warning: Hyper reference `QQA.10.14' on page 178 undefined on input line 
1951.


LaTeX Warning: Hyper reference `QQA.10.14' on page 178 undefined on input line 
1960.


LaTeX Warning: Hyper reference `QQA.10.15' on page 178 undefined on input line 
1962.


LaTeX Warning: Hyper reference `QQA.10.15' on page 178 undefined on input line 
1974.


LaTeX Warning: Citation `JonathanCorbet2006lockdep' on page 178 undefined on in
put line 2019.

[178]

LaTeX Warning: Citation `BenjaminGamsa95a' on page 179 undefined on input line 
2107.


LaTeX Warning: Citation `Golovanevsky:2010:TDL:2174824.2174835' on page 179 und
efined on input line 2137.

[179]) (./debugging/debugging.tex [180

]
Chapter 11.

LaTeX Warning: Citation `GlenfordJMyers1979' on page 181 undefined on input lin
e 28.

[181

]

LaTeX Warning: Citation `RegBraithwaite2007FizzBuzz' on page 182 undefined on i
nput line 131.


LaTeX Warning: Hyper reference `QQA.11.1' on page 182 undefined on input line 1
46.


LaTeX Warning: Hyper reference `QQA.11.1' on page 182 undefined on input line 1
63.


LaTeX Warning: Hyper reference `QQA.11.2' on page 182 undefined on input line 2
13.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 218--228
[][]
 []

[182]

LaTeX Warning: Hyper reference `QQA.11.2' on page 183 undefined on input line 2
94.

<cartoons/TortureTux.pdf, id=5213, 558.93204pt x 638.8666pt>
File: cartoons/TortureTux.pdf Graphic file (type pdf)

<use cartoons/TortureTux.pdf>
Package pdftex.def Info: cartoons/TortureTux.pdf used on input line 337.
(pdftex.def)             Requested size: 558.93066pt x 638.86502pt.

<cartoons/TortureLaptop.pdf, id=5214, 495.50388pt x 622.9744pt>
File: cartoons/TortureLaptop.pdf Graphic file (type pdf)

<use cartoons/TortureLaptop.pdf>
Package pdftex.def Info: cartoons/TortureLaptop.pdf used on input line 344.
(pdftex.def)             Requested size: 495.50266pt x 622.97287pt.
 [183 <./cartoons/TortureTux.pdf> <./cartoons/TortureLaptop.pdf>]

LaTeX Warning: Hyper reference `QQA.11.3' on page 184 undefined on input line 3
96.


LaTeX Warning: Hyper reference `QQA.11.3' on page 184 undefined on input line 4
15.


LaTeX Warning: Citation `EricSRaymond99b' on page 184 undefined on input line 4
58.

[184]

LaTeX Warning: Citation `StevenRostedt2010perfTraceEventP1' on page 185 undefin
ed on input line 545.


LaTeX Warning: Citation `StevenRostedt2010perfTraceEventP2' on page 185 undefin
ed on input line 545.


LaTeX Warning: Citation `StevenRostedt2010perfTraceEventP3' on page 185 undefin
ed on input line 545.


LaTeX Warning: Citation `StevenRostedt2010perfHP+DeathlyMacros' on page 185 und
efined on input line 545.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 581--590
[][]
 []


Underfull \hbox (badness 1014) in paragraph at lines 591--598
\T1/ptm/m/n/10 (+20) macros or lan-guage in-trin-sics, for ex-am-ple, in the
 []


Underfull \hbox (badness 1173) in paragraph at lines 591--598
\T1/ptm/m/n/10 (+20) Linux ker-nel, this might be rep-re-sented as []\T1/pcrs/m
/n/10 _
 []


Underfull \hbox (badness 10000) in paragraph at lines 591--598
[][][]\T1/pcrs/m/n/10 _[]_[]_[][][][][]\T1/ptm/m/n/10 (+20) . Of
 []


Underfull \hbox (badness 10000) in paragraph at lines 591--598
\T1/ptm/m/n/10 (+20) course, if []\T1/pcrs/m/n/10 _[]_[]_[][][][]
 []


Underfull \hbox (badness 10000) in paragraph at lines 591--598
[][][]\T1/pcrs/m/n/10 _[]_[]_[][][][][] \T1/ptm/m/n/10 (+20) might
 []


LaTeX Warning: Hyper reference `QQA.11.4' on page 185 undefined on input line 5
99.


LaTeX Warning: Hyper reference `QQA.11.4' on page 185 undefined on input line 6
14.

[185]

LaTeX Warning: Citation `JonathanCorbet2006lockdep' on page 186 undefined on in
put line 626.


LaTeX Warning: Citation `StevenRostedt2011locdepCryptic' on page 186 undefined 
on input line 626.


LaTeX Warning: Citation `StephenJohnson1977lint' on page 186 undefined on input
 line 649.


LaTeX Warning: Citation `JonathanCorbet2004sparse' on page 186 undefined on inp
ut line 655.

[186]

LaTeX Warning: Citation `PaulEMcKenney2011RCU3.0trainwreck' on page 187 undefin
ed on input line 799.


LaTeX Warning: Hyper reference `QQA.11.5' on page 187 undefined on input line 8
04.


LaTeX Warning: Hyper reference `QQA.11.5' on page 187 undefined on input line 8
25.


LaTeX Warning: Hyper reference `QQA.11.6' on page 187 undefined on input line 8
27.


LaTeX Warning: Hyper reference `QQA.11.6' on page 187 undefined on input line 8
56.


LaTeX Warning: Citation `Brooks79' on page 187 undefined on input line 861.

[187]

LaTeX Warning: Citation `GlenfordJMyers1979' on page 188 undefined on input lin
e 877.


Underfull \hbox (badness 6641) in paragraph at lines 900--908
[]\T1/ptm/m/n/10 (+20) Make ex-tremely dis-ci-plined use of parallel-
 []


<cartoons/r-2014-Passed-the-stress-test.pdf, id=5304, 523.49123pt x 462.44553pt
>
File: cartoons/r-2014-Passed-the-stress-test.pdf Graphic file (type pdf)
 <use cartoons/r-2014-Passed-the-stress-test.pdf>
Package pdftex.def Info: cartoons/r-2014-Passed-the-stress-test.pdf used on inp
ut line 931.
(pdftex.def)             Requested size: 523.48994pt x 462.44438pt.


LaTeX Warning: Hyper reference `QQA.11.7' on page 188 undefined on input line 9
48.


LaTeX Warning: Hyper reference `QQA.11.7' on page 188 undefined on input line 9
82.

[188 <./cartoons/r-2014-Passed-the-stress-test.pdf>]

LaTeX Warning: Hyper reference `QQA.11.8' on page 189 undefined on input line 1
060.


LaTeX Warning: Hyper reference `QQA.11.8' on page 189 undefined on input line 1
074.


LaTeX Warning: Hyper reference `QQA.11.9' on page 189 undefined on input line 1
117.


LaTeX Warning: Hyper reference `QQA.11.9' on page 189 undefined on input line 1
126.

<CodeSamples/debugging/BinomialNRuns.pdf, id=5337, 234.66669pt x 211.75111pt>
File: CodeSamples/debugging/BinomialNRuns.pdf Graphic file (type pdf)

<use CodeSamples/debugging/BinomialNRuns.pdf>
Package pdftex.def Info: CodeSamples/debugging/BinomialNRuns.pdf used on input 
line 1130.
(pdftex.def)             Requested size: 234.6661pt x 211.75058pt.
 [189]

LaTeX Warning: Citation `Feller58' on page 190 undefined on input line 1212.


LaTeX Warning: Citation `McKenney2014ParallelProgramming-e1' on page 190 undefi
ned on input line 1214.

[190 <./CodeSamples/debugging/BinomialNRuns.pdf>]

LaTeX Warning: Hyper reference `QQA.11.10' on page 191 undefined on input line 
1257.


LaTeX Warning: Hyper reference `QQA.11.10' on page 191 undefined on input line 
1273.


LaTeX Warning: Hyper reference `QQA.11.11' on page 191 undefined on input line 
1311.


LaTeX Warning: Hyper reference `QQA.11.11' on page 191 undefined on input line 
1331.


LaTeX Warning: Hyper reference `QQA.11.12' on page 191 undefined on input line 
1333.


LaTeX Warning: Hyper reference `QQA.11.12' on page 191 undefined on input line 
1360.


LaTeX Warning: Citation `WeinerHeisenberg1927Uncertain' on page 191 undefined o
n input line 1380.

[191]

LaTeX Warning: Hyper reference `QQA.11.13' on page 192 undefined on input line 
1432.


LaTeX Warning: Hyper reference `QQA.11.13' on page 192 undefined on input line 
1452.


LaTeX Warning: Hyper reference `QQA.11.14' on page 192 undefined on input line 
1467.


LaTeX Warning: Hyper reference `QQA.11.14' on page 192 undefined on input line 
1479.


Underfull \vbox (badness 10000) has occurred while \output is active []

 [192]

LaTeX Warning: Hyper reference `QQA.11.15' on page 193 undefined on input line 
1563.


LaTeX Warning: Hyper reference `QQA.11.15' on page 193 undefined on input line 
1573.

<debugging/RCUnearMiss.pdf, id=5421, 243.49722pt x 164.02515pt>
File: debugging/RCUnearMiss.pdf Graphic file (type pdf)

<use debugging/RCUnearMiss.pdf>
Package pdftex.def Info: debugging/RCUnearMiss.pdf used on input line 1602.
(pdftex.def)             Requested size: 243.49663pt x 164.02473pt.
 [193 <./debugging/RCUnearMiss.pdf>]

LaTeX Warning: Hyper reference `QQA.11.16' on page 194 undefined on input line 
1686.


LaTeX Warning: Hyper reference `QQA.11.16' on page 194 undefined on input line 
1708.


LaTeX Warning: Hyper reference `QQA.11.17' on page 194 undefined on input line 
1710.


LaTeX Warning: Hyper reference `QQA.11.17' on page 194 undefined on input line 
1731.


LaTeX Warning: Citation `McKenney93' on page 194 undefined on input line 1796.

[194]

LaTeX Warning: Citation `McKenney95a' on page 195 undefined on input line 1837.



LaTeX Warning: Citation `McKenney99b' on page 195 undefined on input line 1837.



LaTeX Warning: Hyper reference `QQA.11.18' on page 195 undefined on input line 
1890.


LaTeX Warning: Hyper reference `QQA.11.18' on page 195 undefined on input line 
1902.

[195]
Underfull \hbox (badness 4739) in paragraph at lines 1920--1933
[]\T1/ptm/m/n/10 (+20) First, let's look at in-ter-fer-ence by other pro-
 []


Underfull \hbox (badness 1881) in paragraph at lines 1920--1933
\T1/ptm/m/n/10 (+20) cesses, threads, and tasks. The POSIX []\T1/pcrs/m/n/10 _
 []


LaTeX Warning: Hyper reference `QQA.11.19' on page 196 undefined on input line 
1985.


LaTeX Warning: Hyper reference `QQA.11.19' on page 196 undefined on input line 
1997.

[196]
Underfull \hbox (badness 1509) in paragraph at lines 2059--2059
[]\T1/ptm/m/n/10 (+20) Figure 11.6: Us-ing getrusage() to De-tect Con-text
 []

[197]

LaTeX Warning: Hyper reference `QQA.11.20' on page 198 undefined on input line 
2252.


LaTeX Warning: Hyper reference `QQA.11.20' on page 198 undefined on input line 
2282.


LaTeX Warning: Hyper reference `QQA.11.21' on page 198 undefined on input line 
2284.


LaTeX Warning: Hyper reference `QQA.11.21' on page 198 undefined on input line 
2296.

<cartoons/UseTheRightCannon.pdf, id=5522, 729.51648pt x 359.9116pt>
File: cartoons/UseTheRightCannon.pdf Graphic file (type pdf)

<use cartoons/UseTheRightCannon.pdf>
Package pdftex.def Info: cartoons/UseTheRightCannon.pdf used on input line 2310
.
(pdftex.def)             Requested size: 729.5147pt x 359.91072pt.

Underfull \vbox (badness 10000) has occurred while \output is active []

 [198]

LaTeX Warning: Citation `AlanMTuring1937HaltingProblem' on page 199 undefined o
n input line 2326.


LaTeX Warning: Citation `GeoffreyKPullum2000HaltingProblem' on page 199 undefin
ed on input line 2326.

) (./formal/formal.tex [199 <./cartoons/UseTheRightCannon.pdf>] [200

]
Chapter 12.
(./formal/spinhint.tex
Underfull \hbox (badness 2158) in paragraph at lines 3--3
[]\T1/ptm/b/n/14.4 General-Purpose State-Space
 []


LaTeX Warning: Citation `Holzmann03a' on page 201 undefined on input line 50.


Underfull \hbox (badness 1997) in paragraph at lines 58--58
[]\T1/ptm/b/n/10 Promela Warm-Up: Non-Atomic In-cre-
 []

[201]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 158--167
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 215--222
[][]
 []


Underfull \vbox (badness 10000) has occurred while \output is active []

 [202]
[203] [204]
Overfull \hbox (20.00003pt too wide) in paragraph at lines 518--530
[][]
 []

[205]
Underfull \hbox (badness 1603) in paragraph at lines 635--654
[]\T1/pcrs/m/n/10 _[][][][] \T1/ptm/m/n/10 (+20) macros are pro-vided in $\T1/p
crs/m/n/10 lock . h$\T1/ptm/m/n/10 (+20) ,
 []

[206]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 750--759
[][]
 []


LaTeX Warning: Hyper reference `QQA.12.1' on page 207 undefined on input line 7
98.


LaTeX Warning: Hyper reference `QQA.12.1' on page 207 undefined on input line 8
08.


LaTeX Warning: Hyper reference `QQA.12.2' on page 207 undefined on input line 8
10.


LaTeX Warning: Hyper reference `QQA.12.2' on page 207 undefined on input line 8
27.


LaTeX Warning: Citation `OlegNesterov2006QRCU' on page 207 undefined on input l
ine 835.


LaTeX Warning: Citation `OlegNesterov2006aQRCU' on page 207 undefined on input 
line 835.


LaTeX Warning: Citation `PaulEMcKenney2006c' on page 207 undefined on input lin
e 841.


Overfull \hbox (20.00003pt too wide) in paragraph at lines 863--872
[][]
 []


Underfull \hbox (badness 10000) in paragraph at lines 873--878
[]\T1/ptm/m/n/10 (+20) There is a []\T1/pcrs/m/n/10 _[][][][] \T1/ptm/m/n/10 (+
20) prim-i-
 []


Underfull \hbox (badness 3068) in paragraph at lines 873--878
\T1/ptm/m/n/10 (+20) tive that blocks un-til all pre-existing QRCU
 []


Underfull \hbox (badness 2529) in paragraph at lines 873--878
\T1/ptm/m/n/10 (+20) read-side crit-i-cal sec-tions com-plete, but, like
 []


Underfull \hbox (badness 10000) in paragraph at lines 873--878
\T1/ptm/m/n/10 (+20) SRCU's []\T1/pcrs/m/n/10 _[][][][]\T1/ptm/m/n/10 (+20) , Q
RCU's
 []

[207]
Underfull \hbox (badness 10000) in paragraph at lines 879--885
[]\T1/ptm/m/n/10 (+20) For ex-am-ple, []\T1/pcrs/m/n/10 _[][][]_
 []


Underfull \hbox (badness 10000) in paragraph at lines 879--885
[]\T1/pcrs/m/n/10 _[][][]_[]_[][][][]
 []


Underfull \hbox (badness 1142) in paragraph at lines 879--885
\T1/ptm/m/it/10 (+20) would \T1/ptm/m/n/10 (+20) need to wait, since it shares 
the same
 []


LaTeX Warning: Citation `PaulMcKenney2007QRCUpatch' on page 208 undefined on in
put line 888.

[208]

LaTeX Warning: Hyper reference `QQA.12.3' on page 209 undefined on input line 1
021.


LaTeX Warning: Hyper reference `QQA.12.3' on page 209 undefined on input line 1
026.


Underfull \hbox (badness 1205) in paragraph at lines 1114--1118
[]\T1/ptm/m/n/10 (+20) Lines 44-56 then com-pare the cur-rent val-ues in
 []


LaTeX Warning: Hyper reference `QQA.12.4' on page 209 undefined on input line 1
119.


LaTeX Warning: Hyper reference `QQA.12.4' on page 209 undefined on input line 1
130.


LaTeX Warning: Hyper reference `QQA.12.5' on page 209 undefined on input line 1
132.


LaTeX Warning: Hyper reference `QQA.12.5' on page 209 undefined on input line 1
158.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1211--1220
[][]
 []

[209]

LaTeX Warning: Citation `PaulMcKenney2007QRCUpatch' on page 210 undefined on in
put line 1293.


Underfull \hbox (badness 2020) in paragraph at lines 1308--1313
[]\T1/ptm/m/n/10 (+20) However, the []\T1/pcrs/m/n/10 _[][][][] \T1/ptm/m/n/10 
(+20) fast-path
 []

[210]

LaTeX Warning: Citation `JadeAlglave2013-cav' on page 211 undefined on input li
ne 1376.


LaTeX Warning: Hyper reference `QQA.12.6' on page 211 undefined on input line 1
393.


LaTeX Warning: Hyper reference `QQA.12.6' on page 211 undefined on input line 1
407.

) (./formal/dyntickrcu.tex

LaTeX Warning: Citation `IngoMolnar05a' on page 211 undefined on input line 9.


Overfull \hbox (0.69118pt too wide) in paragraph at lines 15--30
\T1/ptm/m/n/10 (-20) ``dynticks-idle'' state, and thus in-ca-pable of ex-e-cut-
ing RCU
 []

[211]

LaTeX Warning: Citation `Holzmann03a' on page 212 undefined on input line 54.


LaTeX Warning: Hyper reference `QQA.12.7' on page 212 undefined on input line 6
2.


LaTeX Warning: Hyper reference `QQA.12.7' on page 212 undefined on input line 8
5.


Underfull \hbox (badness 4242) in paragraph at lines 99--99
[]\T1/ptm/b/n/10 Introduction to Pre-emptible RCU and
 []


Underfull \hbox (badness 10000) in paragraph at lines 142--147
[]\T1/ptm/m/n/10 (+20) This func-tion sim-ply in-cre-ments []\T1/pcrs/m/n/10 _
 []


Underfull \hbox (badness 1248) in paragraph at lines 142--147
[]\T1/pcrs/m/n/10 _[][][] \T1/ptm/m/n/10 (+20) and checks that the re-sult is
 []


Overfull \hbox (3.14014pt too wide) in paragraph at lines 158--158
[]  \T1/pcrs/m/n/7 5   WARN_ON(!(__get_cpu_var(dynticks_progress_counter) &[] 
 []


Underfull \hbox (badness 10000) in paragraph at lines 164--171
[]\T1/ptm/m/n/10 (+20) This func-tion again in-cre-ments []\T1/pcrs/m/n/10 _
 []

[212]

LaTeX Warning: Hyper reference `QQA.12.8' on page 213 undefined on input line 2
27.


LaTeX Warning: Hyper reference `QQA.12.8' on page 213 undefined on input line 2
46.


LaTeX Warning: Hyper reference `QQA.12.9' on page 213 undefined on input line 2
48.


LaTeX Warning: Hyper reference `QQA.12.9' on page 213 undefined on input line 2
57.


Underfull \hbox (badness 1077) in paragraph at lines 259--261
[]\T1/ptm/m/n/10 (+20) Interrupt exit is han-dled sim-i-larly by []\T1/pcrs/m/n
/10 _[]_
 []


Underfull \hbox (badness 10000) in paragraph at lines 299--305
[]\T1/ptm/m/n/10 (+20) These two sec-tions have de-scribed how the
 []


Underfull \hbox (badness 4316) in paragraph at lines 299--305
[]\T1/pcrs/m/n/10 _[]_[][][] \T1/ptm/m/n/10 (+20) vari-able is main-
 []

<formal/RCUpreemptStates.pdf, id=5710, 214.15408pt x 271.4642pt>
File: formal/RCUpreemptStates.pdf Graphic file (type pdf)

<use formal/RCUpreemptStates.pdf>
Package pdftex.def Info: formal/RCUpreemptStates.pdf used on input line 311.
(pdftex.def)             Requested size: 214.15355pt x 271.46353pt.

Underfull \hbox (badness 2617) in paragraph at lines 316--321
\T1/ptm/m/n/10 (+20) Of the four pre-emptible RCU grace-period states
 []


Underfull \hbox (badness 1127) in paragraph at lines 316--321
\T1/ptm/m/n/10 (+20) shown in Fig-ure []12.16[], only the []\T1/pcrs/m/n/10 _[]
_[]_
 []


Underfull \hbox (badness 3229) in paragraph at lines 316--321
[]\T1/pcrs/m/n/10 _[][][][] \T1/ptm/m/n/10 (+20) and []\T1/pcrs/m/n/10 _[]_[]_[
]_
 []

[213]
Underfull \hbox (badness 6220) in paragraph at lines 381--383
\T1/ptm/m/n/10 (+20) state in-vokes []\T1/pcrs/m/n/10 _[]_[]_[]_[][][][]\T1/ptm
/m/n/10 (+20) ,
 []


LaTeX Warning: Hyper reference `QQA.12.10' on page 214 undefined on input line 
414.


LaTeX Warning: Hyper reference `QQA.12.10' on page 214 undefined on input line 
418.


Underfull \hbox (badness 1803) in paragraph at lines 420--420
[]\T1/ptm/b/n/12 Validating Pre-emptible RCU and
 []


LaTeX Warning: Citation `Holzmann03a' on page 214 undefined on input line 433.


Underfull \hbox (badness 1902) in paragraph at lines 431--439
\T1/ptm/m/n/10 (+20) try/exit code and the grace-period pro-cess-ing into
 []

[214 <./formal/RCUpreemptStates.pdf>]

LaTeX Warning: Hyper reference `QQA.12.11' on page 215 undefined on input line 
488.


LaTeX Warning: Hyper reference `QQA.12.11' on page 215 undefined on input line 
498.


LaTeX Warning: Hyper reference `QQA.12.12' on page 215 undefined on input line 
500.


LaTeX Warning: Hyper reference `QQA.12.12' on page 215 undefined on input line 
507.


Underfull \hbox (badness 3907) in paragraph at lines 500--508
[]\T1/ptm/b/n/10 Quick Quiz 12.12:[] \T1/ptm/m/n/10 (+20) Isn't it a bit strang
e to
 []


Underfull \hbox (badness 3942) in paragraph at lines 509--521
\T1/ptm/m/n/10 (+20) grace-period pro-cess-ing. For this, we need to
 []


Underfull \hbox (badness 10000) in paragraph at lines 509--521
\T1/ptm/m/n/10 (+20) model []\T1/pcrs/m/n/10 _[]_[]_[][][][]\T1/ptm/m/n/10 (+20
) ,
 []


Underfull \hbox (badness 10000) in paragraph at lines 509--521
[]\T1/pcrs/m/n/10 _[]_[]_[]_[][][][]\T1/ptm/m/n/10 (+20) , []\T1/pcrs/m/n/10 _[
]_
 []


Underfull \hbox (badness 2035) in paragraph at lines 509--521
[]\T1/pcrs/m/n/10 _[]_[][][][]\T1/ptm/m/n/10 (+20) , as well as por-tions of
 []


Underfull \hbox (badness 2951) in paragraph at lines 509--521
[]\T1/pcrs/m/n/10 _[]_[]_[][][][] \T1/ptm/m/n/10 (+20) and []\T1/pcrs/m/n/10 _[
]_[]_
 []


Underfull \hbox (badness 4832) in paragraph at lines 509--521
[]\T1/pcrs/m/n/10 _[][][][] \T1/ptm/m/n/10 (+20) Promela pro-cess mod-els these

 []


Underfull \hbox (badness 3724) in paragraph at lines 579--583
[]\T1/ptm/m/n/10 (+20) Line 23 mod-els a line from []\T1/pcrs/m/n/10 _[]_[]_
 []


Underfull \hbox (badness 10000) in paragraph at lines 579--583
[][][][] \T1/ptm/m/n/10 (+20) and its call to []\T1/pcrs/m/n/10 _[]_
 []


Underfull \hbox (badness 1521) in paragraph at lines 584--590
[]\T1/ptm/m/n/10 (+20) Finally, lines 24-36 model the rel-e-vant code in
 []

[215]

LaTeX Warning: Hyper reference `QQA.12.13' on page 216 undefined on input line 
591.


LaTeX Warning: Hyper reference `QQA.12.13' on page 216 undefined on input line 
607.


Underfull \hbox (badness 1057) in paragraph at lines 609--616
[]\T1/ptm/m/n/10 (+20) The re-sult-ing model ($\T1/pcrs/m/n/10 dyntickRCU -[] b
ase . spin$\T1/ptm/m/n/10 (+20) ),
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 627--636
[][]
 []


LaTeX Warning: Hyper reference `QQA.12.14' on page 216 undefined on input line 
699.


LaTeX Warning: Hyper reference `QQA.12.14' on page 216 undefined on input line 
710.

[216]
Underfull \hbox (badness 1648) in paragraph at lines 883--899
\T1/pcrs/m/n/10 -g -l dyntickRCU-base-sl-busted.spin \T1/ptm/m/n/10 (+20) com-
 []


Underfull \hbox (badness 2213) in paragraph at lines 883--899
\T1/ptm/m/n/10 (+20) mand to cause [][][] to re-trace this se-quence of
 []

[217] [218]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 1045--1053
[][]
 []


Underfull \hbox (badness 2065) in paragraph at lines 1066--1068
\T1/ptm/m/n/10 (+20) The first step is to con-vert []\T1/pcrs/m/n/10 _[][][][] 
\T1/ptm/m/n/10 (+20) to
 []


LaTeX Warning: Hyper reference `QQA.12.15' on page 219 undefined on input line 
1104.


LaTeX Warning: Hyper reference `QQA.12.15' on page 219 undefined on input line 
1111.


Underfull \hbox (badness 1210) in paragraph at lines 1104--1112
[]\T1/ptm/b/n/10 Quick Quiz 12.15:[] \T1/ptm/m/n/10 (+20) But what would you do
 if
 []


Underfull \hbox (badness 1789) in paragraph at lines 1104--1112
\T1/ptm/m/n/10 (+20) you needed the state-ments in a sin-gle []\T1/pcrs/m/n/10 
_
 []


LaTeX Warning: Hyper reference `QQA.12.16' on page 219 undefined on input line 
1113.


LaTeX Warning: Hyper reference `QQA.12.16' on page 219 undefined on input line 
1158.


Underfull \hbox (badness 2359) in paragraph at lines 1218--1226
[]\T1/ptm/m/n/10 (+20) The loop from lines 7-48 mod-els up to []\T1/pcrs/m/n/10
 _
 []

[219]

LaTeX Warning: Hyper reference `QQA.12.17' on page 220 undefined on input line 
1227.


LaTeX Warning: Hyper reference `QQA.12.17' on page 220 undefined on input line 
1236.


LaTeX Warning: Hyper reference `QQA.12.18' on page 220 undefined on input line 
1245.


LaTeX Warning: Hyper reference `QQA.12.18' on page 220 undefined on input line 
1251.


Overfull \hbox (14.98413pt too wide) in paragraph at lines 1275--1275
[] \T1/pcrs/m/n/7 19       shouldexit = dyntick_nohz_done && dyntick_irq_done;[
] 
 []


Overfull \hbox (14.98413pt too wide) in paragraph at lines 1295--1295
[] \T1/pcrs/m/n/7 39       shouldexit = dyntick_nohz_done && dyntick_irq_done;[
] 
 []

[220]
Underfull \vbox (badness 10000) has occurred while \output is active []

 [221]
Overfull \hbox (14.98413pt too wide) in paragraph at lines 1583--1583
[] \T1/pcrs/m/n/7 41     EXECUTE_IRQ(stmt2_1, tmp = dynticks_progress_counter)[
] 
 []


Underfull \hbox (badness 2608) in paragraph at lines 1658--1659
[]\T1/ptm/m/n/10 (+20) Finally, []\T1/pcrs/m/n/10 _[][][][] \T1/ptm/m/n/10 (+20
) re-quires only a few
 []

[222]

LaTeX Warning: Hyper reference `QQA.12.19' on page 223 undefined on input line 
1728.


LaTeX Warning: Hyper reference `QQA.12.19' on page 223 undefined on input line 
1757.


Underfull \hbox (badness 1668) in paragraph at lines 1802--1804
[]\T1/ptm/b/n/10 Promela and spin can ver-ify interrupt/NMI-
 []


LaTeX Warning: Citation `PaulEMcKenney2008HierarchicalRCU' on page 223 undefine
d on input line 1849.


LaTeX Warning: Citation `ManfredSpraul2008StateMachineRCU' on page 223 undefine
d on input line 1851.

[223]
Underfull \hbox (badness 10000) in paragraph at lines 1886--1892
[]\T1/ptm/m/n/10 (+20) The []\T1/pcrs/m/n/10 _[][][]\T1/ptm/m/n/10 (+20) , [][]
[], and
 []


Underfull \hbox (badness 5175) in paragraph at lines 1886--1892
[]\T1/pcrs/m/n/10 _[][][] \T1/ptm/m/n/10 (+20) vari-ables are for the irq code
 []


LaTeX Warning: Hyper reference `QQA.12.20' on page 224 undefined on input line 
1925.


LaTeX Warning: Hyper reference `QQA.12.20' on page 224 undefined on input line 
1937.

[224]
Underfull \hbox (badness 10000) in paragraph at lines 2105--2116
[]\T1/ptm/m/n/10 (+20) Line 18 of []\T1/pcrs/m/n/10 _[]_[][][][] \T1/ptm/m/n/10
 (+20) decre-ments
 []


Underfull \hbox (badness 1342) in paragraph at lines 2105--2116
\T1/ptm/m/n/10 (+20) a mem-ory bar-rier to en-sure that the in-cre-ment of
 []


Underfull \hbox (badness 10000) in paragraph at lines 2149--2166
\T1/ptm/m/n/10 (+20) Figure []12.23[] shows []\T1/pcrs/m/n/10 _[]_[]_
 []


Underfull \hbox (badness 10000) in paragraph at lines 2149--2166
\T1/ptm/m/n/10 (+20) CPU's [][][] and []\T1/pcrs/m/n/10 _[][][] \T1/ptm/m/n/10 
(+20) coun-ters.
 []


Underfull \vbox (badness 10000) has occurred while \output is active []

 [225]
Underfull \hbox (badness 1092) in paragraph at lines 2199--2223
[]\T1/ptm/m/n/10 (+20) Figure []12.24[] shows []\T1/pcrs/m/n/10 _[]_[]_
 []


LaTeX Warning: Hyper reference `QQA.12.21' on page 226 undefined on input line 
2224.


LaTeX Warning: Hyper reference `QQA.12.21' on page 226 undefined on input line 
2238.

) (./formal/ppcmem.tex
Underfull \hbox (badness 10000) in paragraph at lines 3--3
[]\T1/ptm/b/n/14.4 Special-Purpose State-Space
 []

[226]

LaTeX Warning: Citation `JadeAlglave2011ppcmem' on page 227 undefined on input 
line 27.


LaTeX Warning: Citation `PeteBecker2011N3242' on page 227 undefined on input li
ne 29.


LaTeX Warning: Hyper reference `QQA.12.22' on page 227 undefined on input line 
32.


LaTeX Warning: Hyper reference `QQA.12.22' on page 227 undefined on input line 
42.


Underfull \vbox (badness 10000) has occurred while \output is active []



LaTeX Warning: Hyper reference `QQA.12.23' on page 227 undefined on input line 
118.


LaTeX Warning: Hyper reference `QQA.12.23' on page 227 undefined on input line 
133.

[227]

LaTeX Warning: Hyper reference `QQA.12.24' on page 228 undefined on input line 
177.


LaTeX Warning: Hyper reference `QQA.12.24' on page 228 undefined on input line 
193.


LaTeX Warning: Citation `PaulEMcKenney2011ppcmem' on page 228 undefined on inpu
t line 243.

[228]

LaTeX Warning: Hyper reference `QQA.12.25' on page 229 undefined on input line 
316.


LaTeX Warning: Hyper reference `QQA.12.25' on page 229 undefined on input line 
325.


LaTeX Warning: Citation `JadeAlglave2011ppcmem' on page 229 undefined on input 
line 386.

) (./formal/axiomatic.tex [229]

LaTeX Warning: Citation `Alglave:2014:HCM:2594291.2594347' on page 230 undefine
d on input line 67.


LaTeX Warning: Citation `PaulEMcKenney2014weakaxiom' on page 230 undefined on i
nput line 119.

) (./formal/sat.tex

LaTeX Warning: Citation `Kroening:2008:DPA:1391237' on page 230 undefined on in
put line 20.

) [230]

LaTeX Warning: Citation `JonathanCorbet2006lockdep' on page 231 undefined on in
put line 52.


LaTeX Warning: Citation `DaveJones2011Trinity' on page 231 undefined on input l
ine 52.


Underfull \vbox (badness 2057) has occurred while \output is active []

 [231]

LaTeX Warning: Hyper reference `QQA.12.26' on page 232 undefined on input line 
115.


LaTeX Warning: Hyper reference `QQA.12.26' on page 232 undefined on input line 
140.

) (./together/together.tex [232]
Chapter 13.

Underfull \hbox (badness 1565) in paragraph at lines 13--20
\T1/ptm/m/n/10 (+20) This chap-ter gives a few hints on han-dling some
 []

(./together/count.tex

LaTeX Warning: Citation `SilasBoydWickizerPhD' on page 233 undefined on input l
ine 67.

) (./together/refcnt.tex [233

]

LaTeX Warning: Hyper reference `QQA.13.1' on page 234 undefined on input line 4
8.


LaTeX Warning: Hyper reference `QQA.13.1' on page 234 undefined on input line 6
5.


Underfull \hbox (badness 10000) in paragraph at lines 126--126
[]\T1/ptm/b/n/12 Implementation of Reference-
 []

[234]

LaTeX Warning: Hyper reference `QQA.13.2' on page 235 undefined on input line 2
35.


LaTeX Warning: Hyper reference `QQA.13.2' on page 235 undefined on input line 2
47.

[235]

LaTeX Warning: Hyper reference `QQA.13.3' on page 236 undefined on input line 3
14.


LaTeX Warning: Hyper reference `QQA.13.3' on page 236 undefined on input line 3
26.


LaTeX Warning: Hyper reference `QQA.13.4' on page 236 undefined on input line 3
28.


LaTeX Warning: Hyper reference `QQA.13.4' on page 236 undefined on input line 3
40.


LaTeX Warning: Hyper reference `QQA.13.5' on page 236 undefined on input line 3
42.


LaTeX Warning: Hyper reference `QQA.13.5' on page 236 undefined on input line 3
50.


LaTeX Warning: Hyper reference `QQA.13.6' on page 236 undefined on input line 4
28.


LaTeX Warning: Hyper reference `QQA.13.6' on page 236 undefined on input line 4
41.

LaTeX Font Info:    Font shape `T1/pcrs/m/n' will be
(Font)              scaled to size 6.11002pt on input line 450.
[236]
Underfull \vbox (badness 3872) has occurred while \output is active []


Underfull \hbox (badness 10000) in paragraph at lines 572--577
[][][][][]\T1/pcrs/m/n/10 _[]_[]_[][][]_[][]
 []


Underfull \hbox (badness 1308) in paragraph at lines 572--577
[][][][][][][] \T1/ptm/m/n/10 (+20) Atom-i-cally decre-ments the ref-er-enced
 []

[237]
Underfull \hbox (badness 10000) in paragraph at lines 580--586
[][][][][]\T1/pcrs/m/n/10 _[]_[]_[][][]_[][]
 []


Underfull \hbox (badness 1838) in paragraph at lines 580--586
[][][][][][][] \T1/ptm/m/n/10 (+20) Atom-i-cally in-cre-ments the ref-er-enced
 []


Underfull \hbox (badness 10000) in paragraph at lines 586--592
[][][][][]\T1/pcrs/m/n/10 _[][][]_[][][][][][][][][] \T1/ptm/m/n/10 (+20) Re-
 []


Underfull \hbox (badness 10000) in paragraph at lines 592--599
[][][][][]\T1/pcrs/m/n/10 _[][][]_[][][][][][][][][][]
 []


Underfull \hbox (badness 10000) in paragraph at lines 599--610
[][][][][]\T1/pcrs/m/n/10 _[][][][][][]_[][]
 []


Underfull \hbox (badness 10000) in paragraph at lines 599--610
[][][][][][][][][][][][][][][][][]\T1/pcrs/m/n/10 _[][]
 []


Underfull \hbox (badness 1975) in paragraph at lines 599--610
\T1/ptm/m/n/10 (+20) all cur-rently ex-e-cut-ing RCU read-side crit-i-cal
 []


Underfull \hbox (badness 2119) in paragraph at lines 599--610
\T1/ptm/m/n/10 (+20) sec-tions com-plete, how-ever, the []\T1/pcrs/m/n/10 _[][]
[][]
 []


Underfull \hbox (badness 1852) in paragraph at lines 610--613
[][][][][][]\T1/pcrs/m/n/10 _[][][][][][][][][][][][][][][] \T1/ptm/m/n/10 (+20
) Given
 []


Underfull \hbox (badness 3735) in paragraph at lines 615--618
[][][][][]\T1/pcrs/m/n/10 _[]_[][][][][][][] \T1/ptm/m/n/10 (+20) Marks the
 []


Underfull \hbox (badness 10000) in paragraph at lines 618--622
[][][][][]\T1/pcrs/m/n/10 _[]__[]_[]_
 []


Underfull \hbox (badness 7451) in paragraph at lines 618--622
[][][][][][][] \T1/ptm/m/n/10 (+20) Is-sues a mem-ory bar-rier and
 []


LaTeX Warning: Hyper reference `QQA.13.7' on page 238 undefined on input line 6
29.


LaTeX Warning: Hyper reference `QQA.13.7' on page 238 undefined on input line 6
39.


LaTeX Warning: Citation `PaulEMcKenney2006c' on page 238 undefined on input lin
e 649.

) (./together/applyrcu.tex
Underfull \hbox (badness 10000) in paragraph at lines 11--11
[]\T1/ptm/b/n/12 RCU and Per-Thread-Variable-
 []

[238]

LaTeX Warning: Hyper reference `QQA.13.8' on page 239 undefined on input line 2
7.


LaTeX Warning: Hyper reference `QQA.13.8' on page 239 undefined on input line 3
7.


LaTeX Warning: Hyper reference `QQA.13.9' on page 239 undefined on input line 5
5.


LaTeX Warning: Hyper reference `QQA.13.9' on page 239 undefined on input line 9
9.

[239]
Underfull \hbox (badness 3954) in paragraph at lines 210--222
[]\T1/ptm/m/n/10 (+20) Lines 15-29 show []\T1/pcrs/m/n/10 _[][][][]\T1/ptm/m/n/
10 (+20) , which has
 []


LaTeX Warning: Hyper reference `QQA.13.10' on page 240 undefined on input line 
235.


LaTeX Warning: Hyper reference `QQA.13.10' on page 240 undefined on input line 
257.


Underfull \hbox (badness 10000) in paragraph at lines 259--276
[]\T1/ptm/m/n/10 (+20) Lines 50-70 shows []\T1/pcrs/m/n/10 _[]_
 []


Underfull \hbox (badness 1642) in paragraph at lines 259--276
[][][][]\T1/ptm/m/n/10 (+20) , which is in-voked by each thread just
 []


Underfull \hbox (badness 1460) in paragraph at lines 259--276
\T1/pcrs/m/n/10 ->[][][]\T1/ptm/m/n/10 (+20) , and line 64 [][][]s the ex-it-in
g thread's
 []


LaTeX Warning: Hyper reference `QQA.13.11' on page 240 undefined on input line 
279.


LaTeX Warning: Hyper reference `QQA.13.11' on page 240 undefined on input line 
307.


LaTeX Warning: Citation `MathieuDesnoyers2009URCU' on page 240 undefined on inp
ut line 318.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 339--355
[][]
 []

[240]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 362--377
[][]
 []


LaTeX Warning: Citation `Arcangeli03' on page 241 undefined on input line 458.

[241]

LaTeX Warning: Hyper reference `QQA.13.12' on page 242 undefined on input line 
556.


LaTeX Warning: Hyper reference `QQA.13.12' on page 242 undefined on input line 
616.

) (./together/hash.tex
Underfull \vbox (badness 10000) has occurred while \output is active []

 [242]
Underfull \hbox (badness 4872) in paragraph at lines 72--72
[]\T1/ptm/b/n/12 Update-Friendly Hash-Table Tra-
 []


LaTeX Warning: Hyper reference `QQA.13.13' on page 243 undefined on input line 
96.


LaTeX Warning: Hyper reference `QQA.13.13' on page 243 undefined on input line 
116.

)) (./advsync/advsync.tex [243

] [244

]
Chapter 14.

LaTeX Warning: Citation `JadeAlglave2013-WeaknessIsVirtue' on page 245 undefine
d on input line 11.

(./advsync/memorybarriers.tex [245]
Underfull \hbox (badness 5036) in paragraph at lines 72--72
[]\T1/ptm/b/n/12 Memory Or-der-ing and Mem-ory
 []

<appendix/whymb/cacheSC.pdf, id=6122, 217.26154pt x 144.98865pt>
File: appendix/whymb/cacheSC.pdf Graphic file (type pdf)

<use appendix/whymb/cacheSC.pdf>
Package pdftex.def Info: appendix/whymb/cacheSC.pdf used on input line 93.
(pdftex.def)             Requested size: 217.26099pt x 144.98828pt.

<cartoons/r-2014-Out-of-order.pdf, id=6124, 353.09114pt x 377.19809pt>
File: cartoons/r-2014-Out-of-order.pdf Graphic file (type pdf)

<use cartoons/r-2014-Out-of-order.pdf>
Package pdftex.def Info: cartoons/r-2014-Out-of-order.pdf used on input line 11
8.
(pdftex.def)             Requested size: 353.09027pt x 377.19716pt.

Underfull \vbox (badness 10000) has occurred while \output is active []

 [246 <./appendix/whymb/cacheSC.pdf>]

LaTeX Warning: Hyper reference `QQA.14.1' on page 247 undefined on input line 1
97.


LaTeX Warning: Hyper reference `QQA.14.1' on page 247 undefined on input line 2
07.


LaTeX Warning: Hyper reference `QQA.14.2' on page 247 undefined on input line 2
09.


LaTeX Warning: Hyper reference `QQA.14.2' on page 247 undefined on input line 2
23.


LaTeX Warning: Hyper reference `QQA.14.3' on page 247 undefined on input line 2
55.


LaTeX Warning: Hyper reference `QQA.14.3' on page 247 undefined on input line 2
65.

[247 <./cartoons/r-2014-Out-of-order.pdf>]
<advsync/MoreThanOneValue.pdf, id=6160, 318.5298pt x 100.01794pt>
File: advsync/MoreThanOneValue.pdf Graphic file (type pdf)

<use advsync/MoreThanOneValue.pdf>
Package pdftex.def Info: advsync/MoreThanOneValue.pdf used on input line 302.
(pdftex.def)             Requested size: 318.52902pt x 100.01768pt.


LaTeX Warning: Hyper reference `QQA.14.4' on page 248 undefined on input line 3
18.


LaTeX Warning: Hyper reference `QQA.14.4' on page 248 undefined on input line 3
31.


LaTeX Warning: Hyper reference `QQA.14.5' on page 248 undefined on input line 3
33.


LaTeX Warning: Hyper reference `QQA.14.5' on page 248 undefined on input line 3
49.

<advsync/MoreThanOneValue-15CPU.pdf, id=6164, 551.66367pt x 589.07504pt>
File: advsync/MoreThanOneValue-15CPU.pdf Graphic file (type pdf)

<use advsync/MoreThanOneValue-15CPU.pdf>
Package pdftex.def Info: advsync/MoreThanOneValue-15CPU.pdf used on input line 
369.
(pdftex.def)             Requested size: 551.66232pt x 589.0736pt.

<advsync/store15tred.pdf, id=6166, 308.15042pt x 470.75856pt>
File: advsync/store15tred.pdf Graphic file (type pdf)

<use advsync/store15tred.pdf>
Package pdftex.def Info: advsync/store15tred.pdf used on input line 386.
(pdftex.def)             Requested size: 308.14966pt x 470.75742pt.
 [248 <./advsync/MoreThanOneValue.pdf>] [249 <./advsync/MoreThanOneValue-15CPU.
pdf>]

LaTeX Warning: Citation `PeteBecker2011N3242' on page 250 undefined on input li
ne 494.

[250 <./advsync/store15tred.pdf>]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 519--531
[][]
 []


LaTeX Warning: Hyper reference `QQA.14.6' on page 251 undefined on input line 5
32.


LaTeX Warning: Hyper reference `QQA.14.6' on page 251 undefined on input line 5
42.


Underfull \hbox (badness 4024) in paragraph at lines 600--600
[]\T1/ptm/b/n/10 Pair-Wise Mem-ory Bar-ri-ers: Por-ta-ble
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 614--626
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 646--658
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 683--695
[][]
 []

[251]
Underfull \hbox (badness 10000) in paragraph at lines 710--710
[]\T1/ptm/b/n/10 Pair-Wise Mem-ory Bar-ri-ers: Semi-
 []


LaTeX Warning: Hyper reference `QQA.14.7' on page 252 undefined on input line 7
31.


LaTeX Warning: Hyper reference `QQA.14.7' on page 252 undefined on input line 7
56.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 764--776
[][]
 []


Underfull \hbox (badness 4582) in paragraph at lines 799--799
[]\T1/ptm/b/n/10 Pair-Wise Mem-ory Bar-ri-ers: Du-bi-ous
 []

[252]

LaTeX Warning: Hyper reference `QQA.14.8' on page 253 undefined on input line 8
50.


LaTeX Warning: Hyper reference `QQA.14.8' on page 253 undefined on input line 8
68.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 906--916
[][]
 []


LaTeX Warning: Hyper reference `QQA.14.9' on page 253 undefined on input line 9
17.


LaTeX Warning: Hyper reference `QQA.14.9' on page 253 undefined on input line 9
28.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 934--945
[][]
 []


LaTeX Warning: Hyper reference `QQA.14.10' on page 253 undefined on input line 
946.


LaTeX Warning: Hyper reference `QQA.14.10' on page 253 undefined on input line 
964.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 972--982
[][]
 []


LaTeX Warning: Hyper reference `QQA.14.11' on page 253 undefined on input line 
983.


LaTeX Warning: Hyper reference `QQA.14.11' on page 253 undefined on input line 
1000.

[253]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 1024--1043
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1050--1066
[][]
 []


Underfull \hbox (badness 5374) in paragraph at lines 1067--1074
[]\T1/pcrs/m/n/10 _[][][]->[][][][][][][] \T1/ptm/m/n/10 (+20) has seen CPU 1's

 []

<advsync/AbstractMemoryAccessModel.pdf, id=6286, 217.26154pt x 122.85901pt>
File: advsync/AbstractMemoryAccessModel.pdf Graphic file (type pdf)

<use advsync/AbstractMemoryAccessModel.pdf>
Package pdftex.def Info: advsync/AbstractMemoryAccessModel.pdf used on input li
ne 1126.
(pdftex.def)             Requested size: 217.26099pt x 122.85869pt.
 [254]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 1147--1158
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1164--1180
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1184--1195
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1204--1215
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1223--1233
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1248--1256
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1260--1268
[][]
 []


Overfull \hbox (20.00003pt too wide) in paragraph at lines 1281--1287
[][] 
 []


Overfull \hbox (20.00003pt too wide) in paragraph at lines 1290--1296
[][] 
 []


Overfull \hbox (20.00003pt too wide) in paragraph at lines 1302--1308
[][] 
 []

[255 <./advsync/AbstractMemoryAccessModel.pdf>]
Overfull \hbox (20.00003pt too wide) in paragraph at lines 1311--1318
[][] 
 []


Overfull \hbox (20.00003pt too wide) in paragraph at lines 1321--1327
[][] 
 []


Overfull \hbox (20.00003pt too wide) in paragraph at lines 1330--1336
[][] 
 []


Overfull \hbox (20.00003pt too wide) in paragraph at lines 1351--1357
[][] 
 []


Overfull \hbox (20.00003pt too wide) in paragraph at lines 1360--1371
[][] 
 []


Overfull \hbox (20.00003pt too wide) in paragraph at lines 1375--1381
[][] 
 []


Overfull \hbox (20.00003pt too wide) in paragraph at lines 1384--1393
[][] 
 []


Overfull \hbox (20.00003pt too wide) in paragraph at lines 1396--1402
[][] 
 []


Overfull \hbox (20.00003pt too wide) in paragraph at lines 1405--1414
[][] 
 []


Overfull \hbox (20.00003pt too wide) in paragraph at lines 1417--1423
[][] 
 []


Overfull \hbox (20.00003pt too wide) in paragraph at lines 1426--1433
[][] 
 []

[256]

LaTeX Warning: Hyper reference `QQA.14.12' on page 257 undefined on input line 
1590.


LaTeX Warning: Hyper reference `QQA.14.12' on page 257 undefined on input line 
1608.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1595--1609
[][]
 []

[257]

LaTeX Warning: Citation `Torvalds2.6kernel' on page 258 undefined on input line
 1638.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1653--1667
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1673--1682
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1688--1696
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1706--1721
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1742--1757
[][]
 []

[258]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 1782--1793
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1801--1812
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1818--1827
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1843--1851
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1856--1872
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1877--1891
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1900--1914
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1925--1939
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1945--1954
[][]
 []

[259]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 1964--1979
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1988--1997
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 2003--2011
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 2024--2037
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 2047--2059
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 2073--2090
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 2096--2108
[][]
 []


LaTeX Warning: Citation `Maranget2012TutorialARMPower' on page 260 undefined on
 input line 2117.

[260]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 2180--2195
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 2199--2214
[][]
 []

<advsync/MemoryBarrierPairing.pdf, id=6381, 248.53653pt x 51.43802pt>
File: advsync/MemoryBarrierPairing.pdf Graphic file (type pdf)

<use advsync/MemoryBarrierPairing.pdf>
Package pdftex.def Info: advsync/MemoryBarrierPairing.pdf used on input line 22
26.
(pdftex.def)             Requested size: 248.5359pt x 51.43788pt.

Overfull \hbox (10.00002pt too wide) in paragraph at lines 2236--2249
[][]
 []

<advsync/WriteBarrierOrdering.pdf, id=6383, 376.21045pt x 137.54904pt>
File: advsync/WriteBarrierOrdering.pdf Graphic file (type pdf)

<use advsync/WriteBarrierOrdering.pdf>
Package pdftex.def Info: advsync/WriteBarrierOrdering.pdf used on input line 22
59.
(pdftex.def)             Requested size: 376.20952pt x 137.54869pt.

Overfull \hbox (10.00002pt too wide) in paragraph at lines 2269--2284
[][]
 []

[261 <./advsync/MemoryBarrierPairing.pdf>]
<advsync/DataDependencyNeeded.pdf, id=6404, 381.63069pt x 173.68404pt>
File: advsync/DataDependencyNeeded.pdf Graphic file (type pdf)

<use advsync/DataDependencyNeeded.pdf>
Package pdftex.def Info: advsync/DataDependencyNeeded.pdf used on input line 22
91.
(pdftex.def)             Requested size: 381.62975pt x 173.68361pt.

Overfull \hbox (10.00002pt too wide) in paragraph at lines 2305--2321
[][]
 []

<advsync/DataDependencySupplied.pdf, id=6406, 347.34746pt x 159.44266pt>
File: advsync/DataDependencySupplied.pdf Graphic file (type pdf)

<use advsync/DataDependencySupplied.pdf>
Package pdftex.def Info: advsync/DataDependencySupplied.pdf used on input line 
2327.
(pdftex.def)             Requested size: 347.34659pt x 159.44226pt.

Overfull \hbox (10.00002pt too wide) in paragraph at lines 2337--2351
[][]
 []

<advsync/ReadBarrierNeeded.pdf, id=6408, 347.34746pt x 130.32184pt>
File: advsync/ReadBarrierNeeded.pdf Graphic file (type pdf)

<use advsync/ReadBarrierNeeded.pdf>
Package pdftex.def Info: advsync/ReadBarrierNeeded.pdf used on input line 2358.

(pdftex.def)             Requested size: 347.34659pt x 130.32152pt.

Overfull \hbox (10.00002pt too wide) in paragraph at lines 2368--2383
[][]
 []

<advsync/ReadBarrierSupplied.pdf, id=6410, 347.34746pt x 123.30765pt>
File: advsync/ReadBarrierSupplied.pdf Graphic file (type pdf)

<use advsync/ReadBarrierSupplied.pdf>
Package pdftex.def Info: advsync/ReadBarrierSupplied.pdf used on input line 239
0.
(pdftex.def)             Requested size: 347.34659pt x 123.30733pt.

Overfull \hbox (10.00002pt too wide) in paragraph at lines 2401--2417
[][]
 []

<advsync/ReadBarrierSupplied1.pdf, id=6412, 347.34746pt x 144.98865pt>
File: advsync/ReadBarrierSupplied1.pdf Graphic file (type pdf)

<use advsync/ReadBarrierSupplied1.pdf>
Package pdftex.def Info: advsync/ReadBarrierSupplied1.pdf used on input line 24
25.
(pdftex.def)             Requested size: 347.34659pt x 144.98828pt.

<advsync/ReadBarrierSupplied2.pdf, id=6414, 347.34746pt x 144.98865pt>
File: advsync/ReadBarrierSupplied2.pdf Graphic file (type pdf)

<use advsync/ReadBarrierSupplied2.pdf>
Package pdftex.def Info: advsync/ReadBarrierSupplied2.pdf used on input line 24
36.
(pdftex.def)             Requested size: 347.34659pt x 144.98828pt.
 [262 <./advsync/WriteBarrierOrdering.pdf>]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 2464--2477
[][]
 []


Underfull \vbox (badness 4120) has occurred while \output is active []


<advsync/SpeculativeLoad.pdf, id=6436, 349.53673pt x 97.94061pt>
File: advsync/SpeculativeLoad.pdf Graphic file (type pdf)

<use advsync/SpeculativeLoad.pdf>
Package pdftex.def Info: advsync/SpeculativeLoad.pdf used on input line 2490.
(pdftex.def)             Requested size: 349.53587pt x 97.94035pt.

Overfull \hbox (10.00002pt too wide) in paragraph at lines 2499--2513
[][]
 []


Underfull \vbox (badness 1043) has occurred while \output is active []

 [263 <./advsync/DataDependencyNeeded.pdf> <./advsync/DataDependencySupplied.pd
f>]
<advsync/SpeculativeLoadBarrier.pdf, id=6469, 349.39218pt x 116.08066pt>
File: advsync/SpeculativeLoadBarrier.pdf Graphic file (type pdf)

<use advsync/SpeculativeLoadBarrier.pdf>
Package pdftex.def Info: advsync/SpeculativeLoadBarrier.pdf used on input line 
2526.
(pdftex.def)             Requested size: 349.39131pt x 116.08037pt.

<advsync/SpeculativeLoadBarrierCancel.pdf, id=6470, 349.39218pt x 119.62172pt>
File: advsync/SpeculativeLoadBarrierCancel.pdf Graphic file (type pdf)

<use advsync/SpeculativeLoadBarrierCancel.pdf>
Package pdftex.def Info: advsync/SpeculativeLoadBarrierCancel.pdf used on input
 line 2533.
(pdftex.def)             Requested size: 349.39131pt x 119.62141pt.
 [264 <./advsync/ReadBarrierNeeded.pdf> <./advsync/ReadBarrierSupplied.pdf>]
Underfull \hbox (badness 1210) in paragraph at lines 2567--2569
[]\T1/ptm/m/n/10 (+20) All UN-LOCK op-er-a-tions is-sued be-fore a
 []


Underfull \vbox (badness 10000) has occurred while \output is active []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 2594--2604
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 2608--2618
[][]
 []

[265 <./advsync/ReadBarrierSupplied1.pdf> <./advsync/ReadBarrierSupplied2.pdf>]

LaTeX Warning: Hyper reference `QQA.14.13' on page 266 undefined on input line 
2623.


LaTeX Warning: Hyper reference `QQA.14.13' on page 266 undefined on input line 
2630.


Underfull \hbox (badness 2384) in paragraph at lines 2623--2631
[]\T1/ptm/b/n/10 Quick Quiz 14.13:[] \T1/ptm/m/n/10 (+20) What se-quence of LOC
K-
 []


LaTeX Warning: Hyper reference `QQA.14.14' on page 266 undefined on input line 
2632.


LaTeX Warning: Hyper reference `QQA.14.14' on page 266 undefined on input line 
2640.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 2649--2663
[][]
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 2669--2681
[][]
 []


Underfull \vbox (badness 2165) has occurred while \output is active []

 [266 <./advsync/SpeculativeLoad.pdf> <./advsync/SpeculativeLoadBarrier.pdf> <.
/advsync/SpeculativeLoadBarrierCancel.pdf>]

LaTeX Warning: Hyper reference `QQA.14.15' on page 267 undefined on input line 
2710.


LaTeX Warning: Hyper reference `QQA.14.15' on page 267 undefined on input line 
2736.


LaTeX Warning: Hyper reference `QQA.14.16' on page 267 undefined on input line 
2766.


LaTeX Warning: Hyper reference `QQA.14.16' on page 267 undefined on input line 
2777.

<advsync/MemoryArchitecture.pdf, id=6582, 379.86908pt x 154.46303pt>
File: advsync/MemoryArchitecture.pdf Graphic file (type pdf)

<use advsync/MemoryArchitecture.pdf>
Package pdftex.def Info: advsync/MemoryArchitecture.pdf used on input line 2822
.
(pdftex.def)             Requested size: 379.86815pt x 154.46263pt.

<advsync/SplitCache.pdf, id=6583, 260.62357pt x 140.0101pt>
File: advsync/SplitCache.pdf Graphic file (type pdf)

<use advsync/SplitCache.pdf>
Package pdftex.def Info: advsync/SplitCache.pdf used on input line 2851.
(pdftex.def)             Requested size: 260.62292pt x 140.00975pt.
 [267]
Underfull \hbox (badness 10000) in paragraph at lines 2893--2893
[]\T1/ptm/b/n/12 Where Are Mem-ory Bar-ri-ers
 []

[268 <./advsync/MemoryArchitecture.pdf> <./advsync/SplitCache.pdf>])
Underfull \hbox (badness 10000) in paragraph at lines 73--73
[]\T1/ptm/b/n/14.4 Non-Blocking Syn-chro-niza-
 []


LaTeX Warning: Citation `DanAlitarh2013PracticalProgress' on page 269 undefined
 on input line 117.


LaTeX Warning: Citation `Herlihy91' on page 269 undefined on input line 123.


LaTeX Warning: Citation `DanAlitarh2013PracticalProgress' on page 269 undefined
 on input line 126.


LaTeX Warning: Citation `Herlihy93' on page 269 undefined on input line 129.


LaTeX Warning: Citation `Herlihy93' on page 269 undefined on input line 131.


LaTeX Warning: Citation `HerlihyLM03' on page 269 undefined on input line 134.


LaTeX Warning: Citation `DanAlitarh2013PracticalProgress' on page 269 undefined
 on input line 137.


LaTeX Warning: Citation `DanAlitarh2013PracticalProgress' on page 269 undefined
 on input line 140.


LaTeX Warning: Citation `DanAlitarh2013PracticalProgress' on page 269 undefined
 on input line 143.

[269]

LaTeX Warning: Citation `MagedMichael1993JPDC' on page 270 undefined on input l
ine 226.


LaTeX Warning: Citation `MathieuDesnoyers2009URCU' on page 270 undefined on inp
ut line 231.


LaTeX Warning: Citation `MichaelScott96' on page 270 undefined on input line 25
5.


LaTeX Warning: Citation `DanAlitarh2013PracticalProgress' on page 270 undefined
 on input line 266.


LaTeX Warning: Citation `SamyAlBahra2013NBS' on page 270 undefined on input lin
e 267.

[270]

LaTeX Warning: Citation `Takada:1995:RSN:527074.828566' on page 271 undefined o
n input line 281.


LaTeX Warning: Citation `Cai-DongWang1996PrioInherLock' on page 271 undefined o
n input line 281.


LaTeX Warning: Citation `BjoernBrandenburgPhD' on page 271 undefined on input l
ine 287.

) (./rt/rt.tex [271

] [272

]
Chapter 15.

Underfull \hbox (badness 1028) in paragraph at lines 25--25
[]\T1/ptm/b/n/14.4 What is Real-Time Com-put-
 []

<cartoons/realtime-smash.pdf, id=6675, 389.66177pt x 316.36192pt>
File: cartoons/realtime-smash.pdf Graphic file (type pdf)

<use cartoons/realtime-smash.pdf>
Package pdftex.def Info: cartoons/realtime-smash.pdf used on input line 78.
(pdftex.def)             Requested size: 389.66081pt x 316.36115pt.

<cartoons/realtime-lifesupport-nobomb.pdf, id=6677, 460.07082pt x 405.09142pt>
File: cartoons/realtime-lifesupport-nobomb.pdf Graphic file (type pdf)

<use cartoons/realtime-lifesupport-nobomb.pdf>
Package pdftex.def Info: cartoons/realtime-lifesupport-nobomb.pdf used on input
 line 96.
(pdftex.def)             Requested size: 460.06969pt x 405.09042pt.
 [273]
<cartoons/realtime-lazy-crop.pdf, id=6688, 341.43962pt x 800.53479pt>
File: cartoons/realtime-lazy-crop.pdf Graphic file (type pdf)

<use cartoons/realtime-lazy-crop.pdf>
Package pdftex.def Info: cartoons/realtime-lazy-crop.pdf used on input line 126
.
(pdftex.def)             Requested size: 341.43878pt x 800.53282pt.
 [274 <./cartoons/realtime-smash.pdf> <./cartoons/realtime-lifesupport-nobomb.p
df>]
Underfull \vbox (badness 10000) has occurred while \output is active []



LaTeX Warning: Hyper reference `QQA.15.1' on page 275 undefined on input line 2
12.


LaTeX Warning: Hyper reference `QQA.15.1' on page 275 undefined on input line 2
19.

[275 <./cartoons/realtime-lazy-crop.pdf>]

LaTeX Warning: Hyper reference `QQA.15.2' on page 276 undefined on input line 2
78.


LaTeX Warning: Hyper reference `QQA.15.2' on page 276 undefined on input line 3
07.


Underfull \vbox (badness 7851) has occurred while \output is active []

 [276]

LaTeX Warning: Hyper reference `QQA.15.3' on page 277 undefined on input line 4
22.


LaTeX Warning: Hyper reference `QQA.15.3' on page 277 undefined on input line 4
53.


LaTeX Warning: Citation `KristofferBohmann2001a' on page 277 undefined on input
 line 477.


LaTeX Warning: Citation `DeCandia:2007:DAH:1323293.1294281' on page 277 undefin
ed on input line 478.


LaTeX Warning: Hyper reference `QQA.15.4' on page 277 undefined on input line 4
86.


LaTeX Warning: Hyper reference `QQA.15.4' on page 277 undefined on input line 5
03.

[277]

LaTeX Warning: Citation `JeremyWPeters2006NYTDec11' on page 278 undefined on in
put line 535.


LaTeX Warning: Citation `BillInmon2007a' on page 278 undefined on input line 53
5.


Underfull \hbox (badness 10000) in paragraph at lines 537--537
[]\T1/ptm/b/n/14.4 Who Needs Par-al-lel Real-
 []


LaTeX Warning: Citation `BjoernBrandenburgPhD' on page 278 undefined on input l
ine 545.


LaTeX Warning: Citation `ThomasGleixner2010AcademiaVsReality' on page 278 undef
ined on input line 549.

<rt/rt-reflexes.pdf, id=6741, 207.19669pt x 51.4132pt>
File: rt/rt-reflexes.pdf Graphic file (type pdf)

<use rt/rt-reflexes.pdf>
Package pdftex.def Info: rt/rt-reflexes.pdf used on input line 553.
(pdftex.def)             Requested size: 207.19617pt x 51.41306pt.


LaTeX Warning: Citation `RobertBerry2008IBMSysJ' on page 278 undefined on input
 line 579.


Underfull \hbox (badness 3690) in paragraph at lines 597--597
[]\T1/ptm/b/n/14.4 Implementing Par-al-lel Real-
 []

[278 <./rt/rt-reflexes.pdf>]
<rt/rt-regimes.pdf, id=6766, 192.32463pt x 133.04182pt>
File: rt/rt-regimes.pdf Graphic file (type pdf)

<use rt/rt-regimes.pdf>
Package pdftex.def Info: rt/rt-regimes.pdf used on input line 618.
(pdftex.def)             Requested size: 192.32416pt x 133.04149pt.

Underfull \vbox (badness 1946) has occurred while \output is active []



LaTeX Warning: Citation `PeterOkech2009InherentRandomness' on page 279 undefine
d on input line 661.


LaTeX Warning: Citation `ThomasGleixner2012KVMrealtime' on page 279 undefined o
n input line 668.


LaTeX Warning: Citation `JanKiszka2014virtRT' on page 279 undefined on input li
ne 668.


Underfull \hbox (badness 3884) in paragraph at lines 678--678
[]\T1/ptm/b/n/12 Implementing Par-al-lel Real-Time
 []

<rt/Linux-on-RTOS.pdf, id=6768, 138.49516pt x 172.68529pt>
File: rt/Linux-on-RTOS.pdf Graphic file (type pdf)

<use rt/Linux-on-RTOS.pdf>
Package pdftex.def Info: rt/Linux-on-RTOS.pdf used on input line 683.
(pdftex.def)             Requested size: 138.49481pt x 172.68486pt.
 [279 <./rt/rt-regimes.pdf> <./rt/Linux-on-RTOS.pdf

pdfTeX warning: pdflatex (file ./rt/Linux-on-RTOS.pdf): PDF inclusion: multiple
 pdfs with page group included in a single page
>]

LaTeX Warning: Citation `Xenomai2014' on page 280 undefined on input line 699.


LaTeX Warning: Citation `VictorYodaiken2004a' on page 280 undefined on input li
ne 699.

<rt/preemption.pdf, id=6798, 329.701pt x 514.41379pt>
File: rt/preemption.pdf Graphic file (type pdf)
 <use rt/preemption.pdf>
Package pdftex.def Info: rt/preemption.pdf used on input line 719.
(pdftex.def)             Requested size: 329.7002pt x 514.41252pt.

Underfull \vbox (badness 1668) has occurred while \output is active []


<rt/nohzfull.pdf, id=6803, 138.28467pt x 144.82314pt>
File: rt/nohzfull.pdf Graphic file (type pdf)
 <use rt/nohzfull.pdf>
Package pdftex.def Info: rt/nohzfull.pdf used on input line 776.
(pdftex.def)             Requested size: 138.28432pt x 144.82277pt.


LaTeX Warning: Citation `FredericWeisbecker2013nohz' on page 280 undefined on i
nput line 785.


LaTeX Warning: Citation `JonCorbet2004RealTimeLinuxPart1' on page 280 undefined
 on input line 807.


LaTeX Warning: Citation `JonCorbet2004RealTimeLinuxPart2' on page 280 undefined
 on input line 807.

[280] [281 <./rt/preemption.pdf>]
<rt/timerwheel.pdf, id=6837, 139.56924pt x 223.56195pt>
File: rt/timerwheel.pdf Graphic file (type pdf)

<use rt/timerwheel.pdf>
Package pdftex.def Info: rt/timerwheel.pdf used on input line 870.
(pdftex.def)             Requested size: 139.5689pt x 223.5614pt.

Underfull \vbox (badness 1817) has occurred while \output is active []

 [282 <./rt/nohzfull.pdf> <./rt/timerwheel.pdf

pdfTeX warning: pdflatex (file ./rt/timerwheel.pdf): PDF inclusion: multiple pd
fs with page group included in a single page
>] <cartoons/1kHz.pdf, id=6871, 319.79472pt x 287.27324pt>
File: cartoons/1kHz.pdf Graphic file (type pdf)

<use cartoons/1kHz.pdf>
Package pdftex.def Info: cartoons/1kHz.pdf used on input line 901.
(pdftex.def)             Requested size: 319.79393pt x 287.27254pt.

<cartoons/100kHz.pdf, id=6872, 350.14815pt x 258.00388pt>
File: cartoons/100kHz.pdf Graphic file (type pdf)

<use cartoons/100kHz.pdf>
Package pdftex.def Info: cartoons/100kHz.pdf used on input line 908.
(pdftex.def)             Requested size: 350.14728pt x 258.00323pt.
 <rt/irq.pdf, id=6878, 281.15167pt x 90.64609pt>
File: rt/irq.pdf Graphic file (type pdf)

<use rt/irq.pdf>
Package pdftex.def Info: rt/irq.pdf used on input line 971.
(pdftex.def)             Requested size: 281.15097pt x 90.64584pt.

Underfull \vbox (badness 10000) has occurred while \output is active []

 [283 <./cartoons/1kHz.pdf> <./cartoons/100kHz.pdf>]
<rt/threaded-irq.pdf, id=6892, 281.15167pt x 123.19008pt>
File: rt/threaded-irq.pdf Graphic file (type pdf)

<use rt/threaded-irq.pdf>
Package pdftex.def Info: rt/threaded-irq.pdf used on input line 991.
(pdftex.def)             Requested size: 281.15097pt x 123.18977pt.


LaTeX Warning: Citation `LuiSha1990PriorityInheritance' on page 284 undefined o
n input line 1025.

<cartoons/Priority_Boost_2.pdf, id=6894, 413.02303pt x 223.3143pt>
File: cartoons/Priority_Boost_2.pdf Graphic file (type pdf)

<use cartoons/Priority_Boost_2.pdf>
Package pdftex.def Info: cartoons/Priority_Boost_2.pdf used on input line 1051.

(pdftex.def)             Requested size: 413.02202pt x 223.31374pt.

Overfull \hbox (19.87334pt too wide) in paragraph at lines 1051--1052
 [][] 
 []


LaTeX Warning: Citation `VictorYodaiken2004a' on page 284 undefined on input li
ne 1059.

[284 <./rt/irq.pdf> <./rt/threaded-irq.pdf

pdfTeX warning: pdflatex (file ./rt/threaded-irq.pdf): PDF inclusion: multiple 
pdfs with page group included in a single page
> <./cartoons/Priority_Boost_2.pdf>]

LaTeX Warning: Citation `LuiSha1990PriorityInheritance' on page 285 undefined o
n input line 1108.


LaTeX Warning: Hyper reference `QQA.15.5' on page 285 undefined on input line 1
111.


LaTeX Warning: Hyper reference `QQA.15.5' on page 285 undefined on input line 1
134.


LaTeX Warning: Citation `PaulEMcKenney2007WhatIsRCUFundamentally' on page 285 u
ndefined on input line 1142.


LaTeX Warning: Citation `PaulMcKenney2012RCUUsage' on page 285 undefined on inp
ut line 1142.


LaTeX Warning: Citation `PaulEMcKenney2014RCUAPI' on page 285 undefined on inpu
t line 1142.


LaTeX Warning: Citation `DinakarGuniguntala2008IBMSysJ' on page 285 undefined o
n input line 1149.

[285]

LaTeX Warning: Citation `PaulEMcKenney2011RCU3.0trainwreck' on page 286 undefin
ed on input line 1217.


LaTeX Warning: Citation `BjoernBrandenburgPhD' on page 286 undefined on input l
ine 1235.


LaTeX Warning: Hyper reference `QQA.15.6' on page 286 undefined on input line 1
241.


LaTeX Warning: Hyper reference `QQA.15.6' on page 286 undefined on input line 1
255.


Underfull \hbox (badness 1354) in paragraph at lines 1241--1256
[]\T1/ptm/b/n/10 Quick Quiz 15.6:[] \T1/ptm/m/n/10 (+20) Sup-pose that pre-emp-
tion oc-
 []


LaTeX Warning: Citation `JakeEdge2013Future-rtLinux' on page 286 undefined on i
nput line 1272.


LaTeX Warning: Citation `JakeEdge2014Future-rtLinux' on page 286 undefined on i
nput line 1272.


LaTeX Warning: Citation `JonCorbet2013NO-HZ-FULL' on page 286 undefined on inpu
t line 1300.

[286] [287]
Underfull \hbox (badness 3884) in paragraph at lines 1502--1502
[]\T1/ptm/b/n/12 Implementing Par-al-lel Real-Time
 []


LaTeX Warning: Citation `Herlihy91' on page 288 undefined on input line 1529.


LaTeX Warning: Citation `DanAlitarh2013PracticalProgress' on page 288 undefined
 on input line 1550.

[288]

LaTeX Warning: Hyper reference `QQA.15.7' on page 289 undefined on input line 1
557.


LaTeX Warning: Hyper reference `QQA.15.7' on page 289 undefined on input line 1
572.


LaTeX Warning: Citation `BjoernBrandenburgPhD' on page 289 undefined on input l
ine 1577.


LaTeX Warning: Hyper reference `QQA.15.8' on page 289 undefined on input line 1
612.


LaTeX Warning: Hyper reference `QQA.15.8' on page 289 undefined on input line 1
623.


LaTeX Warning: Citation `AdrianSutton2013LCA:Disruptor' on page 289 undefined o
n input line 1671.

[289]
Underfull \hbox (badness 6110) in paragraph at lines 1746--1753
[]\T1/ptm/m/n/10 (+20) Another prob-lem is that the thread must be
 []

[290]

LaTeX Warning: Hyper reference `QQA.15.9' on page 291 undefined on input line 1
845.


LaTeX Warning: Hyper reference `QQA.15.9' on page 291 undefined on input line 1
855.


LaTeX Warning: Hyper reference `QQA.15.10' on page 291 undefined on input line 
1857.


LaTeX Warning: Hyper reference `QQA.15.10' on page 291 undefined on input line 
1863.

<cartoons/RealTimeNotRealFast.pdf, id=7008, 443.7378pt x 325.45586pt>
File: cartoons/RealTimeNotRealFast.pdf Graphic file (type pdf)

<use cartoons/RealTimeNotRealFast.pdf>
Package pdftex.def Info: cartoons/RealTimeNotRealFast.pdf used on input line 18
73.
(pdftex.def)             Requested size: 443.73671pt x 325.45506pt.

Overfull \hbox (5.41582pt too wide) in paragraph at lines 1873--1874
 [][] 
 []

<cartoons/RealFastNotRealTime.pdf, id=7009, 449.03755pt x 317.26529pt>
File: cartoons/RealFastNotRealTime.pdf Graphic file (type pdf)

<use cartoons/RealFastNotRealTime.pdf>
Package pdftex.def Info: cartoons/RealFastNotRealTime.pdf used on input line 18
80.
(pdftex.def)             Requested size: 449.03644pt x 317.26451pt.

Overfull \hbox (5.41658pt too wide) in paragraph at lines 1880--1881
 [][] 
 []


Underfull \vbox (badness 10000) has occurred while \output is active []

 [291 <./cartoons/RealTimeNotRealFast.pdf> <./cartoons/RealFastNotRealTime.pdf>
])
(./easy/easy.tex [292

]
Chapter 16.

LaTeX Warning: Citation `RustyRussell2003OLSkeynote' on page 293 undefined on i
nput line 51.


LaTeX Warning: Citation `ValgrindHomePage' on page 293 undefined on input line 
78.

[293

]

LaTeX Warning: Citation `PaulEMcKenney2007PreemptibleRCU' on page 294 undefined
 on input line 87.


LaTeX Warning: Citation `ALPHA95' on page 294 undefined on input line 91.


LaTeX Warning: Citation `Compaq01' on page 294 undefined on input line 94.

<easy/Mandel_zoom_00_mandelbrot_set.pdf, id=7059, 1284.79988pt x 963.6pt>
File: easy/Mandel_zoom_00_mandelbrot_set.pdf Graphic file (type pdf)

<use easy/Mandel_zoom_00_mandelbrot_set.pdf>
Package pdftex.def Info: easy/Mandel_zoom_00_mandelbrot_set.pdf used on input l
ine 138.
(pdftex.def)             Requested size: 1284.79677pt x 963.59766pt.
 [294 <./easy/Mandel_zoom_00_mandelbrot_set.pdf>]

LaTeX Warning: Hyper reference `QQA.16.1' on page 295 undefined on input line 2
10.


LaTeX Warning: Hyper reference `QQA.16.1' on page 295 undefined on input line 2
18.


LaTeX Warning: Hyper reference `QQA.16.2' on page 295 undefined on input line 2
32.


LaTeX Warning: Hyper reference `QQA.16.2' on page 295 undefined on input line 2
53.


LaTeX Warning: Hyper reference `QQA.16.3' on page 295 undefined on input line 2
62.


LaTeX Warning: Hyper reference `QQA.16.3' on page 295 undefined on input line 2
75.


<cartoons/r-2014-shaving-the-mandelbrot.pdf, id=7087, 369.40503pt x 233.54199pt
>
File: cartoons/r-2014-shaving-the-mandelbrot.pdf Graphic file (type pdf)
 <use cartoons/r-2014-shaving-the-mandelbrot.pdf>
Package pdftex.def Info: cartoons/r-2014-shaving-the-mandelbrot.pdf used on inp
ut line 283.
(pdftex.def)             Requested size: 369.40411pt x 233.54141pt.
) (./future/future.tex
[295 <./cartoons/r-2014-shaving-the-mandelbrot.pdf>] [296

]
Chapter 17.

LaTeX Warning: Citation `KeithRSpitz1977' on page 297 undefined on input line 2
1.

(./future/cpu.tex
<cartoons/r-2014-CPU-future-uniprocessor-uber-alles.pdf, id=7105, 365.12393pt x
 366.24684pt>
File: cartoons/r-2014-CPU-future-uniprocessor-uber-alles.pdf Graphic file (type
 pdf)
 <use cartoons/r-2014-CPU-future-uniprocessor-uber-alles.pdf>
Package pdftex.def Info: cartoons/r-2014-CPU-future-uniprocessor-uber-alles.pdf
 used on input line 18.
(pdftex.def)             Requested size: 365.12303pt x 366.24594pt.

<cartoons/r-2014-CPU-Future-Multithreaded-Mania.pdf, id=7106, 321.39366pt x 349
.46153pt>
File: cartoons/r-2014-CPU-Future-Multithreaded-Mania.pdf Graphic file (type pdf
)
 <use cartoons/r-2014-CPU-Future-Multithreaded-Mania.pdf>
Package pdftex.def Info: cartoons/r-2014-CPU-Future-Multithreaded-Mania.pdf use
d on input line 25.
(pdftex.def)             Requested size: 321.39287pt x 349.46066pt.

<cartoons/r-2014-CPU-Future-More-of-the-Same.pdf, id=7107, 372.21768pt x 507.97
052pt>
File: cartoons/r-2014-CPU-Future-More-of-the-Same.pdf Graphic file (type pdf)
 <use cartoons/r-2014-CPU-Future-More-of-the-Same.pdf>
Package pdftex.def Info: cartoons/r-2014-CPU-Future-More-of-the-Same.pdf used o
n input line 32.
(pdftex.def)             Requested size: 372.21677pt x 507.96928pt.

<cartoons/r-2014-CPU-Future-Crash-dummies.pdf, id=7108, 665.80513pt x 505.24191
pt>
File: cartoons/r-2014-CPU-Future-Crash-dummies.pdf Graphic file (type pdf)
 <use cartoons/r-2014-CPU-Future-Crash-dummies.pdf>
Package pdftex.def Info: cartoons/r-2014-CPU-Future-Crash-dummies.pdf used on i
nput line 39.
(pdftex.def)             Requested size: 665.8035pt x 505.24068pt.


LaTeX Warning: Citation `PaulEdwardMcKenneyPhD' on page 297 undefined on input 
line 60.

[297 <./cartoons/r-2014-CPU-future-uniprocessor-uber-alles.pdf>]

LaTeX Warning: Citation `PaulEdwardMcKenneyPhD' on page 298 undefined on input 
line 93.


Underfull \vbox (badness 1436) has occurred while \output is active []

 [298 <./cartoons/r-2014-CPU-Future-Multithreaded-Mania.pdf> <./cartoons/r-2014
-CPU-Future-More-of-the-Same.pdf

pdfTeX warning: pdflatex (file ./cartoons/r-2014-CPU-Future-More-of-the-Same.pd
f): PDF inclusion: multiple pdfs with page group included in a single page
>]

LaTeX Warning: Citation `PaulEdwardMcKenneyPhD' on page 299 undefined on input 
line 130.

<future/latencytrend.pdf, id=7135, 238.51704pt x 231.87024pt>
File: future/latencytrend.pdf Graphic file (type pdf)

<use future/latencytrend.pdf>
Package pdftex.def Info: future/latencytrend.pdf used on input line 159.
(pdftex.def)             Requested size: 216.81pt x 210.76872pt.

<future/be-lb-n4-rf-all.pdf, id=7136, 244.53952pt x 225.22946pt>
File: future/be-lb-n4-rf-all.pdf Graphic file (type pdf)

<use future/be-lb-n4-rf-all.pdf>
Package pdftex.def Info: future/be-lb-n4-rf-all.pdf used on input line 168.
(pdftex.def)             Requested size: 216.81pt x 199.69406pt.

<future/be-lw-n4-rf-all.pdf, id=7137, 244.53952pt x 207.16194pt>
File: future/be-lw-n4-rf-all.pdf Graphic file (type pdf)

<use future/be-lw-n4-rf-all.pdf>
Package pdftex.def Info: future/be-lw-n4-rf-all.pdf used on input line 177.
(pdftex.def)             Requested size: 216.81pt x 183.67494pt.


LaTeX Warning: Citation `PaulEdwardMcKenneyPhD' on page 299 undefined on input 
line 183.


LaTeX Warning: Citation `Sarma04c' on page 299 undefined on input line 205.


Underfull \hbox (badness 2922) in paragraph at lines 186--207
\T1/ptm/m/n/10 (+20) ure []17.5[] con-tinue, then mem-ory la-tency
 []

[299 <./cartoons/r-2014-CPU-Future-Crash-dummies.pdf> <./future/latencytrend.pd
f>]) (./future/tm.tex

LaTeX Warning: Citation `DBLomet1977SIGSOFT' on page 300 undefined on input lin
e 7.


LaTeX Warning: Citation `Herlihy93a' on page 300 undefined on input line 12.


LaTeX Warning: Citation `JMStone93' on page 300 undefined on input line 14.


LaTeX Warning: Citation `Martinez01a' on page 300 undefined on input line 23.


LaTeX Warning: Citation `Rajwar01a' on page 300 undefined on input line 23.


LaTeX Warning: Citation `MauriceHerlihy2005-TM-manifesto.pldi' on page 300 unde
fined on input line 26.


LaTeX Warning: Citation `DanGrossman2007TMGCAnalogy' on page 300 undefined on i
nput line 26.


LaTeX Warning: Citation `Blundell2005DebunkTM' on page 300 undefined on input l
ine 27.


LaTeX Warning: Citation `McKenney2007PLOSTM' on page 300 undefined on input lin
e 27.


Underfull \vbox (badness 1748) has occurred while \output is active []

 [300 <./future/be-lb-n4-rf-all.pdf> <./future/be-lw-n4-rf-all.pdf>]

LaTeX Warning: Citation `PaulEMcKenney2009TMeverywhere' on page 301 undefined o
n input line 51.


LaTeX Warning: Citation `SpearMichaelScott2008InevitableSTM' on page 301 undefi
ned on input line 123.

[301]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 171--182
[][]
 []


LaTeX Warning: Citation `SpearMichaelScott2008InevitableSTM' on page 302 undefi
ned on input line 202.

[302]
Underfull \hbox (badness 6741) in paragraph at lines 296--306
[]\T1/ptm/m/n/10 (+20) Non-persistent locks in-clude []\T1/pcrs/m/n/10 _[]_
 []


Underfull \hbox (badness 2384) in paragraph at lines 296--306
[][][][]\T1/ptm/m/n/10 (+20) , []\T1/pcrs/m/n/10 _[]_[][][][]\T1/ptm/m/n/10 (+2
0) , and most
 []

[303]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 364--376
[][]
 []


Underfull \hbox (badness 10000) in paragraph at lines 377--385
[]\T1/ptm/m/n/10 (+20) This pseudo-code frag-ment uses []\T1/pcrs/m/n/10 _
 []


Underfull \hbox (badness 4084) in paragraph at lines 377--385
[][][][] \T1/ptm/m/n/10 (+20) to spawn one thread per CPU, then
 []


Underfull \hbox (badness 1997) in paragraph at lines 439--446
[]\T1/ptm/m/n/10 (+20) In the case of non-persistent prim-i-tives (in-clud-
 []


Underfull \hbox (badness 1552) in paragraph at lines 439--446
\T1/ptm/m/n/10 (+20) ing []\T1/pcrs/m/n/10 _[]_[][][][]\T1/ptm/m/n/10 (+20) , [
]\T1/pcrs/m/n/10 _[]_
 []


LaTeX Warning: Hyper reference `QQA.17.1' on page 304 undefined on input line 4
53.


LaTeX Warning: Hyper reference `QQA.17.1' on page 304 undefined on input line 4
65.

[304]
Underfull \hbox (badness 2875) in paragraph at lines 475--487
\T1/ptm/m/n/10 (+20) the []\T1/pcrs/m/n/10 _[][][] \T1/ptm/m/n/10 (+20) and []\
T1/pcrs/m/n/10 _
 []


LaTeX Warning: Citation `Ali-Reza-Adl-Tabatabai2009CppTM' on page 305 undefined
 on input line 573.

[305]

LaTeX Warning: Citation `TheOpenGroup1997SUS' on page 306 undefined on input li
ne 590.


LaTeX Warning: Citation `DaveDice2009ASPLOSRockHTM' on page 306 undefined on in
put line 642.

[306]

LaTeX Warning: Citation `Volos2008TRANSACT' on page 307 undefined on input line
 711.


LaTeX Warning: Citation `ChistopherJRossbach2007a' on page 307 undefined on inp
ut line 738.

[307]

LaTeX Warning: Citation `WilsonCHsieh92a' on page 308 undefined on input line 7
77.


LaTeX Warning: Citation `YossiLev2009SNZIrwlock' on page 308 undefined on input
 line 789.


LaTeX Warning: Citation `ChistopherJRossbach2007a' on page 308 undefined on inp
ut line 802.


LaTeX Warning: Citation `MathieuDesnoyers2009URCU' on page 308 undefined on inp
ut line 821.


LaTeX Warning: Citation `MathieuDesnoyers2012URCU' on page 308 undefined on inp
ut line 821.


LaTeX Warning: Citation `ChistopherJRossbach2007a' on page 308 undefined on inp
ut line 823.


LaTeX Warning: Citation `DonaldEPorter2007TRANSACT' on page 308 undefined on in
put line 870.


LaTeX Warning: Citation `PhilHoward2011RCUTMRBTree' on page 308 undefined on in
put line 870.


LaTeX Warning: Citation `PhilipWHoward2013RCUrbtree' on page 308 undefined on i
nput line 870.

[308]

LaTeX Warning: Citation `Blundell2006TMdeadlock' on page 309 undefined on input
 line 924.


Underfull \hbox (badness 3189) in paragraph at lines 935--938
[]\T1/ptm/m/n/10 (+20) Transactions are per-mit-ted to carry out non-
 []


LaTeX Warning: Citation `Gramoli:2014:DTP:2541883.2541900' on page 309 undefine
d on input line 945.

[309]

LaTeX Warning: Citation `TatianaShpeisman2009CppTM' on page 310 undefined on in
put line 984.


LaTeX Warning: Citation `DaveDice2009ASPLOSRockHTM' on page 310 undefined on in
put line 1005.

<cartoons/TM-the-vision.pdf, id=7344, 492.90102pt x 505.89702pt>
File: cartoons/TM-the-vision.pdf Graphic file (type pdf)

<use cartoons/TM-the-vision.pdf>
Package pdftex.def Info: cartoons/TM-the-vision.pdf used on input line 1022.
(pdftex.def)             Requested size: 492.89981pt x 505.89578pt.

<cartoons/TM-the-reality-conflict.pdf, id=7345, 482.77063pt x 573.74023pt>
File: cartoons/TM-the-reality-conflict.pdf Graphic file (type pdf)

<use cartoons/TM-the-reality-conflict.pdf>
Package pdftex.def Info: cartoons/TM-the-reality-conflict.pdf used on input lin
e 1029.
(pdftex.def)             Requested size: 482.76945pt x 573.73883pt.

<cartoons/TM-the-reality-nonidempotent.pdf, id=7346, 481.80702pt x 497.22462pt>
File: cartoons/TM-the-reality-nonidempotent.pdf Graphic file (type pdf)
<use cartoons/TM-the-reality-nonidempotent.pdf>
Package pdftex.def Info: cartoons/TM-the-reality-nonidempotent.pdf used on inpu
t line 1036.
(pdftex.def)             Requested size: 481.80585pt x 497.2234pt.

<cartoons/TM-the-reality-realtime.pdf, id=7347, 508.78783pt x 526.55687pt>
File: cartoons/TM-the-reality-realtime.pdf Graphic file (type pdf)

<use cartoons/TM-the-reality-realtime.pdf>
Package pdftex.def Info: cartoons/TM-the-reality-realtime.pdf used on input lin
e 1043.
(pdftex.def)             Requested size: 508.78658pt x 526.55557pt.


LaTeX Warning: Citation `JoeDuffy2010RetroTM' on page 310 undefined on input li
ne 1058.


LaTeX Warning: Citation `JoeDuffy2010RetroTM2' on page 310 undefined on input l
ine 1058.

) (./future/htm.tex
Underfull \hbox (badness 10000) in paragraph at lines 3--3
[]\T1/ptm/b/n/14.4 Hardware Trans-ac-tional
 []


Underfull \vbox (badness 10000) has occurred while \output is active []

 [310 <./cartoons/TM-the-vision.pdf>]

LaTeX Warning: Citation `McKenney2007PLOSTM' on page 311 undefined on input lin
e 38.


LaTeX Warning: Citation `PaulEMcKenney2010OSRGrassGreener' on page 311 undefine
d on input line 38.


LaTeX Warning: Citation `RichardBornat2006SheepGoats' on page 311 undefined on 
input line 70.


LaTeX Warning: Citation `SaeedDehnadi2009SheepGoats' on page 311 undefined on i
nput line 70.


LaTeX Warning: Citation `RegBraithwaite2007FizzBuzz' on page 311 undefined on i
nput line 72.

[311 <./cartoons/TM-the-reality-conflict.pdf> <./cartoons/TM-the-reality-nonide
mpotent.pdf>]

LaTeX Warning: Citation `Anderson97' on page 312 undefined on input line 90.


LaTeX Warning: Hyper reference `QQA.17.2' on page 312 undefined on input line 1
03.


LaTeX Warning: Hyper reference `QQA.17.2' on page 312 undefined on input line 1
13.


LaTeX Warning: Citation `Ellis80' on page 312 undefined on input line 132.


LaTeX Warning: Citation `DavidSMiller2006HashedLocking' on page 312 undefined o
n input line 135.


LaTeX Warning: Hyper reference `QQA.17.3' on page 312 undefined on input line 1
42.


LaTeX Warning: Hyper reference `QQA.17.3' on page 312 undefined on input line 1
49.


LaTeX Warning: Citation `DaveDice2009ASPLOSRockHTM' on page 312 undefined on in
put line 156.


LaTeX Warning: Citation `CliffClick2009AzulHTM' on page 312 undefined on input 
line 157.


LaTeX Warning: Citation `Martinez01a' on page 312 undefined on input line 165.


LaTeX Warning: Citation `Rajwar02a' on page 312 undefined on input line 165.

[312 <./cartoons/TM-the-reality-realtime.pdf>]

LaTeX Warning: Citation `RaviRajwar2012TSX' on page 313 undefined on input line
 238.


LaTeX Warning: Citation `CScottAnanian2006' on page 313 undefined on input line
 241.


LaTeX Warning: Citation `KevinEMoore2006' on page 313 undefined on input line 2
41.


LaTeX Warning: Citation `SanjeevKumar2006' on page 313 undefined on input line 
253.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 266--275
[][]
 []


LaTeX Warning: Citation `EgeAkpinar2011HTM2TLE' on page 313 undefined on input 
line 293.


LaTeX Warning: Citation `YujieLiu2011ToxicTransactions' on page 313 undefined o
n input line 296.

[313]

LaTeX Warning: Citation `HagitAttiya2011LawsOfOrder' on page 314 undefined on i
nput line 322.


LaTeX Warning: Citation `Attiya:2011:LOE:1925844.1926442' on page 314 undefined
 on input line 322.


LaTeX Warning: Citation `PaulEMcKenney2011SNC' on page 314 undefined on input l
ine 322.


LaTeX Warning: Citation `CliffClick2009AzulHTM' on page 314 undefined on input 
line 333.


LaTeX Warning: Hyper reference `QQA.17.4' on page 314 undefined on input line 3
35.


LaTeX Warning: Hyper reference `QQA.17.4' on page 314 undefined on input line 3
44.


LaTeX Warning: Hyper reference `QQA.17.5' on page 314 undefined on input line 3
64.


LaTeX Warning: Hyper reference `QQA.17.5' on page 314 undefined on input line 4
00.


LaTeX Warning: Citation `Martinez02a' on page 314 undefined on input line 427.


LaTeX Warning: Citation `Martinez02a' on page 314 undefined on input line 433.

[314]

LaTeX Warning: Citation `ChristianJacobi2012MainframeTM' on page 315 undefined 
on input line 474.


LaTeX Warning: Citation `DaveDice2008TransactLockElision' on page 315 undefined
 on input line 524.


LaTeX Warning: Citation `Blundell2006TMdeadlock' on page 315 undefined on input
 line 528.

[315]

LaTeX Warning: Hyper reference `QQA.17.6' on page 316 undefined on input line 5
43.


LaTeX Warning: Hyper reference `QQA.17.6' on page 316 undefined on input line 5
76.


LaTeX Warning: Hyper reference `QQA.17.7' on page 316 undefined on input line 5
78.


LaTeX Warning: Hyper reference `QQA.17.7' on page 316 undefined on input line 5
99.


LaTeX Warning: Hyper reference `QQA.17.8' on page 316 undefined on input line 6
01.


LaTeX Warning: Citation `PeterOkech2009InherentRandomness' on page 316 undefine
d on input line 602.


LaTeX Warning: Hyper reference `QQA.17.8' on page 316 undefined on input line 7
15.


LaTeX Warning: Hyper reference `QQA.17.9' on page 316 undefined on input line 7
86.


LaTeX Warning: Hyper reference `QQA.17.9' on page 316 undefined on input line 7
99.

[316]

LaTeX Warning: Hyper reference `QQA.17.10' on page 317 undefined on input line 
834.


LaTeX Warning: Hyper reference `QQA.17.10' on page 317 undefined on input line 
840.

(./future/HTMtable.tex
Underfull \hbox (badness 1521) in paragraph at lines 28--30
[]|\T1/ptm/m/n/9 (+20) Irrevocable op-er-a-tions force fall-back
 []


Underfull \hbox (badness 1742) in paragraph at lines 85--86
[]|\T1/ptm/m/n/9 (+20) Performance is in-sen-si-tive to cache-
 []


Underfull \hbox (badness 10000) in paragraph at lines 97--98
[]|\T1/ptm/m/n/9 (+20) Interaction With
 []

)

LaTeX Warning: Citation `JonathanCorbet2006lockdep' on page 317 undefined on in
put line 864.


LaTeX Warning: Citation `AlexanderMatveev2012PessimisticTM' on page 317 undefin
ed on input line 868.


LaTeX Warning: Citation `PaulEMcKenney2011Verico' on page 317 undefined on inpu
t line 874.


LaTeX Warning: Citation `MagedMichael04a' on page 317 undefined on input line 8
80.


LaTeX Warning: Citation `HerlihyLM02' on page 317 undefined on input line 880.


LaTeX Warning: Citation `McKenney98' on page 317 undefined on input line 881.


LaTeX Warning: Citation `McKenney01a' on page 317 undefined on input line 881.


LaTeX Warning: Citation `ThomasEHart2007a' on page 317 undefined on input line 
881.


LaTeX Warning: Citation `PaulEMcKenney2012ELCbattery' on page 317 undefined on 
input line 881.

(./future/HTMtableRCU.tex
Underfull \hbox (badness 1521) in paragraph at lines 28--30
[]|\T1/ptm/m/n/9 (+20) Irrevocable op-er-a-tions force fall-back
 []


Underfull \hbox (badness 1902) in paragraph at lines 68--70
\T1/ptm/m/n/9 (+20) sult in ex-pen-sive cache misses and
 []


Underfull \hbox (badness 1742) in paragraph at lines 115--116
[]|\T1/ptm/m/n/9 (+20) Performance is in-sen-si-tive to cache-
 []


Underfull \hbox (badness 10000) in paragraph at lines 127--128
[]|\T1/ptm/m/n/9 (+20) Interaction With
 []

)

LaTeX Warning: Citation `MagedMichael04a' on page 317 undefined on input line 8
95.


LaTeX Warning: Citation `HerlihyLM02' on page 317 undefined on input line 895.


LaTeX Warning: Citation `MathieuDesnoyers2012URCU' on page 317 undefined on inp
ut line 895.


LaTeX Warning: Citation `DinakarGuniguntala2008IBMSysJ' on page 317 undefined o
n input line 895.


LaTeX Warning: Citation `ThomasEHart2007a' on page 317 undefined on input line 
895.


LaTeX Warning: Citation `MathieuDesnoyers2012URCU' on page 317 undefined on inp
ut line 899.

[317] [318] [319]

LaTeX Warning: Citation `EgeAkpinar2011HTM2TLE' on page 320 undefined on input 
line 1048.


LaTeX Warning: Citation `YujieLiu2011ToxicTransactions' on page 320 undefined o
n input line 1048.


LaTeX Warning: Citation `Blundell2006TMdeadlock' on page 320 undefined on input
 line 1050.


Underfull \vbox (badness 1668) has occurred while \output is active []

 [320]

LaTeX Warning: Citation `ChristianJacobi2012MainframeTM' on page 321 undefined 
on input line 1072.


LaTeX Warning: Citation `JustinGottschlich2013TMdebug' on page 321 undefined on
 input line 1148.

[321]

LaTeX Warning: Citation `McKenney2007PLOSTM' on page 322 undefined on input lin
e 1189.


LaTeX Warning: Citation `PaulEMcKenney2010OSRGrassGreener' on page 322 undefine
d on input line 1189.

)

LaTeX Warning: Citation `VijayDSilva2012-sas' on page 322 undefined on input li
ne 84.


LaTeX Warning: Citation `JadeAlglave2013-cav' on page 322 undefined on input li
ne 97.

[322])
Underfull \vbox (badness 1668) has occurred while \output is active []


(./appendix/appendix.tex [323]
\openout2 = `appendix/questions/questions.aux'.

 (./appendix/questions/questions.tex [324


]
Appendix A.
(./appendix/questions/after.tex
Overfull \hbox (11.03613pt too wide) in paragraph at lines 112--112
 [][] 
 []


LaTeX Warning: Hyper reference `QQA.A.1' on page 325 undefined on input line 11
6.


LaTeX Warning: Hyper reference `QQA.A.1' on page 325 undefined on input line 12
5.


Underfull \vbox (badness 6396) has occurred while \output is active []

 [325]
<appendix/questions/after-snapshot.pdf, id=7581, 207.85345pt x 213.66403pt>
File: appendix/questions/after-snapshot.pdf Graphic file (type pdf)

<use appendix/questions/after-snapshot.pdf>
Package pdftex.def Info: appendix/questions/after-snapshot.pdf used on input li
ne 210.
(pdftex.def)             Requested size: 207.85294pt x 213.6635pt.
 [326 <./appendix/questions/after-snapshot.pdf>]

LaTeX Warning: Hyper reference `QQA.A.2' on page 327 undefined on input line 23
4.


LaTeX Warning: Hyper reference `QQA.A.2' on page 327 undefined on input line 24
8.

) (./appendix/questions/concurrentparallel.tex

LaTeX Warning: Hyper reference `QQA.A.3' on page 327 undefined on input line 24
.


LaTeX Warning: Hyper reference `QQA.A.3' on page 327 undefined on input line 30
.


LaTeX Warning: Hyper reference `QQA.A.4' on page 327 undefined on input line 76
.


LaTeX Warning: Hyper reference `QQA.A.4' on page 327 undefined on input line 88
.

[327]) (./appendix/questions/time.tex
<cartoons/r-2014-What-time-is-it.pdf, id=7616, 361.35pt x 361.35pt>
File: cartoons/r-2014-What-time-is-it.pdf Graphic file (type pdf)

<use cartoons/r-2014-What-time-is-it.pdf>
Package pdftex.def Info: cartoons/r-2014-What-time-is-it.pdf used on input line
 9.
(pdftex.def)             Requested size: 361.34912pt x 361.34912pt.
)) [328 <./cartoons/r-2014-What-time-is-it.pdf>]
\openout2 = `appendix/whymb/whymemorybarriers.aux'.

 (./appendix/whymb/whymemorybarriers.tex
Appendix B.
File: appendix/whymb/cacheSC.pdf Graphic file (type pdf)
<use appendix/whymb/cacheSC.pdf>
Package pdftex.def Info: appendix/whymb/cacheSC.pdf used on input line 50.
(pdftex.def)             Requested size: 217.26099pt x 144.98828pt.
 [329



]
Overfull \hbox (0.74629pt too wide) in paragraph at lines 81--94
\T1/ptm/m/n/10 (-20) ``cache line'', which is a 256-byte-aligned block of memor
y.
 []


LaTeX Warning: Citation `DavidECuller1999' on page 330 undefined on input line 
231.

[330]

LaTeX Warning: Hyper reference `QQA.B.1' on page 331 undefined on input line 32
9.


LaTeX Warning: Hyper reference `QQA.B.1' on page 331 undefined on input line 36
4.


LaTeX Warning: Hyper reference `QQA.B.2' on page 331 undefined on input line 37
2.


LaTeX Warning: Hyper reference `QQA.B.2' on page 331 undefined on input line 38
4.

[331]

LaTeX Warning: Hyper reference `QQA.B.3' on page 332 undefined on input line 38
6.


LaTeX Warning: Hyper reference `QQA.B.3' on page 332 undefined on input line 39
6.


LaTeX Warning: Hyper reference `QQA.B.4' on page 332 undefined on input line 39
8.


LaTeX Warning: Hyper reference `QQA.B.4' on page 332 undefined on input line 41
3.

<appendix/whymb/MESI.pdf, id=7663, 163.05904pt x 163.05615pt>
File: appendix/whymb/MESI.pdf Graphic file (type pdf)

<use appendix/whymb/MESI.pdf>
Package pdftex.def Info: appendix/whymb/MESI.pdf used on input line 425.
(pdftex.def)             Requested size: 163.05862pt x 163.05574pt.
 [332 <./appendix/whymb/MESI.pdf>]

LaTeX Warning: Hyper reference `QQA.B.5' on page 333 undefined on input line 51
4.


LaTeX Warning: Hyper reference `QQA.B.5' on page 333 undefined on input line 52
6.


LaTeX Warning: Hyper reference `QQA.B.6' on page 333 undefined on input line 59
8.


LaTeX Warning: Hyper reference `QQA.B.6' on page 333 undefined on input line 60
5.

<appendix/whymb/cacheSCwrite.pdf, id=7684, 177.71193pt x 177.66019pt>
File: appendix/whymb/cacheSCwrite.pdf Graphic file (type pdf)

<use appendix/whymb/cacheSCwrite.pdf>
Package pdftex.def Info: appendix/whymb/cacheSCwrite.pdf used on input line 628
.
(pdftex.def)             Requested size: 177.71149pt x 177.65974pt.
 [333 <./appendix/whymb/cacheSCwrite.pdf>]

LaTeX Warning: Hyper reference `QQA.B.7' on page 334 undefined on input line 64
8.


LaTeX Warning: Hyper reference `QQA.B.7' on page 334 undefined on input line 65
9.

<appendix/whymb/cacheSB.pdf, id=7703, 217.26154pt x 194.67398pt>
File: appendix/whymb/cacheSB.pdf Graphic file (type pdf)

<use appendix/whymb/cacheSB.pdf>
Package pdftex.def Info: appendix/whymb/cacheSB.pdf used on input line 663.
(pdftex.def)             Requested size: 217.26099pt x 194.6735pt.

Underfull \hbox (badness 1838) in paragraph at lines 685--689
\T1/ptm/m/n/10 (+20) To see the first com-pli-ca-tion, a vi-o-la-tion of self-
 []


Overfull \hbox (10.00002pt too wide) in paragraph at lines 691--700
[][]
 []

[334 <./appendix/whymb/cacheSB.pdf>]
<appendix/whymb/cacheSBf.pdf, id=7722, 217.26154pt x 194.67398pt>
File: appendix/whymb/cacheSBf.pdf Graphic file (type pdf)

<use appendix/whymb/cacheSBf.pdf>
Package pdftex.def Info: appendix/whymb/cacheSBf.pdf used on input line 746.
(pdftex.def)             Requested size: 217.26099pt x 194.6735pt.

Overfull \hbox (10.00002pt too wide) in paragraph at lines 764--781
[][]
 []


Underfull \vbox (badness 1997) has occurred while \output is active []

 [335 <./appendix/whymb/cacheSBf.pdf>]

LaTeX Warning: Hyper reference `QQA.B.8' on page 336 undefined on input line 81
6.


LaTeX Warning: Hyper reference `QQA.B.8' on page 336 undefined on input line 82
2.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 831--849
[][]
 []

[336] <appendix/whymb/cacheSBfIQ.pdf, id=7768, 217.26154pt x 226.2924pt>
File: appendix/whymb/cacheSBfIQ.pdf Graphic file (type pdf)

<use appendix/whymb/cacheSBfIQ.pdf>
Package pdftex.def Info: appendix/whymb/cacheSBfIQ.pdf used on input line 977.
(pdftex.def)             Requested size: 217.26099pt x 226.29184pt.
 [337]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 1009--1027
[][]
 []


LaTeX Warning: Hyper reference `QQA.B.9' on page 338 undefined on input line 10
63.


LaTeX Warning: Hyper reference `QQA.B.9' on page 338 undefined on input line 10
76.


Overfull \hbox (10.00002pt too wide) in paragraph at lines 1088--1107
[][]
 []

[338 <./appendix/whymb/cacheSBfIQ.pdf>]

LaTeX Warning: Hyper reference `QQA.B.10' on page 339 undefined on input line 1
108.


LaTeX Warning: Hyper reference `QQA.B.10' on page 339 undefined on input line 1
156.

[339]
Overfull \hbox (10.00002pt too wide) in paragraph at lines 1233--1252
[][]
 []


LaTeX Warning: Citation `ALPHA95' on page 340 undefined on input line 1286.


LaTeX Warning: Citation `AMDOpteron02' on page 340 undefined on input line 1286
.


LaTeX Warning: Citation `IntelItanium02v2' on page 340 undefined on input line 
1286.


LaTeX Warning: Citation `PowerPC94' on page 340 undefined on input line 1286.


LaTeX Warning: Citation `MichaelLyons05a' on page 340 undefined on input line 1
286.


LaTeX Warning: Citation `SPARC94' on page 340 undefined on input line 1286.


LaTeX Warning: Citation `IntelXeonV3-96a' on page 340 undefined on input line 1
286.


LaTeX Warning: Citation `IntelXeonV2b-96a' on page 340 undefined on input line 
1286.


LaTeX Warning: Citation `IBMzSeries04a' on page 340 undefined on input line 128
6.


LaTeX Warning: Citation `Gharachorloo95' on page 340 undefined on input line 12
86.


LaTeX Warning: Citation `PeterSewell2010weakmemory' on page 340 undefined on in
put line 1286.


LaTeX Warning: Citation `DanielJSorin2011MemModel' on page 340 undefined on inp
ut line 1286.


LaTeX Warning: Citation `PaulMcKenney2005i' on page 340 undefined on input line
 1289.


LaTeX Warning: Citation `PaulMcKenney2005j' on page 340 undefined on input line
 1289.


LaTeX Warning: Hyper reference `QQA.B.11' on page 340 undefined on input line 1
307.


LaTeX Warning: Hyper reference `QQA.B.11' on page 340 undefined on input line 1
323.


Underfull \hbox (badness 2608) in paragraph at lines 1325--1341
[]\T1/ptm/m/n/10 (+20) Imagine a large non-uniform cache ar-chi-tec-ture
 []

<appendix/whymb/hostileordering.pdf, id=7827, 217.26154pt x 167.57274pt>
File: appendix/whymb/hostileordering.pdf Graphic file (type pdf)

<use appendix/whymb/hostileordering.pdf>
Package pdftex.def Info: appendix/whymb/hostileordering.pdf used on input line 
1344.
(pdftex.def)             Requested size: 217.26099pt x 167.57231pt.
 [340]

LaTeX Warning: Hyper reference `QQA.B.12' on page 341 undefined on input line 1
392.


LaTeX Warning: Hyper reference `QQA.B.12' on page 341 undefined on input line 1
407.


LaTeX Warning: Hyper reference `QQA.B.13' on page 341 undefined on input line 1
492.


LaTeX Warning: Hyper reference `QQA.B.13' on page 341 undefined on input line 1
529.


LaTeX Warning: Hyper reference `QQA.B.14' on page 341 undefined on input line 1
531.


LaTeX Warning: Hyper reference `QQA.B.14' on page 341 undefined on input line 1
544.


Underfull \hbox (badness 7777) in paragraph at lines 1531--1545
[]\T1/ptm/b/n/10 Quick Quiz B.14:[] \T1/ptm/m/n/10 (+20) If CPU 2 ex-e-cuted an

 []


Underfull \hbox (badness 7415) in paragraph at lines 1549--1549
[]\T1/ptm/b/n/14.4 Memory-Barrier In-struc-tions
 []

[341 <./appendix/whymb/hostileordering.pdf>]

LaTeX Warning: Citation `Compaq01' on page 342 undefined on input line 1573.


Underfull \vbox (badness 1888) has occurred while \output is active []


Underfull \hbox (badness 10000) in paragraph at lines 1669--1672
[][]\T1/pcrs/m/n/10 _[]_[]_[][][][] \T1/ptm/m/n/10 (+20) that forces
 []

[342]

LaTeX Warning: Citation `Compaq01' on page 343 undefined on input line 1809.

[343]

LaTeX Warning: Hyper reference `QQA.B.15' on page 344 undefined on input line 1
925.


LaTeX Warning: Hyper reference `QQA.B.15' on page 344 undefined on input line 1
951.


LaTeX Warning: Citation `ALPHA95' on page 344 undefined on input line 1953.


LaTeX Warning: Citation `AMDOpteron:2:2007' on page 344 undefined on input line
 1958.

[344]

LaTeX Warning: Citation `ARMv7A:2010' on page 345 undefined on input line 1972.



Overfull \hbox (10.00002pt too wide) in paragraph at lines 2015--2028
[][]
 []


LaTeX Warning: Citation `IntelItanium02v2' on page 345 undefined on input line 
2045.


LaTeX Warning: Citation `IntelItanium02v3' on page 345 undefined on input line 
2048.

[345] <cartoons/r-2014-LD-ACQ.pdf, id=7909, 396.43108pt x 489.95547pt>
File: cartoons/r-2014-LD-ACQ.pdf Graphic file (type pdf)

<use cartoons/r-2014-LD-ACQ.pdf>
Package pdftex.def Info: cartoons/r-2014-LD-ACQ.pdf used on input line 2060.
(pdftex.def)             Requested size: 396.4301pt x 489.95427pt.


LaTeX Warning: Citation `MIPSvII-A-2015' on page 346 undefined on input line 20
89.


LaTeX Warning: Citation `RichardSmith2015N4527' on page 346 undefined on input 
line 2094.


Underfull \hbox (badness 1742) in paragraph at lines 2109--2112
\T1/ptm/m/n/10 (+20) be used to im-ple-ment the Linux-kernel []\T1/pcrs/m/n/10 
_
 []


Underfull \hbox (badness 2608) in paragraph at lines 2113--2116
[]\T1/ptm/m/n/10 (+20) Release mem-ory bar-rier, which
 []


Underfull \hbox (badness 2932) in paragraph at lines 2113--2116
\T1/ptm/m/n/10 (+20) may be used to im-ple-ment the Linux-kernel
 []


Underfull \hbox (badness 10000) in paragraph at lines 2113--2116
[]\T1/pcrs/m/n/10 _[][][][][]_[]_
 []


LaTeX Warning: Citation `GerryKane96a' on page 346 undefined on input line 2131
.


LaTeX Warning: Citation `PowerPC94' on page 346 undefined on input line 2142.


LaTeX Warning: Citation `MichaelLyons05a' on page 346 undefined on input line 2
142.

[346 <./cartoons/r-2014-LD-ACQ.pdf>]

LaTeX Warning: Citation `PaulEMcKenneyN2745r2009' on page 347 undefined on inpu
t line 2192.


LaTeX Warning: Citation `SPARC94' on page 347 undefined on input line 2214.


LaTeX Warning: Citation `SPARC94' on page 347 undefined on input line 2224.

[347]
Underfull \hbox (badness 7291) in paragraph at lines 2243--2247
\T1/ptm/m/n/10 (+20) op-tions to-gether, as in [][][][][][][][][]
 []


Underfull \hbox (badness 10000) in paragraph at lines 2243--2247
[][][][][][][][][][][][][][][][][][][]\T1/ptm/m/n/10 (+20) ,
 []


LaTeX Warning: Citation `SPARC94' on page 348 undefined on input line 2276.


LaTeX Warning: Citation `IntelXeonV3-96a' on page 348 undefined on input line 2
289.


Underfull \vbox (badness 2073) has occurred while \output is active []



LaTeX Warning: Citation `Intelx86MemoryOrdering2007' on page 348 undefined on i
nput line 2300.


LaTeX Warning: Citation `Intel64IA32v3A2011' on page 348 undefined on input lin
e 2305.


LaTeX Warning: Citation `Intel64IA32v3A2011' on page 348 undefined on input lin
e 2321.


LaTeX Warning: Citation `IntelXeonV2b-96a' on page 348 undefined on input line 
2327.


Underfull \hbox (badness 1325) in paragraph at lines 2326--2330
\T1/ptm/m/n/10 (+20) or-dered (\T1/pcrs/m/n/10 clflush \T1/ptm/m/n/10 (+20) and
 non-temporal move in-struc-
 []


LaTeX Warning: Citation `Intel64IA32v3A2011' on page 348 undefined on input lin
e 2340.

[348]

LaTeX Warning: Citation `IBMzSeries04a' on page 349 undefined on input line 234
6.

[349]) [350

]
Appendix C.
(./qqz.tex) (./glossary.tex [351



] [352

]
Appendix D.
[353]
Underfull \hbox (badness 4859) in paragraph at lines 156--160
[]\T1/ptm/m/n/10 (+20) A prob-lem or al-go-rithm
 []


Underfull \hbox (badness 7099) in paragraph at lines 161--164
[]\T1/ptm/m/n/10 (+20) An ex-clu-sive lock is a mutual-
 []

[354]

LaTeX Warning: Citation `AndreasHaas2012FIFOisnt' on page 355 undefined on inpu
t line 233.

[355] [356]
Underfull \hbox (badness 10000) in paragraph at lines 400--409
[]\T1/ptm/m/n/10 (+20) Shared-memory syn-
 []


Underfull \hbox (badness 1953) in paragraph at lines 400--409
\T1/ptm/m/n/10 (+20) be im-ple-mented ei-ther in hard-ware (hard-ware
 []


Underfull \hbox (badness 3291) in paragraph at lines 400--409
\T1/ptm/m/n/10 (+20) trans-ac-tional mem-ory, or HTM), in soft-ware
 []

) [357] (./perfbook.bbl [358

] [359

]
Underfull \hbox (badness 1286) in paragraph at lines 113--119
\T1/ptm/m/n/10 (+20) A tool for ex-plor-ing the POWER and ARM mem-ory mod-els, 
June
 []

[360]
Underfull \hbox (badness 10000) in paragraph at lines 227--232
\T1/pcrs/m/n/10 http : / / www . bohmann . dk / articles / response _ time _ st
ill _
 []


Underfull \hbox (badness 6204) in paragraph at lines 234--241
[]\T1/ptm/m/n/10 (+20) Richard Bor-nat.  Di-vid-ing the sheep from the goats, J
an-u-ary
 []


Underfull \hbox (badness 5460) in paragraph at lines 234--241
\T1/ptm/m/n/10 (+20) 2006.  Sem-i-nar at School of Com-put-ing, Univ. of Kent. 
Ab-
 []


Underfull \hbox (badness 10000) in paragraph at lines 234--241
\T1/ptm/m/n/10 (+20) stract is avail-able at []$\T1/pcrs/m/n/10 https : / / www
 . cs . kent . ac . uk / seminar _
 []


Underfull \hbox (badness 10000) in paragraph at lines 234--241
[]$\T1/pcrs/m/n/10 http : / / www . eis . mdx . ac . uk / staffpages / r _ born
at / papers /
 []

[361] [362] [363]
Underfull \hbox (badness 2409) in paragraph at lines 479--483
[]\T1/ptm/m/n/10 (+20) Joe Duffy.  A (brief) ret-ro-spec-tive on trans-ac-tiona
l mem-ory, Jan-
 []


Underfull \hbox (badness 2096) in paragraph at lines 479--483
\T1/ptm/m/n/10 (+20) u-ary 2010.  []$\T1/pcrs/m/n/10 http : / / joeduffyblog . 
com / 2010 / 01 / 03 / a -[] brief -[]
 []


Underfull \hbox (badness 3088) in paragraph at lines 485--489
[]\T1/ptm/m/n/10 (+20) Joe Duffy.  More thoughts on trans-ac-tional mem-ory, Ma
y 2010.
 []


Underfull \hbox (badness 10000) in paragraph at lines 485--489
[]$\T1/pcrs/m/n/10 http : / / joeduffyblog . com / 2010 / 05 / 16 / more -[] th
oughts -[] on -[]
 []


Underfull \hbox (badness 1365) in paragraph at lines 518--521
[]\T1/ptm/m/n/10 (+20) Douglas En-gel-bart.  The demo, De-cem-ber 1968.  URL: [
]$\T1/pcrs/m/n/10 http : / /
 []


Underfull \hbox (badness 10000) in paragraph at lines 549--554
[]\T1/ptm/m/n/10 (+20) ETH Zurich.  Par-al-lel solver for a per-fect maze, Marc
h
 []


Underfull \hbox (badness 10000) in paragraph at lines 549--554
\T1/ptm/m/n/10 (+20) 2011.  URL: $\T1/pcrs/m/n/10 http : / / nativesystems . in
f . ethz . ch / pub /
 []


Underfull \hbox (badness 10000) in paragraph at lines 549--554
\T1/pcrs/m/n/10 Main / WebHomeLecturesParallelProgrammingExercises /
 []

[364] [365]
Underfull \hbox (badness 10000) in paragraph at lines 679--685
\T1/pcrs/m/n/10 us / um / people / gray / papers / superservers(4t _ computers 
)
 []

[366] [367]
Underfull \hbox (badness 3803) in paragraph at lines 908--914
[]\T1/ptm/m/n/10 (+20) Intel Cor-po-ra-tion.  \T1/ptm/m/it/10 (+20) IA-32 In-te
l Ar-chi-tec-ture Soft-ware De-vel-oper's
 []


Underfull \hbox (badness 2088) in paragraph at lines 908--914
\T1/ptm/m/it/10 (+20) Man-ual Vol-ume 2B: In-struc-tion Set Ref-er-ence, N-Z\T1
/ptm/m/n/10 (+20) , 2004.  Avail-
 []


Underfull \hbox (badness 1314) in paragraph at lines 908--914
\T1/ptm/m/n/10 (+20) able: []$\T1/pcrs/m/n/10 ftp : / / download . intel . com 
/ design / Pentium4 / manuals /
 []


Underfull \hbox (badness 3803) in paragraph at lines 916--922
[]\T1/ptm/m/n/10 (+20) Intel Cor-po-ra-tion.  \T1/ptm/m/it/10 (+20) IA-32 In-te
l Ar-chi-tec-ture Soft-ware De-vel-oper's
 []


Underfull \hbox (badness 4927) in paragraph at lines 916--922
\T1/ptm/m/it/10 (+20) Man-ual Vol-ume 3: Sys-tem Pro-gram-ming Guide\T1/ptm/m/n
/10 (+20) , 2004.  Avail-
 []


Underfull \hbox (badness 1314) in paragraph at lines 916--922
\T1/ptm/m/n/10 (+20) able: []$\T1/pcrs/m/n/10 ftp : / / download . intel . com 
/ design / Pentium4 / manuals /
 []

[368]
Underfull \hbox (badness 1769) in paragraph at lines 976--982
[]\T1/ptm/m/n/10 (+20) Christian Ja-cobi, Tim-o-thy Slegel, and Dan Greiner.  [
]Trans-ac-tional
 []


Underfull \hbox (badness 2376) in paragraph at lines 976--982
\T1/ptm/m/n/10 (+20) ber 2012.  The 45$[]$ An-nual IEEE/ACM In-ter-na-tional Sy
m-po-sium
 []

[369]
Underfull \hbox (badness 3758) in paragraph at lines 1086--1092
\T1/pcrs/m/n/10 www . linuxdevices . com / articles / AT5698775833 . html$ \T1/
ptm/m/n/10 (+20) [bro-ken,
 []

[370]
Underfull \hbox (badness 3019) in paragraph at lines 1165--1173
[]\T1/ptm/m/n/10 (+20) Paul E. McKen-ney.  []Sto-chas-tic fair-ness queu-ing[].
  In \T1/ptm/m/it/10 (+20) IEEE IN-
 []


Underfull \hbox (badness 1184) in paragraph at lines 1165--1173
\T1/ptm/m/it/10 (+20) FO-COM'90 Pro-ceed-ings\T1/ptm/m/n/10 (+20) , pages 733--
740, San Fran-cisco, June 1990.
 []


Underfull \hbox (badness 10000) in paragraph at lines 1186--1193
\T1/pcrs/m/n/10 com / users / paulmck / scalability / paper / mutexdesignpat . 
pdf$[]
 []


Underfull \hbox (badness 10000) in paragraph at lines 1215--1221
[]\T1/ptm/m/n/10 (+20) Paul E. McKen-ney.  Mem-ory or-der-ing in mod-ern mi-cro
-pro-
 []


Underfull \hbox (badness 10000) in paragraph at lines 1215--1221
\T1/ptm/m/n/10 (+20) ces-sors, part I.  \T1/ptm/m/it/10 (+20) Linux Jour-nal\T1
/ptm/m/n/10 (+20) , 1(136):52--57, Au-gust 2005.
 []


Underfull \hbox (badness 10000) in paragraph at lines 1215--1221
\T1/ptm/m/n/10 (+20) Avail-able: []$\T1/pcrs/m/n/10 http : / / www . linuxjourn
al . com / article / 8211$[]
 []


Underfull \hbox (badness 10000) in paragraph at lines 1215--1221
[]$\T1/pcrs/m/n/10 http : / / www . rdrop . com / users / paulmck / scalability
 / paper /
 []


Underfull \hbox (badness 5374) in paragraph at lines 1223--1229
[]\T1/ptm/m/n/10 (+20) Paul E. McKen-ney.  Mem-ory or-der-ing in mod-ern mi-cro
-pro-ces-
 []


Underfull \hbox (badness 7256) in paragraph at lines 1223--1229
\T1/ptm/m/n/10 (+20) sors, part II.  \T1/ptm/m/it/10 (+20) Linux Jour-nal\T1/pt
m/m/n/10 (+20) , 1(137):78--82, Sep-tem-ber 2005.
 []


Underfull \hbox (badness 10000) in paragraph at lines 1223--1229
\T1/ptm/m/n/10 (+20) Avail-able: []$\T1/pcrs/m/n/10 http : / / www . linuxjourn
al . com / article / 8212$[]
 []


Underfull \hbox (badness 10000) in paragraph at lines 1223--1229
[]$\T1/pcrs/m/n/10 http : / / www . rdrop . com / users / paulmck / scalability
 / paper /
 []

[371]
Underfull \hbox (badness 1158) in paragraph at lines 1291--1295
[]\T1/ptm/m/n/10 (+20) Paul E. McKen-ney.  Trans-ac-tional mem-ory ev-ery-where
?, Sep-tem-ber
 []


Underfull \hbox (badness 2495) in paragraph at lines 1313--1317
\T1/ptm/m/n/10 (+20) tice?, Jan-u-ary 2011.  []$\T1/pcrs/m/n/10 http : / / www 
. rdrop . com / users / paulmck /
 []


Underfull \hbox (badness 10000) in paragraph at lines 1313--1317
\T1/pcrs/m/n/10 scalability / paper / VericoTheoryPractice . 2011 . 01 . 28a .
 []

[372]
Underfull \hbox (badness 10000) in paragraph at lines 1446--1450
\T1/pcrs/m/n/10 / / kernel . nic . funet . fi / pub / linux / kernel / v2 . 3 /
 patch -[]
 []

[373]
Underfull \hbox (badness 3108) in paragraph at lines 1472--1477
[]\T1/ptm/m/n/10 (+20) Ingo Mol-nar.  Light-weight ro-bust fu-texes, March 2006
.  Avail-
 []


Underfull \hbox (badness 1314) in paragraph at lines 1472--1477
\T1/ptm/m/n/10 (+20) able: []$\T1/pcrs/m/n/10 http : / / lxr . linux . no / #li
nux + v2 . 6 . 39 / Documentation /
 []

[374]
Underfull \hbox (badness 6236) in paragraph at lines 1549--1554
[]\T1/ptm/m/n/10 (+20) Paul E. McKen-ney and Raul Sil-vera.  Ex-am-ple power im
-ple-
 []


Underfull \hbox (badness 4024) in paragraph at lines 1549--1554
\T1/ptm/m/n/10 (+20) men-ta-tion for c/c++ mem-ory model, Feb-ru-ary 2009.  Ava
il-able:
 []


Underfull \hbox (badness 10000) in paragraph at lines 1549--1554
[]$\T1/pcrs/m/n/10 http : / / www . rdrop . com / users / paulmck / scalability
 / paper /
 []


Underfull \hbox (badness 2237) in paragraph at lines 1633--1638
[]\T1/ptm/m/n/10 (+20) Oleg Nes-terov.  Re: [patch] cpufreq: mark \T1/pcrs/m/n/
10 cpufreq_tsc() \T1/ptm/m/n/10 (+20) as
 []

[375]
Underfull \hbox (badness 1210) in paragraph at lines 1682--1686
\T1/ptm/m/n/10 (+20) De-cem-ber 2006.  URL: []$\T1/pcrs/m/n/10 http : / / www .
 nytimes . com / 2006 / 12 / 11 /
 []


Underfull \hbox (badness 10000) in paragraph at lines 1682--1686
\T1/pcrs/m/n/10 technology / 11reuters . html ? ei = 5088 & en = e5e9416415a9ee
b2 &
 []


Underfull \hbox (badness 8019) in paragraph at lines 1718--1722
[]\T1/ptm/m/n/10 (+20) Donald E. Porter and Em-mett Witchel.  Lessons from larg
e
 []


Underfull \hbox (badness 5008) in paragraph at lines 1718--1722
\T1/ptm/m/n/10 (+20) trans-ac-tional sys-tems, De-cem-ber 2007.  Per-sonal com-
mu-ni-ca-tion
 []

[376]
Underfull \hbox (badness 7649) in paragraph at lines 1781--1786
[]\T1/ptm/m/n/10 (+20) Steven Ros-t-edt.  Light-weight PI-futexes, June 2006.  
Avail-
 []


Underfull \hbox (badness 1314) in paragraph at lines 1781--1786
\T1/ptm/m/n/10 (+20) able: []$\T1/pcrs/m/n/10 http : / / lxr . linux . no / #li
nux + v2 . 6 . 39 / Documentation /
 []


Underfull \hbox (badness 2707) in paragraph at lines 1812--1815
[]\T1/ptm/m/n/10 (+20) Steven Ros-t-edt.  lock-dep: How to read its cryp-tic ou
t-put, Sep-
 []


Underfull \hbox (badness 3826) in paragraph at lines 1817--1822
[]\T1/ptm/m/n/10 (+20) Rusty Rus-sell.  Hang-ing out with smart peo-ple: or... 
things I
 []

[377]
Underfull \hbox (badness 1584) in paragraph at lines 1899--1906
\T1/ptm/m/n/10 (+20) a-nisms for soft-ware trans-ac-tional mem-ory.  In \T1/ptm
/m/it/10 (+20) 3$[]$ ACM SIG-PLAN
 []

[378] [379]
Underfull \hbox (badness 3108) in paragraph at lines 2133--2137
[]\T1/ptm/m/n/10 (+20) Fr�d�ric Weis-becker.  In-ter-rup-tion timer p�ri-odic, 
2012.  []$\T1/pcrs/m/n/10 http :
 []


Underfull \hbox (badness 10000) in paragraph at lines 2133--2137
\T1/pcrs/m/n/10 / / www . dailymotion . com / video / xtxtew _ interruption -[]
 timer -[]
 []


Underfull \hbox (badness 7595) in paragraph at lines 2139--2144
[]\T1/ptm/m/n/10 (+20) Stewart Weiss.  Unix lec-ture notes, May 2013.  Avail-ab
le:
 []


Underfull \hbox (badness 10000) in paragraph at lines 2139--2144
[]$\T1/pcrs/m/n/10 http : / / www . compsci . hunter . cuny . edu / ~sweiss / c
ourse _
 []

[380]) [381]
\openout2 = `appendix/ack/ack.aux'.

 (./appendix/ack/ack.tex [382



]
Appendix E.
(./origpub.tex)

! LaTeX Error: Something's wrong--perhaps a missing \item.

See the LaTeX manual or LaTeX Companion for explanation.
Type  H <return>  for immediate help.
 ...                                              
                                                  
l.72 \ListOriginalPublications
                              
? 
! Emergency stop.
 ...                                              
                                                  
l.72 \ListOriginalPublications
                              
Try typing  <return>  to proceed.
If that doesn't work, type  X <return>  to quit.


Here is how much of TeX's memory you used:
 19617 strings out of 494953
 317891 string characters out of 6180977
 427148 words of memory out of 5000000
 17047 multiletter control sequences out of 15000+600000
 132400 words of font info for 469 fonts, out of 8000000 for 9000
 1455 hyphenation exceptions out of 8191
 34i,18n,35p,831b,1120s stack positions out of 5000i,500n,10000p,200000b,80000s
!  ==> Fatal error occurred, no output PDF file produced!

--------------6F62C0EFF8B48F960B76ADAD--

