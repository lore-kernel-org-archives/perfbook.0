Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e37.co.us.ibm.com ([32.97.110.158]:48719 "EHLO
 e37.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752480AbbBVAYm (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sat, 21 Feb 2015
 19:24:42 -0500
Received: from /spool/local	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sat, 21 Feb
 2015 17:24:42 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])	by d03dlp01.boulder.ibm.com
 (Postfix) with ESMTP id B4B901FF001E	for <perfbook@vger.kernel.org>; Sat, 21
 Feb 2015 17:15:49 -0700 (MST)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t1M0N7xs9306230	for <perfbook@vger.kernel.org>; Sat, 21 Feb 2015 17:23:07
 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t1M0Ob27020904	for <perfbook@vger.kernel.org>; Sat, 21 Feb 2015 17:24:37
 -0700
Date: Sat, 21 Feb 2015 16:24:35 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Failure building perfbook v2011.01.02a-795-ge45eba1 on Fedora 21
Message-ID: <20150222002435.GW5745@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <1346287019.1411835.1424537935538.JavaMail.zimbra@inf.utfsm.cl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1346287019.1411835.1424537935538.JavaMail.zimbra@inf.utfsm.cl>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Horst von Brand <vonbrand@inf.utfsm.cl>
Cc: perfbook@vger.kernel.org, bp@alien8.de

On Sat, Feb 21, 2015 at 01:58:55PM -0300, Horst von Brand wrote:
> As requested, I'm attaching the perfbook.log file resulting.
> -- 
> Dr. Horst H. von Brand                   User #22616 counter.li.org
> Departamento de Informatica                    Fono: +56 32 2654431
> Universidad Tecnica Federico Santa Maria             +56 32 2654239
> Casilla 110-V, Valparaiso, Chile 2340000       Fax:  +56 32 2797513

Hello, Horst,

This is similar to a problem that Borislav Petkov encountered a couple
of months ago, and is due to a bug in recent versions of the lstinline
command.  (I avoid these by running on an old version.)

A fix is said to be in the works, but in the meantime you can work around
this bug by adding the following:

    \makeatletter
    \renewcommand\lstinline[1][]{%
        \leavevmode\bgroup % \hbox\bgroup --> \bgroup
          \def\lst@boxpos{b}%
          \lsthk@PreSet\lstset{flexiblecolumns,#1}%
          \lsthk@TextStyle
          \ifnum\iffalse{\fi`}=\z@\fi
          \@ifnextchar\bgroup{%
            \ifnum`{=\z@}\fi%
            \afterassignment\lst@InlineG \let\@let@token}{%
            \ifnum`{=\z@}\fi\lstinline@}}
    \makeatother

Details: http://tex.stackexchange.com/a/10371

CCing Borislav given his experience dealing with this problem.

							Thanx, Paul

> This is pdfTeX, Version 3.14159265-2.6-1.40.15 (TeX Live 2014) (preloaded format=pdflatex 2015.2.18)  21 FEB 2015 13:57
> entering extended mode
>  restricted \write18 enabled.
>  %&-line parsing enabled.
> **perfbook
> (./perfbook.tex
> LaTeX2e <2011/06/27>
> Babel <3.9k> and hyphenation patterns for 17 languages loaded.
> (./book.cls
> Document Class: book 2007/10/19 v1.4h-pem Standard LaTeX document class
> (/usr/share/texlive/texmf-dist/tex/latex/base/bk10.clo
> File: bk10.clo 2007/10/19 v1.4h Standard LaTeX file (size option)
> )
> \c@part=\count79
> \c@chapter=\count80
> \c@section=\count81
> \c@subsection=\count82
> \c@subsubsection=\count83
> \c@paragraph=\count84
> \c@subparagraph=\count85
> \c@figure=\count86
> \c@table=\count87
> \abovecaptionskip=\skip41
> \belowcaptionskip=\skip42
> \bibindent=\dimen102
> )
> (/usr/share/texlive/texmf-dist/tex/latex/base/fontenc.sty
> Package: fontenc 2005/09/27 v1.99g Standard LaTeX package
> 
> (/usr/share/texlive/texmf-dist/tex/latex/base/t1enc.def
> File: t1enc.def 2005/09/27 v1.99g Standard LaTeX file
> LaTeX Font Info:    Redeclaring font encoding T1 on input line 43.
> ))
> (/usr/share/texlive/texmf-dist/tex/latex/base/textcomp.sty
> Package: textcomp 2005/09/27 v1.99g Standard LaTeX package
> Package textcomp Info: Sub-encoding information:
> (textcomp)               5 = only ISO-Adobe without \textcurrency
> (textcomp)               4 = 5 + \texteuro
> (textcomp)               3 = 4 + \textohm
> (textcomp)               2 = 3 + \textestimated + \textcurrency
> (textcomp)               1 = TS1 - \textcircled - \t
> (textcomp)               0 = TS1 (full)
> (textcomp)             Font families with sub-encoding setting implement
> (textcomp)             only a restricted character set as indicated.
> (textcomp)             Family '?' is the default used for unknown fonts.
> (textcomp)             See the documentation for details.
> Package textcomp Info: Setting ? sub-encoding to TS1/1 on input line 71.
> 
> (/usr/share/texlive/texmf-dist/tex/latex/base/ts1enc.def
> File: ts1enc.def 2001/06/05 v3.0e (jk/car/fm) Standard LaTeX file
> )
> LaTeX Info: Redefining \oldstylenums on input line 266.
> Package textcomp Info: Setting cmr sub-encoding to TS1/0 on input line 281.
> Package textcomp Info: Setting cmss sub-encoding to TS1/0 on input line 282.
> Package textcomp Info: Setting cmtt sub-encoding to TS1/0 on input line 283.
> Package textcomp Info: Setting cmvtt sub-encoding to TS1/0 on input line 284.
> Package textcomp Info: Setting cmbr sub-encoding to TS1/0 on input line 285.
> Package textcomp Info: Setting cmtl sub-encoding to TS1/0 on input line 286.
> Package textcomp Info: Setting ccr sub-encoding to TS1/0 on input line 287.
> Package textcomp Info: Setting ptm sub-encoding to TS1/4 on input line 288.
> Package textcomp Info: Setting pcr sub-encoding to TS1/4 on input line 289.
> Package textcomp Info: Setting phv sub-encoding to TS1/4 on input line 290.
> Package textcomp Info: Setting ppl sub-encoding to TS1/3 on input line 291.
> Package textcomp Info: Setting pag sub-encoding to TS1/4 on input line 292.
> Package textcomp Info: Setting pbk sub-encoding to TS1/4 on input line 293.
> Package textcomp Info: Setting pnc sub-encoding to TS1/4 on input line 294.
> Package textcomp Info: Setting pzc sub-encoding to TS1/4 on input line 295.
> Package textcomp Info: Setting bch sub-encoding to TS1/4 on input line 296.
> Package textcomp Info: Setting put sub-encoding to TS1/5 on input line 297.
> Package textcomp Info: Setting uag sub-encoding to TS1/5 on input line 298.
> Package textcomp Info: Setting ugq sub-encoding to TS1/5 on input line 299.
> Package textcomp Info: Setting ul8 sub-encoding to TS1/4 on input line 300.
> Package textcomp Info: Setting ul9 sub-encoding to TS1/4 on input line 301.
> Package textcomp Info: Setting augie sub-encoding to TS1/5 on input line 302.
> Package textcomp Info: Setting dayrom sub-encoding to TS1/3 on input line 303.
> Package textcomp Info: Setting dayroms sub-encoding to TS1/3 on input line 304.
> 
> Package textcomp Info: Setting pxr sub-encoding to TS1/0 on input line 305.
> Package textcomp Info: Setting pxss sub-encoding to TS1/0 on input line 306.
> Package textcomp Info: Setting pxtt sub-encoding to TS1/0 on input line 307.
> Package textcomp Info: Setting txr sub-encoding to TS1/0 on input line 308.
> Package textcomp Info: Setting txss sub-encoding to TS1/0 on input line 309.
> Package textcomp Info: Setting txtt sub-encoding to TS1/0 on input line 310.
> Package textcomp Info: Setting lmr sub-encoding to TS1/0 on input line 311.
> Package textcomp Info: Setting lmdh sub-encoding to TS1/0 on input line 312.
> Package textcomp Info: Setting lmss sub-encoding to TS1/0 on input line 313.
> Package textcomp Info: Setting lmssq sub-encoding to TS1/0 on input line 314.
> Package textcomp Info: Setting lmvtt sub-encoding to TS1/0 on input line 315.
> Package textcomp Info: Setting qhv sub-encoding to TS1/0 on input line 316.
> Package textcomp Info: Setting qag sub-encoding to TS1/0 on input line 317.
> Package textcomp Info: Setting qbk sub-encoding to TS1/0 on input line 318.
> Package textcomp Info: Setting qcr sub-encoding to TS1/0 on input line 319.
> Package textcomp Info: Setting qcs sub-encoding to TS1/0 on input line 320.
> Package textcomp Info: Setting qpl sub-encoding to TS1/0 on input line 321.
> Package textcomp Info: Setting qtm sub-encoding to TS1/0 on input line 322.
> Package textcomp Info: Setting qzc sub-encoding to TS1/0 on input line 323.
> Package textcomp Info: Setting qhvc sub-encoding to TS1/0 on input line 324.
> Package textcomp Info: Setting futs sub-encoding to TS1/4 on input line 325.
> Package textcomp Info: Setting futx sub-encoding to TS1/4 on input line 326.
> Package textcomp Info: Setting futj sub-encoding to TS1/4 on input line 327.
> Package textcomp Info: Setting hlh sub-encoding to TS1/3 on input line 328.
> Package textcomp Info: Setting hls sub-encoding to TS1/3 on input line 329.
> Package textcomp Info: Setting hlst sub-encoding to TS1/3 on input line 330.
> Package textcomp Info: Setting hlct sub-encoding to TS1/5 on input line 331.
> Package textcomp Info: Setting hlx sub-encoding to TS1/5 on input line 332.
> Package textcomp Info: Setting hlce sub-encoding to TS1/5 on input line 333.
> Package textcomp Info: Setting hlcn sub-encoding to TS1/5 on input line 334.
> Package textcomp Info: Setting hlcw sub-encoding to TS1/5 on input line 335.
> Package textcomp Info: Setting hlcf sub-encoding to TS1/5 on input line 336.
> Package textcomp Info: Setting pplx sub-encoding to TS1/3 on input line 337.
> Package textcomp Info: Setting pplj sub-encoding to TS1/3 on input line 338.
> Package textcomp Info: Setting ptmx sub-encoding to TS1/4 on input line 339.
> Package textcomp Info: Setting ptmj sub-encoding to TS1/4 on input line 340.
> )
> (/usr/share/texlive/texmf-dist/tex/latex/psnfss/mathptmx.sty
> Package: mathptmx 2005/04/12 PSNFSS-v9.2a Times w/ Math, improved (SPQR, WaS) 
> LaTeX Font Info:    Redeclaring symbol font `operators' on input line 28.
> LaTeX Font Info:    Overwriting symbol font `operators' in version `normal'
> (Font)                  OT1/cmr/m/n --> OT1/ztmcm/m/n on input line 28.
> LaTeX Font Info:    Overwriting symbol font `operators' in version `bold'
> (Font)                  OT1/cmr/bx/n --> OT1/ztmcm/m/n on input line 28.
> LaTeX Font Info:    Redeclaring symbol font `letters' on input line 29.
> LaTeX Font Info:    Overwriting symbol font `letters' in version `normal'
> (Font)                  OML/cmm/m/it --> OML/ztmcm/m/it on input line 29.
> LaTeX Font Info:    Overwriting symbol font `letters' in version `bold'
> (Font)                  OML/cmm/b/it --> OML/ztmcm/m/it on input line 29.
> LaTeX Font Info:    Redeclaring symbol font `symbols' on input line 30.
> LaTeX Font Info:    Overwriting symbol font `symbols' in version `normal'
> (Font)                  OMS/cmsy/m/n --> OMS/ztmcm/m/n on input line 30.
> LaTeX Font Info:    Overwriting symbol font `symbols' in version `bold'
> (Font)                  OMS/cmsy/b/n --> OMS/ztmcm/m/n on input line 30.
> LaTeX Font Info:    Redeclaring symbol font `largesymbols' on input line 31.
> LaTeX Font Info:    Overwriting symbol font `largesymbols' in version `normal'
> (Font)                  OMX/cmex/m/n --> OMX/ztmcm/m/n on input line 31.
> LaTeX Font Info:    Overwriting symbol font `largesymbols' in version `bold'
> (Font)                  OMX/cmex/m/n --> OMX/ztmcm/m/n on input line 31.
> \symbold=\mathgroup4
> \symitalic=\mathgroup5
> LaTeX Font Info:    Redeclaring math alphabet \mathbf on input line 34.
> LaTeX Font Info:    Overwriting math alphabet `\mathbf' in version `normal'
> (Font)                  OT1/cmr/bx/n --> OT1/ptm/bx/n on input line 34.
> LaTeX Font Info:    Overwriting math alphabet `\mathbf' in version `bold'
> (Font)                  OT1/cmr/bx/n --> OT1/ptm/bx/n on input line 34.
> LaTeX Font Info:    Redeclaring math alphabet \mathit on input line 35.
> LaTeX Font Info:    Overwriting math alphabet `\mathit' in version `normal'
> (Font)                  OT1/cmr/m/it --> OT1/ptm/m/it on input line 35.
> LaTeX Font Info:    Overwriting math alphabet `\mathit' in version `bold'
> (Font)                  OT1/cmr/bx/it --> OT1/ptm/m/it on input line 35.
> LaTeX Info: Redefining \hbar on input line 50.
> )
> (/usr/share/texlive/texmf-dist/tex/latex/psnfss/helvet.sty
> Package: helvet 2005/04/12 PSNFSS-v9.2a (WaS) 
> 
> (/usr/share/texlive/texmf-dist/tex/latex/graphics/keyval.sty
> Package: keyval 1999/03/16 v1.13 key=value parser (DPC)
> \KV@toks@=\toks14
> ))
> (/usr/share/texlive/texmf-dist/tex/latex/psnfss/courier.sty
> Package: courier 2005/04/12 PSNFSS-v9.2a (WaS) 
> )
> (/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.sty
> Package: microtype 2013/05/23 v2.5a Micro-typographical refinements (RS)
> \MT@toks=\toks15
> \MT@count=\count88
> LaTeX Info: Redefining \textls on input line 766.
> \MT@outer@kern=\dimen103
> LaTeX Info: Redefining \textmicrotypecontext on input line 1285.
> \MT@listname@count=\count89
> 
> (/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype-pdftex.def
> File: microtype-pdftex.def 2013/05/23 v2.5a Definitions specific to pdftex (RS)
> 
> LaTeX Info: Redefining \lsstyle on input line 915.
> LaTeX Info: Redefining \lslig on input line 915.
> \MT@outer@space=\skip43
> )
> Package microtype Info: Loading configuration file microtype.cfg.
> 
> (/usr/share/texlive/texmf-dist/tex/latex/microtype/microtype.cfg
> File: microtype.cfg 2013/05/23 v2.5a microtype main configuration file (RS)
> ))
> (/usr/share/texlive/texmf-dist/tex/latex/graphics/lscape.sty
> Package: lscape 2000/10/22 v3.01 Landscape Pages (DPC)
> 
> (/usr/share/texlive/texmf-dist/tex/latex/graphics/graphics.sty
> Package: graphics 2009/02/05 v1.0o Standard LaTeX Graphics (DPC,SPQR)
> 
> (/usr/share/texlive/texmf-dist/tex/latex/graphics/trig.sty
> Package: trig 1999/03/16 v1.09 sin cos tan (DPC)
> )
> (/usr/share/texlive/texmf-dist/tex/latex/latexconfig/graphics.cfg
> File: graphics.cfg 2010/04/23 v1.9 graphics configuration of TeX Live
> )
> Package graphics Info: Driver file: pdftex.def on input line 91.
> 
> (/usr/share/texlive/texmf-dist/tex/latex/pdftex-def/pdftex.def
> File: pdftex.def 2011/05/27 v0.06d Graphics/color for pdfTeX
> 
> (/usr/share/texlive/texmf-dist/tex/generic/oberdiek/infwarerr.sty
> Package: infwarerr 2010/04/08 v1.3 Providing info/warning/error messages (HO)
> )
> (/usr/share/texlive/texmf-dist/tex/generic/oberdiek/ltxcmds.sty
> Package: ltxcmds 2011/11/09 v1.22 LaTeX kernel commands for general use (HO)
> )
> \Gread@gobject=\count90
> )))
> (/usr/share/texlive/texmf-dist/tex/latex/graphics/epsfig.sty
> Package: epsfig 1999/02/16 v1.7a (e)psfig emulation (SPQR)
> 
> (/usr/share/texlive/texmf-dist/tex/latex/graphics/graphicx.sty
> Package: graphicx 1999/02/16 v1.0f Enhanced LaTeX Graphics (DPC,SPQR)
> \Gin@req@height=\dimen104
> \Gin@req@width=\dimen105
> )
> \epsfxsize=\dimen106
> \epsfysize=\dimen107
> )
> (/usr/share/texlive/texmf-dist/tex/latex/subfigure/subfigure.sty
> Package: subfigure 2002/03/15 v2.1.5 subfigure package
> \subfigtopskip=\skip44
> \subfigcapskip=\skip45
> \subfigcaptopadj=\dimen108
> \subfigbottomskip=\skip46
> \subfigcapmargin=\dimen109
> \subfiglabelskip=\skip47
> \c@subfigure=\count91
> \c@lofdepth=\count92
> \c@subtable=\count93
> \c@lotdepth=\count94
> 
> ****************************************
> * Local config file subfigure.cfg used *
> ****************************************
> (/usr/share/texlive/texmf-dist/tex/latex/subfigure/subfigure.cfg)
> \subfig@top=\skip48
> \subfig@bottom=\skip49
> )
> (/usr/share/texlive/texmf-dist/tex/latex/tools/enumerate.sty
> Package: enumerate 1999/03/05 v3.00 enumerate extensions (DPC)
> \@enLab=\toks16
> )
> (/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty
> Package: ifthen 2001/05/26 v1.1c Standard LaTeX ifthen package (DPC)
> )
> (/usr/share/texlive/texmf-dist/tex/latex/listings/listings.sty
> \lst@mode=\count95
> \lst@gtempboxa=\box26
> \lst@token=\toks17
> \lst@length=\count96
> \lst@currlwidth=\dimen110
> \lst@column=\count97
> \lst@pos=\count98
> \lst@lostspace=\dimen111
> \lst@width=\dimen112
> \lst@newlines=\count99
> \lst@lineno=\count100
> \lst@maxwidth=\dimen113
> 
> (/usr/share/texlive/texmf-dist/tex/latex/listings/lstmisc.sty
> File: lstmisc.sty 2014/03/04 1.5c (Carsten Heinz)
> \c@lstnumber=\count101
> \lst@skipnumbers=\count102
> \lst@framebox=\box27
> )
> (/usr/share/texlive/texmf-dist/tex/latex/listings/listings.cfg
> File: listings.cfg 2014/03/04 1.5c listings configuration
> ))
> Package: listings 2014/03/04 1.5c (Carsten Heinz)
> 
> (/usr/share/texlive/texmf-dist/tex/latex/hyperref/hyperref.sty
> Package: hyperref 2012/11/06 v6.83m Hypertext links for LaTeX
> 
> (/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-hyperref.sty
> Package: hobsub-hyperref 2012/05/28 v1.13 Bundle oberdiek, subset hyperref (HO)
> 
> 
> (/usr/share/texlive/texmf-dist/tex/generic/oberdiek/hobsub-generic.sty
> Package: hobsub-generic 2012/05/28 v1.13 Bundle oberdiek, subset generic (HO)
> Package: hobsub 2012/05/28 v1.13 Construct package bundles (HO)
> Package hobsub Info: Skipping package `infwarerr' (already loaded).
> Package hobsub Info: Skipping package `ltxcmds' (already loaded).
> Package: ifluatex 2010/03/01 v1.3 Provides the ifluatex switch (HO)
> Package ifluatex Info: LuaTeX not detected.
> Package: ifvtex 2010/03/01 v1.5 Detect VTeX and its facilities (HO)
> Package ifvtex Info: VTeX not detected.
> Package: intcalc 2007/09/27 v1.1 Expandable calculations with integers (HO)
> Package: ifpdf 2011/01/30 v2.3 Provides the ifpdf switch (HO)
> Package ifpdf Info: pdfTeX in PDF mode is detected.
> Package: etexcmds 2011/02/16 v1.5 Avoid name clashes with e-TeX commands (HO)
> Package etexcmds Info: Could not find \expanded.
> (etexcmds)             That can mean that you are not using pdfTeX 1.50 or
> (etexcmds)             that some package has redefined \expanded.
> (etexcmds)             In the latter case, load this package earlier.
> Package: kvsetkeys 2012/04/25 v1.16 Key value parser (HO)
> Package: kvdefinekeys 2011/04/07 v1.3 Define keys (HO)
> Package: pdftexcmds 2011/11/29 v0.20 Utility functions of pdfTeX for LuaTeX (HO
> )
> Package pdftexcmds Info: LuaTeX not detected.
> Package pdftexcmds Info: \pdf@primitive is available.
> Package pdftexcmds Info: \pdf@ifprimitive is available.
> Package pdftexcmds Info: \pdfdraftmode found.
> Package: pdfescape 2011/11/25 v1.13 Implements pdfTeX's escape features (HO)
> Package: bigintcalc 2012/04/08 v1.3 Expandable calculations on big integers (HO
> )
> Package: bitset 2011/01/30 v1.1 Handle bit-vector datatype (HO)
> Package: uniquecounter 2011/01/30 v1.2 Provide unlimited unique counter (HO)
> )
> Package hobsub Info: Skipping package `hobsub' (already loaded).
> Package: letltxmacro 2010/09/02 v1.4 Let assignment for LaTeX macros (HO)
> Package: hopatch 2012/05/28 v1.2 Wrapper for package hooks (HO)
> Package: xcolor-patch 2011/01/30 xcolor patch
> Package: atveryend 2011/06/30 v1.8 Hooks at the very end of document (HO)
> Package atveryend Info: \enddocument detected (standard20110627).
> Package: atbegshi 2011/10/05 v1.16 At begin shipout hook (HO)
> Package: refcount 2011/10/16 v3.4 Data extraction from label references (HO)
> Package: hycolor 2011/01/30 v1.7 Color options for hyperref/bookmark (HO)
> )
> (/usr/share/texlive/texmf-dist/tex/generic/ifxetex/ifxetex.sty
> Package: ifxetex 2010/09/12 v0.6 Provides ifxetex conditional
> )
> (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/auxhook.sty
> Package: auxhook 2011/03/04 v1.3 Hooks for auxiliary files (HO)
> )
> (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/kvoptions.sty
> Package: kvoptions 2011/06/30 v3.11 Key value format for package options (HO)
> )
> \@linkdim=\dimen114
> \Hy@linkcounter=\count103
> \Hy@pagecounter=\count104
> 
> (/usr/share/texlive/texmf-dist/tex/latex/hyperref/pd1enc.def
> File: pd1enc.def 2012/11/06 v6.83m Hyperref: PDFDocEncoding definition (HO)
> )
> \Hy@SavedSpaceFactor=\count105
> 
> (/usr/share/texlive/texmf-dist/tex/latex/latexconfig/hyperref.cfg
> File: hyperref.cfg 2002/06/06 v1.2 hyperref configuration of TeXLive
> )
> Package hyperref Info: Option `bookmarks' set `true' on input line 4319.
> Package hyperref Info: Option `bookmarksnumbered' set `true' on input line 4319
> .
> Package hyperref Info: Hyper figures OFF on input line 4443.
> Package hyperref Info: Link nesting OFF on input line 4448.
> Package hyperref Info: Hyper index ON on input line 4451.
> Package hyperref Info: Plain pages OFF on input line 4458.
> Package hyperref Info: Backreferencing OFF on input line 4463.
> Package hyperref Info: Implicit mode ON; LaTeX internals redefined.
> Package hyperref Info: Bookmarks ON on input line 4688.
> \c@Hy@tempcnt=\count106
> 
> (/usr/share/texlive/texmf-dist/tex/latex/url/url.sty
> \Urlmuskip=\muskip10
> Package: url 2013/09/16  ver 3.4  Verb mode for urls, etc.
> )
> LaTeX Info: Redefining \url on input line 5041.
> \XeTeXLinkMargin=\dimen115
> \Fld@menulength=\count107
> \Field@Width=\dimen116
> \Fld@charsize=\dimen117
> Package hyperref Info: Hyper figures OFF on input line 6295.
> Package hyperref Info: Link nesting OFF on input line 6300.
> Package hyperref Info: Hyper index ON on input line 6303.
> Package hyperref Info: backreferencing OFF on input line 6310.
> Package hyperref Info: Link coloring OFF on input line 6315.
> Package hyperref Info: Link coloring with OCG OFF on input line 6320.
> Package hyperref Info: PDF/A mode OFF on input line 6325.
> LaTeX Info: Redefining \ref on input line 6365.
> LaTeX Info: Redefining \pageref on input line 6369.
> \Hy@abspage=\count108
> \c@Item=\count109
> \c@Hfootnote=\count110
> )
> 
> Package hyperref Message: Driver (autodetected): hpdftex.
> 
> (/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
> File: hpdftex.def 2012/11/06 v6.83m Hyperref driver for pdfTeX
> \Fld@listcount=\count111
> \c@bookmark@seq@number=\count112
> 
> (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty
> Package: rerunfilecheck 2011/04/15 v1.7 Rerun checks for auxiliary files (HO)
> Package uniquecounter Info: New unique counter `rerunfilecheck' on input line 2
> 82.
> )
> \Hy@SectionHShift=\skip50
> )
> (./qqz.sty
> \c@quickquizctr=\count113
> ) (./origpub.sty) (./perfbook.aux)
> \openout1 = `perfbook.aux'.
> 
> LaTeX Font Info:    Checking defaults for OML/cmm/m/it on input line 31.
> LaTeX Font Info:    ... okay on input line 31.
> LaTeX Font Info:    Checking defaults for T1/cmr/m/n on input line 31.
> LaTeX Font Info:    ... okay on input line 31.
> LaTeX Font Info:    Checking defaults for OT1/cmr/m/n on input line 31.
> LaTeX Font Info:    ... okay on input line 31.
> LaTeX Font Info:    Checking defaults for OMS/cmsy/m/n on input line 31.
> LaTeX Font Info:    ... okay on input line 31.
> LaTeX Font Info:    Checking defaults for OMX/cmex/m/n on input line 31.
> LaTeX Font Info:    ... okay on input line 31.
> LaTeX Font Info:    Checking defaults for U/cmr/m/n on input line 31.
> LaTeX Font Info:    ... okay on input line 31.
> LaTeX Font Info:    Checking defaults for TS1/cmr/m/n on input line 31.
> LaTeX Font Info:    Try loading font information for TS1+cmr on input line 31.
> 
> (/usr/share/texlive/texmf-dist/tex/latex/base/ts1cmr.fd
> File: ts1cmr.fd 1999/05/25 v2.5h Standard LaTeX font definitions
> )
> LaTeX Font Info:    ... okay on input line 31.
> LaTeX Font Info:    Checking defaults for PD1/pdf/m/n on input line 31.
> LaTeX Font Info:    ... okay on input line 31.
> LaTeX Font Info:    Try loading font information for T1+ptm on input line 31.
> 
> (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1ptm.fd
> File: t1ptm.fd 2001/06/04 font definitions for T1/ptm.
> )
> \big@size=\dimen118
> LaTeX Info: Redefining \microtypecontext on input line 31.
> Package microtype Info: Generating PDF output.
> Package microtype Info: Character protrusion enabled (level 2).
> Package microtype Info: Using default protrusion set `alltext'.
> Package microtype Info: Automatic font expansion enabled (level 2),
> (microtype)             stretch: 20, shrink: 20, step: 1, non-selected.
> Package microtype Info: Using default expansion set `basictext'.
> Package microtype Info: No adjustment of tracking.
> Package microtype Info: No adjustment of interword spacing.
> Package microtype Info: No adjustment of character kerning.
> 
> (/usr/share/texlive/texmf-dist/tex/latex/microtype/mt-ptm.cfg
> File: mt-ptm.cfg 2006/04/20 v1.7 microtype config. file: Times (RS)
> )
> (/usr/share/texlive/texmf-dist/tex/context/base/supp-pdf.mkii
> [Loading MPS to PDF converter (version 2006.09.02).]
> \scratchcounter=\count114
> \scratchdimen=\dimen119
> \scratchbox=\box28
> \nofMPsegments=\count115
> \nofMParguments=\count116
> \everyMPshowfont=\toks18
> \MPscratchCnt=\count117
> \MPscratchDim=\dimen120
> \MPnumerator=\count118
> \makeMPintoPDFobject=\count119
> \everyMPtoPDFconversion=\toks19
> ) (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/epstopdf-base.sty
> Package: epstopdf-base 2010/02/09 v2.5 Base part for package epstopdf
> 
> (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/grfext.sty
> Package: grfext 2010/08/19 v1.1 Manage graphics extensions (HO)
> )
> Package grfext Info: Graphics extension search list:
> (grfext)             [.png,.pdf,.jpg,.mps,.jpeg,.jbig2,.jb2,.PNG,.PDF,.JPG,.JPE
> G,.JBIG2,.JB2,.eps]
> (grfext)             \AppendGraphicsExtensions on input line 452.
> 
> (/usr/share/texlive/texmf-dist/tex/latex/latexconfig/epstopdf-sys.cfg
> File: epstopdf-sys.cfg 2010/07/13 v1.3 Configuration of (r)epstopdf for TeX Liv
> e
> ))
> \c@lstlisting=\count120
> \AtBeginShipoutBox=\box29
> Package hyperref Info: Link coloring OFF on input line 31.
> 
> (/usr/share/texlive/texmf-dist/tex/latex/hyperref/nameref.sty
> Package: nameref 2012/10/27 v2.43 Cross-referencing by name of section
> 
> (/usr/share/texlive/texmf-dist/tex/generic/oberdiek/gettitlestring.sty
> Package: gettitlestring 2010/12/03 v1.4 Cleanup title references (HO)
> )
> \c@section@level=\count121
> )
> LaTeX Info: Redefining \ref on input line 31.
> LaTeX Info: Redefining \pageref on input line 31.
> LaTeX Info: Redefining \nameref on input line 31.
> 
> (./perfbook.out) (./perfbook.out)
> \@outlinefile=\write3
> \openout3 = `perfbook.out'.
> 
> LaTeX Font Info:    Try loading font information for OT1+ztmcm on input line 86
> .
> 
> (/usr/share/texlive/texmf-dist/tex/latex/psnfss/ot1ztmcm.fd
> File: ot1ztmcm.fd 2000/01/03 Fontinst v1.801 font definitions for OT1/ztmcm.
> )
> Package microtype Info: Loading generic settings for font family
> (microtype)             `ztmcm' (encoding: OT1).
> (microtype)             For optimal results, create family-specific settings.
> (microtype)             See the microtype manual for details.
> LaTeX Font Info:    Try loading font information for OML+ztmcm on input line 86
> .
> 
> (/usr/share/texlive/texmf-dist/tex/latex/psnfss/omlztmcm.fd
> File: omlztmcm.fd 2000/01/03 Fontinst v1.801 font definitions for OML/ztmcm.
> )
> LaTeX Font Info:    Try loading font information for OMS+ztmcm on input line 86
> .
> 
> (/usr/share/texlive/texmf-dist/tex/latex/psnfss/omsztmcm.fd
> File: omsztmcm.fd 2000/01/03 Fontinst v1.801 font definitions for OMS/ztmcm.
> )
> LaTeX Font Info:    Try loading font information for OMX+ztmcm on input line 86
> .
> 
> (/usr/share/texlive/texmf-dist/tex/latex/psnfss/omxztmcm.fd
> File: omxztmcm.fd 2000/01/03 Fontinst v1.801 font definitions for OMX/ztmcm.
> )
> LaTeX Font Info:    Try loading font information for OT1+ptm on input line 86.
> 
> (/usr/share/texlive/texmf-dist/tex/latex/psnfss/ot1ptm.fd
> File: ot1ptm.fd 2001/06/04 font definitions for OT1/ptm.
> )
> LaTeX Font Info:    Font shape `OT1/ptm/bx/n' in size <12> not available
> (Font)              Font shape `OT1/ptm/b/n' tried instead on input line 86.
> LaTeX Font Info:    Font shape `OT1/ptm/bx/n' in size <9> not available
> (Font)              Font shape `OT1/ptm/b/n' tried instead on input line 86.
> LaTeX Font Info:    Font shape `OT1/ptm/bx/n' in size <7> not available
> (Font)              Font shape `OT1/ptm/b/n' tried instead on input line 86.
>  [1
> 
> 
> 
> 
> {/usr/share/texlive/texmf-dist/fonts/map/pdftex/updmap/pdftex.map}] (./legal.te
> x
> LaTeX Font Info:    Font shape `T1/ptm/bx/n' in size <14.4> not available
> (Font)              Font shape `T1/ptm/b/n' tried instead on input line 5.
> 
> Underfull \hbox (badness 10000) in paragraph at lines 7--11
> 
>  []
> 
> LaTeX Font Info:    Try loading font information for TS1+ptm on input line 12.
> (/usr/share/texlive/texmf-dist/tex/latex/psnfss/ts1ptm.fd
> File: ts1ptm.fd 2001/06/04 font definitions for TS1/ptm.
> )
> LaTeX Font Info:    Font shape `OT1/ptm/bx/n' in size <10> not available
> (Font)              Font shape `OT1/ptm/b/n' tried instead on input line 24.
> LaTeX Font Info:    Font shape `OT1/ptm/bx/n' in size <7.4> not available
> (Font)              Font shape `OT1/ptm/b/n' tried instead on input line 24.
> LaTeX Font Info:    Font shape `OT1/ptm/bx/n' in size <6> not available
> (Font)              Font shape `OT1/ptm/b/n' tried instead on input line 24.
> LaTeX Font Info:    Font shape `OT1/ptm/bx/n' in size <8> not available
> (Font)              Font shape `OT1/ptm/b/n' tried instead on input line 25.
> LaTeX Font Info:    Font shape `OT1/ptm/bx/n' in size <5> not available
> (Font)              Font shape `OT1/ptm/b/n' tried instead on input line 25.
> LaTeX Font Info:    Try loading font information for T1+pcr on input line 25.
> 
> (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1pcr.fd
> File: t1pcr.fd 2001/06/04 font definitions for T1/pcr.
> )
> Package microtype Info: Loading generic settings for font family
> (microtype)             `pcr' (encoding: T1).
> (microtype)             For optimal results, create family-specific settings.
> (microtype)             See the microtype manual for details.
>  [2
> 
> 
> ])
> LaTeX Font Info:    Font shape `T1/ptm/bx/n' in size <24.88> not available
> (Font)              Font shape `T1/ptm/b/n' tried instead on input line 87.
>  (./perfbook.toc)
> \tf@toc=\write4
> \openout4 = `perfbook.toc'.
> 
> [3
> 
> 
> 
> ] [4
> 
> 
> ] (./howto/howto.tex
> Chapter 1.
> LaTeX Font Info:    Font shape `T1/ptm/bx/n' in size <20.74> not available
> (Font)              Font shape `T1/ptm/b/n' tried instead on input line 3.
> LaTeX Font Info:    Font shape `T1/ptm/bx/n' in size <10> not available
> (Font)              Font shape `T1/ptm/b/n' tried instead on input line 57.
> 
> LaTeX Warning: Reference `chp:Counting' on page 1 undefined on input line 57.
> 
> 
> LaTeX Warning: Reference `cha:Partitioning and Synchronization Design' on page 
> 1 undefined on input line 65.
> 
> 
> LaTeX Warning: Reference `chp:Counting' on page 1 undefined on input line 67.
> 
> 
> LaTeX Warning: Citation `Dijkstra:1968:LEG:362929.362947' on page 1 undefined o
> n input line 70.
> 
> 
> LaTeX Warning: Citation `PaulEMcKenney2012HOTPARsuboptimal' on page 1 undefined
>  on input line 72.
> 
> 
> LaTeX Warning: Reference `chp:Locking' on page 1 undefined on input line 76.
> 
> 
> LaTeX Warning: Reference `chp:Data Ownership' on page 1 undefined on input line
>  79.
> 
> 
> LaTeX Warning: Reference `chp:Deferred Processing' on page 1 undefined on input
>  line 81.
> 
> 
> LaTeX Warning: Reference `chp:Data Structures' on page 1 undefined on input lin
> e 85.
> 
> 
> Underfull \vbox (badness 1259) has occurred while \output is active []
> 
>  [1
> 
> ]
> 
> LaTeX Warning: Reference `chp:Validation' on page 2 undefined on input line 92.
> 
> 
> 
> LaTeX Warning: Reference `chp:formal:Formal Verification' on page 2 undefined o
> n input line 94.
> 
> 
> LaTeX Warning: Reference `chp:Putting It All Together' on page 2 undefined on i
> nput line 98.
> 
> 
> LaTeX Warning: Reference `sec:advsync:Advanced Synchronization' on page 2 undef
> ined on input line 103.
> 
> 
> LaTeX Warning: Reference `chp:Ease of Use' on page 2 undefined on input line 10
> 6.
> 
> 
> LaTeX Warning: Reference `chp:Conflicting Visions of the Future' on page 2 unde
> fined on input line 107.
> 
> 
> LaTeX Warning: Reference `chp:app:whymb:Why Memory Barriers?' on page 2 undefin
> ed on input line 114.
> 
> 
> LaTeX Warning: Reference `chp:Answers to Quick Quizzes' on page 2 undefined on 
> input line 116.
> 
> 
> LaTeX Warning: Reference `chp:Answers to Quick Quizzes' on page 2 undefined on 
> input line 125.
> 
> 
> LaTeX Warning: Reference `chp:Answers to Quick Quizzes' on page 2 undefined on 
> input line 126.
> 
> 
> LaTeX Warning: Citation `HerlihyShavit2008Textbook' on page 2 undefined on inpu
> t line 245.
> 
> 
> LaTeX Warning: Citation `MichaelScott2013Textbook' on page 2 undefined on input
>  line 252.
> 
> 
> LaTeX Warning: Citation `MichaelScott2006Textbook' on page 2 undefined on input
>  line 260.
> 
> 
> LaTeX Warning: Citation `SchmidtStalRohnertBuschmann2000v2Textbook' on page 2 u
> ndefined on input line 266.
> 
> 
> LaTeX Warning: Citation `BuschmannHenneySchmidt2007v4Textbook' on page 2 undefi
> ned on input line 266.
> 
> [2]
> 
> LaTeX Warning: Citation `CorbetRubiniKroahHartman' on page 3 undefined on input
>  line 276.
> 
> 
> Underfull \hbox (badness 1859) in paragraph at lines 274--281
> \T1/ptm/m/n/10 (+20) then Cor-bet's, Ru-bini's, and Kroah-Hartman's
>  []
> 
> 
> LaTeX Warning: Citation `Mattson2005Textbook' on page 3 undefined on input line
>  284.
> 
> 
> LaTeX Warning: Citation `NormMatloff2013ParProcBook' on page 3 undefined on inp
> ut line 291.
> 
> 
> LaTeX Warning: Citation `Butenhof1997pthreads' on page 3 undefined on input lin
> e 293.
> 
> 
> LaTeX Warning: Citation `WRichardStevens1992' on page 3 undefined on input line
>  295.
> 
> 
> LaTeX Warning: Citation `StewartWeiss2013UNIX' on page 3 undefined on input lin
> e 297.
> 
> 
> LaTeX Warning: Citation `AnthonyWilliams2012' on page 3 undefined on input line
>  302.
> 
> 
> LaTeX Warning: Citation `HerbSutter2008EffectiveConcurrency' on page 3 undefine
> d on input line 306.
> 
> 
> LaTeX Warning: Citation `Reinders2007Textbook' on page 3 undefined on input lin
> e 310.
> 
> 
> LaTeX Warning: Citation `Schimmel:1994:USM:175689' on page 3 undefined on input
>  line 316.
> 
> 
> LaTeX Warning: Citation `DougLea1997Textbook' on page 3 undefined on input line
>  318.
> 
> 
> LaTeX Warning: Citation `Goetz2007Textbook' on page 3 undefined on input line 3
> 18.
> 
> 
> LaTeX Warning: Reference `sec:defer:``Toy'' RCU Implementations' on page 3 unde
> fined on input line 341.
> 
> 
> Underfull \hbox (badness 2547) in paragraph at lines 387--395
> []\T1/ptm/m/n/10 (+20) To cre-ate patches or [][][] re-quests, you
>  []
> 
> 
> Underfull \hbox (badness 10000) in paragraph at lines 387--395
> []$\T1/pcr/m/n/10 git : / / git . kernel . org / pub / scm / linux /
>  []
> 
> [3]
> Underfull \hbox (badness 3930) in paragraph at lines 411--415
> []\T1/ptm/m/n/10 (+20) PDFs of this book are spo-rad-i-cally posted at
>  []
> 
> 
> Underfull \hbox (badness 10000) in paragraph at lines 411--415
> []$\T1/pcr/m/n/10 http : / / kernel . org / pub / linux / kernel /
>  []
> 
> 
> Underfull \hbox (badness 10000) in paragraph at lines 411--415
> \T1/pcr/m/n/10 people / paulmck / perfbook / perfbook . html$[]
>  []
> 
> 
> Underfull \hbox (badness 10000) in paragraph at lines 411--415
> \T1/ptm/m/n/10 (+20) and at []$\T1/pcr/m/n/10 http : / / www . rdrop . com / us
> ers /
>  []
> 
> 
> Underfull \hbox (badness 2564) in paragraph at lines 416--422
> []\T1/ptm/m/n/10 (+20) The ac-tual pro-cess of con-tribut-ing patches and
>  []
> 
> 
> Underfull \hbox (badness 1953) in paragraph at lines 416--422
> \T1/ptm/m/n/10 (+20) send-ing [][][] re-quests is sim-i-lar to that of
>  []
> 
> 
> Underfull \hbox (badness 5578) in paragraph at lines 416--422
> \T1/ptm/m/n/10 (+20) the Linux ker-nel, which is doc-u-mented in the
>  []
> 
> 
> Underfull \hbox (badness 10000) in paragraph at lines 429--431
> []\T1/ptm/m/n/10 (+20) Please see []$\T1/pcr/m/n/10 http : / / lkml . org / lkm
> l / 2007 /
>  []
> 
> 
> Underfull \hbox (badness 7238) in paragraph at lines 429--431
> \T1/pcr/m/n/10 1 / 15 / 219$[] \T1/ptm/m/n/10 (+20) for an ex-am-ple patch con-
> tain-ing a
>  []
> 
> [4]) (./intro/intro.tex [5
> 
> ] [6
> 
> ]
> Chapter 2.
> 
> LaTeX Warning: Citation `DouglasEngelbart1968' on page 7 undefined on input lin
> e 36.
> 
> 
> LaTeX Warning: Citation `ScottGriffen2000' on page 7 undefined on input line 38
> .
> 
> 
> Underfull \vbox (badness 5832) has occurred while \output is active []
> 
> 
> 
> LaTeX Warning: Citation `Olukotun96' on page 7 undefined on input line 74.
> 
> [7]
> 
> LaTeX Warning: Citation `Torvalds2.6kernel' on page 8 undefined on input line 1
> 01.
> 
> 
> LaTeX Warning: Citation `PostgreSQL2008' on page 8 undefined on input line 102.
> 
> 
> 
> LaTeX Warning: Citation `MySQL2008' on page 8 undefined on input line 102.
> 
> 
> LaTeX Warning: Citation `OpenMPI2008' on page 8 undefined on input line 103.
> 
> 
> LaTeX Warning: Citation `BOINC2008' on page 8 undefined on input line 103.
> 
> 
> Underfull \hbox (badness 10000) in paragraph at lines 107--113
> []\T1/ptm/m/n/10 (+20) Fourth, even though the large-scale parallel-
>  []
> 
> 
> Underfull \hbox (badness 1142) in paragraph at lines 107--113
> \T1/ptm/m/n/10 (+20) al-most all pro-pri-etary projects, these projects have
>  []
> 
> 
> LaTeX Warning: Citation `BryanGardiner2007' on page 8 undefined on input line 1
> 20.
> 
> 
> LaTeX Warning: Citation `GordonMoore03a' on page 8 undefined on input line 120.
> 
> 
> pdfTeX warning (ext4): destination with the same identifier (name{quickquizctr.
> 1}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.128 \QuickQuiz{}
>                   pdfTeX warning (ext4): destination with the same identifier (
> name{quickquizctr.2}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.192 \QuickQuiz{}
>                   pdfTeX warning (ext4): destination with the same identifier (
> name{quickquizctr.3}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.238 \QuickQuiz{}
>                   
> LaTeX Font Info:    Font shape `T1/ptm/bx/n' in size <12> not available
> (Font)              Font shape `T1/ptm/b/n' tried instead on input line 282.
>  <SMPdesign/clockfreq.pdf, id=319, 252.945pt x 260.975pt>
> File: SMPdesign/clockfreq.pdf Graphic file (type pdf)
> 
> <use SMPdesign/clockfreq.pdf>
> Package pdftex.def Info: SMPdesign/clockfreq.pdf used on input line 315.
> (pdftex.def)             Requested size: 252.94438pt x 260.97437pt.
>  [8]
> 
> LaTeX Warning: Citation `LinusTorvalds2001a' on page 9 undefined on input line 
> 350.
> 
> 
> LaTeX Warning: Citation `CSIRACMuseumVictoria' on page 9 undefined on input lin
> e 411.
> 
> 
> LaTeX Warning: Citation `CSIRACUniversityMelbourne' on page 9 undefined on inpu
> t line 411.
> 
> 
> LaTeX Warning: Citation `z80Wikipedia' on page 9 undefined on input line 423.
> 
> [9 <./SMPdesign/clockfreq.pdf>]
> <SMPdesign/mipsperbuck.pdf, id=350, 252.945pt x 260.975pt>
> File: SMPdesign/mipsperbuck.pdf Graphic file (type pdf)
> 
> <use SMPdesign/mipsperbuck.pdf>
> Package pdftex.def Info: SMPdesign/mipsperbuck.pdf used on input line 432.
> (pdftex.def)             Requested size: 252.94438pt x 260.97437pt.
> 
> Underfull \vbox (badness 3907) has occurred while \output is active []
> 
> 
> 
> LaTeX Warning: Citation `OpenGroup1997pthreads' on page 10 undefined on input l
> ine 512.
> 
> 
> Underfull \hbox (badness 10000) in paragraph at lines 511--518
> []\T1/ptm/m/n/10 (+20) : This cat-e-gory,
>  []
> 
> 
> Underfull \hbox (badness 1383) in paragraph at lines 511--518
> \T1/ptm/m/n/10 (+20) which in-cludes POSIX Threads (pthreads) [[]],
>  []
> 
> 
> LaTeX Warning: Citation `MPIForum2008' on page 10 undefined on input line 524.
> 
> 
> LaTeX Warning: Citation `DIS9075SQL92' on page 10 undefined on input line 536.
> 
> 
> LaTeX Warning: Citation `TPC' on page 10 undefined on input line 540.
> 
> <intro/PPGrelation.pdf, id=352, 134.5025pt x 95.35625pt>
> File: intro/PPGrelation.pdf Graphic file (type pdf)
> 
> <use intro/PPGrelation.pdf>
> Package pdftex.def Info: intro/PPGrelation.pdf used on input line 549.
> (pdftex.def)             Requested size: 134.50215pt x 95.356pt.
>  [10 <./SMPdesign/mipsperbuck.pdf>]
> <intro/Generality.pdf, id=364, 243.91125pt x 178.6675pt>
> File: intro/Generality.pdf Graphic file (type pdf)
> 
> <use intro/Generality.pdf>
> Package pdftex.def Info: intro/Generality.pdf used on input line 580.
> (pdftex.def)             Requested size: 243.91064pt x 178.66705pt.
> 
> Underfull \hbox (badness 4805) in paragraph at lines 649--649
> []\T1/ptm/b/n/14.4 Alternatives to Par-al-lel Pro-
>  []
> 
> 
> Underfull \vbox (badness 10000) has occurred while \output is active []
> 
>  [11 <./intro/PPGrelation.pdf> <./intro/Generality.pdf>]
> Underfull \hbox (badness 1062) in paragraph at lines 675--675
> []\T1/ptm/b/n/12 Multiple In-stances of a Se-quen-tial
>  []
> 
> 
> LaTeX Warning: Citation `Date82' on page 12 undefined on input line 706.
> 
> [12]
> 
> LaTeX Warning: Citation `RyanEccles2005HPCSNovice' on page 13 undefined on inpu
> t line 825.
> 
> 
> LaTeX Warning: Citation `RyanEccles2006HPCSNoviceNeeds' on page 13 undefined on
>  input line 825.
> 
> 
> LaTeX Warning: Citation `LorinHochstein2005SC' on page 13 undefined on input li
> ne 825.
> 
> 
> LaTeX Warning: Citation `DuaneSzafron1994PEMPDS' on page 13 undefined on input 
> line 825.
> 
> <intro/FourTaskCategories.pdf, id=390, 218.8175pt x 137.51375pt>
> File: intro/FourTaskCategories.pdf Graphic file (type pdf)
> 
> <use intro/FourTaskCategories.pdf>
> Package pdftex.def Info: intro/FourTaskCategories.pdf used on input line 840.
> (pdftex.def)             Requested size: 218.81696pt x 137.51341pt.
> 
> 
> LaTeX Warning: Citation `GeneAmdahl1967AmdahlsLaw' on page 13 undefined on inpu
> t line 862.
> 
> [13 <./intro/FourTaskCategories.pdf>]
> 
> LaTeX Warning: Citation `OpenGroup1997pthreads' on page 14 undefined on input l
> ine 950.
> 
> 
> LaTeX Warning: Citation `DIS9075SQL92' on page 14 undefined on input line 951.
> 
> 
> LaTeX Warning: Citation `ElGhazawi2003UPC' on page 14 undefined on input line 9
> 53.
> 
> 
> LaTeX Warning: Citation `MPIForum2008' on page 14 undefined on input line 955.
> 
> 
> LaTeX Warning: Citation `McKenney2007PLOSTM' on page 14 undefined on input line
>  971.
> 
> 
> LaTeX Warning: Reference `sec:future:Transactional Memory' on page 14 undefined
>  on input line 974.
> 
> 
> LaTeX Warning: Reference `sec:future:Hardware Transactional Memory' on page 14 
> undefined on input line 975.
> 
> 
> Underfull \hbox (badness 1052) in paragraph at lines 978--978
> []\T1/ptm/b/n/12 Resource Par-ti-tion-ing and Repli-ca-
>  []
> 
> 
> LaTeX Warning: Citation `Beck85' on page 14 undefined on input line 990.
> 
> [14] <intro/FourTaskOrder.pdf, id=411, 218.8175pt x 137.51375pt>
> File: intro/FourTaskOrder.pdf Graphic file (type pdf)
> 
> <use intro/FourTaskOrder.pdf>
> Package pdftex.def Info: intro/FourTaskOrder.pdf used on input line 1028.
> (pdftex.def)             Requested size: 218.81696pt x 137.51341pt.
> 
> 
> LaTeX Warning: Citation `PanagiotisMetaxas1999PDCS' on page 15 undefined on inp
> ut line 1050.
> 
> 
> Underfull \hbox (badness 2582) in paragraph at lines 1052--1052
> []\T1/ptm/b/n/12 How Do Lan-guages and En-vi-ron-
>  []
> 
> ) (./cpu/cpu.tex [15 <./intro/FourTaskOrder.pdf>] [16
> 
> ]
> Chapter 3.
> 
> LaTeX Warning: Citation `Hennessy95a' on page 17 undefined on input line 15.
> 
> pdfTeX warning (ext4): destination with the same identifier (name{quickquizctr.
> 1}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.17 \QuickQuiz{}
>                   (./cpu/overview.tex
> <cartoons/r-2014-CPU-track-meet.pdf, id=432, 470.71323pt x 390.22197pt>
> File: cartoons/r-2014-CPU-track-meet.pdf Graphic file (type pdf)
> 
> <use cartoons/r-2014-CPU-track-meet.pdf>
> Package pdftex.def Info: cartoons/r-2014-CPU-track-meet.pdf used on input line 
> 13.
> (pdftex.def)             Requested size: 470.71208pt x 390.22101pt.
> 
> <cartoons/r-2014-Old-man-and-Brat.pdf, id=434, 478.98454pt x 318.60663pt>
> File: cartoons/r-2014-Old-man-and-Brat.pdf Graphic file (type pdf)
> 
> <use cartoons/r-2014-Old-man-and-Brat.pdf>
> Package pdftex.def Info: cartoons/r-2014-Old-man-and-Brat.pdf used on input lin
> e 32.
> (pdftex.def)             Requested size: 478.98337pt x 318.60585pt.
> 
> <cartoons/r-2014-branch-error.pdf, id=436, 421.29546pt x 361.68835pt>
> File: cartoons/r-2014-branch-error.pdf Graphic file (type pdf)
> 
> <use cartoons/r-2014-branch-error.pdf>
> Package pdftex.def Info: cartoons/r-2014-branch-error.pdf used on input line 57
> .
> (pdftex.def)             Requested size: 421.29442pt x 361.68747pt.
>  [17 <./cartoons/r-2014-CPU-track-meet.pdf>]
> Underfull \vbox (badness 2401) has occurred while \output is active []
> 
> 
> <cartoons/r-2014-memory-reference.pdf, id=453, 311.99965pt x 318.2517pt>
> File: cartoons/r-2014-memory-reference.pdf Graphic file (type pdf)
> 
> <use cartoons/r-2014-memory-reference.pdf>
> Package pdftex.def Info: cartoons/r-2014-memory-reference.pdf used on input lin
> e 110.
> (pdftex.def)             Requested size: 311.99889pt x 318.25092pt.
> 
> Underfull \vbox (badness 5622) has occurred while \output is active []
> 
>  [18 <./cartoons/r-2014-Old-man-and-Brat.pdf> <./cartoons/r-2014-branch-error.p
> df
> 
> pdfTeX warning: pdflatex (file ./cartoons/r-2014-branch-error.pdf): PDF inclusi
> on: multiple pdfs with page group included in a single page
> >] <cartoons/r-2014-Atomic-reference.pdf, id=556, 352.8064pt x 253.83916pt>
> File: cartoons/r-2014-Atomic-reference.pdf Graphic file (type pdf)
> 
> <use cartoons/r-2014-Atomic-reference.pdf>
> Package pdftex.def Info: cartoons/r-2014-Atomic-reference.pdf used on input lin
> e 157.
> (pdftex.def)             Requested size: 352.80553pt x 253.83853pt.
> pdfTeX warning (ext4): destination with the same identifier (name{quickquizctr.
> 2}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.179 \QuickQuiz{}
>                   
> 
> LaTeX Warning: Reference `sec:advsync:Memory Barriers' on page 19 undefined on 
> input line 206.
> 
> 
> LaTeX Warning: Reference `chp:app:whymb:Why Memory Barriers?' on page 19 undefi
> ned on input line 207.
> 
> 
> Overfull \hbox (10.00002pt too wide) in paragraph at lines 212--221
> [][]
>  []
> 
> <cartoons/r-2014-Memory-barrier.pdf, id=558, 338.61507pt x 330.18358pt>
> File: cartoons/r-2014-Memory-barrier.pdf Graphic file (type pdf)
> 
> <use cartoons/r-2014-Memory-barrier.pdf>
> Package pdftex.def Info: cartoons/r-2014-Memory-barrier.pdf used on input line 
> 224.
> (pdftex.def)             Requested size: 338.61423pt x 330.18277pt.
>  [19 <./cartoons/r-2014-memory-reference.pdf> <./cartoons/r-2014-Atomic-referen
> ce.pdf
> 
> pdfTeX warning: pdflatex (file ./cartoons/r-2014-Atomic-reference.pdf): PDF inc
> lusion: multiple pdfs with page group included in a single page
> >]
> <cartoons/r-2014-CPU-track-meet-cache-miss-toll-booth.pdf, id=690, 478.88432pt 
> x 398.58098pt>
> File: cartoons/r-2014-CPU-track-meet-cache-miss-toll-booth.pdf Graphic file (ty
> pe pdf)
>  <use cartoons/r-2014-CPU-track-meet-cache-miss-toll-booth.pdf>
> Package pdftex.def Info: cartoons/r-2014-CPU-track-meet-cache-miss-toll-booth.p
> df used on input line 249.
> (pdftex.def)             Requested size: 478.88315pt x 398.58pt.
> 
> 
> LaTeX Warning: Reference `sec:app:whymb:Cache Structure' on page 20 undefined o
> n input line 266.
> 
> pdfTeX warning (ext4): destination with the same identifier (name{quickquizctr.
> 3}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.270 \QuickQuiz{}
>                   
> <cartoons/r-2014-CPU-track-meet-phone-booth.pdf, id=692, 541.42645pt x 438.2853
> 2pt>
> File: cartoons/r-2014-CPU-track-meet-phone-booth.pdf Graphic file (type pdf)
>  <use cartoons/r-2014-CPU-track-meet-phone-booth.pdf>
> Package pdftex.def Info: cartoons/r-2014-CPU-track-meet-phone-booth.pdf used on
>  input line 288.
> (pdftex.def)             Requested size: 541.42513pt x 438.28426pt.
> 
> 
> LaTeX Warning: Reference `cha:Partitioning and Synchronization Design' on page 
> 20 undefined on input line 313.
> 
> [20 <./cartoons/r-2014-Memory-barrier.pdf> <./cartoons/r-2014-CPU-track-meet-ca
> che-miss-toll-booth.pdf
> 
> pdfTeX warning: pdflatex (file ./cartoons/r-2014-CPU-track-meet-cache-miss-toll
> -booth.pdf): PDF inclusion: multiple pdfs with page group included in a single 
> page
> > <./cartoons/r-2014-CPU-track-meet-phone-booth.pdf
> 
> pdfTeX warning: pdflatex (file ./cartoons/r-2014-CPU-track-meet-phone-booth.pdf
> ): PDF inclusion: multiple pdfs with page group included in a single page
> >]) (./cpu/overheads.tex <cpu/SystemArch.pdf, id=728, 218.8175pt x 188.705pt>
> File: cpu/SystemArch.pdf Graphic file (type pdf)
> 
> <use cpu/SystemArch.pdf>
> Package pdftex.def Info: cpu/SystemArch.pdf used on input line 16.
> (pdftex.def)             Requested size: 218.81696pt x 188.70453pt.
> pdfTeX warning (ext4): destination with the same identifier (name{quickquizctr.
> 4}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.63 \QuickQuiz{}
>                  pdfTeX warning (ext4): destination with the same identifier (n
> ame{quickquizctr.5}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.94 \QuickQuiz{}
>                   [21 <./cpu/SystemArch.pdf>]pdfTeX warning (ext4): destination
>  with the same identifier (name{quickquizctr.6}) has been already used, duplica
> te ignored
> <to be read again> 
>                    \relax 
> l.171 \QuickQuiz{}
>                   pdfTeX warning (ext4): destination with the same identifier (
> name{quickquizctr.7}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.262 \QuickQuiz{}
>                   
> <cartoons/Data-chasing-light-wave.pdf, id=750, 859.28426pt x 491.8375pt>
> File: cartoons/Data-chasing-light-wave.pdf Graphic file (type pdf)
> 
> <use cartoons/Data-chasing-light-wave.pdf>
> Package pdftex.def Info: cartoons/Data-chasing-light-wave.pdf used on input lin
> e 285.
> (pdftex.def)             Requested size: 859.28217pt x 491.83629pt.
> ) (./cpu/hwfreelunch.tex
> 
> LaTeX Warning: Citation `HerbSutter2008EffectiveConcurrency' on page 22 undefin
> ed on input line 9.
> 
> [22 <./cartoons/Data-chasing-light-wave.pdf>]pdfTeX warning (ext4): destination
>  with the same identifier (name{quickquizctr.8}) has been already used, duplica
> te ignored
> <to be read again> 
>                    \relax 
> l.38 \QuickQuiz{}
>                  
> 
> LaTeX Warning: Citation `JohnKnickerbocker2008:3DI' on page 23 undefined on inp
> ut line 91.
> 
> <cpu/3DI.pdf, id=765, 218.8175pt x 97.36375pt>
> File: cpu/3DI.pdf Graphic file (type pdf)
>  <use cpu/3DI.pdf>
> Package pdftex.def Info: cpu/3DI.pdf used on input line 95.
> (pdftex.def)             Requested size: 218.81696pt x 97.3635pt.
> 
> 
> LaTeX Warning: Citation `JimGray2002SmokingHairyGolfBalls' on page 23 undefined
>  on input line 124.
> 
> 
> LaTeX Warning: Citation `BryanGardiner2007' on page 23 undefined on input line 
> 131.
> 
> [23 <./cpu/3DI.pdf>]) (./cpu/swdesign.tex [24]pdfTeX warning (ext4): destinatio
> n with the same identifier (name{quickquizctr.9}) has been already used, duplic
> ate ignored
> <to be read again> 
>                    \relax 
> l.30 \QuickQuiz{}
>                  pdfTeX warning (ext4): destination with the same identifier (n
> ame{quickquizctr.10}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.78 \QuickQuiz{}
>                  )
> 
> LaTeX Warning: Reference `chp:Counting' on page 25 undefined on input line 49.
> 
> 
> LaTeX Warning: Reference `cha:Partitioning and Synchronization Design' on page 
> 25 undefined on input line 51.
> 
> ) (./toolsoftrade/toolsoftrade.tex [25] [26
> 
> ]
> Chapter 4.
> 
> LaTeX Warning: Reference `sec:toolsoftrade:Linux-Kernel Equivalents to POSIX Op
> erations' on page 27 undefined on input line 15.
> 
> 
> LaTeX Warning: Reference `sec:toolsoftrade:The Right Tool for the Job: How to C
> hoose?' on page 27 undefined on input line 17.
> 
> 
> Overfull \hbox (10.00002pt too wide) in paragraph at lines 34--45
> [][]
>  []
> 
> <toolsoftrade/shellparallel.pdf, id=803, 218.8175pt x 159.59625pt>
> File: toolsoftrade/shellparallel.pdf Graphic file (type pdf)
> 
> <use toolsoftrade/shellparallel.pdf>
> Package pdftex.def Info: toolsoftrade/shellparallel.pdf used on input line 48.
> (pdftex.def)             Requested size: 218.81696pt x 159.59584pt.
> pdfTeX warning (ext4): destination with the same identifier (name{quickquizctr.
> 1}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.67 \QuickQuiz{}
>                  pdfTeX warning (ext4): destination with the same identifier (n
> ame{quickquizctr.2}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.81 \QuickQuiz{}
>                  pdfTeX warning (ext4): destination with the same identifier (n
> ame{quickquizctr.3}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.110 \QuickQuiz{}
>                   
> 
> LaTeX Warning: Citation `OpenGroup1997pthreads' on page 27 undefined on input l
> ine 143.
> 
> 
> Underfull \vbox (badness 7397) has occurred while \output is active []
> 
>  [27 <./toolsoftrade/shellparallel.pdf>]
> Underfull \hbox (badness 2961) in paragraph at lines 155--155
> []\T1/ptm/b/n/12 POSIX Pro-cess Cre-ation and De-
>  []
> 
> 
> LaTeX Warning: Citation `WRichardStevens1992' on page 28 undefined on input lin
> e 174.
> 
> 
> LaTeX Warning: Citation `StewartWeiss2013UNIX' on page 28 undefined on input li
> ne 174.
> 
> pdfTeX warning (ext4): destination with the same identifier (name{quickquizctr.
> 4}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.257 \QuickQuiz{}
>                   
> Overfull \hbox (10.00002pt too wide) in paragraph at lines 309--317
> [][]
>  []
> 
> 
> Underfull \vbox (badness 6001) has occurred while \output is active []
> 
>  [28]pdfTeX warning (ext4): destination with the same identifier (name{quickqui
> zctr.5}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.318 \QuickQuiz{}
>                   
> Underfull \hbox (badness 3229) in paragraph at lines 351--351
> []\T1/ptm/b/n/12 POSIX Thread Cre-ation and De-
>  []
> 
> 
> Underfull \vbox (badness 10000) has occurred while \output is active []
> 
> pdfTeX warning (ext4): destination with the same identifier (name{quickquizctr.
> 6}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.404 \QuickQuiz{}
>                   
> Overfull \hbox (10.00002pt too wide) in paragraph at lines 434--442
> [][]
>  []
> 
> pdfTeX warning (ext4): destination with the same identifier (name{quickquizctr.
> 7}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.453 \QuickQuiz{}
>                    [29]
> Underfull \hbox (badness 7963) in paragraph at lines 486--493
> \T1/ptm/m/n/10 (+20) the spec-i-fied lock, and the []\T1/pcr/m/n/10 _[]_
>  []
> 
> pdfTeX warning (ext4): destination with the same identifier (name{quickquizctr.
> 8}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.494 \QuickQuiz{}
>                   
> Overfull \hbox (3.89609pt too wide) in paragraph at lines 565--565
> []  \T1/pcr/m/n/7 1 pthread_mutex_t lock_a = PTHREAD_MUTEX_INITIALIZER;[] 
>  []
> 
> 
> Overfull \hbox (3.89609pt too wide) in paragraph at lines 565--565
> []  \T1/pcr/m/n/7 2 pthread_mutex_t lock_b = PTHREAD_MUTEX_INITIALIZER;[] 
>  []
> 
> 
> Underfull \hbox (badness 1325) in paragraph at lines 578--584
> []\T1/ptm/m/n/10 (+20) Lines 5-28 de-fines a func-tion []\T1/pcr/m/n/10 _[][]
>  []
> 
> pdfTeX warning (ext4): destination with the same identifier (name{quickquizctr.
> 9}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.585 \QuickQuiz{}
>                   pdfTeX warning (ext4): destination with the same identifier (
> name{quickquizctr.10}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.609 \QuickQuiz{}
>                    [30]
> Overfull \hbox (8.09608pt too wide) in paragraph at lines 656--656
> []  \T1/pcr/m/n/7 1   printf("Creating two threads using same lock:\n");[] 
>  []
> 
> 
> Overfull \hbox (10.00002pt too wide) in paragraph at lines 671--679
> [][]
>  []
> 
> pdfTeX warning (ext4): destination with the same identifier (name{quickquizctr.
> 11}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.684 \QuickQuiz{}
>                   
> Overfull \hbox (16.49608pt too wide) in paragraph at lines 726--726
> []  \T1/pcr/m/n/7 1   printf("Creating two threads w/different locks:\n");[] 
>  []
> 
> 
> Overfull \hbox (10.00002pt too wide) in paragraph at lines 739--750
> [][]
>  []
> 
> 
> Underfull \vbox (badness 3260) has occurred while \output is active []
> 
> pdfTeX warning (ext4): destination with the same identifier (name{quickquizctr.
> 12}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.756 \QuickQuiz{}
>                   pdfTeX warning (ext4): destination with the same identifier (
> name{quickquizctr.13}) has been already used, duplicate ignored
> <to be read again> 
>                    \relax 
> l.775 \QuickQuiz{}
>                   
> Underfull \hbox (badness 10000) in paragraph at lines 815--828
> []\T1/pcr/m/n/10 _[]_[]\T1/ptm/m/n/10 (+20) , []\T1/pcr/m/n/10 _[]_[] \T1/ptm/m
> /n/10 (+20) may
>  []
> 
> 
> Underfull \hbox (badness 10000) in paragraph at lines 815--828
> \T1/ptm/m/n/10 (+20) be stat-i-cally ini-tial-ized via []\T1/pcr/m/n/10 _[]_
>  []
> 
> 
> Underfull \hbox (badness 10000) in paragraph at lines 815--828
> [] \T1/ptm/m/n/10 (+20) or dy-nam-i-cally ini-tial-ized via
>  []
> 
> 
> Underfull \hbox (badness 3219) in paragraph at lines 815--828
> \T1/ptm/m/n/10 (+20) the []\T1/pcr/m/n/10 _[]_[][] \T1/ptm/m/n/10 (+20) prim-i-
> tive. The
>  []
> 
> 
> Underfull \hbox (badness 10000) in paragraph at lines 815--828
> []\T1/pcr/m/n/10 _[]_[][] \T1/ptm/m/n/10 (+20) prim-i-tive read-
>  []
> 
> 
> Underfull \hbox (badness 4168) in paragraph at lines 815--828
> \T1/ptm/m/n/10 (+20) acquires the spec-i-fied []\T1/pcr/m/n/10 _[]_[]\T1/ptm/m/
> n/10 (+20) , the
>  []
> 
> 
> Underfull \hbox (badness 10000) in paragraph at lines 815--828
> []\T1/pcr/m/n/10 _[]_[][] \T1/ptm/m/n/10 (+20) prim-i-tive write-
>  []
> 
> [31]
> Underfull \hbox (badness 5064) in paragraph at lines 908--915
> []\T1/ptm/m/n/10 (+20) Lines 12-41 de-fine [][], which is the
>  []
> 
> 
> Underfull \hbox (badness 1205) in paragraph at lines 908--915
> \T1/ptm/m/n/10 (+20) reader thread. Line 18 atom-i-cally in-cre-ments the
>  []
> 
> <CodeSamples/toolsoftrade/rwlockscale.pdf, id=864, 353.32pt x 394.47375pt>
> File: CodeSamples/toolsoftrade/rwlockscale.pdf Graphic file (type pdf)
> 
> <use CodeSamples/toolsoftrade/rwlockscale.pdf>
> Package pdftex.def Info: CodeSamples/toolsoftrade/rwlockscale.pdf used on input
>  line 994.
> (pdftex.def)             Requested size: 353.31914pt x 394.47278pt.
>  [32]
> 
> LaTeX Warning: Reference `chp:Counting' on page 33 undefined on input line 1117
> .
> 
> 
> LaTeX Warning: Reference `chp:Deferred Processing' on page 33 undefined on inpu
> t line 1117.
> 
> LaTeX Font Info:    Try loading font information for T1+phv on input line 1138.
> 
> (/usr/share/texlive/texmf-dist/tex/latex/psnfss/t1phv.fd
> File: t1phv.fd 2001/06/04 scalable font definitions for T1/phv.
> )
> Package microtype Info: Loading generic settings for font family
> (microtype)             `phv' (encoding: T1).
> (microtype)             For optimal results, create family-specific settings.
> (microtype)             See the microtype manual for details.
> 
> Underfull \hbox (badness 10000) in paragraph at lines 1138--1151
> \T1/pcr/m/n/10 __[]_[]_[]_[][]\T1/ptm/m/n/10 (+20) , \T1/pcr/m/n/10 __[]_[]_
>  []
> 
> 
> Underfull \hbox (badness 6412) in paragraph at lines 1138--1151
> []\T1/pcr/m/n/10 _[][]\T1/ptm/m/n/10 (+20) , \T1/pcr/m/n/10 __[]_[]_[]_[][]\T1/
> ptm/m/n/10 (+20) , and
>  []
> 
> 
> Underfull \hbox (badness 1117) in paragraph at lines 1138--1151
> \T1/ptm/m/n/10 (+20) can in-stead use the \T1/pcr/m/n/10 __[]_[]_[]_[][]\T1/ptm
> /m/n/10 (+20) ,
>  []
> 
> 
> Underfull \hbox (badness 10000) in paragraph at lines 1138--1151
> \T1/pcr/m/n/10 __[]_[]_[]_[][]\T1/ptm/m/n/10 (+20) , \T1/pcr/m/n/10 __[]_[]_
>  []
> 
> 
> Underfull \hbox (badness 10000) in paragraph at lines 1138--1151
> []\T1/pcr/m/n/10 _[][]\T1/ptm/m/n/10 (+20) , \T1/pcr/m/n/10 __[]_[]_[]_[][]\T1/
> ptm/m/n/10 (+20) ,
>  []
> 
> [33 <./CodeSamples/toolsoftrade/rwlockscale.pdf>]
> 
> LaTeX Warning: Citation `MauriceHerlihy90a' on page 34 undefined on input line 
> 1197.
> 
> 
> Underfull \hbox (badness 2443) in paragraph at lines 1180--1198
> []\T1/pcr/m/n/10 _[][] \T1/ptm/m/n/10 (+20) and \T1/pcr/m/n/10 __[]_[]_[]_[]_
>  []
> 
> 
> LaTeX Warning: Reference `sec:advsync:Memory Barriers' on page 34 undefined on 
> input line 1201.
> 
> 
> Overfull \hbox (4.31609pt too wide) in paragraph at lines 1220--1220
> []\T1/pcr/m/n/7 #define barrier() __asm__ __volatile__("": : :"memory")[] 
>  []
> 
> 
> Underfull \hbox (badness 7576) in paragraph at lines 1234--1234
> []\T1/ptm/b/n/14.4 Linux-Kernel Equiv-a-lents to
>  []
> 
> ! Missing { inserted.
> <inserted text> 
>                 {
> l.1246 			&
>             \co{struct task_struct} \\
> ? 
> ! Emergency stop.
> <inserted text> 
>                 {
> l.1246 			&
>             \co{struct task_struct} \\
> End of file on the terminal!
> 
>  
> Here is how much of TeX's memory you used:
>  9728 strings out of 494814
>  150646 string characters out of 6174199
>  256893 words of memory out of 5000000
>  12353 multiletter control sequences out of 15000+600000
>  92251 words of font info for 258 fonts, out of 8000000 for 9000
>  81 hyphenation exceptions out of 8191
>  33i,15n,35p,324b,1121s stack positions out of 5000i,500n,10000p,200000b,80000s
> !  ==> Fatal error occurred, no output PDF file produced!

