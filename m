Return-Path: <SRS0=aLez=2P=gmail.com=zhouzhouyi@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hWFLAL79rOvZy0q6gR9QHar3oTLKaDXI2VRG82z+pdo=;
        b=CxhPzO/JlIj0sZYks6rqTNndGcR5ynlGBQIaWQgKQwhW+uYsAI4AFlsO+ZiwEJ99R5
         sgMjVyFgtMzpNqKf7+CMEa+2f6VTLiCA/2o2QO+tU4rqyHFz3U29w6rL6BECvM9BQXJV
         qkFT8lnHajflophRjJXgh0medhZZsNGZfH3DL987omAl4d4sRWbRG85PAEtP5M2v6O9G
         wgY/I6lrelbZ25RFBV7DpDH+ipQOEcDiP7jrOSzclPWJFiUSWWUfZ020rg9yurztn1M8
         j0ievRi5Xiw49crocB5zs+Xzk4pOC0ed5FQ6x22222pLKbUOl8+XsMxGmK+6ZQRqAMsx
         g7KA==
MIME-Version: 1.0
References: <20221014055543.8214-1-zhouzhouyi@gmail.com> <c033269a-5cd7-608c-6bd9-3ee47bb56023@gmail.com>
In-Reply-To: <c033269a-5cd7-608c-6bd9-3ee47bb56023@gmail.com>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Fri, 14 Oct 2022 11:19:04 +0800
Message-ID: <CAABZP2zVHS056GbHxNWkSzdimS4R9XdoK4nWw_bvh=Oz0K=VOw@mail.gmail.com>
Subject: Re: [PATCH -perfbook v2] memorder: fix a line number reference error
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, perfbook@vger.kernel.org, luyang.co@gmail.com
List-ID: <perfbook.vger.kernel.org>

Thank Akira for your fantastic work!


On Fri, Oct 14, 2022 at 6:44 PM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> Section 15.2.3 says,
>
>   "Listing 15.10 shows how to make this work reliably on pre-v4.15
>    Linux kernels running on DEC Alpha, by replacing line 19's
>    READ_ONCE() with lockless_dereference()."
>
> However, the READ_ONCE() is actually on line 18 of Listing 15.9.
>
> Fix the reference and clarify the READ_ONCE() is in Listing 15.9.
Yes lockless_dereference() is replacing READ_ONCE() in List 15.9
>
> Reported-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> v1 (from Zhouyi) -> v2
>
>  - Reference line 18 of Listing 15.9.
>  - Adjust wording around the fixed reference.
>  - Zhouyi's Reported-by.
>
> Zhouyi, how does this look to you?
Thank Akira for your advice and guidance! I downloaded you patch and
1) patch -p 1 < "[PATCH -perfbook v2] memorder_ fix a line number
reference error.eml"
2) make -j 16
then read perfbook.pdf

It is much more perfect than I can expect!

and from your example, I know how to add reference to code next time I
am creating a patch!

Thank both of you for your enthusiasm and patience!

Thanks
Zhouyi
>
> Thanks, Akira
> --
>  memorder/memorder.tex | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index c350758d61cb..28319bfba16b 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -1274,13 +1274,14 @@ exists (1:r2=x0 /\ 1:r3=1)
>  \label{lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)}
>  \end{listing}
>
> -\begin{fcvref}[ln:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)]
> +\begin{fcvref}[ln:formal:C-MP+o-wmb-o+o-addr-o:whole]
>  \Cref{lst:memorder:Enforced Ordering of Message-Passing Address-Dependency Litmus Test (Before v4.15)}
>  % \path{C-MP+o-wmb-o+ld-addr-o.litmus} available at commit bc4b1c3f3b35
>  % ("styleguide: Loosen restriction on comment in litmus test")
>  shows how to make this work reliably on pre-v4.15 Linux kernels running on
> -DEC Alpha, by replacing \clnref{read}'s \co{READ_ONCE()} with
> -\apikh{lockless_dereference()},\footnote{
> +DEC Alpha, by replacing \co{READ_ONCE()} on \clnref{P1:x1} of
> +\cref{lst:memorder:Message-Passing Address-Dependency Litmus Test (No Ordering Before v4.15)}
> +with \apikh{lockless_dereference()},\footnote{
>         Note that \co{lockless_dereference()} is not needed on v4.15 and
>         later, and therefore is not available in these later Linux kernels.
>         Nor is it needed in versions of this book containing this sentence.}
>
> base-commit: c2b75b99a151008c6b59bddcabb9e44e744f3678
> --
> 2.25.1
>
>
