Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43794 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S932419AbeCLCJI (ORCPT <rfc822;perfbook@vger.kernel.org>); Sun, 11
 Mar 2018 22:09:08 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w2C28mB0119759
 for <perfbook@vger.kernel.org>; Sun, 11 Mar 2018 22:09:08 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 2gneqatsf0-1 (version=TLSv1.2
 cipher=AES256-SHA256 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Sun, 11 Mar 2018 22:09:08 -0400
Received: from localhost by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 11 Mar
 2018 22:09:07 -0400
Date: Sun, 11 Mar 2018 19:09:43 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] Add poor person's slanted shape for 'newtxtext' font
Reply-To: paulmck@linux.vnet.ibm.com
References: <bfc8d604-9405-2f70-93e0-2b5db0335e71@gmail.com>
 <bcb7cf66-dcf5-ac42-33a4-c8ad7f1e43ae@gmail.com>
 <4c0f88de-015a-1544-a0c6-7d0df9bc3e70@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c0f88de-015a-1544-a0c6-7d0df9bc3e70@gmail.com>
Message-Id: <20180312020943.GO3918@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Mar 11, 2018 at 12:24:58PM +0900, Akira Yokosawa wrote:
> >From 12a6abc21cd570f4fcf371d79d983f43d673b67d Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 11 Mar 2018 07:49:24 +0900
> Subject: [PATCH v2] Add poor person's slanted shape for 'newtxtext' font
> 
> The "newtx" font package switched to TeX Gyre Termes fonts in
> version 1.4 (released in TeX Live 2014). It lacks slanted shape.
> 
> In perfbook, slanted shape is not used in LaTeX sources at the
> moment, but is used in page headers generated in the "book" document
> class.
> 
> The change of Times Roman clone font to "newtxtext" font made in
> commit b4ad25eae241 ("future/QC: Use upright glyph for math constant
> and descriptive suffix") had a side-effect of page headers to
> be rendered in italic font when TeX Live 2014 or later is used.
> Most notably, chapter/section numbers in page headers are rendered
> upright.
> 
> This commit adds poor person's slanted shapes for roman fonts
> as suggested in https://tex.stackexchange.com/questions/247539/.
> 
> This change doesn't have visual effect on TeX Live 2013.
> 
> Fixes: b4ad25eae241 ("future/QC: Use upright glyph for math constant and descriptive suffix")
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Applied, thank you!

							Thanx, Paul

> ---
> Change in v2:
> 
>  Moved the definitions into the "else" clause of \IfSansSerif to avoid
>  conflict with the up-to-date version of "newtxsf" math font package in
>  target "1csf".
> 
> NOTE 1: Target "1csf" does not affected by the lack of slanted shape in
> roman font.
> 
> NOTE 2: Target "1csf" doesn't build on TeX Live 2013.
> "newtxsf" on TeX Live 2015/debian or Tex Live 2016 on Fedora 26/27 does
> not conflict in v1 of this patch.
> You may need to install newtxsf v1.05 [1] to see the conflict and
> the resolution in v2.
> 
> [1]: https://www.ctan.org/pkg/newtxsf
> 
>     Thanks, Akira
> --
>  perfbook.tex | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/perfbook.tex b/perfbook.tex
> index efb6750..fe9421e 100644
> --- a/perfbook.tex
> +++ b/perfbook.tex
> @@ -95,6 +95,12 @@
>  \usepackage[slantedGreek,scaled=.96]{newtxsf}
>  }{
>  \usepackage[slantedGreek]{newtxmath} % math package to be used with newtxtext
> +% Poor person's slanted shape for roman --- newtxtext lacks slanted shape
> +\AtBeginDocument{%
> +  \DeclareFontShape{\encodingdefault}{\rmdefault}{m}{sl}{<-> ptmro7t}{}%
> +  \DeclareFontShape{\encodingdefault}{\rmdefault}{b}{sl}{<-> ptmbo7t}{}%
> +  \DeclareFontShape{\encodingdefault}{\rmdefault}{bx}{sl}{<->ssub * ptm/b/sl}{}%
> +}
>  }
> 
>  \newcommand{\LstLineNo}{\makebox[5ex][r]{\arabic{VerbboxLineNo}\hspace{2ex}}}
> -- 
> 2.7.4
> 
> 

