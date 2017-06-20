Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gD2rNR4LkhUvizGBbnhLI6OXybsW6EZIBRUnfB30dfs=;
 b=XzMzxlm3yQV4pm6Knb12jPI9CdAm1uJOto+Y3p/IwSlVajcU3s6NgqOdEA9CD8u+SX
 5n7jS8LR0lO8IJSePDKfQzHRcQg0tQP+Dhd5Nw3qmyYwrwcecAwnUeT6v0QnpxtYUGgb
 2PZIKhfLEDC0+I7ipoteJLpp0JiYAM4bcNKPc2l4q5KvipC7feL9+++ylNzWQ5l2mecg
 BCGEg/rsRokc16BmEG+yOrcDjb/SEaovdx3ln3daLrwhkLHA1g5hsDKczkIG0QtIuJlr
 Nz1YoQ0gdrMs+fstzMoLYumxtv2oXkVHLRPmlzVjwx2V4uXPZb6kvaqxIWynH4j/J6Hn
 7owQ==
Subject: Re: [PATCH 2/3] toyrcu: Trivial typo fixes (rcu_idx -> rcu_refcnt)
References: <17af992e-b78b-25c0-0b77-d18fbfd75895@gmail.com>
 <1d238a3f-1c64-e731-f344-5c4b86455bd0@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <6130a59b-a467-a83f-ecf5-40a52036c745@gmail.com>
Date: Wed, 21 Jun 2017 07:55:34 +0900
MIME-Version: 1.0
In-Reply-To: <1d238a3f-1c64-e731-f344-5c4b86455bd0@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/06/20 23:28, Akira Yokosawa wrote:
>>From db0fd6b383b551eabecb12dfa21e42093f338b2f Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiyks@gmail.com>
> Date: Mon, 19 Jun 2017 23:55:31 +0900
> Subject: [PATCH 2/3] toyrcu: Trivial typo fixes (rcu_idx -> rcu_refcnt)
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  appendix/toyrcu/toyrcu.tex | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
> index 79fbe33..a7bf6ca 100644
> --- a/appendix/toyrcu/toyrcu.tex
> +++ b/appendix/toyrcu/toyrcu.tex
> @@ -524,10 +524,10 @@ by complementing the value of \co{rcu_idx}, as in \co{rcu_idx = !rcu_idx}.
>  Suppose that the old value of \co{rcu_idx} was zero, so that the new
>  value is one.
>  New readers that arrive after the complement operation will increment
> -\co{rcu_idx[1]}, while the old readers that previously incremented
> -\co{rcu_idx[0]} will decrement \co{rcu_idx[0]} when they exit their
> +\co{rcu_refcnt[1]}, while the old readers that previously incremented
> +\co{rcu_refcnt[0]} will decrement \co{rcu_refcnt[0]} when they exit their
>  RCU read-side critical sections.
> -This means that the value of \co{rcu_idx[0]} will no longer be incremented,
> +This means that the value of \co{rcu_refcnt[0]} will no longer be incremented,
>  and thus will be monotonically decreasing.\footnote{
>  	There is a race condition that this ``monotonically decreasing''
>  	statement ignores.
> @@ -616,11 +616,11 @@ Lines~6 and 19 acquire and release \co{rcu_gp_lock} in order to
>  prevent more than one concurrent instance of \co{synchronize_rcu()}.
>  Lines~7-8 pick up the value of \co{rcu_idx} and complement it,
>  respectively, so that subsequent instances of \co{rcu_read_lock()}
> -will use a different element of \co{rcu_idx} that did preceding
> +will use a different element of \co{rcu_refcnt} that did preceding
>  instances.

I have a little trouble with this sentence. Do you mean:

             ..., so that subsequent instances of \co{rcu_read_lock()}
will use a different element of \co{rcu_refcnt} from the one did preceding
instances.                                      

???

       Thanks, Akira
> -Lines~10-12 then wait for the prior element of \co{rcu_idx} to
> +Lines~10-12 then wait for the prior element of \co{rcu_refcnt} to
>  reach zero, with the memory barrier on line~9 ensuring that the check
> -of \co{rcu_idx} is not reordered to precede the complementing of
> +of \co{rcu_refcnt} is not reordered to precede the complementing of
>  \co{rcu_idx}.
>  Lines~13-18 repeat this process, and line~20 ensures that any
>  subsequent reclamation operations are not reordered to precede the
> 

