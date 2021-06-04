Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229704AbhFDDPc (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Thu, 3 Jun 2021 23:15:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622776427;
        bh=ZAUGLwRLO3xWBZkI0AjzYDiTNl2D2gtX9hsbE2e7Wp4=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=RtbBB3F3Qno2CJYH+5s/VxaDBe+DxmgUBRn0PgBOBy8g6iz2+Q5hda0M1RjR1jRZK
         SUuWm45uEa29Y6FNgCHNI1p4/yCBfGckZDDw/Y9Qc5XQnLYIAexY/FXGGftI3lkVcU
         +7THw8CdFrjqOvsb4tj8oc7qPrbVWku9sK0Ks2HBmYI9fqlsKva4jbCCEV1ZGLUONd
         0GDzr1Dn7svKP2Uo0R7EQyAWRC4cZT508HR0d/ROKMdEeL8JpyQ7LTkaMHtOPLKtDA
         a3oStpKOuQ7Ik1+lWuMp1Swy7Dt65n45UD7/FYP/Hb+gcDQnstM0MO4jvdbZkzYC+Z
         4RDkWvzHq2B/w==
Date: Thu, 3 Jun 2021 20:13:47 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] FAQ-BUILD: Remove items of obsolete issues on
 Fedora
Message-ID: <20210604031347.GT4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <4d932040-16ac-74b3-688b-9a40721525b5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d932040-16ac-74b3-688b-9a40721525b5@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Fri, Jun 04, 2021 at 11:59:22AM +0900, Akira Yokosawa wrote:
> Also indent answer to (now) #12 in the same manner as the other
> answers.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  FAQ-BUILD.txt | 47 ++++++++---------------------------------------
>  1 file changed, 8 insertions(+), 39 deletions(-)
> 
> diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
> index 3672d4f2..80b71c42 100644
> --- a/FAQ-BUILD.txt
> +++ b/FAQ-BUILD.txt
> @@ -38,7 +38,7 @@
>  	A.	The "pdflatex" package is a variant of Don Knuth's
>  		digital typesetting program, which you can install.
>  		Alternatively, you can use the container image described
> -		in #14 below.  Otherwise, instructions follow.
> +		in #13 below.  Otherwise, instructions follow.
>  
>  		On Ubuntu Bionic and Focal, the following list should cover
>  		necessary packages (except for -doc packages):
> @@ -240,47 +240,16 @@
>  		Please make sure to revert the changes before doing
>  		"git commit" of the other updates you've made.
>  
> -12.	Figures of gnuplot in perfbook I built have their upper end
> -	trimmed.  What am I missing?
> -
> -	A.	This is a known issue on Fedora as of November 2, 2019.
> -		Its Ghostscript (9.27) has regression in bounding box
> -		calculation. It has been fixed since in the upstream
> -		Ghostscript.
> -
> -		    https://bugs.ghostscript.com/show_bug.cgi?id=700988
> -
> -		Installing upstream Ghostscript 9.50 (or later) should
> -		work with you, but see #7 above to get a compatible a2ping.
> -
> -		"make neatfreak; make" will rebuild all the figures.
> -		The "-jN" option should accelerate the rebuild.
> -
> -	    Note:
> -		Fedora 32 has a fixed version of Ghostscript (9.52).
> -
> -13.	After updating or installing texlive packages on Fedora,
> -	build fails with the message from bibtex saying:
> -
> -		I found no \bibdata command---while reading file perfbook.aux
> -		I found no \bibstyle command---while reading file perfbook.aux
> -
> -	Is there any workaround?
> -
> -	A.	Try rebuilding database files by the following commands:
> -
> -		    sudo updmap-sys --syncwithtrees --force
> -		    sudo updmap-sys
> -
> -14.	After upgrading the userspace RCU library, and all of the code
> +12.	After upgrading the userspace RCU library, and all of the code
>  	samples making use of that library are now broken.
>  
> -	The userspace RCU library sometimes breaks ABI, which requires
> -	that the binaries dynamically linking to it be rebuilt.
> -	Try removing the old binaries ("make clean") and then rebuilding
> -	("make").
> +	A.	The userspace RCU library sometimes breaks ABI, which
> +		requires that the binaries dynamically linking to it be
> +		rebuilt.
> +		Try removing the old binaries ("make clean") and then
> +		rebuilding ("make").
>  
> -15.	I want a stable environment to build perfbook.pdf.
> +13.	I want a stable environment to build perfbook.pdf.
>  	Can't I just use some container image?
>  
>  	A.	You can find a template Dockerfile under the docker/
> -- 
> 2.17.1
> 
