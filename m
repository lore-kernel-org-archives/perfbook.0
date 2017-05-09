Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JlXLD5Ju7Hvh5TNJHcY79p5hD2YZimO68IfUNBzczo8=;
 b=hLhX4GlaeIPU6VCmq6GXYlywV7tfwEFG9UGD/H5RyRpZPyUobVYMhHi7uJn6AhZXnU
 d7iD0EACObKpnlmReRMdt39NlCLZpkeeVda70q6TSmvxcb+VundwqwUMvfFl8q9NEsCj
 W+xqM2mC/gvZfEBN5jQ2IL5c4IQIKPlum4R2CDzMetDtVPNxvsetvPILAde2rALcr3LG
 IQAYj00V0QjvbNkCpC1/vAXOv8yJAjdjceEgUIQEzw7tR49MS/oGvsdXvl/5hSzOUEhh
 XWvRvoaR44CrPrCdHwwMati83K1MiOoDdNkDQ1CYSVK3DgK7yREfk4biftx5C1wYihw5
 zPxg==
Subject: Re: [PATCH] Update Answer to Quick Quiz 5.27
References: <1494319692-4252-1-git-send-email-junchangwang@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <07cd658e-d71b-496e-5583-e204ae1c3ebf@gmail.com>
Date: Tue, 9 May 2017 23:56:25 +0900
MIME-Version: 1.0
In-Reply-To: <1494319692-4252-1-git-send-email-junchangwang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/05/09 16:48:12 +0800, Junchang Wang wrote:
> Oops. Forgot the summary in previous email. Resend the patch.
> 
> 
> The Answer to Quick Quiz 5.27 is a bit hard to follow. Rewrite it.
> 
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> ---
>  count/count.tex | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/count/count.tex b/count/count.tex
> index cc47554..6dfc7a6 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -1258,13 +1258,13 @@ machine.
>  	fast and scalable while allowing readers to also enjoy
>  	reasonable performance and scalability?
>  \QuickQuizAnswer{
> -	One approach would be to maintain a global approximation
> -	to the value.
> -	Readers would increment their per-thread variable, but when it
> -	reached some predefined limit, atomically add it to a global
> -	variable, then zero their per-thread variable.
> -	This would permit a tradeoff between average increment overhead
> -	and accuracy of the value read out.
> +	One approach would be to add a global variable maintaining a
> +	approximation to the exact value. An updater would increment its
> +	per-thread variable, and when its value reaches predefined limit,
> +	atomically add the value to the global variable, then zero its
> +	per-thread variable. Readers simply return the value of global variable,
> +	enjoying reasonable performance.  This would permit a tradeoff between
> +	average increment overhead and accuracy of the value read out.
>  
>  	The reader is encouraged to think up and try out other approaches,
>  	for example, using a combining tree.
> 

Hi Junchang,

What confused you seems to be a simple typo.
Isn't the following one-liner sufficient for you?

                Thanks, Akira

--8<---->8--
From 725b32938e0cbc245e5a528fd475951bb8be1de5 Mon Sep 17 00:00:00 2001
From: Akira Yokosawa <akiyks@gmail.com>
Date: Tue, 9 May 2017 23:39:57 +0900
Subject: [PATCH] count: Fix typo in Answer to Quick Quiz 5.27

Reported-by: Junchang Wang <junchangwang@gmail.com>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 count/count.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/count/count.tex b/count/count.tex
index cc47554..096b53d 100644
--- a/count/count.tex
+++ b/count/count.tex
@@ -1260,7 +1260,7 @@ machine.
 \QuickQuizAnswer{
 	One approach would be to maintain a global approximation
 	to the value.
-	Readers would increment their per-thread variable, but when it
+	Updaters would increment their per-thread variable, but when it
 	reached some predefined limit, atomically add it to a global
 	variable, then zero their per-thread variable.
 	This would permit a tradeoff between average increment overhead
-- 
2.7.4


