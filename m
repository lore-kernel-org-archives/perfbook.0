Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726731AbgAFBZc (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sun, 5 Jan 2020 20:25:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578273932;
        bh=aOA1fIJXvgf1O9wUIrdThQhGNEajgW649b8aJ/nsCzY=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=JI5w1x6gTZdzDW16DQlkaap6HRd3MNpQHfgyaEypMC+FpNn3Y3o2fnxbphgR4uESi
         0oyQ3jUTCaM426x+9ULfajueeZI1WRenf69W58cZ4qBiWuC71mmLkVlX2es6gJKxiL
         h4U6qQt48SZGQo+C6Kgn79/GSOFwNXSj6ij+emtc=
Date: Sun, 5 Jan 2020 17:25:31 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [RFT PATCH] utilities/toarxiv.sh: Get rid of borders around
 hyperlinks
Message-ID: <20200106012531.GH13449@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <70c586e6-a76d-f107-43be-e2f1ee1fa1c9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70c586e6-a76d-f107-43be-e2f1ee1fa1c9@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jan 05, 2020 at 12:40:50AM +0900, Akira Yokosawa wrote:
> >From 1edf6fb9b98cd74d37a3580f2b482d4d9c0197ad Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sat, 4 Jan 2020 20:15:27 +0900
> Subject: [RFT PATCH] utilities/toarxiv.sh: Get rid of borders around hyperlinks
> 
> Based on a Q&A on StackExchange [1], putting "nohypertex" in
> 00README.XXX looks like the cause of all those ugly borders.
> 
> To override the default behavior of arxiv's hyperref,
> add a boolean "toarxiv" in perfbook.tex and set it "true" in
> toarxiv.sh so that the workaround code added in the preamble
> shall be enabled.
> 
> [1]: https://tex.stackexchange.com/questions/30243/
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Hi Paul,
> 
> I looked at v2019.12.22a on https://arxiv.org/abs/1701.00854 and found that
> some pages in the PDF almost impossible to read because of frequent borders
> around hyperlinks.
> 
> I'm not sure this change in toarxiv.sh and perfbook.tex actually works on
> arxiv.org, but can you try building there and see whether it works or not?

Queued and pushed.  I have started the arxiv.org processing step, but it
usually takes awhile.  ;-)

							Thanx, Paul

>         Thanks, Akira
> -- 
>  perfbook.tex         | 14 +++++++++++++-
>  utilities/toarxiv.sh |  4 ++--
>  2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/perfbook.tex b/perfbook.tex
> index 0fae78fb..db334ae4 100644
> --- a/perfbook.tex
> +++ b/perfbook.tex
> @@ -110,10 +110,12 @@
>  \newboolean{nimbusavail}
>  \setboolean{nimbusavail}{false}
>  \newcommand{\IfNimbusAvail}[2]{\ifthenelse{\boolean{nimbusavail}}{#1}{#2}}
> -
>  \newboolean{colorlinks}
>  \setboolean{colorlinks}{false}
>  \newcommand{\IfColorLinks}[2]{\ifthenelse{\boolean{colorlinks}}{#1}{#2}}
> +\newboolean{toarxiv}
> +\setboolean{toarxiv}{false}
> +\newcommand{\IfToArxiv}[2]{\ifthenelse{\boolean{toarxiv}}{#1}{#2}}
>  
>  \IfTwoColumn{}{
>  \setboolean{colorlinks}{true}
> @@ -123,6 +125,16 @@
>  \hypersetup{colorlinks=true,allcolors=MediumBlue}
>  }{}
>  
> +\IfToArxiv{
> +\hypersetup{
> +    colorlinks=true,
> +    linkcolor=black,
> +    citecolor=black,
> +    filecolor=black,
> +    urlcolor=black,
> +}
> +}{}
> +
>  \IfNimbusAvail{
>  \usepackage{nimbusmononarrow}
>  }{}
> diff --git a/utilities/toarxiv.sh b/utilities/toarxiv.sh
> index 29bce4ea..5e1c6388 100644
> --- a/utilities/toarxiv.sh
> +++ b/utilities/toarxiv.sh
> @@ -79,6 +79,6 @@ rm ${destdir}/SMPdesign/DiningPhilosopher5TB.tex
>  
>  # The following changes work around arxiv.org limitations
>  sed	-e '/usepackage{footnotebackref}/d' \
> -	-e 's/\[bookmarks=true,bookmarksnumbered=true,pdfborder={0 0 0}]/[bookmarks=false]/' \
> +	-e 's/{toarxiv}{false}/{toarxiv}{true}/' \
>  	< perfbook.tex > ${destdir}/perfbook.tex
> -echo "nohypertex" > ${destdir}/00README.XXX
> +# echo "nohypertex" > ${destdir}/00README.XXX
> -- 
> 2.24.1
> 
