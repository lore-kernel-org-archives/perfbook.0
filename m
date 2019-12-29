Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726187AbfL2BwI (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Sat, 28 Dec 2019 20:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577584328;
        bh=K3V6zJf7wrZ0wa2jLR38FfaoFWljf4m4CYtNksPUfsQ=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=vT3kMf4mWRiyRph1TrhXBLVSpeKOi5iI30i7WHKBrsLFVhIlPlBHqDBHifDoH2TTi
         UlKAz6TVX++PmUtpjbl9XO7J/EsJY6/ZlQQyd6+Yhj84rYgXJgqn33YduR0M6/+R67
         VbvLkA3Lwp1qwF0jXc9YWz9SjaOf6gWtFBU+mXfU=
Date: Sat, 28 Dec 2019 17:52:08 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH 0/2] appendix/questions: Updates in ordering
Message-ID: <20191229015208.GQ13449@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <64715baf-7214-037d-ab82-324683ba2dbf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64715baf-7214-037d-ab82-324683ba2dbf@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Dec 29, 2019 at 08:30:54AM +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This patch set is mostly to educate you on the the way to use \cref{}
> \Cref{}.
> 
> In the current setting of the cleveref package, there is no difference
> whichever you use. But it is possible to make \cref{} to generate
> e.g. "Sec. n.m" instead of "Section. n.m" to save some space.
> They say abbreviation in the beginning of a sentence should be
> avoided.
> 
> Such an attempt should wait until the time we finish the conversion
> to the cleveref style cross-references.

Got it, thank you!  \Cref{} only at the start of a sentence, then.
I applied and pushed both of them, thank you!

							Thanx, Paul

>         Thanks, Akira
> --
> Akira Yokosawa (2):
>   appendix/questions: Fix 'cleveref' macro usage in ordering section
>   appendix/questions: Use nbsp in 'value n'
> 
>  appendix/questions/ordering.tex | 39 ++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 20 deletions(-)
> 
> -- 
> 2.17.1
