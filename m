Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=GJQuWyHyUQACDDActRJKRi9TEZQDpxzxB6Exp1pDOcQ=;
 b=qglWhCIFbyJ7GTM2b0GAtcuTWbZqNX/7ZFvFkd2gOg9Y7N7hx03DHdhGQVpYnwiTU6
 /RR31wEHd9ZqsxTvITpD42arV4/6zEfQY0qHQkLlfA/KOCXZ0WRO0rvGINZDR7zvKMqy
 PCCJFze454DUqlc/B0miTGdz9R7gt1nKFq8XwsJIOo8JtN3ueCZVMkZWQcNicf0S+ukL
 oiS1RKZflZK0Z2V4RiQfVhoWL/2kJOBN5IaQ6Fg5mz8v9aBL055sPoeocrZsTe+l2jYg
 MrxE+UPSDyB8ODbVx/mvfgc7THzCchPozPjWx5g4zvpI7+RB2Di7aPIHImOgkqUhCeAp
 tQTQ==
From: SeongJae Park <sj38.park@gmail.com>
Date: Sat, 9 Apr 2016 14:46:15 +0900 (KST)
Subject: Re: [PATCH] advsync: Another fix to use latex reference feature
 consistently
In-Reply-To: <57087D07.6030207@gmail.com>
Message-ID: <alpine.DEB.2.10.1604091434270.32362@hxeon>
References: <57087D07.6030207@gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@linux.vnet.ibm.com, sj38.park@gmail.com, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hello,

The patch looks good to me.  Just FYI, however, I think it would be
better to use `git format-patch` for patch creation because a patch that
made with the command can be merged in git repository more easily.

Acked-by: SeongJae Park <sj38.park@gmail.com>

On Sat, 9 Apr 2016, Akira Yokosawa wrote:

> Hello,
>
> This is the first time I submit a patch.
> I'm not sure the format below is acceptable or not, but just trying.
> If there is any issue, please advise me.
>
> Regards,
>
> Akira Yokosawa <akiyks@gmail.com>
>
> -- >8 --
> Subject: [PATCH] advsync: Another fix to use latex reference feature consistently
>
> In commit 91bde6aa87c2884f19d2a83534236cdbb319d625, SeongJae Park
> has made changes to enforce latex reference feature to the references
> in the `Advanced Synchronization` chapter. However one of section
> name direct citations is left unchanged in the commit.
> This commit fixes the remaining one.
>
> Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
> ---
> advsync/memorybarriers.tex | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index 12771ec..e527def 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -1508,7 +1508,7 @@ Read memory barriers imply data dependency barriers, and so can substitute
> for them.
>
> $\dagger$ Note that read barriers should normally be paired with write barriers;
> -see the ``SMP barrier pairing'' subsection.
> +see Secton~\ref{sec:advsync:SMP Barrier Pairing}.
>
> \paragraph{General Memory Barriers}
>
> -- 
> 1.9.1
>
>

