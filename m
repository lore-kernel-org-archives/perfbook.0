Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729072AbhASXf7 (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Tue, 19 Jan 2021 18:35:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611099316;
        bh=hORUHyTwCm+P0NNgvqMvaYtyTEaLccZFBOY8aV5SCH8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ZX5Q6BqFbhtQaNa2o/1aBRGhyAMM0035W5NKwhwdTDIb26NEQ3lcw2Tclpscy5apb
         OoOH5jU31y3shUdAtyycS+Y6iHjxiwZ9nQKCrrF/2nTEZus5MTQ/rVWGZykuPu9pei
         AK/K9uBrEwaKL3r30EhJQxZQcHyJaR9KkicbIyzW7q50J6NWtYKMIO1LhnYZH6EO52
         9Kl3SnbSjTNIC8QNBGYK9yerZGkkILTN8zWkmMJF0ZLntMgPH01m4+GbWoeRZ0/2Eb
         kSfPOMTA/blkNuAWaobqMpAaTd1hHxWAhgslNPRzS3g+IHEL8WEAJgi0oDGv1mu7EJ
         7GW3ScKstgKOA==
Date: Tue, 19 Jan 2021 15:35:15 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] formal: Update Figure 12.4 (refscale.c as test
 code)
Message-ID: <20210119233515.GA2743@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <9ba078ef-0cc4-7d83-acc8-c4ae8a807bff@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ba078ef-0cc4-7d83-acc8-c4ae8a807bff@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Jan 20, 2021 at 07:45:27AM +0900, Akira Yokosawa wrote:
> Update the data and plot based on rcutorture.sh of commit
> 1e0319874e40 ("formal: Make rcutorture.sh account for refperf->refscale").
> 
> Note that rcu-test.dat is manually edited to replace Linux version
> strings with empty ones to put labels (mostly) every four releases
> in the plot.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  formal/RCU-test-ratio.eps | 36 ++++++++++++++++++------------------
>  formal/data/rcu-test.dat  |  4 ++--
>  2 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/formal/RCU-test-ratio.eps b/formal/RCU-test-ratio.eps
> index 0825615f..8e2b676f 100644
> --- a/formal/RCU-test-ratio.eps
> +++ b/formal/RCU-test-ratio.eps
> @@ -1,7 +1,7 @@
>  %!PS-Adobe-2.0
>  %%Title: RCU-test-ratio.eps
>  %%Creator: gnuplot 5.2 patchlevel 2
> -%%CreationDate: Sun Jan 17 22:07:18 2021
> +%%CreationDate: Wed Jan 20 07:13:31 2021
>  %%DocumentFonts: (atend)
>  %%BoundingBox: 50 50 453 230
>  %%Orientation: Portrait
> @@ -1872,7 +1872,7 @@ SDict begin [
>    /Creator (gnuplot 5.2 patchlevel 2)
>  %  /Producer (gnuplot)
>  %  /Keywords ()
> -  /CreationDate (Sun Jan 17 22:07:18 2021)
> +  /CreationDate (Wed Jan 20 07:13:31 2021)
>    /DOCINFO pdfmark
>  end
>  } ifelse
> @@ -3311,22 +3311,22 @@ LCb setrgbcolor
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.200 3418 512 27 742 BoxColFill
> +0.00 0.00 0.00 C 0.200 3418 512 27 713 BoxColFill
>  LCb setrgbcolor
>  3418 512 N
> -0 741 V
> +0 712 V
>  26 0 V
> -0 -741 V
> +0 -712 V
>  -26 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.00 0.00 0.00 C 0.200 3455 512 26 749 BoxColFill
> +0.00 0.00 0.00 C 0.200 3455 512 26 720 BoxColFill
>  LCb setrgbcolor
>  3455 512 N
> -0 748 V
> +0 719 V
>  25 0 V
> -0 -748 V
> +0 -719 V
>  -25 0 V
>  Z stroke
>  1.000 UL
> @@ -4125,22 +4125,22 @@ LCb setrgbcolor
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.200 3418 1253 27 285 BoxColFill
> +0.90 0.62 0.00 C 0.200 3418 1224 27 314 BoxColFill
>  LCb setrgbcolor
> -3418 1253 N
> -0 284 V
> +3418 1224 N
> +0 313 V
>  26 0 V
> -0 -284 V
> +0 -313 V
>  -26 0 V
>  Z stroke
>  1.000 UL
>  LTb
> -0.90 0.62 0.00 C 0.200 3455 1260 26 291 BoxColFill
> +0.90 0.62 0.00 C 0.200 3455 1231 26 320 BoxColFill
>  LCb setrgbcolor
> -3455 1260 N
> -0 290 V
> +3455 1231 N
> +0 319 V
>  25 0 V
> -0 -290 V
> +0 -319 V
>  -25 0 V
>  Z stroke
>  1.000 UL
> @@ -4235,8 +4235,8 @@ LTb
>  37 5 V
>  36 -2 V
>  37 -29 V
> -36 2 V
> -37 5 V
> +36 72 V
> +37 3 V
>  % End plot #3
>  stroke
>  2.000 UL
> diff --git a/formal/data/rcu-test.dat b/formal/data/rcu-test.dat
> index 3419fd65..4bd65599 100644
> --- a/formal/data/rcu-test.dat
> +++ b/formal/data/rcu-test.dat
> @@ -76,5 +76,5 @@ v5.4  15379 6209 21588 28.8
>  ""    15675 6373 22048 28.9
>  ""    15986 6455 22441 28.8
>  v5.8  17424 6627 24051 27.6
> -""    18395 7062 25457 27.7
> -v5.10 18582 7197 25779 27.9
> +""    17678 7779 25457 30.6
> +v5.10 17863 7916 25779 30.7
> -- 
> 2.17.1
> 
