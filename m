Return-Path: <perfbook-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:37340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231718AbhHFRxD (ORCPT <rfc822;perfbook@vger.kernel.org>);
        Fri, 6 Aug 2021 13:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628272367;
        bh=eXprZSwFQbUcKuVjbRKFMSRHRU6VSfDc375SLf9idRU=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=OmTL2u6uSF6rVuO9fwpYF98e5rQbIIpKEmbN2m2mLmIJdSkDP+m5WBlchsZVUmTb9
         ItmXcPZrSzmA+Kf7xYZWFRTEF2XCZiVQNRtRe0mZ3flYWYO1XoHrR4D2/UkBPYltwF
         HEktPbKAQ7429jJVfcp8U1vZXZ96SRhlMjfLM8Ly/yWRRgq1uhfuIDgYCm0vpQWplc
         L8VxiaPaHJQgsCeeyP8LnvIVzB1YO67+AfPkwOVl0QwJh9ZlAjSYO98tykwNgTBgBQ
         P0s49rgQetpP0qDzWp3SQ99y5OxRWxZzh9xqtS1X0wTVLI9iKI+LP88d29+OUCl7l+
         c+nLu6GmO6K6w==
Date: Fri, 6 Aug 2021 10:52:47 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH -perfbook] datastruct: Allow 'breaklines' in
 hash_resize() for ebook-size builds
Message-ID: <20210806175247.GR4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <f04cd86d-59d0-93ea-dfdf-a617dba03950@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f04cd86d-59d0-93ea-dfdf-a617dba03950@gmail.com>
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Balbir Singh <bsingharora@gmail.com>, perfbook@vger.kernel.org

On Fri, Aug 06, 2021 at 11:44:21AM +0900, Akira Yokosawa wrote:
> This code snippet already has the special tabsize of 6 for 1c and 2c builds.
> However, it is too wide for ebook-size builds.
> As a workaround, add "breaklines=true" in the option list and permit folding
> of long lines.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Balbir Singh <bsingharora@gmail.com>

Queued and pushed, thank you!

							Thanx, Paul

> ---
>  CodeSamples/datastruct/hash/hash_resize.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
> index 6e450e3c..d084264f 100644
> --- a/CodeSamples/datastruct/hash/hash_resize.c
> +++ b/CodeSamples/datastruct/hash/hash_resize.c
> @@ -276,7 +276,7 @@ void hashtab_del(struct ht_elem *htep,			//\lnlbl{del:b}
>  }							//\lnlbl{del:e}
>  //\end{snippet}
>  
> -//\begin{snippet}[labelbase=ln:datastruct:hash_resize:resize,commandchars=\\\@\$,tabsize=6]
> +//\begin{snippet}[labelbase=ln:datastruct:hash_resize:resize,commandchars=\\\@\$,tabsize=6,breaklines=true]
>  /* Resize a hash table. */
>  int hashtab_resize(struct hashtab *htp_master,
>                     unsigned long nbuckets,
> -- 
> 2.17.1
> 
> 
