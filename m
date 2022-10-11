Return-Path: <SRS0=f179=2M=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0OpfCHi+hIWVaFi2MjBsK5K/rWte6n9NjPDlEFwc/G8=;
        b=X+Wf/K0vVuYHqnyqmysTnZMgfYcbqKP0hPVekjbLyWeJJYg5pCFW/k2zS2DJh0NnL2
         GzMhR7iR8T1+hu7sZcgSGPW5Th+/SoOphecqeaNZPYY1RH/6T5eM0LAL9to7Eh32hRip
         nZn0HY6S3xp0VjhU15vkZShWX0UPd1zro0SvzGDrv2Ke9/nZ01gW+NSmx7rQMhRfDkXo
         eN9WVuVPf/T99j6Oeo3fE4urzTIpYfzOQnbVBmnDOD/nVPi+eAO8ImAZsBM5EDj8DsGY
         MWgKwiyVm8rtMnYNwdqXDdwGmSMnmc7Y4fokw2XgTHHoDNn6wirzc07gAoF1bUo32pAl
         +RuA==
Message-ID: <4f53aff4-6bf5-f4e0-6511-00cc040496e5@gmail.com>
Date: Tue, 11 Oct 2022 17:37:55 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] memorder.tex: the exists clause in Listing 15.35 should
 never be satisfied.
References: <CANJ3EgF5G-rK+VVTigRkDp97=UtAh3TcVWr0tcpZv2NF_0n-Hw@mail.gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <CANJ3EgF5G-rK+VVTigRkDp97=UtAh3TcVWr0tcpZv2NF_0n-Hw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Patrick Yingxi Pan <pyxchina92929@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

[+CC: Paul]

Hi,

On Tue, 11 Oct 2022 11:17:25 +0800, Patrick Yingxi Pan wrote:
> Hello!
> 
> According to the context and my understanding of locking primitives, I
> suppose the 'exists' clause in the litmus test shouldn't be satisfied.

I agree with you in that section 15.4.2.2 is described as if the
result were "Never".

However, if you run herd7 on the litmus test, you'll get:

------------------------------------------------
Test Lock-outside-across Allowed
States 4
0:r1=0; 1:r1=0;
0:r1=0; 1:r1=1;
0:r1=1; 1:r1=0;
0:r1=1; 1:r1=1;
Ok
Witnesses
Positive: 2 Negative: 12
Condition exists (0:r1=0 /\ 1:r1=0)
Observation Lock-outside-across Sometimes 2 12   <--
Time Lock-outside-across 0.02
Hash=06337358bba3d1ed44db8ea81cf1d236
------------------------------------------------

That said, I'm not in the position of deciding LKMM is right or not.

        Thanks, Akira

> 
> Signed-off-by: Patrick Pan <pyxchina92929@gmail.com>
> ---
>  memorder/memorder.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index a0a87d0a..9c1846d0 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -3452,7 +3452,7 @@ following subsequent critical sections?
>  This question can be answered for the Linux kernel by referring to
>  \cref{lst:memorder:Accesses Outside of Critical Sections}
>  (\path{C-Lock-outside-across.litmus}).
> -Running this litmus test yields the \co{Sometimes} result,
> +Running this litmus test yields the \co{Never} result,
>  which means that accesses in code leading up to a prior critical section
>  is also visible to the current CPU or thread holding that same lock.
>  Similarly, code that is placed after a subsequent critical section
> 
> base-commit: 7f12a9358e220f3d0c3a0880d01bc283113d7a5b
> --
