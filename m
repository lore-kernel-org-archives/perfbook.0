Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1761511AbgJXP2M (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 24 Oct 2020 11:28:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603553292;
        bh=/BpnP4Is+U8kIfb3PHnFQqUD5vhYQItYEwPNT03hcoo=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=vFDWAY2myRzg7qS0+iwujkMrunzJIJCBDFESVMFG8QprCe4U5+YykCULbDawkY0hc
         eqpPDJvL2/xw5mvllms0Rg9SeF2odbR72puzzFZgKqsd8l3eZ3tbOv7O8SPqtYA49D
         m2NLKbej8HMtyuj6L7VEPGG/PXCR0vVgkOekmeio=
Date: Sat, 24 Oct 2020 08:28:11 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH perfbook] utilities/autodate.sh: Make newer tcolorbox
 behave as before
Message-ID: <20201024152811.GS3249@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <b120d0b6-0c03-f1c6-7e2e-bea2e28227ce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b120d0b6-0c03-f1c6-7e2e-bea2e28227ce@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Oct 24, 2020 at 08:39:18PM +0900, Akira Yokosawa wrote:
> Date: Sun, 4 Oct 2020 18:57:55 +0900
> Subject: [PATCH perfbook] utilities/autodate.sh: Make newer tcolorbox behave as before
> 
> tcolorbox 4.40 or later has wider skips around its boxes by default.
> 
> Putting \tcbsetforeverylayer{autoparskip} in preamble restores the
> previous default behavior [1].
> 
> It needs to be put conditionally because the command changes older
> tcolorbox's behavior.
> 
> We use a lot of booleans for conditional things in perfbook, but
> their values are changed based on targets such as -1c, -nq, -qq, etc.
> However, version of tcolorbox is common to all the targets.
> We need a different way to put the \tcbsetforeverylayer{} command.
> 
> As autodate.tex is included in the preamble of perfbook, we can do
> this by adding some script in autodate.sh, which will generate the
> command when a newer tcolorbox is found.
> 
> Also update Makefile to let autodate.tex depend on autodate.sh.
> 
> [1]: https://www.ctan.org/ctan-ann/id/mailman.3088.1601153860.2548.ctan-ann@ctan.org
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> I have kept this one on hold for a couple of weeks.
> perfbook can be built without this change, but the wider skips
> around Quick Quizzes looked waste of space for me.
> 
> This change actually restores the exact behavior of older tcolorbox.

Queued and pushed, thank you!!!

No difference at this end, but that is to be expected, given that my
setup still uses an older version of tcolorbox.  ;-)

							Thanx, Paul

>         Thanks, Akira
> --
>  Makefile              |  2 +-
>  utilities/autodate.sh | 10 ++++++++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index a3f98442..73b5767e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -204,7 +204,7 @@ ifeq ($(NEWTXTEXT),)
>  endif
>  	sh utilities/runfirstlatex.sh $(basename $@)
>  
> -autodate.tex: perfbook-lt.tex $(LATEXSOURCES) $(BIBSOURCES) $(SVGSOURCES) $(FIGSOURCES) $(DOTSOURCES) $(EPSORIGIN) $(SOURCES_OF_SNIPPET) $(GITREFSTAGS) utilities/fcvextract.pl
> +autodate.tex: perfbook-lt.tex $(LATEXSOURCES) $(BIBSOURCES) $(SVGSOURCES) $(FIGSOURCES) $(DOTSOURCES) $(EPSORIGIN) $(SOURCES_OF_SNIPPET) $(GITREFSTAGS) utilities/fcvextract.pl utilities/autodate.sh
>  	sh utilities/autodate.sh >autodate.tex
>  
>  perfbook_flat.tex: autodate.tex $(PDFTARGETS_OF_EPS) $(PDFTARGETS_OF_SVG) $(FCVSNIPPETS) $(FCVSNIPPETS_VIA_LTMS)
> diff --git a/utilities/autodate.sh b/utilities/autodate.sh
> index 2b76d33b..7bd7cbb8 100644
> --- a/utilities/autodate.sh
> +++ b/utilities/autodate.sh
> @@ -94,3 +94,13 @@ env printf '\\date{%s %s, %s %s %s}\n' $month $day $year "$release" $modified
>  env printf '\\newcommand{\\commityear}{%s}\n' $year
>  env printf '\\newcommand{\\commitid}{%s}\n' $commitid$modified
>  env printf '\\IfQqzBg{}{\\setboolean{qqzbg}{%s}}\n' $qqzbg
> +
> +# command for newer tcolorbox (4.40 or later) to have backward-compatible skips
> +tcolorbox_sty=`kpsewhich tcolorbox.sty`
> +tcbversion=`grep ProvidesPackage $tcolorbox_sty | sed -e 's/.*version \([0-9]\+\.[0-9]\+\).*/\1/g'`
> +tcbold=4.39
> +env printf '%% tcolorbox version: %s\n' $tcbversion
> +if [ $(echo $tcbversion $tcbold | awk '{if ($1 > $2) print 1;}') ] ;
> +then
> +	env printf '\\tcbsetforeverylayer{autoparskip}\n';
> +fi
> -- 
> 2.17.1
> 
