Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e19.ny.us.ibm.com ([129.33.205.209]:54513 "EHLO
 e19.ny.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S932202AbcESTqs (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 19 May 2016
 15:46:48 -0400
Received: from localhost	by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Thu, 19 May
 2016 15:46:47 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 186836E804A
 for <perfbook@vger.kernel.org>; Thu, 19 May 2016 15:46:29 -0400 (EDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4JJkjij39714866	for <perfbook@vger.kernel.org>; Thu, 19 May 2016 19:46:45
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4JJkjMW015300	for <perfbook@vger.kernel.org>; Thu, 19 May 2016 15:46:45
 -0400
Date: Thu, 19 May 2016 12:46:51 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Improve messages regarding font installation
Message-ID: <20160519194651.GV3528@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <0b0668b6-76b8-2490-9777-1e0aa0e10280@gmail.com>
 <09228564-927a-0300-9f7c-7c86915092c0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09228564-927a-0300-9f7c-7c86915092c0@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, May 20, 2016 at 12:06:58AM +0900, Akira Yokosawa wrote:
> >From 42dc2a0371d48c0b23f4ed70d556ef15213b5f69 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Thu, 19 May 2016 23:34:27 +0900
> Subject: [PATCH] Improve messages regarding font installation
> 
> In commit d8318d8db866 ("Add font installation check"), there was
> typos already fixed by commit adc5a0ed9702 ("Fix typo "baloon" ->
> "balloon"").
> However, it breaks adjustment of "##" characters in the warning
> messages.
> This commit fixes them.
> It also improves explanation of item 1 in FAQ-BUILD.txt by adding
> a reference to item 1 of FAQ.txt.
> It also adds a comment in Figure 1.1 that refers to item 1 in
> FAQ.txt
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued, thank you!

BTW, I am still getting this:

#######################################################################
## Steel City Comic font is not found in the resulting PDF!          ##
## Some speech balloons in the cartoons have been rendered awkwardly.##
## See item 1 in FAQ-BUILD.txt for the solution.                     ##
#######################################################################

I do have some fonts installed:

$ fc-list | grep steel
/usr/share/fonts/truetype/steel-city-comic.regular.ttf: Steel City Comic:style=Regular,Normal,obyčejné,Standard,Κανονικά,Normaali,Normál,Normale,Standaard,Normalny,Обычный,Normálne,Navadno,Arrunta

This is from steel-city-comic.regular.ttf.  Is there something more that
I need?  (I do plead much ignorance on fonts.)

							Thanx, Paul

> ---
>  FAQ-BUILD.txt         | 6 +++---
>  howto/howto.tex       | 9 +++++----
>  utilities/eps2pdf.sh  | 2 +-
>  utilities/runlatex.sh | 2 +-
>  4 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
> index d963534..e888725 100644
> --- a/FAQ-BUILD.txt
> +++ b/FAQ-BUILD.txt
> @@ -1,6 +1,6 @@
> -1.	I have installed the Steel City Comic font, and rebuilt
> -	"perfbook.pdf".  But it doesn't seem to have any effect.
> -	What am I missing?
> +1.	I have installed the Steel City Comic font referring to item 1
> +	in FAQ.txt, and rebuilt "perfbook.pdf". But it doesn't seem to
> +	have any effect. What am I missing?
> 
>  	A.	If you built "perfbook.pdf" before installing the font,
>  		you need to rebuild cartoons whose sources are .svg
> diff --git a/howto/howto.tex b/howto/howto.tex
> index 6980114..7a70bb4 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -354,10 +354,11 @@ Other types of systems have well-known ways of locating files by filename.
>  \begin{verbatim}
>    1 git clone git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git
>    2 cd perfbook
> -  3 make
> -  4 evince perfbook.pdf & # Two-column version
> -  5 make perfbook-1c.pdf
> -  6 evince perfbook-1c.pdf & # One-column version for e-readers
> +  3 # You may need to install a font here. See item 1 in FAQ.txt.
> +  4 make
> +  5 evince perfbook.pdf & # Two-column version
> +  6 make perfbook-1c.pdf
> +  7 evince perfbook-1c.pdf & # One-column version for e-readers
>  \end{verbatim}
>  }
>  \caption{Creating an Up-To-Date PDF}
> diff --git a/utilities/eps2pdf.sh b/utilities/eps2pdf.sh
> index 1497bdd..0a82d57 100644
> --- a/utilities/eps2pdf.sh
> +++ b/utilities/eps2pdf.sh
> @@ -24,7 +24,7 @@ if ! fc-list | grep -q steel
>  then
>  	echo "#######################################################################"
>  	echo "## Steel City Comic font is not found in the font cache!             ##"
> -	echo "## Some speech balloons in the cartoons would be rendered awkwardly.  ##"
> +	echo "## Some speech balloons in the cartoons would be rendered awkwardly. ##"
>  	echo "## See item 1 in FAQ.txt for how to install the font.                ##"
>  	echo "## Nevertheless, this build will resume in a short while.            ##"
>  	echo "#######################################################################"
> diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
> index 9ae9021..94d46d6 100644
> --- a/utilities/runlatex.sh
> +++ b/utilities/runlatex.sh
> @@ -117,7 +117,7 @@ if ! grep -q -i "steel city comic" cartoons/*.pdf
>  then
>  	echo "#######################################################################"
>  	echo "## Steel City Comic font is not found in the resulting PDF!          ##"
> -	echo "## Some speech balloons in the cartoons have been rendered awkwardly. ##"
> +	echo "## Some speech balloons in the cartoons have been rendered awkwardly.##"
>  	echo "## See item 1 in FAQ-BUILD.txt for the solution.                     ##"
>  	echo "#######################################################################"
>  fi
> -- 
> 1.9.1
> 

