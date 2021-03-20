Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:50596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229920AbhCTTDw (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 20 Mar 2021 15:03:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616267032;
        bh=2fqhakcmUOVMFuEXUA2fG5HEvdMBrYT1nyRbQ1UqI8o=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=doKkO0qDv/M3XdWLzPZMlmwSgYuRTsujdYeT5lVlpUqVVyjbAyslwguoyGoFo5RBk
         c5DrPrzXbCczySGkL6Mqd1GmBzX96WWX7Mv9RJECNX5WEqRsYuSDMjhknfwc12A+GJ
         mbWZGw29OOMJiUYZuyMqpdIqqqulgJbAZ+77g4wSSCMYV3SRr3TYq4wrQUSrXo3vZg
         //KQn7kGP6CXC2gKkhCr5XYymo4h+3I4CvzAzTdr9Wl3xW07QttQICvh1VeuP1g/OJ
         2PMH8eALC0pIs8pesaEQF/BXtudQ88wbPIhqhyIXXbO3QjUouLDhgl8wJ85iIkOg3J
         Cg0mfZZSKGc+A==
Date: Sat, 20 Mar 2021 12:03:52 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 2/3 -perfbook] together/refcnt: Adjust tense with 'have
 released'
Message-ID: <20210320190352.GB2696@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <85bad10b-4875-b98f-8c3d-547625460817@gmail.com>
 <8d327ffe-282a-2a04-41e2-ee3ab9bc5ffb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d327ffe-282a-2a04-41e2-ee3ab9bc5ffb@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Mar 21, 2021 at 12:23:13AM +0900, Akira Yokosawa wrote:
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> Paul,
> 
> This is in your recent update.
> The former part of "or" says "both CPUs have released ...", so the
> latter part should say "(both CPUs have) exited ...", I suppose.
> 
> "or have exited" might be the right fix, but it sounds redundant
> to me.  Up to you!

In this case, what you have works fine.  The reason that it works is
because there is only the four words "released their hazard pointers"
between "both CPUs have" and "exited their...".  If there was instead
a long run of text instead of just four words, repeating the "both CPUs
have" would be a good way of helping the reader to make the connection
across that long run of text.

I took all three patches, all good catches!  My eyes apparently are not
as young as they once were, so thank you very much!!!

							Thanx, Paul

>         Thanks, Akira
> --
>  together/refcnt.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/together/refcnt.tex b/together/refcnt.tex
> index 829af167..599ae5f0 100644
> --- a/together/refcnt.tex
> +++ b/together/refcnt.tex
> @@ -257,7 +257,7 @@ and any needed memory barriers or disabling of compiler optimizations
>  will be provided by the hazard-pointers or RCU infrastructure.
>  Therefore, if two CPUs release the final two references concurrently, the
>  actual cleanup will be deferred until both CPUs have released their hazard
> -pointers or exits their RCU read-side critical sections, respectively.
> +pointers or exited their RCU read-side critical sections, respectively.
>  
>  \QuickQuiz{
>  	Why isn't it necessary to guard against cases where one CPU
> -- 
> 2.17.1
> 
> 
