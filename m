Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:48710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725834AbfLHBOw (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 7 Dec 2019 20:14:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575767691;
        bh=D4K+RpANgRkzW+Ix1jNLx/Oogs7V9HPjJZmDk1uNVlk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Fv0JXUqYameg9sxhGN0T0J/Vnh3FTOROh63uQDu3UdNHm64f1mw/qXPujmXoIky9Z
         JdgZZK9q5ydNjDgA4Pb4SW7gkvp3kplq+9BNoQpJPTCuiUVhYUpC07WtVCblTgWt4O
         ACyOACdj9B/KcGgJ7k8kHNkURgCV83E3zJDCHWj0=
Date: Sat, 7 Dec 2019 17:14:51 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] advsync: Get rid of ACCESS_ONCE()
Message-ID: <20191208011451.GS2889@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <826d9e91-0e6a-e498-b041-6eedf39a3404@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <826d9e91-0e6a-e498-b041-6eedf39a3404@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Dec 08, 2019 at 08:43:54AM +0900, Akira Yokosawa wrote:
> >From 77ced05dd5df0aa61358643ae359e8afb5e731fc Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Sun, 8 Dec 2019 07:15:54 +0900
> Subject: [PATCH] advsync: Get rid of ACCESS_ONCE()
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Queued and pushed, good catch, thank you!

							Thanx, Paul

> ---
>  advsync/advsync.tex | 2 +-
>  advsync/rt.tex      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/advsync/advsync.tex b/advsync/advsync.tex
> index ee99ec87..d860d2db 100644
> --- a/advsync/advsync.tex
> +++ b/advsync/advsync.tex
> @@ -181,7 +181,7 @@ The linearizability criterion for NBS algorithms requires that reads from
>  and updates to the array either use atomic instructions or be accompanied
>  by memory barriers, but in the not-uncommon case where linearizability
>  is not important, simple volatile loads and stores suffice, for example,
> -using \co{ACCESS_ONCE()}.
> +using \co{READ_ONCE()} and \co{WRITE_ONCE()}.
>  
>  An NBS set may also be implemented using a bitmap, where each value that
>  might be a member of the set corresponds to one bit.
> diff --git a/advsync/rt.tex b/advsync/rt.tex
> index e5ec1bd9..a92b83d0 100644
> --- a/advsync/rt.tex
> +++ b/advsync/rt.tex
> @@ -1174,7 +1174,7 @@ void __rcu_read_unlock(void)		        \lnlbl[unl:b]
>  		barrier();			\lnlbl[unl:bar1]
>  		t->rcu_read_lock_nesting = INT_MIN;  \lnlbl[unl:neg]
>  		barrier();			\lnlbl[unl:bar2]
> -		if (ACCESS_ONCE(t->rcu_read_unlock_special.s)) \lnlbl[unl:chks]
> +		if (READ_ONCE(t->rcu_read_unlock_special.s)) \lnlbl[unl:chks]
>  			rcu_read_unlock_special(t);  \lnlbl[unl:unls]
>  		barrier();			\lnlbl[unl:bar3]
>  		t->rcu_read_lock_nesting = 0;	\lnlbl[unl:zero]
> -- 
> 2.17.1
> 
