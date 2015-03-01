Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e39.co.us.ibm.com ([32.97.110.160]:46186 "EHLO
 e39.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752714AbbCARui (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 1 Mar 2015
 12:50:38 -0500
Received: from /spool/local	by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 1 Mar 2015
 10:50:37 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])	by d03dlp02.boulder.ibm.com
 (Postfix) with ESMTP id AEDD83E4003B	for <perfbook@vger.kernel.org>; Sun, 1
 Mar 2015 10:50:34 -0700 (MST)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t21HonnB42533106	for <perfbook@vger.kernel.org>; Sun, 1 Mar 2015 10:50:49
 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t21HoYnJ015725	for <perfbook@vger.kernel.org>; Sun, 1 Mar 2015 10:50:34 -0700
Date: Sun, 1 Mar 2015 09:50:32 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Cannot build perfbook
Message-ID: <20150301175032.GN15405@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <20150301100726.GA15534@rotes76.wohnheim.uni-kl.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150301100726.GA15534@rotes76.wohnheim.uni-kl.de>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Eduard Bloch <edi@gmx.de>
Cc: perfbook@vger.kernel.org

On Sun, Mar 01, 2015 at 11:07:26AM +0100, Eduard Bloch wrote:
> Hello,
> 
> FYI, I tried to compile your perfbook but it looks like something in the
> process breaks and I cannot figure out what (yet). I am running it on a
> Debian Sid system with a regular Tex installation. Tex (pdflatex,
> bibtex, etc.) itself does work... (I tested this with my build my old
> Diploma Thesis booklet, it's fine).
> 
> Log file attached, maybe you have seen this before?
> 
> The last file mentioned there,
> ./CodeSamples/toolsoftrade/rwlockscale.pdf , also looks ok.

Hello, Eduard,

Copying the perfbook email list in case someone has successfully built
it on recent Debian Sid.  The attached file ends with:

------------------------------------------------------------------------
Package hyperref Info: Option `bookmarks' set `true' on input line 4319.
Package hyperref Info: Option `bookmarksnumbered' set `true' on input line 4319
------------------------------------------------------------------------

Did it possibly get truncated?

If so, could you please send me the last (say) fifty lines?  If they
look something like this:

------------------------------------------------------------------------
Underfull \hbox (badness 7576) in paragraph at lines 1234--1234
[]\T1/ptm/b/n/14.4 Linux-Kernel Equiv-a-lents to
 []

! Missing { inserted.
<inserted text> 
                {
l.1246                        &
            \co{struct task_struct} \\
? 
! Emergency stop.
<inserted text> 
                {
l.1246                        &
            \co{struct task_struct} \\
End of file on the terminal!
------------------------------------------------------------------------

Then a fix that Borislav Petkov came up with should help:

------------------------------------------------------------------------
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
------------------------------------------------------------------------

Otherwise, let's see what you have!

							Thanx, Paul

> Regards,
> Eduard.

> This is pdfTeX, Version 3.14159265-2.6-1.40.15 (TeX Live 2015/dev/Debian) (preloaded format=pdflatex 2015.1.19)  1 MAR 2015 10:39
> entering extended mode
>  restricted \write18 enabled.
>  %&-line parsing enabled.
> **perfbook
> (./perfbook.tex
> LaTeX2e <2014/05/01>
> Babel <3.9l> and hyphenation patterns for 4 languages loaded.
> (/usr/share/texlive/texmf-dist/tex/latex/base/book.cls
> Document Class: book 2014/09/29 v1.4h Standard LaTeX document class
> (/usr/share/texlive/texmf-dist/tex/latex/base/bk10.clo
> File: bk10.clo 2014/09/29 v1.4h Standard LaTeX file (size option)
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
> Package: keyval 2014/05/08 v1.15 key=value parser (DPC)
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
> Package: graphicx 2014/04/25 v1.0g Enhanced LaTeX Graphics (DPC,SPQR)
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
> Package: enumerate 2014/10/28 v3.00 enumerate extensions (DPC)
> \@enLab=\toks16
> )
> (/usr/share/texlive/texmf-dist/tex/latex/base/ifthen.sty
> Package: ifthen 2014/09/29 v1.1c Standard LaTeX ifthen package (DPC)
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
> File: lstmisc.sty 2014/09/06 1.5e (Carsten Heinz)
> \c@lstnumber=\count101
> \lst@skipnumbers=\count102
> \lst@framebox=\box27
> )
> (/usr/share/texlive/texmf-dist/tex/latex/listings/listings.cfg
> File: listings.cfg 2014/09/06 1.5e listings configuration
> ))
> Package: listings 2014/09/06 1.5e (Carsten Heinz)
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

